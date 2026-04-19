// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    _ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sportId: json['sport_id'] as String,
      description: json['description'] as String?,
      videoUrl: json['video_url'] as String?,
      primaryMuscles:
          (json['primary_muscles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      secondaryMuscles:
          (json['secondary_muscles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      trainingTypes:
          (json['training_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseModelToJson(_ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sport_id': instance.sportId,
      'description': instance.description,
      'video_url': instance.videoUrl,
      'primary_muscles': instance.primaryMuscles,
      'secondary_muscles': instance.secondaryMuscles,
      'training_types': instance.trainingTypes,
    };
