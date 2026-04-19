import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamification_models.freezed.dart';
part 'gamification_models.g.dart';

@freezed
abstract class UserStreak with _$UserStreak {
  const factory UserStreak({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'current_streak') @Default(0) int currentStreak,
    @JsonKey(name: 'max_streak') @Default(0) int maxStreak,
    @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
    @JsonKey(name: 'freeze_items_available')
    @Default(0)
    int freezeItemsAvailable,
  }) = _UserStreak;

  factory UserStreak.fromJson(Map<String, dynamic> json) =>
      _$UserStreakFromJson(json);
}

@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String name,
    required String description,
    @JsonKey(name: 'icon_path') String? iconPath,
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    // Helper field to check if unlocked in UI
    @Default(false) bool isUnlocked,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}
