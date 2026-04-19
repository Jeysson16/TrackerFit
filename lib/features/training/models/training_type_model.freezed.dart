// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingTypeModel {

 String get id;@JsonKey(name: 'sport_id') String get sportId; String get name; String? get description;
/// Create a copy of TrainingTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingTypeModelCopyWith<TrainingTypeModel> get copyWith => _$TrainingTypeModelCopyWithImpl<TrainingTypeModel>(this as TrainingTypeModel, _$identity);

  /// Serializes this TrainingTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sportId,name,description);

@override
String toString() {
  return 'TrainingTypeModel(id: $id, sportId: $sportId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $TrainingTypeModelCopyWith<$Res>  {
  factory $TrainingTypeModelCopyWith(TrainingTypeModel value, $Res Function(TrainingTypeModel) _then) = _$TrainingTypeModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'sport_id') String sportId, String name, String? description
});




}
/// @nodoc
class _$TrainingTypeModelCopyWithImpl<$Res>
    implements $TrainingTypeModelCopyWith<$Res> {
  _$TrainingTypeModelCopyWithImpl(this._self, this._then);

  final TrainingTypeModel _self;
  final $Res Function(TrainingTypeModel) _then;

/// Create a copy of TrainingTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sportId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingTypeModel].
extension TrainingTypeModelPatterns on TrainingTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sport_id')  String sportId,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingTypeModel() when $default != null:
return $default(_that.id,_that.sportId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sport_id')  String sportId,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TrainingTypeModel():
return $default(_that.id,_that.sportId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'sport_id')  String sportId,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TrainingTypeModel() when $default != null:
return $default(_that.id,_that.sportId,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingTypeModel implements TrainingTypeModel {
  const _TrainingTypeModel({required this.id, @JsonKey(name: 'sport_id') required this.sportId, required this.name, this.description});
  factory _TrainingTypeModel.fromJson(Map<String, dynamic> json) => _$TrainingTypeModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'sport_id') final  String sportId;
@override final  String name;
@override final  String? description;

/// Create a copy of TrainingTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingTypeModelCopyWith<_TrainingTypeModel> get copyWith => __$TrainingTypeModelCopyWithImpl<_TrainingTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sportId,name,description);

@override
String toString() {
  return 'TrainingTypeModel(id: $id, sportId: $sportId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TrainingTypeModelCopyWith<$Res> implements $TrainingTypeModelCopyWith<$Res> {
  factory _$TrainingTypeModelCopyWith(_TrainingTypeModel value, $Res Function(_TrainingTypeModel) _then) = __$TrainingTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'sport_id') String sportId, String name, String? description
});




}
/// @nodoc
class __$TrainingTypeModelCopyWithImpl<$Res>
    implements _$TrainingTypeModelCopyWith<$Res> {
  __$TrainingTypeModelCopyWithImpl(this._self, this._then);

  final _TrainingTypeModel _self;
  final $Res Function(_TrainingTypeModel) _then;

/// Create a copy of TrainingTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sportId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_TrainingTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
