// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SportModel _$SportModelFromJson(Map<String, dynamic> json) => _SportModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  iconName: json['icon_name'] as String?,
);

Map<String, dynamic> _$SportModelToJson(_SportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon_name': instance.iconName,
    };
