import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/training/models/workout_session_model.dart';

final localStorageProvider = Provider((ref) => LocalStorageService());

class LocalStorageService {
  static const String workoutBoxName = 'workout_sessions';
  static const String routineBoxName = 'user_routines';
  static const String syncQueueBoxName = 'sync_queue';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(workoutBoxName);
    await Hive.openBox(routineBoxName);
    await Hive.openBox(syncQueueBoxName);
  }

  // --- Workouts ---
  Future<void> saveWorkout(WorkoutSessionModel workout) async {
    final box = Hive.box(workoutBoxName);
    // Use localId as key, or generate one if not present
    final key = workout.localId ?? DateTime.now().millisecondsSinceEpoch.toString();
    
    // Convert to JSON for storage
    await box.put(key, workout.toJson());
    
    // Add to sync queue if not synced
    if (workout.syncedAt == null) {
      await _addToSyncQueue('workout', key);
    }
  }

  List<WorkoutSessionModel> getAllWorkouts() {
    final box = Hive.box(workoutBoxName);
    return box.values.map((e) {
      // e is LinkedMap<dynamic, dynamic>, need to convert to Map<String, dynamic>
      final jsonMap = Map<String, dynamic>.from(e as Map);
      return WorkoutSessionModel.fromJson(jsonMap);
    }).toList();
  }

  // --- Sync Queue ---
  Future<void> _addToSyncQueue(String type, String id) async {
    final box = Hive.box(syncQueueBoxName);
    await box.add({'type': type, 'id': id, 'timestamp': DateTime.now().toIso8601String()});
  }

  List<Map<String, dynamic>> getSyncQueue() {
    final box = Hive.box(syncQueueBoxName);
    return box.values.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }

  Future<void> removeFromSyncQueue(int index) async {
    final box = Hive.box(syncQueueBoxName);
    await box.deleteAt(index);
  }
  
  Future<void> clearSyncQueue() async {
    final box = Hive.box(syncQueueBoxName);
    await box.clear();
  }
}
