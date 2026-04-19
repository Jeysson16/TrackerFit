// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutSessionModel _$WorkoutSessionModelFromJson(Map<String, dynamic> json) =>
    _WorkoutSessionModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      routineId: json['routine_id'] as String?,
      workoutDayId: json['workout_day_id'] as String?,
      name: json['name'] as String?,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      dayRating: (json['day_rating'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      localId: json['local_id'] as String?,
      syncedAt: json['synced_at'] == null
          ? null
          : DateTime.parse(json['synced_at'] as String),
      exercises:
          (json['exercise_logs'] as List<dynamic>?)
              ?.map((e) => ExerciseLogModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkoutSessionModelToJson(
  _WorkoutSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'routine_id': instance.routineId,
  'workout_day_id': instance.workoutDayId,
  'name': instance.name,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime?.toIso8601String(),
  'day_rating': instance.dayRating,
  'notes': instance.notes,
  'local_id': instance.localId,
  'synced_at': instance.syncedAt?.toIso8601String(),
  'exercise_logs': instance.exercises,
};

_ExerciseLogModel _$ExerciseLogModelFromJson(Map<String, dynamic> json) =>
    _ExerciseLogModel(
      id: json['id'] as String?,
      exerciseId: json['exercise_id'] as String,
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String?,
      sets:
          (json['set_logs'] as List<dynamic>?)
              ?.map((e) => SetLogModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseLogModelToJson(_ExerciseLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise_id': instance.exerciseId,
      'order_index': instance.orderIndex,
      'notes': instance.notes,
      'set_logs': instance.sets,
    };

_SetLogModel _$SetLogModelFromJson(Map<String, dynamic> json) => _SetLogModel(
  id: json['id'] as String?,
  setOrder: (json['set_order'] as num).toInt(),
  isDropSet: json['is_drop_set'] as bool? ?? false,
  isWarmup: json['isWarmup'] as bool? ?? false,
  isCompleted: json['isCompleted'] as bool? ?? false,
  weightKg: (json['weight_kg'] as num?)?.toDouble(),
  reps: (json['reps'] as num?)?.toInt(),
  rpe: (json['rpe'] as num?)?.toDouble(),
  rir: (json['rir'] as num?)?.toInt(),
  maxVelocity: (json['max_velocity'] as num?)?.toDouble(),
  durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
  restSeconds: (json['rest_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$SetLogModelToJson(_SetLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'set_order': instance.setOrder,
      'is_drop_set': instance.isDropSet,
      'isWarmup': instance.isWarmup,
      'isCompleted': instance.isCompleted,
      'weight_kg': instance.weightKg,
      'reps': instance.reps,
      'rpe': instance.rpe,
      'rir': instance.rir,
      'max_velocity': instance.maxVelocity,
      'duration_seconds': instance.durationSeconds,
      'rest_seconds': instance.restSeconds,
    };
