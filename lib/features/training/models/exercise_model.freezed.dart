// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseModel {

 String get id; String get name;@JsonKey(name: 'sport_id') String get sportId; String? get description;@JsonKey(name: 'video_url') String? get videoUrl;@JsonKey(name: 'primary_muscles') List<String> get primaryMuscles;@JsonKey(name: 'secondary_muscles') List<String> get secondaryMuscles;@JsonKey(name: 'training_types') List<String> get trainingTypes;
/// Create a copy of ExerciseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseModelCopyWith<ExerciseModel> get copyWith => _$ExerciseModelCopyWithImpl<ExerciseModel>(this as ExerciseModel, _$identity);

  /// Serializes this ExerciseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other.primaryMuscles, primaryMuscles)&&const DeepCollectionEquality().equals(other.secondaryMuscles, secondaryMuscles)&&const DeepCollectionEquality().equals(other.trainingTypes, trainingTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sportId,description,videoUrl,const DeepCollectionEquality().hash(primaryMuscles),const DeepCollectionEquality().hash(secondaryMuscles),const DeepCollectionEquality().hash(trainingTypes));

@override
String toString() {
  return 'ExerciseModel(id: $id, name: $name, sportId: $sportId, description: $description, videoUrl: $videoUrl, primaryMuscles: $primaryMuscles, secondaryMuscles: $secondaryMuscles, trainingTypes: $trainingTypes)';
}


}

/// @nodoc
abstract mixin class $ExerciseModelCopyWith<$Res>  {
  factory $ExerciseModelCopyWith(ExerciseModel value, $Res Function(ExerciseModel) _then) = _$ExerciseModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'sport_id') String sportId, String? description,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'primary_muscles') List<String> primaryMuscles,@JsonKey(name: 'secondary_muscles') List<String> secondaryMuscles,@JsonKey(name: 'training_types') List<String> trainingTypes
});




}
/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._self, this._then);

  final ExerciseModel _self;
  final $Res Function(ExerciseModel) _then;

/// Create a copy of ExerciseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sportId = null,Object? description = freezed,Object? videoUrl = freezed,Object? primaryMuscles = null,Object? secondaryMuscles = null,Object? trainingTypes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,primaryMuscles: null == primaryMuscles ? _self.primaryMuscles : primaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryMuscles: null == secondaryMuscles ? _self.secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self.trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseModel].
extension ExerciseModelPatterns on ExerciseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseModel value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'primary_muscles')  List<String> primaryMuscles, @JsonKey(name: 'secondary_muscles')  List<String> secondaryMuscles, @JsonKey(name: 'training_types')  List<String> trainingTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseModel() when $default != null:
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.videoUrl,_that.primaryMuscles,_that.secondaryMuscles,_that.trainingTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'primary_muscles')  List<String> primaryMuscles, @JsonKey(name: 'secondary_muscles')  List<String> secondaryMuscles, @JsonKey(name: 'training_types')  List<String> trainingTypes)  $default,) {final _that = this;
switch (_that) {
case _ExerciseModel():
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.videoUrl,_that.primaryMuscles,_that.secondaryMuscles,_that.trainingTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'primary_muscles')  List<String> primaryMuscles, @JsonKey(name: 'secondary_muscles')  List<String> secondaryMuscles, @JsonKey(name: 'training_types')  List<String> trainingTypes)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseModel() when $default != null:
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.videoUrl,_that.primaryMuscles,_that.secondaryMuscles,_that.trainingTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseModel implements ExerciseModel {
  const _ExerciseModel({required this.id, required this.name, @JsonKey(name: 'sport_id') required this.sportId, this.description, @JsonKey(name: 'video_url') this.videoUrl, @JsonKey(name: 'primary_muscles') final  List<String> primaryMuscles = const [], @JsonKey(name: 'secondary_muscles') final  List<String> secondaryMuscles = const [], @JsonKey(name: 'training_types') final  List<String> trainingTypes = const []}): _primaryMuscles = primaryMuscles,_secondaryMuscles = secondaryMuscles,_trainingTypes = trainingTypes;
  factory _ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'sport_id') final  String sportId;
@override final  String? description;
@override@JsonKey(name: 'video_url') final  String? videoUrl;
 final  List<String> _primaryMuscles;
@override@JsonKey(name: 'primary_muscles') List<String> get primaryMuscles {
  if (_primaryMuscles is EqualUnmodifiableListView) return _primaryMuscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_primaryMuscles);
}

 final  List<String> _secondaryMuscles;
@override@JsonKey(name: 'secondary_muscles') List<String> get secondaryMuscles {
  if (_secondaryMuscles is EqualUnmodifiableListView) return _secondaryMuscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryMuscles);
}

 final  List<String> _trainingTypes;
@override@JsonKey(name: 'training_types') List<String> get trainingTypes {
  if (_trainingTypes is EqualUnmodifiableListView) return _trainingTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingTypes);
}


/// Create a copy of ExerciseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseModelCopyWith<_ExerciseModel> get copyWith => __$ExerciseModelCopyWithImpl<_ExerciseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other._primaryMuscles, _primaryMuscles)&&const DeepCollectionEquality().equals(other._secondaryMuscles, _secondaryMuscles)&&const DeepCollectionEquality().equals(other._trainingTypes, _trainingTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sportId,description,videoUrl,const DeepCollectionEquality().hash(_primaryMuscles),const DeepCollectionEquality().hash(_secondaryMuscles),const DeepCollectionEquality().hash(_trainingTypes));

@override
String toString() {
  return 'ExerciseModel(id: $id, name: $name, sportId: $sportId, description: $description, videoUrl: $videoUrl, primaryMuscles: $primaryMuscles, secondaryMuscles: $secondaryMuscles, trainingTypes: $trainingTypes)';
}


}

/// @nodoc
abstract mixin class _$ExerciseModelCopyWith<$Res> implements $ExerciseModelCopyWith<$Res> {
  factory _$ExerciseModelCopyWith(_ExerciseModel value, $Res Function(_ExerciseModel) _then) = __$ExerciseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'sport_id') String sportId, String? description,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'primary_muscles') List<String> primaryMuscles,@JsonKey(name: 'secondary_muscles') List<String> secondaryMuscles,@JsonKey(name: 'training_types') List<String> trainingTypes
});




}
/// @nodoc
class __$ExerciseModelCopyWithImpl<$Res>
    implements _$ExerciseModelCopyWith<$Res> {
  __$ExerciseModelCopyWithImpl(this._self, this._then);

  final _ExerciseModel _self;
  final $Res Function(_ExerciseModel) _then;

/// Create a copy of ExerciseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sportId = null,Object? description = freezed,Object? videoUrl = freezed,Object? primaryMuscles = null,Object? secondaryMuscles = null,Object? trainingTypes = null,}) {
  return _then(_ExerciseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,primaryMuscles: null == primaryMuscles ? _self._primaryMuscles : primaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryMuscles: null == secondaryMuscles ? _self._secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self._trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
