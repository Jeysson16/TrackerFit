// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStreak _$UserStreakFromJson(Map<String, dynamic> json) => _UserStreak(
  userId: json['user_id'] as String,
  currentStreak: (json['current_streak'] as num?)?.toInt() ?? 0,
  maxStreak: (json['max_streak'] as num?)?.toInt() ?? 0,
  lastActivityDate: json['last_activity_date'] == null
      ? null
      : DateTime.parse(json['last_activity_date'] as String),
  freezeItemsAvailable: (json['freeze_items_available'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserStreakToJson(_UserStreak instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'current_streak': instance.currentStreak,
      'max_streak': instance.maxStreak,
      'last_activity_date': instance.lastActivityDate?.toIso8601String(),
      'freeze_items_available': instance.freezeItemsAvailable,
    };

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  iconPath: json['icon_path'] as String?,
  xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
  isUnlocked: json['isUnlocked'] as bool? ?? false,
);

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon_path': instance.iconPath,
      'xp_reward': instance.xpReward,
      'isUnlocked': instance.isUnlocked,
    };
