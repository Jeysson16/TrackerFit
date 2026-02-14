// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamification_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStreak {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'current_streak') int get currentStreak;@JsonKey(name: 'max_streak') int get maxStreak;@JsonKey(name: 'last_activity_date') DateTime? get lastActivityDate;@JsonKey(name: 'freeze_items_available') int get freezeItemsAvailable;
/// Create a copy of UserStreak
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStreakCopyWith<UserStreak> get copyWith => _$UserStreakCopyWithImpl<UserStreak>(this as UserStreak, _$identity);

  /// Serializes this UserStreak to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStreak&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.maxStreak, maxStreak) || other.maxStreak == maxStreak)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.freezeItemsAvailable, freezeItemsAvailable) || other.freezeItemsAvailable == freezeItemsAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentStreak,maxStreak,lastActivityDate,freezeItemsAvailable);

@override
String toString() {
  return 'UserStreak(userId: $userId, currentStreak: $currentStreak, maxStreak: $maxStreak, lastActivityDate: $lastActivityDate, freezeItemsAvailable: $freezeItemsAvailable)';
}


}

/// @nodoc
abstract mixin class $UserStreakCopyWith<$Res>  {
  factory $UserStreakCopyWith(UserStreak value, $Res Function(UserStreak) _then) = _$UserStreakCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'current_streak') int currentStreak,@JsonKey(name: 'max_streak') int maxStreak,@JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,@JsonKey(name: 'freeze_items_available') int freezeItemsAvailable
});




}
/// @nodoc
class _$UserStreakCopyWithImpl<$Res>
    implements $UserStreakCopyWith<$Res> {
  _$UserStreakCopyWithImpl(this._self, this._then);

  final UserStreak _self;
  final $Res Function(UserStreak) _then;

/// Create a copy of UserStreak
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? currentStreak = null,Object? maxStreak = null,Object? lastActivityDate = freezed,Object? freezeItemsAvailable = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,maxStreak: null == maxStreak ? _self.maxStreak : maxStreak // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: freezed == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,freezeItemsAvailable: null == freezeItemsAvailable ? _self.freezeItemsAvailable : freezeItemsAvailable // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStreak].
extension UserStreakPatterns on UserStreak {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStreak value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStreak() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStreak value)  $default,){
final _that = this;
switch (_that) {
case _UserStreak():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStreak value)?  $default,){
final _that = this;
switch (_that) {
case _UserStreak() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'current_streak')  int currentStreak, @JsonKey(name: 'max_streak')  int maxStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'freeze_items_available')  int freezeItemsAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStreak() when $default != null:
return $default(_that.userId,_that.currentStreak,_that.maxStreak,_that.lastActivityDate,_that.freezeItemsAvailable);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'current_streak')  int currentStreak, @JsonKey(name: 'max_streak')  int maxStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'freeze_items_available')  int freezeItemsAvailable)  $default,) {final _that = this;
switch (_that) {
case _UserStreak():
return $default(_that.userId,_that.currentStreak,_that.maxStreak,_that.lastActivityDate,_that.freezeItemsAvailable);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'current_streak')  int currentStreak, @JsonKey(name: 'max_streak')  int maxStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'freeze_items_available')  int freezeItemsAvailable)?  $default,) {final _that = this;
switch (_that) {
case _UserStreak() when $default != null:
return $default(_that.userId,_that.currentStreak,_that.maxStreak,_that.lastActivityDate,_that.freezeItemsAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStreak implements UserStreak {
  const _UserStreak({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'current_streak') this.currentStreak = 0, @JsonKey(name: 'max_streak') this.maxStreak = 0, @JsonKey(name: 'last_activity_date') this.lastActivityDate, @JsonKey(name: 'freeze_items_available') this.freezeItemsAvailable = 0});
  factory _UserStreak.fromJson(Map<String, dynamic> json) => _$UserStreakFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'current_streak') final  int currentStreak;
@override@JsonKey(name: 'max_streak') final  int maxStreak;
@override@JsonKey(name: 'last_activity_date') final  DateTime? lastActivityDate;
@override@JsonKey(name: 'freeze_items_available') final  int freezeItemsAvailable;

/// Create a copy of UserStreak
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStreakCopyWith<_UserStreak> get copyWith => __$UserStreakCopyWithImpl<_UserStreak>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStreakToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStreak&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.maxStreak, maxStreak) || other.maxStreak == maxStreak)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.freezeItemsAvailable, freezeItemsAvailable) || other.freezeItemsAvailable == freezeItemsAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,currentStreak,maxStreak,lastActivityDate,freezeItemsAvailable);

@override
String toString() {
  return 'UserStreak(userId: $userId, currentStreak: $currentStreak, maxStreak: $maxStreak, lastActivityDate: $lastActivityDate, freezeItemsAvailable: $freezeItemsAvailable)';
}


}

/// @nodoc
abstract mixin class _$UserStreakCopyWith<$Res> implements $UserStreakCopyWith<$Res> {
  factory _$UserStreakCopyWith(_UserStreak value, $Res Function(_UserStreak) _then) = __$UserStreakCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'current_streak') int currentStreak,@JsonKey(name: 'max_streak') int maxStreak,@JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,@JsonKey(name: 'freeze_items_available') int freezeItemsAvailable
});




}
/// @nodoc
class __$UserStreakCopyWithImpl<$Res>
    implements _$UserStreakCopyWith<$Res> {
  __$UserStreakCopyWithImpl(this._self, this._then);

  final _UserStreak _self;
  final $Res Function(_UserStreak) _then;

/// Create a copy of UserStreak
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? currentStreak = null,Object? maxStreak = null,Object? lastActivityDate = freezed,Object? freezeItemsAvailable = null,}) {
  return _then(_UserStreak(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,maxStreak: null == maxStreak ? _self.maxStreak : maxStreak // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: freezed == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,freezeItemsAvailable: null == freezeItemsAvailable ? _self.freezeItemsAvailable : freezeItemsAvailable // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Achievement {

 String get id; String get name; String get description;@JsonKey(name: 'icon_path') String? get iconPath;@JsonKey(name: 'xp_reward') int get xpReward;// Helper field to check if unlocked in UI
 bool get isUnlocked;
/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementCopyWith<Achievement> get copyWith => _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconPath,xpReward,isUnlocked);

@override
String toString() {
  return 'Achievement(id: $id, name: $name, description: $description, iconPath: $iconPath, xpReward: $xpReward, isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res>  {
  factory $AchievementCopyWith(Achievement value, $Res Function(Achievement) _then) = _$AchievementCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'icon_path') String? iconPath,@JsonKey(name: 'xp_reward') int xpReward, bool isUnlocked
});




}
/// @nodoc
class _$AchievementCopyWithImpl<$Res>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? iconPath = freezed,Object? xpReward = null,Object? isUnlocked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Achievement].
extension AchievementPatterns on Achievement {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Achievement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Achievement value)  $default,){
final _that = this;
switch (_that) {
case _Achievement():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Achievement value)?  $default,){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'icon_path')  String? iconPath, @JsonKey(name: 'xp_reward')  int xpReward,  bool isUnlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconPath,_that.xpReward,_that.isUnlocked);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'icon_path')  String? iconPath, @JsonKey(name: 'xp_reward')  int xpReward,  bool isUnlocked)  $default,) {final _that = this;
switch (_that) {
case _Achievement():
return $default(_that.id,_that.name,_that.description,_that.iconPath,_that.xpReward,_that.isUnlocked);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @JsonKey(name: 'icon_path')  String? iconPath, @JsonKey(name: 'xp_reward')  int xpReward,  bool isUnlocked)?  $default,) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconPath,_that.xpReward,_that.isUnlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Achievement implements Achievement {
  const _Achievement({required this.id, required this.name, required this.description, @JsonKey(name: 'icon_path') this.iconPath, @JsonKey(name: 'xp_reward') this.xpReward = 0, this.isUnlocked = false});
  factory _Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'icon_path') final  String? iconPath;
@override@JsonKey(name: 'xp_reward') final  int xpReward;
// Helper field to check if unlocked in UI
@override@JsonKey() final  bool isUnlocked;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementCopyWith<_Achievement> get copyWith => __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconPath,xpReward,isUnlocked);

@override
String toString() {
  return 'Achievement(id: $id, name: $name, description: $description, iconPath: $iconPath, xpReward: $xpReward, isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res> implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(_Achievement value, $Res Function(_Achievement) _then) = __$AchievementCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'icon_path') String? iconPath,@JsonKey(name: 'xp_reward') int xpReward, bool isUnlocked
});




}
/// @nodoc
class __$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? iconPath = freezed,Object? xpReward = null,Object? isUnlocked = null,}) {
  return _then(_Achievement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
