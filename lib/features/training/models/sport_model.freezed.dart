// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sport_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SportModel {

 String get id; String get name; String? get description;@JsonKey(name: 'icon_name') String? get iconName;
/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportModelCopyWith<SportModel> get copyWith => _$SportModelCopyWithImpl<SportModel>(this as SportModel, _$identity);

  /// Serializes this SportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconName);

@override
String toString() {
  return 'SportModel(id: $id, name: $name, description: $description, iconName: $iconName)';
}


}

/// @nodoc
abstract mixin class $SportModelCopyWith<$Res>  {
  factory $SportModelCopyWith(SportModel value, $Res Function(SportModel) _then) = _$SportModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'icon_name') String? iconName
});




}
/// @nodoc
class _$SportModelCopyWithImpl<$Res>
    implements $SportModelCopyWith<$Res> {
  _$SportModelCopyWithImpl(this._self, this._then);

  final SportModel _self;
  final $Res Function(SportModel) _then;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SportModel].
extension SportModelPatterns on SportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportModel value)  $default,){
final _that = this;
switch (_that) {
case _SportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportModel value)?  $default,){
final _that = this;
switch (_that) {
case _SportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'icon_name')  String? iconName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'icon_name')  String? iconName)  $default,) {final _that = this;
switch (_that) {
case _SportModel():
return $default(_that.id,_that.name,_that.description,_that.iconName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description, @JsonKey(name: 'icon_name')  String? iconName)?  $default,) {final _that = this;
switch (_that) {
case _SportModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportModel implements SportModel {
  const _SportModel({required this.id, required this.name, this.description, @JsonKey(name: 'icon_name') this.iconName});
  factory _SportModel.fromJson(Map<String, dynamic> json) => _$SportModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'icon_name') final  String? iconName;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportModelCopyWith<_SportModel> get copyWith => __$SportModelCopyWithImpl<_SportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconName);

@override
String toString() {
  return 'SportModel(id: $id, name: $name, description: $description, iconName: $iconName)';
}


}

/// @nodoc
abstract mixin class _$SportModelCopyWith<$Res> implements $SportModelCopyWith<$Res> {
  factory _$SportModelCopyWith(_SportModel value, $Res Function(_SportModel) _then) = __$SportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'icon_name') String? iconName
});




}
/// @nodoc
class __$SportModelCopyWithImpl<$Res>
    implements _$SportModelCopyWith<$Res> {
  __$SportModelCopyWithImpl(this._self, this._then);

  final _SportModel _self;
  final $Res Function(_SportModel) _then;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconName = freezed,}) {
  return _then(_SportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
