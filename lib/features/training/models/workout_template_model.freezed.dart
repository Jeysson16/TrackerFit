// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutTemplateModel {

 String get id; String get name;@JsonKey(name: 'sport_id') String get sportId; String? get description; bool get isSmartGenerated; List<WorkoutDayModel> get days;
/// Create a copy of WorkoutTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutTemplateModelCopyWith<WorkoutTemplateModel> get copyWith => _$WorkoutTemplateModelCopyWithImpl<WorkoutTemplateModel>(this as WorkoutTemplateModel, _$identity);

  /// Serializes this WorkoutTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutTemplateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.description, description) || other.description == description)&&(identical(other.isSmartGenerated, isSmartGenerated) || other.isSmartGenerated == isSmartGenerated)&&const DeepCollectionEquality().equals(other.days, days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sportId,description,isSmartGenerated,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'WorkoutTemplateModel(id: $id, name: $name, sportId: $sportId, description: $description, isSmartGenerated: $isSmartGenerated, days: $days)';
}


}

/// @nodoc
abstract mixin class $WorkoutTemplateModelCopyWith<$Res>  {
  factory $WorkoutTemplateModelCopyWith(WorkoutTemplateModel value, $Res Function(WorkoutTemplateModel) _then) = _$WorkoutTemplateModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'sport_id') String sportId, String? description, bool isSmartGenerated, List<WorkoutDayModel> days
});




}
/// @nodoc
class _$WorkoutTemplateModelCopyWithImpl<$Res>
    implements $WorkoutTemplateModelCopyWith<$Res> {
  _$WorkoutTemplateModelCopyWithImpl(this._self, this._then);

  final WorkoutTemplateModel _self;
  final $Res Function(WorkoutTemplateModel) _then;

/// Create a copy of WorkoutTemplateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sportId = null,Object? description = freezed,Object? isSmartGenerated = null,Object? days = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isSmartGenerated: null == isSmartGenerated ? _self.isSmartGenerated : isSmartGenerated // ignore: cast_nullable_to_non_nullable
as bool,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<WorkoutDayModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutTemplateModel].
extension WorkoutTemplateModelPatterns on WorkoutTemplateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutTemplateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutTemplateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutTemplateModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutTemplateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutTemplateModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutTemplateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description,  bool isSmartGenerated,  List<WorkoutDayModel> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutTemplateModel() when $default != null:
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.isSmartGenerated,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description,  bool isSmartGenerated,  List<WorkoutDayModel> days)  $default,) {final _that = this;
switch (_that) {
case _WorkoutTemplateModel():
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.isSmartGenerated,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'sport_id')  String sportId,  String? description,  bool isSmartGenerated,  List<WorkoutDayModel> days)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutTemplateModel() when $default != null:
return $default(_that.id,_that.name,_that.sportId,_that.description,_that.isSmartGenerated,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutTemplateModel implements WorkoutTemplateModel {
  const _WorkoutTemplateModel({required this.id, required this.name, @JsonKey(name: 'sport_id') required this.sportId, this.description, this.isSmartGenerated = false, final  List<WorkoutDayModel> days = const []}): _days = days;
  factory _WorkoutTemplateModel.fromJson(Map<String, dynamic> json) => _$WorkoutTemplateModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'sport_id') final  String sportId;
@override final  String? description;
@override@JsonKey() final  bool isSmartGenerated;
 final  List<WorkoutDayModel> _days;
@override@JsonKey() List<WorkoutDayModel> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of WorkoutTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutTemplateModelCopyWith<_WorkoutTemplateModel> get copyWith => __$WorkoutTemplateModelCopyWithImpl<_WorkoutTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutTemplateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.description, description) || other.description == description)&&(identical(other.isSmartGenerated, isSmartGenerated) || other.isSmartGenerated == isSmartGenerated)&&const DeepCollectionEquality().equals(other._days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sportId,description,isSmartGenerated,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'WorkoutTemplateModel(id: $id, name: $name, sportId: $sportId, description: $description, isSmartGenerated: $isSmartGenerated, days: $days)';
}


}

/// @nodoc
abstract mixin class _$WorkoutTemplateModelCopyWith<$Res> implements $WorkoutTemplateModelCopyWith<$Res> {
  factory _$WorkoutTemplateModelCopyWith(_WorkoutTemplateModel value, $Res Function(_WorkoutTemplateModel) _then) = __$WorkoutTemplateModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'sport_id') String sportId, String? description, bool isSmartGenerated, List<WorkoutDayModel> days
});




}
/// @nodoc
class __$WorkoutTemplateModelCopyWithImpl<$Res>
    implements _$WorkoutTemplateModelCopyWith<$Res> {
  __$WorkoutTemplateModelCopyWithImpl(this._self, this._then);

  final _WorkoutTemplateModel _self;
  final $Res Function(_WorkoutTemplateModel) _then;

/// Create a copy of WorkoutTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sportId = null,Object? description = freezed,Object? isSmartGenerated = null,Object? days = null,}) {
  return _then(_WorkoutTemplateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isSmartGenerated: null == isSmartGenerated ? _self.isSmartGenerated : isSmartGenerated // ignore: cast_nullable_to_non_nullable
as bool,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<WorkoutDayModel>,
  ));
}


}

// dart format on
