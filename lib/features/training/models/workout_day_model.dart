import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_day_model.freezed.dart';
part 'workout_day_model.g.dart';

@freezed
abstract class WorkoutDayModel with _$WorkoutDayModel {
  const factory WorkoutDayModel({
    required String id,
    required String name,
    @Default(false) bool isRestDay,
    @JsonKey(name: 'training_type_ids') @Default([]) List<String> trainingTypeIds,
    @JsonKey(name: 'exercise_configs') @Default([]) List<ExerciseConfigModel> exercises,
  }) = _WorkoutDayModel;

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDayModelFromJson(json);
}

@freezed
abstract class ExerciseConfigModel with _$ExerciseConfigModel {
  const factory ExerciseConfigModel({
    @JsonKey(name: 'exercise_id') required String exerciseId,
    @Default(0) int orderIndex,
    @Default([]) List<SetConfigModel> sets,
  }) = _ExerciseConfigModel;

  factory ExerciseConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseConfigModelFromJson(json);
}

@freezed
abstract class SetConfigModel with _$SetConfigModel {
  const factory SetConfigModel({
    required int setOrder,
    @JsonKey(name: 'target_reps_min') int? targetRepsMin,
    @JsonKey(name: 'target_reps_max') int? targetRepsMax,
    @JsonKey(name: 'target_rir') int? targetRir,
    @JsonKey(name: 'weight') double? weight,
    @JsonKey(name: 'max_velocity') double? maxVelocity,
    @JsonKey(name: 'duration_seconds') int? durationSeconds,
    @JsonKey(name: 'rest_seconds') int? restSeconds,
    @JsonKey(name: 'is_amrap') @Default(false) bool isAmrap,
  }) = _SetConfigModel;

  factory SetConfigModel.fromJson(Map<String, dynamic> json) =>
      _$SetConfigModelFromJson(json);
}
