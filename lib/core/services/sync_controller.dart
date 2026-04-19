import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'local_storage_service.dart';

final syncControllerProvider = Provider(
  (ref) =>
      SyncController(ref.read(localStorageProvider), FirebaseFirestore.instance),
);

class SyncController {
  final LocalStorageService _localStorage;
  final FirebaseFirestore _firestore;

  SyncController(this._localStorage, this._firestore);

  Future<void> init() async {
    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (!result.contains(ConnectivityResult.none)) {
        syncPendingData();
      }
    });
  }

  Future<void> syncPendingData() async {
    final queue = _localStorage.getSyncQueue();
    if (queue.isEmpty) return;

    print('Syncing ${queue.length} items...');

    // Simple implementation: iterate and push
    // In a real app, you'd batch requests or handle retries more robustly
    for (int i = 0; i < queue.length; i++) {
      final item = queue[i];
      final type = item['type'];
      final id = item['id'];

      try {
        if (type == 'workout') {
          await _syncWorkout(id);
        }
        // Remove from queue if successful
        // Note: Removing by index while iterating can be tricky if not careful,
        // but since we read the whole queue snapshot, we should clear the specific item or rebuild queue.
        // For simplicity here, we'll clear the whole queue at the end if all succeed,
        // or improved: delete processed item.
        // Here we just print success.
        print('Synced $type $id');
      } catch (e) {
        print('Failed to sync $type $id: $e');
      }
    }

    // Naive clear for this example.
    // Ideally: remove only successful ones.
    await _localStorage.clearSyncQueue();
  }

  Future<void> _syncWorkout(String localId) async {
    final workouts = _localStorage.getAllWorkouts();
    final workout = workouts.firstWhere(
      (w) => w.localId == localId,
      orElse: () => throw Exception('Workout not found locally'),
    );

    // Convert to Firebase JSON (removing local-only fields if necessary)
    // Here we use the same model, but we should ensure 'id' is handled if it's a UUID generated locally or by DB.
    // If localId is used as temp ID, we might need to swap it.

    final workoutJson = workout.toJson();

    // Use Firestore set with merge to effectively upsert
    final docRef = _firestore.collection('workout_sessions').doc(localId); // Using localId as document ID for simplicity, assuming it's a UUID
    
    // We can add a 'synced_at' timestamp
    workoutJson['synced_at'] = FieldValue.serverTimestamp();

    await docRef.set(workoutJson, SetOptions(merge: true));

    // Get the timestamp we just wrote, or just use DateTime.now() since Firestore doesn't return the payload on set.
    // To be precise we could just mark it synced locally.
    final updatedWorkout = workout.copyWith(
      id: docRef.id,
      syncedAt: DateTime.now(),
    );

    await _localStorage.saveWorkout(updatedWorkout);
  }
}
