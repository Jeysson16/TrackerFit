import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/gamification_models.dart';

final gamificationServiceProvider = Provider((ref) => GamificationService(Supabase.instance.client));

class GamificationService {
  final SupabaseClient _supabase;

  GamificationService(this._supabase);

  // --- Streaks ---
  Future<UserStreak> getUserStreak() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not logged in');

    try {
      final response = await _supabase
          .from('user_streaks')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) {
        // Create initial streak record
        final newStreak = await _supabase
            .from('user_streaks')
            .insert({'user_id': userId})
            .select()
            .single();
        return UserStreak.fromJson(newStreak);
      }
      return UserStreak.fromJson(response);
    } catch (e) {
      print('Error fetching streak: $e');
      // Return a safe default if offline or error
      return UserStreak(userId: userId);
    }
  }

  Future<void> updateStreak() async {
    final userId = _supabase.auth.currentUser?.id;
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
        newCurrent = 1; // Should not happen if difference is 0 (handled above) or negative
      }
    } else {
      newCurrent = 1; // First ever activity
    }

    final newMax = newCurrent > streak.maxStreak ? newCurrent : streak.maxStreak;

    await _supabase.from('user_streaks').upsert({
      'user_id': userId,
      'current_streak': newCurrent,
      'max_streak': newMax,
      'last_activity_date': now.toIso8601String(),
    });
  }

  // --- PRs ---
  Future<bool> checkPersonalRecord(String exerciseId, double weight, int reps) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    // Simplified check: Is this weight higher than any previous record for this exercise?
    // In a real app, you'd check estimated 1RM or specific rep ranges.
    
    final response = await _supabase
        .from('personal_records')
        .select()
        .eq('user_id', userId)
        .eq('exercise_id', exerciseId)
        .order('weight_kg', ascending: false)
        .limit(1)
        .maybeSingle();

    if (response == null || (response['weight_kg'] as num) < weight) {
      // New PR! Save it.
      await _supabase.from('personal_records').insert({
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
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    // 1. Get all achievements
    final all = await _supabase.from('achievements').select();
    
    // 2. Get unlocked
    final unlocked = await _supabase
        .from('user_achievements')
        .select('achievement_id')
        .eq('user_id', userId);
        
    final unlockedIds = (unlocked as List).map((e) => e['achievement_id'] as String).toSet();

    return (all as List).map((e) {
      final ach = Achievement.fromJson(e);
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
