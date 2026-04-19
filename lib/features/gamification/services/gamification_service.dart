import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gamification_models.dart';

final gamificationServiceProvider = Provider(
  (ref) => GamificationService(FirebaseFirestore.instance, FirebaseAuth.instance),
);

final streakProvider = FutureProvider<UserStreak>((ref) async {
  final service = ref.watch(gamificationServiceProvider);
  return service.getUserStreak();
});

class GamificationService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  GamificationService(this._firestore, this._auth);

  // --- Streaks ---
  Future<UserStreak> getUserStreak() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception('User not logged in');

    try {
      final docSnap = await _firestore
          .collection('user_streaks')
          .doc(userId)
          .get();

      if (!docSnap.exists) {
        // Create initial streak record
        final newStreakJson = {'user_id': userId, 'current_streak': 0, 'max_streak': 0, 'freeze_items_available': 0};
        await _firestore.collection('user_streaks').doc(userId).set(newStreakJson);
        return UserStreak.fromJson(newStreakJson);
      }
      return UserStreak.fromJson(docSnap.data()!);
    } catch (e) {
      print('Error fetching streak: $e');
      // Return a safe default if offline or error
      return UserStreak(userId: userId);
    }
  }

  Future<void> updateStreak() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final streak = await getUserStreak();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Check if already updated today
    if (streak.lastActivityDate != null) {
      final lastDate = streak.lastActivityDate!;
      final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);

      if (lastDay.isAtSameMomentAs(today)) {
        return; // Already counted for today
      }
    }

    // Logic for increment or reset
    // This logic ideally lives in a Postgres Function to be atomic,
    // but here is the client-side approximation.

    int newCurrent = streak.currentStreak;

    if (streak.lastActivityDate != null) {
      final difference = today.difference(streak.lastActivityDate!).inDays;
      if (difference == 1) {
        newCurrent++;
      } else if (difference > 1) {
        // Missed a day
        if (streak.freezeItemsAvailable > 0) {
          // Use freeze (logic would require decrementing freeze count)
          // For now, simple reset
          newCurrent = 1;
        } else {
          newCurrent = 1;
        }
      } else {
        newCurrent =
            1; // Should not happen if difference is 0 (handled above) or negative
      }
    } else {
      newCurrent = 1; // First ever activity
    }

    final newMax = newCurrent > streak.maxStreak
        ? newCurrent
        : streak.maxStreak;

    await _firestore.collection('user_streaks').doc(userId).set({
      'user_id': userId,
      'current_streak': newCurrent,
      'max_streak': newMax,
      'last_activity_date': now.toIso8601String(),
    }, SetOptions(merge: true));
  }

  // --- PRs ---
  Future<bool> checkPersonalRecord(
    String exerciseId,
    double weight,
    int reps,
  ) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return false;

    // Simplified check: Is this weight higher than any previous record for this exercise?
    // In a real app, you'd check estimated 1RM or specific rep ranges.

    final response = await _firestore
        .collection('personal_records')
        .where('user_id', isEqualTo: userId)
        .where('exercise_id', isEqualTo: exerciseId)
        .orderBy('weight_kg', descending: true)
        .limit(1)
        .get();

    if (response.docs.isEmpty || (response.docs.first.data()['weight_kg'] as num) < weight) {
      // New PR! Save it.
      await _firestore.collection('personal_records').add({
        'user_id': userId,
        'exercise_id': exerciseId,
        'weight_kg': weight,
        'reps': reps,
      });
      return true;
    }
    return false;
  }

  // --- Achievements ---
  Future<List<Achievement>> getMyAchievements() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return [];

    // 1. Get all achievements
    final all = await _firestore.collection('achievements').get();

    // 2. Get unlocked
    final unlocked = await _firestore
        .collection('user_achievements')
        .where('user_id', isEqualTo: userId)
        .get();

    final unlockedIds = unlocked.docs
        .map((e) => e.data()['achievement_id'] as String)
        .toSet();

    return all.docs.map((e) {
      final data = e.data();
      data['id'] = e.id; // Usually id is the document ID if not inside data
      final ach = Achievement.fromJson(data);
      return ach.copyWith(isUnlocked: unlockedIds.contains(ach.id));
    }).toList();
  }

  Future<Achievement?> checkAchievementUnlock(String conditionCode) async {
    // This would be called after specific events.
    // E.g. after saving workout, call with 'workouts_update'

    // Mock logic: randomly unlock 'iron_novice' for demo if condition matches
    if (conditionCode == 'workouts_10') {
      // Check real count...
      // If met:
      // await unlockAchievement('iron_novice');
      // return achievement;
    }
    return null;
  }
}
