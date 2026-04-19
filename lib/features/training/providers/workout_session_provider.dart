import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/workout_session_model.dart';
import '../models/workout_day_model.dart';
import '../../../core/services/local_storage_service.dart';

final workoutSessionProvider = StateNotifierProvider<WorkoutSessionNotifier, WorkoutSessionModel?>((ref) {
  final localStorage = ref.watch(localStorageProvider);
  return WorkoutSessionNotifier(localStorage);
});

class WorkoutSessionNotifier extends StateNotifier<WorkoutSessionModel?> {
  final LocalStorageService _localStorage;

  WorkoutSessionNotifier(this._localStorage) : super(null);

  void startWorkout(String routineId, String workoutDayId, String name, String userId, List<ExerciseConfigModel> exerciseConfigs) {
    List<ExerciseLogModel> initialExercises = [];
    
    for (int i = 0; i < exerciseConfigs.length; i++) {
       final config = exerciseConfigs[i];
       
       List<SetLogModel> initialSets = [];
       for (int j = 0; j < config.sets.length; j++) {
          final setConfig = config.sets[j];
          initialSets.add(SetLogModel(
             setOrder: setConfig.setOrder,
             isDropSet: false,
             isWarmup: false,
             isCompleted: false,
             reps: setConfig.targetRepsMin ?? setConfig.targetRepsMax, // Use target for default text? Or keep null so user types it
             weightKg: null,
             rir: null,
          ));
       }
       
       // If no sets configured, just add an empty normal set to begin with
       if (initialSets.isEmpty) {
          initialSets.add(const SetLogModel(setOrder: 1));
       }

       initialExercises.add(ExerciseLogModel(
         id: const Uuid().v4(),
         exerciseId: config.exerciseId,
         orderIndex: i,
         sets: initialSets,
       ));
    }

    state = WorkoutSessionModel(
      id: const Uuid().v4(),
      localId: const Uuid().v4(),
      userId: userId,
      routineId: routineId,
      workoutDayId: workoutDayId,
      name: name,
      startTime: DateTime.now(),
      exercises: initialExercises,
    );
  }

  void addExerciseLog(String exerciseId) {
    if (state == null) return;
    
    final newExercise = ExerciseLogModel(
      id: const Uuid().v4(),
      exerciseId: exerciseId,
      orderIndex: state!.exercises.length,
      sets: [const SetLogModel(setOrder: 1)], // add single default set
    );

    state = state!.copyWith(
      exercises: [...state!.exercises, newExercise],
    );
  }

  void addSetToExercise(String exerciseLogId, {bool isWarmup = false, bool isDropSet = false}) {
     if (state == null) return;
     final exercises = state!.exercises.map((ex) {
        if (ex.id == exerciseLogId) {
           final newSets = List<SetLogModel>.from(ex.sets);
           final nextOrder = newSets.isEmpty ? 1 : newSets.map((s) => s.setOrder).reduce((a, b) => a > b ? a : b) + 1;
           
           newSets.add(SetLogModel(
              setOrder: nextOrder,
              isWarmup: isWarmup,
              isDropSet: isDropSet,
           ));
           return ex.copyWith(sets: newSets);
        }
        return ex;
     }).toList();
     state = state!.copyWith(exercises: exercises);
  }

  void updateSetLog(String exerciseLogId, int setIndex, SetLogModel updatedSet) {
    if (state == null) return;

    final exercises = state!.exercises.map((ex) {
      if (ex.id == exerciseLogId) {
        final newSets = List<SetLogModel>.from(ex.sets);
        if (setIndex < newSets.length) {
          newSets[setIndex] = updatedSet;
        } else {
          newSets.add(updatedSet);
        }
        return ex.copyWith(sets: newSets);
      }
      return ex;
    }).toList();

    state = state!.copyWith(exercises: exercises);
  }

  Future<void> endWorkout() async {
    if (state == null) return;
    
    final finishedWorkout = state!.copyWith(endTime: DateTime.now());
    await _localStorage.saveWorkout(finishedWorkout);
    state = null;
  }
}
