// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutTemplateModel _$WorkoutTemplateModelFromJson(
  Map<String, dynamic> json,
) => _WorkoutTemplateModel(
  id: json['id'] as String,
  name: json['name'] as String,
  sportId: json['sport_id'] as String,
  description: json['description'] as String?,
  isSmartGenerated: json['isSmartGenerated'] as bool? ?? false,
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => WorkoutDayModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$WorkoutTemplateModelToJson(
  _WorkoutTemplateModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sport_id': instance.sportId,
  'description': instance.description,
  'isSmartGenerated': instance.isSmartGenerated,
  'days': instance.days,
};
