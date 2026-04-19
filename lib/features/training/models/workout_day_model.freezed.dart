// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutDayModel {

 String get id; String get name; bool get isRestDay;@JsonKey(name: 'training_type_ids') List<String> get trainingTypeIds;@JsonKey(name: 'exercise_configs') List<ExerciseConfigModel> get exercises;
/// Create a copy of WorkoutDayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutDayModelCopyWith<WorkoutDayModel> get copyWith => _$WorkoutDayModelCopyWithImpl<WorkoutDayModel>(this as WorkoutDayModel, _$identity);

  /// Serializes this WorkoutDayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutDayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isRestDay, isRestDay) || other.isRestDay == isRestDay)&&const DeepCollectionEquality().equals(other.trainingTypeIds, trainingTypeIds)&&const DeepCollectionEquality().equals(other.exercises, exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isRestDay,const DeepCollectionEquality().hash(trainingTypeIds),const DeepCollectionEquality().hash(exercises));

@override
String toString() {
  return 'WorkoutDayModel(id: $id, name: $name, isRestDay: $isRestDay, trainingTypeIds: $trainingTypeIds, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $WorkoutDayModelCopyWith<$Res>  {
  factory $WorkoutDayModelCopyWith(WorkoutDayModel value, $Res Function(WorkoutDayModel) _then) = _$WorkoutDayModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool isRestDay,@JsonKey(name: 'training_type_ids') List<String> trainingTypeIds,@JsonKey(name: 'exercise_configs') List<ExerciseConfigModel> exercises
});




}
/// @nodoc
class _$WorkoutDayModelCopyWithImpl<$Res>
    implements $WorkoutDayModelCopyWith<$Res> {
  _$WorkoutDayModelCopyWithImpl(this._self, this._then);

  final WorkoutDayModel _self;
  final $Res Function(WorkoutDayModel) _then;

/// Create a copy of WorkoutDayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isRestDay = null,Object? trainingTypeIds = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isRestDay: null == isRestDay ? _self.isRestDay : isRestDay // ignore: cast_nullable_to_non_nullable
as bool,trainingTypeIds: null == trainingTypeIds ? _self.trainingTypeIds : trainingTypeIds // ignore: cast_nullable_to_non_nullable
as List<String>,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<ExerciseConfigModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutDayModel].
extension WorkoutDayModelPatterns on WorkoutDayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutDayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutDayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutDayModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutDayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutDayModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutDayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool isRestDay, @JsonKey(name: 'training_type_ids')  List<String> trainingTypeIds, @JsonKey(name: 'exercise_configs')  List<ExerciseConfigModel> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutDayModel() when $default != null:
return $default(_that.id,_that.name,_that.isRestDay,_that.trainingTypeIds,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool isRestDay, @JsonKey(name: 'training_type_ids')  List<String> trainingTypeIds, @JsonKey(name: 'exercise_configs')  List<ExerciseConfigModel> exercises)  $default,) {final _that = this;
switch (_that) {
case _WorkoutDayModel():
return $default(_that.id,_that.name,_that.isRestDay,_that.trainingTypeIds,_that.exercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool isRestDay, @JsonKey(name: 'training_type_ids')  List<String> trainingTypeIds, @JsonKey(name: 'exercise_configs')  List<ExerciseConfigModel> exercises)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutDayModel() when $default != null:
return $default(_that.id,_that.name,_that.isRestDay,_that.trainingTypeIds,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutDayModel implements WorkoutDayModel {
  const _WorkoutDayModel({required this.id, required this.name, this.isRestDay = false, @JsonKey(name: 'training_type_ids') final  List<String> trainingTypeIds = const [], @JsonKey(name: 'exercise_configs') final  List<ExerciseConfigModel> exercises = const []}): _trainingTypeIds = trainingTypeIds,_exercises = exercises;
  factory _WorkoutDayModel.fromJson(Map<String, dynamic> json) => _$WorkoutDayModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  bool isRestDay;
 final  List<String> _trainingTypeIds;
@override@JsonKey(name: 'training_type_ids') List<String> get trainingTypeIds {
  if (_trainingTypeIds is EqualUnmodifiableListView) return _trainingTypeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingTypeIds);
}

 final  List<ExerciseConfigModel> _exercises;
@override@JsonKey(name: 'exercise_configs') List<ExerciseConfigModel> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of WorkoutDayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutDayModelCopyWith<_WorkoutDayModel> get copyWith => __$WorkoutDayModelCopyWithImpl<_WorkoutDayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutDayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutDayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isRestDay, isRestDay) || other.isRestDay == isRestDay)&&const DeepCollectionEquality().equals(other._trainingTypeIds, _trainingTypeIds)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,isRestDay,const DeepCollectionEquality().hash(_trainingTypeIds),const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'WorkoutDayModel(id: $id, name: $name, isRestDay: $isRestDay, trainingTypeIds: $trainingTypeIds, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$WorkoutDayModelCopyWith<$Res> implements $WorkoutDayModelCopyWith<$Res> {
  factory _$WorkoutDayModelCopyWith(_WorkoutDayModel value, $Res Function(_WorkoutDayModel) _then) = __$WorkoutDayModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool isRestDay,@JsonKey(name: 'training_type_ids') List<String> trainingTypeIds,@JsonKey(name: 'exercise_configs') List<ExerciseConfigModel> exercises
});




}
/// @nodoc
class __$WorkoutDayModelCopyWithImpl<$Res>
    implements _$WorkoutDayModelCopyWith<$Res> {
  __$WorkoutDayModelCopyWithImpl(this._self, this._then);

  final _WorkoutDayModel _self;
  final $Res Function(_WorkoutDayModel) _then;

/// Create a copy of WorkoutDayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isRestDay = null,Object? trainingTypeIds = null,Object? exercises = null,}) {
  return _then(_WorkoutDayModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isRestDay: null == isRestDay ? _self.isRestDay : isRestDay // ignore: cast_nullable_to_non_nullable
as bool,trainingTypeIds: null == trainingTypeIds ? _self._trainingTypeIds : trainingTypeIds // ignore: cast_nullable_to_non_nullable
as List<String>,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<ExerciseConfigModel>,
  ));
}


}


/// @nodoc
mixin _$ExerciseConfigModel {

@JsonKey(name: 'exercise_id') String get exerciseId; int get orderIndex; List<SetConfigModel> get sets;
/// Create a copy of ExerciseConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseConfigModelCopyWith<ExerciseConfigModel> get copyWith => _$ExerciseConfigModelCopyWithImpl<ExerciseConfigModel>(this as ExerciseConfigModel, _$identity);

  /// Serializes this ExerciseConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseConfigModel&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other.sets, sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,orderIndex,const DeepCollectionEquality().hash(sets));

@override
String toString() {
  return 'ExerciseConfigModel(exerciseId: $exerciseId, orderIndex: $orderIndex, sets: $sets)';
}


}

/// @nodoc
abstract mixin class $ExerciseConfigModelCopyWith<$Res>  {
  factory $ExerciseConfigModelCopyWith(ExerciseConfigModel value, $Res Function(ExerciseConfigModel) _then) = _$ExerciseConfigModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'exercise_id') String exerciseId, int orderIndex, List<SetConfigModel> sets
});




}
/// @nodoc
class _$ExerciseConfigModelCopyWithImpl<$Res>
    implements $ExerciseConfigModelCopyWith<$Res> {
  _$ExerciseConfigModelCopyWithImpl(this._self, this._then);

  final ExerciseConfigModel _self;
  final $Res Function(ExerciseConfigModel) _then;

/// Create a copy of ExerciseConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? orderIndex = null,Object? sets = null,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetConfigModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseConfigModel].
extension ExerciseConfigModelPatterns on ExerciseConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'exercise_id')  String exerciseId,  int orderIndex,  List<SetConfigModel> sets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseConfigModel() when $default != null:
return $default(_that.exerciseId,_that.orderIndex,_that.sets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'exercise_id')  String exerciseId,  int orderIndex,  List<SetConfigModel> sets)  $default,) {final _that = this;
switch (_that) {
case _ExerciseConfigModel():
return $default(_that.exerciseId,_that.orderIndex,_that.sets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'exercise_id')  String exerciseId,  int orderIndex,  List<SetConfigModel> sets)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseConfigModel() when $default != null:
return $default(_that.exerciseId,_that.orderIndex,_that.sets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseConfigModel implements ExerciseConfigModel {
  const _ExerciseConfigModel({@JsonKey(name: 'exercise_id') required this.exerciseId, this.orderIndex = 0, final  List<SetConfigModel> sets = const []}): _sets = sets;
  factory _ExerciseConfigModel.fromJson(Map<String, dynamic> json) => _$ExerciseConfigModelFromJson(json);

@override@JsonKey(name: 'exercise_id') final  String exerciseId;
@override@JsonKey() final  int orderIndex;
 final  List<SetConfigModel> _sets;
@override@JsonKey() List<SetConfigModel> get sets {
  if (_sets is EqualUnmodifiableListView) return _sets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sets);
}


/// Create a copy of ExerciseConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseConfigModelCopyWith<_ExerciseConfigModel> get copyWith => __$ExerciseConfigModelCopyWithImpl<_ExerciseConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseConfigModel&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other._sets, _sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,orderIndex,const DeepCollectionEquality().hash(_sets));

@override
String toString() {
  return 'ExerciseConfigModel(exerciseId: $exerciseId, orderIndex: $orderIndex, sets: $sets)';
}


}

/// @nodoc
abstract mixin class _$ExerciseConfigModelCopyWith<$Res> implements $ExerciseConfigModelCopyWith<$Res> {
  factory _$ExerciseConfigModelCopyWith(_ExerciseConfigModel value, $Res Function(_ExerciseConfigModel) _then) = __$ExerciseConfigModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'exercise_id') String exerciseId, int orderIndex, List<SetConfigModel> sets
});




}
/// @nodoc
class __$ExerciseConfigModelCopyWithImpl<$Res>
    implements _$ExerciseConfigModelCopyWith<$Res> {
  __$ExerciseConfigModelCopyWithImpl(this._self, this._then);

  final _ExerciseConfigModel _self;
  final $Res Function(_ExerciseConfigModel) _then;

/// Create a copy of ExerciseConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? orderIndex = null,Object? sets = null,}) {
  return _then(_ExerciseConfigModel(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,sets: null == sets ? _self._sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetConfigModel>,
  ));
}


}


/// @nodoc
mixin _$SetConfigModel {

 int get setOrder;@JsonKey(name: 'target_reps_min') int? get targetRepsMin;@JsonKey(name: 'target_reps_max') int? get targetRepsMax;@JsonKey(name: 'target_rir') int? get targetRir;@JsonKey(name: 'weight') double? get weight;@JsonKey(name: 'max_velocity') double? get maxVelocity;@JsonKey(name: 'duration_seconds') int? get durationSeconds;@JsonKey(name: 'rest_seconds') int? get restSeconds;@JsonKey(name: 'is_amrap') bool get isAmrap;
/// Create a copy of SetConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetConfigModelCopyWith<SetConfigModel> get copyWith => _$SetConfigModelCopyWithImpl<SetConfigModel>(this as SetConfigModel, _$identity);

  /// Serializes this SetConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetConfigModel&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.targetRepsMin, targetRepsMin) || other.targetRepsMin == targetRepsMin)&&(identical(other.targetRepsMax, targetRepsMax) || other.targetRepsMax == targetRepsMax)&&(identical(other.targetRir, targetRir) || other.targetRir == targetRir)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&(identical(other.isAmrap, isAmrap) || other.isAmrap == isAmrap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setOrder,targetRepsMin,targetRepsMax,targetRir,weight,maxVelocity,durationSeconds,restSeconds,isAmrap);

@override
String toString() {
  return 'SetConfigModel(setOrder: $setOrder, targetRepsMin: $targetRepsMin, targetRepsMax: $targetRepsMax, targetRir: $targetRir, weight: $weight, maxVelocity: $maxVelocity, durationSeconds: $durationSeconds, restSeconds: $restSeconds, isAmrap: $isAmrap)';
}


}

/// @nodoc
abstract mixin class $SetConfigModelCopyWith<$Res>  {
  factory $SetConfigModelCopyWith(SetConfigModel value, $Res Function(SetConfigModel) _then) = _$SetConfigModelCopyWithImpl;
@useResult
$Res call({
 int setOrder,@JsonKey(name: 'target_reps_min') int? targetRepsMin,@JsonKey(name: 'target_reps_max') int? targetRepsMax,@JsonKey(name: 'target_rir') int? targetRir,@JsonKey(name: 'weight') double? weight,@JsonKey(name: 'max_velocity') double? maxVelocity,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'rest_seconds') int? restSeconds,@JsonKey(name: 'is_amrap') bool isAmrap
});




}
/// @nodoc
class _$SetConfigModelCopyWithImpl<$Res>
    implements $SetConfigModelCopyWith<$Res> {
  _$SetConfigModelCopyWithImpl(this._self, this._then);

  final SetConfigModel _self;
  final $Res Function(SetConfigModel) _then;

/// Create a copy of SetConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setOrder = null,Object? targetRepsMin = freezed,Object? targetRepsMax = freezed,Object? targetRir = freezed,Object? weight = freezed,Object? maxVelocity = freezed,Object? durationSeconds = freezed,Object? restSeconds = freezed,Object? isAmrap = null,}) {
  return _then(_self.copyWith(
setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,targetRepsMin: freezed == targetRepsMin ? _self.targetRepsMin : targetRepsMin // ignore: cast_nullable_to_non_nullable
as int?,targetRepsMax: freezed == targetRepsMax ? _self.targetRepsMax : targetRepsMax // ignore: cast_nullable_to_non_nullable
as int?,targetRir: freezed == targetRir ? _self.targetRir : targetRir // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,maxVelocity: freezed == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: freezed == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int?,isAmrap: null == isAmrap ? _self.isAmrap : isAmrap // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SetConfigModel].
extension SetConfigModelPatterns on SetConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _SetConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _SetConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int setOrder, @JsonKey(name: 'target_reps_min')  int? targetRepsMin, @JsonKey(name: 'target_reps_max')  int? targetRepsMax, @JsonKey(name: 'target_rir')  int? targetRir, @JsonKey(name: 'weight')  double? weight, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds, @JsonKey(name: 'is_amrap')  bool isAmrap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetConfigModel() when $default != null:
return $default(_that.setOrder,_that.targetRepsMin,_that.targetRepsMax,_that.targetRir,_that.weight,_that.maxVelocity,_that.durationSeconds,_that.restSeconds,_that.isAmrap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int setOrder, @JsonKey(name: 'target_reps_min')  int? targetRepsMin, @JsonKey(name: 'target_reps_max')  int? targetRepsMax, @JsonKey(name: 'target_rir')  int? targetRir, @JsonKey(name: 'weight')  double? weight, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds, @JsonKey(name: 'is_amrap')  bool isAmrap)  $default,) {final _that = this;
switch (_that) {
case _SetConfigModel():
return $default(_that.setOrder,_that.targetRepsMin,_that.targetRepsMax,_that.targetRir,_that.weight,_that.maxVelocity,_that.durationSeconds,_that.restSeconds,_that.isAmrap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int setOrder, @JsonKey(name: 'target_reps_min')  int? targetRepsMin, @JsonKey(name: 'target_reps_max')  int? targetRepsMax, @JsonKey(name: 'target_rir')  int? targetRir, @JsonKey(name: 'weight')  double? weight, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds, @JsonKey(name: 'is_amrap')  bool isAmrap)?  $default,) {final _that = this;
switch (_that) {
case _SetConfigModel() when $default != null:
return $default(_that.setOrder,_that.targetRepsMin,_that.targetRepsMax,_that.targetRir,_that.weight,_that.maxVelocity,_that.durationSeconds,_that.restSeconds,_that.isAmrap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetConfigModel implements SetConfigModel {
  const _SetConfigModel({required this.setOrder, @JsonKey(name: 'target_reps_min') this.targetRepsMin, @JsonKey(name: 'target_reps_max') this.targetRepsMax, @JsonKey(name: 'target_rir') this.targetRir, @JsonKey(name: 'weight') this.weight, @JsonKey(name: 'max_velocity') this.maxVelocity, @JsonKey(name: 'duration_seconds') this.durationSeconds, @JsonKey(name: 'rest_seconds') this.restSeconds, @JsonKey(name: 'is_amrap') this.isAmrap = false});
  factory _SetConfigModel.fromJson(Map<String, dynamic> json) => _$SetConfigModelFromJson(json);

@override final  int setOrder;
@override@JsonKey(name: 'target_reps_min') final  int? targetRepsMin;
@override@JsonKey(name: 'target_reps_max') final  int? targetRepsMax;
@override@JsonKey(name: 'target_rir') final  int? targetRir;
@override@JsonKey(name: 'weight') final  double? weight;
@override@JsonKey(name: 'max_velocity') final  double? maxVelocity;
@override@JsonKey(name: 'duration_seconds') final  int? durationSeconds;
@override@JsonKey(name: 'rest_seconds') final  int? restSeconds;
@override@JsonKey(name: 'is_amrap') final  bool isAmrap;

/// Create a copy of SetConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConfigModelCopyWith<_SetConfigModel> get copyWith => __$SetConfigModelCopyWithImpl<_SetConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConfigModel&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.targetRepsMin, targetRepsMin) || other.targetRepsMin == targetRepsMin)&&(identical(other.targetRepsMax, targetRepsMax) || other.targetRepsMax == targetRepsMax)&&(identical(other.targetRir, targetRir) || other.targetRir == targetRir)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&(identical(other.isAmrap, isAmrap) || other.isAmrap == isAmrap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setOrder,targetRepsMin,targetRepsMax,targetRir,weight,maxVelocity,durationSeconds,restSeconds,isAmrap);

@override
String toString() {
  return 'SetConfigModel(setOrder: $setOrder, targetRepsMin: $targetRepsMin, targetRepsMax: $targetRepsMax, targetRir: $targetRir, weight: $weight, maxVelocity: $maxVelocity, durationSeconds: $durationSeconds, restSeconds: $restSeconds, isAmrap: $isAmrap)';
}


}

/// @nodoc
abstract mixin class _$SetConfigModelCopyWith<$Res> implements $SetConfigModelCopyWith<$Res> {
  factory _$SetConfigModelCopyWith(_SetConfigModel value, $Res Function(_SetConfigModel) _then) = __$SetConfigModelCopyWithImpl;
@override @useResult
$Res call({
 int setOrder,@JsonKey(name: 'target_reps_min') int? targetRepsMin,@JsonKey(name: 'target_reps_max') int? targetRepsMax,@JsonKey(name: 'target_rir') int? targetRir,@JsonKey(name: 'weight') double? weight,@JsonKey(name: 'max_velocity') double? maxVelocity,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'rest_seconds') int? restSeconds,@JsonKey(name: 'is_amrap') bool isAmrap
});




}
/// @nodoc
class __$SetConfigModelCopyWithImpl<$Res>
    implements _$SetConfigModelCopyWith<$Res> {
  __$SetConfigModelCopyWithImpl(this._self, this._then);

  final _SetConfigModel _self;
  final $Res Function(_SetConfigModel) _then;

/// Create a copy of SetConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setOrder = null,Object? targetRepsMin = freezed,Object? targetRepsMax = freezed,Object? targetRir = freezed,Object? weight = freezed,Object? maxVelocity = freezed,Object? durationSeconds = freezed,Object? restSeconds = freezed,Object? isAmrap = null,}) {
  return _then(_SetConfigModel(
setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,targetRepsMin: freezed == targetRepsMin ? _self.targetRepsMin : targetRepsMin // ignore: cast_nullable_to_non_nullable
as int?,targetRepsMax: freezed == targetRepsMax ? _self.targetRepsMax : targetRepsMax // ignore: cast_nullable_to_non_nullable
as int?,targetRir: freezed == targetRir ? _self.targetRir : targetRir // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,maxVelocity: freezed == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: freezed == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int?,isAmrap: null == isAmrap ? _self.isAmrap : isAmrap // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
