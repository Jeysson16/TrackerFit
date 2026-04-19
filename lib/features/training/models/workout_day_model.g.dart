// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutDayModel _$WorkoutDayModelFromJson(Map<String, dynamic> json) =>
    _WorkoutDayModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isRestDay: json['isRestDay'] as bool? ?? false,
      trainingTypeIds:
          (json['training_type_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exercises:
          (json['exercise_configs'] as List<dynamic>?)
              ?.map(
                (e) => ExerciseConfigModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkoutDayModelToJson(_WorkoutDayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRestDay': instance.isRestDay,
      'training_type_ids': instance.trainingTypeIds,
      'exercise_configs': instance.exercises,
    };

_ExerciseConfigModel _$ExerciseConfigModelFromJson(Map<String, dynamic> json) =>
    _ExerciseConfigModel(
      exerciseId: json['exercise_id'] as String,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      sets:
          (json['sets'] as List<dynamic>?)
              ?.map((e) => SetConfigModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseConfigModelToJson(
  _ExerciseConfigModel instance,
) => <String, dynamic>{
  'exercise_id': instance.exerciseId,
  'orderIndex': instance.orderIndex,
  'sets': instance.sets,
};

_SetConfigModel _$SetConfigModelFromJson(Map<String, dynamic> json) =>
    _SetConfigModel(
      setOrder: (json['setOrder'] as num).toInt(),
      targetRepsMin: (json['target_reps_min'] as num?)?.toInt(),
      targetRepsMax: (json['target_reps_max'] as num?)?.toInt(),
      targetRir: (json['target_rir'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      maxVelocity: (json['max_velocity'] as num?)?.toDouble(),
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      restSeconds: (json['rest_seconds'] as num?)?.toInt(),
      isAmrap: json['is_amrap'] as bool? ?? false,
    );

Map<String, dynamic> _$SetConfigModelToJson(_SetConfigModel instance) =>
    <String, dynamic>{
      'setOrder': instance.setOrder,
      'target_reps_min': instance.targetRepsMin,
      'target_reps_max': instance.targetRepsMax,
      'target_rir': instance.targetRir,
      'weight': instance.weight,
      'max_velocity': instance.maxVelocity,
      'duration_seconds': instance.durationSeconds,
      'rest_seconds': instance.restSeconds,
      'is_amrap': instance.isAmrap,
    };
