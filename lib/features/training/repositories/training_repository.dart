import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/local_storage_service.dart';
import '../models/sport_model.dart';
import '../models/training_type_model.dart';
import '../models/muscle_group_model.dart';
import '../models/exercise_model.dart';
import '../models/workout_template_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

final trainingRepositoryProvider = Provider((ref) {
  final localStorage = ref.watch(localStorageProvider);
  return TrainingRepository(localStorage);
});

class TrainingRepository {
  final LocalStorageService _localStorage;

  TrainingRepository(this._localStorage);

  // --- Sports ---
  List<SportModel> getSports() {
    final box = Hive.box(LocalStorageService.sportBoxName);
    return box.values.map((e) => SportModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<void> saveSport(SportModel sport) async {
    final box = Hive.box(LocalStorageService.sportBoxName);
    await box.put(sport.id, sport.toJson());
  }
  
  Future<void> deleteSport(String id) async {
    final box = Hive.box(LocalStorageService.sportBoxName);
    await box.delete(id);
  }

  // --- Training Types ---
  List<TrainingTypeModel> getTrainingTypes() {
    final box = Hive.box(LocalStorageService.trainingTypeBoxName);
    return box.values.map((e) => TrainingTypeModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<void> saveTrainingType(TrainingTypeModel type) async {
    final box = Hive.box(LocalStorageService.trainingTypeBoxName);
    await box.put(type.id, type.toJson());
  }

  Future<void> deleteTrainingType(String id) async {
    final box = Hive.box(LocalStorageService.trainingTypeBoxName);
    await box.delete(id);
  }

  // --- Muscle Groups ---
  List<MuscleGroupModel> getMuscleGroups() {
    final box = Hive.box(LocalStorageService.muscleGroupBoxName);
    return box.values.map((e) => MuscleGroupModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<void> saveMuscleGroup(MuscleGroupModel group) async {
    final box = Hive.box(LocalStorageService.muscleGroupBoxName);
    await box.put(group.id, group.toJson());
  }

  Future<void> deleteMuscleGroup(String id) async {
    final box = Hive.box(LocalStorageService.muscleGroupBoxName);
    await box.delete(id);
  }

  // --- Exercises ---
  List<ExerciseModel> getExercises() {
    final box = Hive.box(LocalStorageService.exerciseBoxName);
    return box.values.map((e) => ExerciseModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<void> saveExercise(ExerciseModel exercise) async {
    final box = Hive.box(LocalStorageService.exerciseBoxName);
    await box.put(exercise.id, exercise.toJson());
  }

  Future<void> deleteExercise(String id) async {
    final box = Hive.box(LocalStorageService.exerciseBoxName);
    await box.delete(id);
  }

  // --- Workout Templates ---
  List<WorkoutTemplateModel> getTemplates() {
    final box = Hive.box(LocalStorageService.templateBoxName);
    return box.values.map((e) => WorkoutTemplateModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<void> saveTemplate(WorkoutTemplateModel template) async {
    final box = Hive.box(LocalStorageService.templateBoxName);
    await box.put(template.id, template.toJson());
  }

  Future<void> deleteTemplate(String id) async {
    final box = Hive.box(LocalStorageService.templateBoxName);
    await box.delete(id);
  }
}
