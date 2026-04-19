// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingTypeModel _$TrainingTypeModelFromJson(Map<String, dynamic> json) =>
    _TrainingTypeModel(
      id: json['id'] as String,
      sportId: json['sport_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TrainingTypeModelToJson(_TrainingTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sport_id': instance.sportId,
      'name': instance.name,
      'description': instance.description,
    };
