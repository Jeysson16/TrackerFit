import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session_model.freezed.dart';
part 'workout_session_model.g.dart';

@freezed
abstract class WorkoutSessionModel with _$WorkoutSessionModel {
  const factory WorkoutSessionModel({
    String? id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'routine_id') String? routineId,
    String? name,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    @JsonKey(name: 'day_rating') int? dayRating,
    String? notes,
    
    // For Offline Sync
    @JsonKey(name: 'local_id') String? localId,
    @JsonKey(name: 'synced_at') DateTime? syncedAt,
    
    // Nested objects (Optional, depending on API response structure)
    @JsonKey(name: 'exercise_logs') @Default([]) List<ExerciseLogModel> exercises,
  }) = _WorkoutSessionModel;

  factory WorkoutSessionModel.fromJson(Map<String, dynamic> json) => _$WorkoutSessionModelFromJson(json);
}

@freezed
abstract class ExerciseLogModel with _$ExerciseLogModel {
  const factory ExerciseLogModel({
    String? id,
    @JsonKey(name: 'exercise_id') required String exerciseId,
    @JsonKey(name: 'order_index') @Default(0) int orderIndex,
    String? notes,
    @JsonKey(name: 'set_logs') @Default([]) List<SetLogModel> sets,
  }) = _ExerciseLogModel;

  factory ExerciseLogModel.fromJson(Map<String, dynamic> json) => _$ExerciseLogModelFromJson(json);
}

@freezed
abstract class SetLogModel with _$SetLogModel {
  const factory SetLogModel({
    String? id,
    @JsonKey(name: 'set_order') required int setOrder,
    @JsonKey(name: 'weight_kg') double? weightKg,
    int? reps,
    double? rpe,
    int? rir,
  }) = _SetLogModel;

  factory SetLogModel.fromJson(Map<String, dynamic> json) => _$SetLogModelFromJson(json);
}
