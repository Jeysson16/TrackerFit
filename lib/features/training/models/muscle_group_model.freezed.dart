// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muscle_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuscleGroupModel {

 String get id; String get name;@JsonKey(name: 'is_front') bool get isFront;
/// Create a copy of MuscleGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuscleGroupModelCopyWith<MuscleGroupModel> get copyWith => _$MuscleGroupModelCopyWithImpl<MuscleGroupModel>(this as MuscleGroupModel, _$identity);

  /// Serializes this MuscleGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuscleGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isFront, isFront) || other.isFront == isFront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isFront);

@override
String toString() {
  return 'MuscleGroupModel(id: $id, name: $name, isFront: $isFront)';
}


}

/// @nodoc
abstract mixin class $MuscleGroupModelCopyWith<$Res>  {
  factory $MuscleGroupModelCopyWith(MuscleGroupModel value, $Res Function(MuscleGroupModel) _then) = _$MuscleGroupModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'is_front') bool isFront
});




}
/// @nodoc
class _$MuscleGroupModelCopyWithImpl<$Res>
    implements $MuscleGroupModelCopyWith<$Res> {
  _$MuscleGroupModelCopyWithImpl(this._self, this._then);

  final MuscleGroupModel _self;
  final $Res Function(MuscleGroupModel) _then;

/// Create a copy of MuscleGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isFront = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isFront: null == isFront ? _self.isFront : isFront // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MuscleGroupModel].
extension MuscleGroupModelPatterns on MuscleGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MuscleGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MuscleGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MuscleGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _MuscleGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MuscleGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _MuscleGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'is_front')  bool isFront)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MuscleGroupModel() when $default != null:
return $default(_that.id,_that.name,_that.isFront);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'is_front')  bool isFront)  $default,) {final _that = this;
switch (_that) {
case _MuscleGroupModel():
return $default(_that.id,_that.name,_that.isFront);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'is_front')  bool isFront)?  $default,) {final _that = this;
switch (_that) {
case _MuscleGroupModel() when $default != null:
return $default(_that.id,_that.name,_that.isFront);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MuscleGroupModel implements MuscleGroupModel {
  const _MuscleGroupModel({required this.id, required this.name, @JsonKey(name: 'is_front') this.isFront = true});
  factory _MuscleGroupModel.fromJson(Map<String, dynamic> json) => _$MuscleGroupModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'is_front') final  bool isFront;

/// Create a copy of MuscleGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuscleGroupModelCopyWith<_MuscleGroupModel> get copyWith => __$MuscleGroupModelCopyWithImpl<_MuscleGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuscleGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuscleGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isFront, isFront) || other.isFront == isFront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isFront);

@override
String toString() {
  return 'MuscleGroupModel(id: $id, name: $name, isFront: $isFront)';
}


}

/// @nodoc
abstract mixin class _$MuscleGroupModelCopyWith<$Res> implements $MuscleGroupModelCopyWith<$Res> {
  factory _$MuscleGroupModelCopyWith(_MuscleGroupModel value, $Res Function(_MuscleGroupModel) _then) = __$MuscleGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'is_front') bool isFront
});




}
/// @nodoc
class __$MuscleGroupModelCopyWithImpl<$Res>
    implements _$MuscleGroupModelCopyWith<$Res> {
  __$MuscleGroupModelCopyWithImpl(this._self, this._then);

  final _MuscleGroupModel _self;
  final $Res Function(_MuscleGroupModel) _then;

/// Create a copy of MuscleGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isFront = null,}) {
  return _then(_MuscleGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isFront: null == isFront ? _self.isFront : isFront // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
