// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuscleGroupModel _$MuscleGroupModelFromJson(Map<String, dynamic> json) =>
    _MuscleGroupModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isFront: json['is_front'] as bool? ?? true,
    );

Map<String, dynamic> _$MuscleGroupModelToJson(_MuscleGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_front': instance.isFront,
    };
