// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutSessionModel {

 String? get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'routine_id') String? get routineId;@JsonKey(name: 'workout_day_id') String? get workoutDayId; String? get name;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime? get endTime;@JsonKey(name: 'day_rating') int? get dayRating; String? get notes;// For Offline Sync
@JsonKey(name: 'local_id') String? get localId;@JsonKey(name: 'synced_at') DateTime? get syncedAt;// Nested objects (Optional, depending on API response structure)
@JsonKey(name: 'exercise_logs') List<ExerciseLogModel> get exercises;
/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionModelCopyWith<WorkoutSessionModel> get copyWith => _$WorkoutSessionModelCopyWithImpl<WorkoutSessionModel>(this as WorkoutSessionModel, _$identity);

  /// Serializes this WorkoutSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.workoutDayId, workoutDayId) || other.workoutDayId == workoutDayId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.dayRating, dayRating) || other.dayRating == dayRating)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&const DeepCollectionEquality().equals(other.exercises, exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,routineId,workoutDayId,name,startTime,endTime,dayRating,notes,localId,syncedAt,const DeepCollectionEquality().hash(exercises));

@override
String toString() {
  return 'WorkoutSessionModel(id: $id, userId: $userId, routineId: $routineId, workoutDayId: $workoutDayId, name: $name, startTime: $startTime, endTime: $endTime, dayRating: $dayRating, notes: $notes, localId: $localId, syncedAt: $syncedAt, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionModelCopyWith<$Res>  {
  factory $WorkoutSessionModelCopyWith(WorkoutSessionModel value, $Res Function(WorkoutSessionModel) _then) = _$WorkoutSessionModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'routine_id') String? routineId,@JsonKey(name: 'workout_day_id') String? workoutDayId, String? name,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime,@JsonKey(name: 'day_rating') int? dayRating, String? notes,@JsonKey(name: 'local_id') String? localId,@JsonKey(name: 'synced_at') DateTime? syncedAt,@JsonKey(name: 'exercise_logs') List<ExerciseLogModel> exercises
});




}
/// @nodoc
class _$WorkoutSessionModelCopyWithImpl<$Res>
    implements $WorkoutSessionModelCopyWith<$Res> {
  _$WorkoutSessionModelCopyWithImpl(this._self, this._then);

  final WorkoutSessionModel _self;
  final $Res Function(WorkoutSessionModel) _then;

/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? routineId = freezed,Object? workoutDayId = freezed,Object? name = freezed,Object? startTime = null,Object? endTime = freezed,Object? dayRating = freezed,Object? notes = freezed,Object? localId = freezed,Object? syncedAt = freezed,Object? exercises = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,workoutDayId: freezed == workoutDayId ? _self.workoutDayId : workoutDayId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,dayRating: freezed == dayRating ? _self.dayRating : dayRating // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String?,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutSessionModel].
extension WorkoutSessionModelPatterns on WorkoutSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'routine_id')  String? routineId, @JsonKey(name: 'workout_day_id')  String? workoutDayId,  String? name, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'day_rating')  int? dayRating,  String? notes, @JsonKey(name: 'local_id')  String? localId, @JsonKey(name: 'synced_at')  DateTime? syncedAt, @JsonKey(name: 'exercise_logs')  List<ExerciseLogModel> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutSessionModel() when $default != null:
return $default(_that.id,_that.userId,_that.routineId,_that.workoutDayId,_that.name,_that.startTime,_that.endTime,_that.dayRating,_that.notes,_that.localId,_that.syncedAt,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'routine_id')  String? routineId, @JsonKey(name: 'workout_day_id')  String? workoutDayId,  String? name, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'day_rating')  int? dayRating,  String? notes, @JsonKey(name: 'local_id')  String? localId, @JsonKey(name: 'synced_at')  DateTime? syncedAt, @JsonKey(name: 'exercise_logs')  List<ExerciseLogModel> exercises)  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionModel():
return $default(_that.id,_that.userId,_that.routineId,_that.workoutDayId,_that.name,_that.startTime,_that.endTime,_that.dayRating,_that.notes,_that.localId,_that.syncedAt,_that.exercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'routine_id')  String? routineId, @JsonKey(name: 'workout_day_id')  String? workoutDayId,  String? name, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'day_rating')  int? dayRating,  String? notes, @JsonKey(name: 'local_id')  String? localId, @JsonKey(name: 'synced_at')  DateTime? syncedAt, @JsonKey(name: 'exercise_logs')  List<ExerciseLogModel> exercises)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionModel() when $default != null:
return $default(_that.id,_that.userId,_that.routineId,_that.workoutDayId,_that.name,_that.startTime,_that.endTime,_that.dayRating,_that.notes,_that.localId,_that.syncedAt,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutSessionModel implements WorkoutSessionModel {
  const _WorkoutSessionModel({this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'routine_id') this.routineId, @JsonKey(name: 'workout_day_id') this.workoutDayId, this.name, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'day_rating') this.dayRating, this.notes, @JsonKey(name: 'local_id') this.localId, @JsonKey(name: 'synced_at') this.syncedAt, @JsonKey(name: 'exercise_logs') final  List<ExerciseLogModel> exercises = const []}): _exercises = exercises;
  factory _WorkoutSessionModel.fromJson(Map<String, dynamic> json) => _$WorkoutSessionModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'routine_id') final  String? routineId;
@override@JsonKey(name: 'workout_day_id') final  String? workoutDayId;
@override final  String? name;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime? endTime;
@override@JsonKey(name: 'day_rating') final  int? dayRating;
@override final  String? notes;
// For Offline Sync
@override@JsonKey(name: 'local_id') final  String? localId;
@override@JsonKey(name: 'synced_at') final  DateTime? syncedAt;
// Nested objects (Optional, depending on API response structure)
 final  List<ExerciseLogModel> _exercises;
// Nested objects (Optional, depending on API response structure)
@override@JsonKey(name: 'exercise_logs') List<ExerciseLogModel> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutSessionModelCopyWith<_WorkoutSessionModel> get copyWith => __$WorkoutSessionModelCopyWithImpl<_WorkoutSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.workoutDayId, workoutDayId) || other.workoutDayId == workoutDayId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.dayRating, dayRating) || other.dayRating == dayRating)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,routineId,workoutDayId,name,startTime,endTime,dayRating,notes,localId,syncedAt,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'WorkoutSessionModel(id: $id, userId: $userId, routineId: $routineId, workoutDayId: $workoutDayId, name: $name, startTime: $startTime, endTime: $endTime, dayRating: $dayRating, notes: $notes, localId: $localId, syncedAt: $syncedAt, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$WorkoutSessionModelCopyWith<$Res> implements $WorkoutSessionModelCopyWith<$Res> {
  factory _$WorkoutSessionModelCopyWith(_WorkoutSessionModel value, $Res Function(_WorkoutSessionModel) _then) = __$WorkoutSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'routine_id') String? routineId,@JsonKey(name: 'workout_day_id') String? workoutDayId, String? name,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime,@JsonKey(name: 'day_rating') int? dayRating, String? notes,@JsonKey(name: 'local_id') String? localId,@JsonKey(name: 'synced_at') DateTime? syncedAt,@JsonKey(name: 'exercise_logs') List<ExerciseLogModel> exercises
});




}
/// @nodoc
class __$WorkoutSessionModelCopyWithImpl<$Res>
    implements _$WorkoutSessionModelCopyWith<$Res> {
  __$WorkoutSessionModelCopyWithImpl(this._self, this._then);

  final _WorkoutSessionModel _self;
  final $Res Function(_WorkoutSessionModel) _then;

/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? routineId = freezed,Object? workoutDayId = freezed,Object? name = freezed,Object? startTime = null,Object? endTime = freezed,Object? dayRating = freezed,Object? notes = freezed,Object? localId = freezed,Object? syncedAt = freezed,Object? exercises = null,}) {
  return _then(_WorkoutSessionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,routineId: freezed == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String?,workoutDayId: freezed == workoutDayId ? _self.workoutDayId : workoutDayId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,dayRating: freezed == dayRating ? _self.dayRating : dayRating // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String?,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogModel>,
  ));
}


}


/// @nodoc
mixin _$ExerciseLogModel {

 String? get id;@JsonKey(name: 'exercise_id') String get exerciseId;@JsonKey(name: 'order_index') int get orderIndex; String? get notes;@JsonKey(name: 'set_logs') List<SetLogModel> get sets;
/// Create a copy of ExerciseLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseLogModelCopyWith<ExerciseLogModel> get copyWith => _$ExerciseLogModelCopyWithImpl<ExerciseLogModel>(this as ExerciseLogModel, _$identity);

  /// Serializes this ExerciseLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.sets, sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,orderIndex,notes,const DeepCollectionEquality().hash(sets));

@override
String toString() {
  return 'ExerciseLogModel(id: $id, exerciseId: $exerciseId, orderIndex: $orderIndex, notes: $notes, sets: $sets)';
}


}

/// @nodoc
abstract mixin class $ExerciseLogModelCopyWith<$Res>  {
  factory $ExerciseLogModelCopyWith(ExerciseLogModel value, $Res Function(ExerciseLogModel) _then) = _$ExerciseLogModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'exercise_id') String exerciseId,@JsonKey(name: 'order_index') int orderIndex, String? notes,@JsonKey(name: 'set_logs') List<SetLogModel> sets
});




}
/// @nodoc
class _$ExerciseLogModelCopyWithImpl<$Res>
    implements $ExerciseLogModelCopyWith<$Res> {
  _$ExerciseLogModelCopyWithImpl(this._self, this._then);

  final ExerciseLogModel _self;
  final $Res Function(ExerciseLogModel) _then;

/// Create a copy of ExerciseLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? exerciseId = null,Object? orderIndex = null,Object? notes = freezed,Object? sets = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetLogModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseLogModel].
extension ExerciseLogModelPatterns on ExerciseLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseLogModel value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'exercise_id')  String exerciseId, @JsonKey(name: 'order_index')  int orderIndex,  String? notes, @JsonKey(name: 'set_logs')  List<SetLogModel> sets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseLogModel() when $default != null:
return $default(_that.id,_that.exerciseId,_that.orderIndex,_that.notes,_that.sets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'exercise_id')  String exerciseId, @JsonKey(name: 'order_index')  int orderIndex,  String? notes, @JsonKey(name: 'set_logs')  List<SetLogModel> sets)  $default,) {final _that = this;
switch (_that) {
case _ExerciseLogModel():
return $default(_that.id,_that.exerciseId,_that.orderIndex,_that.notes,_that.sets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'exercise_id')  String exerciseId, @JsonKey(name: 'order_index')  int orderIndex,  String? notes, @JsonKey(name: 'set_logs')  List<SetLogModel> sets)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseLogModel() when $default != null:
return $default(_that.id,_that.exerciseId,_that.orderIndex,_that.notes,_that.sets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseLogModel implements ExerciseLogModel {
  const _ExerciseLogModel({this.id, @JsonKey(name: 'exercise_id') required this.exerciseId, @JsonKey(name: 'order_index') this.orderIndex = 0, this.notes, @JsonKey(name: 'set_logs') final  List<SetLogModel> sets = const []}): _sets = sets;
  factory _ExerciseLogModel.fromJson(Map<String, dynamic> json) => _$ExerciseLogModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'exercise_id') final  String exerciseId;
@override@JsonKey(name: 'order_index') final  int orderIndex;
@override final  String? notes;
 final  List<SetLogModel> _sets;
@override@JsonKey(name: 'set_logs') List<SetLogModel> get sets {
  if (_sets is EqualUnmodifiableListView) return _sets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sets);
}


/// Create a copy of ExerciseLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseLogModelCopyWith<_ExerciseLogModel> get copyWith => __$ExerciseLogModelCopyWithImpl<_ExerciseLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._sets, _sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,orderIndex,notes,const DeepCollectionEquality().hash(_sets));

@override
String toString() {
  return 'ExerciseLogModel(id: $id, exerciseId: $exerciseId, orderIndex: $orderIndex, notes: $notes, sets: $sets)';
}


}

/// @nodoc
abstract mixin class _$ExerciseLogModelCopyWith<$Res> implements $ExerciseLogModelCopyWith<$Res> {
  factory _$ExerciseLogModelCopyWith(_ExerciseLogModel value, $Res Function(_ExerciseLogModel) _then) = __$ExerciseLogModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'exercise_id') String exerciseId,@JsonKey(name: 'order_index') int orderIndex, String? notes,@JsonKey(name: 'set_logs') List<SetLogModel> sets
});




}
/// @nodoc
class __$ExerciseLogModelCopyWithImpl<$Res>
    implements _$ExerciseLogModelCopyWith<$Res> {
  __$ExerciseLogModelCopyWithImpl(this._self, this._then);

  final _ExerciseLogModel _self;
  final $Res Function(_ExerciseLogModel) _then;

/// Create a copy of ExerciseLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? exerciseId = null,Object? orderIndex = null,Object? notes = freezed,Object? sets = null,}) {
  return _then(_ExerciseLogModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sets: null == sets ? _self._sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetLogModel>,
  ));
}


}


/// @nodoc
mixin _$SetLogModel {

 String? get id;@JsonKey(name: 'set_order') int get setOrder;@JsonKey(name: 'is_drop_set') bool get isDropSet; bool get isWarmup; bool get isCompleted;@JsonKey(name: 'weight_kg') double? get weightKg; int? get reps; double? get rpe; int? get rir;@JsonKey(name: 'max_velocity') double? get maxVelocity;@JsonKey(name: 'duration_seconds') int? get durationSeconds;@JsonKey(name: 'rest_seconds') int? get restSeconds;
/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLogModelCopyWith<SetLogModel> get copyWith => _$SetLogModelCopyWithImpl<SetLogModel>(this as SetLogModel, _$identity);

  /// Serializes this SetLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.isDropSet, isDropSet) || other.isDropSet == isDropSet)&&(identical(other.isWarmup, isWarmup) || other.isWarmup == isWarmup)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.rpe, rpe) || other.rpe == rpe)&&(identical(other.rir, rir) || other.rir == rir)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,setOrder,isDropSet,isWarmup,isCompleted,weightKg,reps,rpe,rir,maxVelocity,durationSeconds,restSeconds);

@override
String toString() {
  return 'SetLogModel(id: $id, setOrder: $setOrder, isDropSet: $isDropSet, isWarmup: $isWarmup, isCompleted: $isCompleted, weightKg: $weightKg, reps: $reps, rpe: $rpe, rir: $rir, maxVelocity: $maxVelocity, durationSeconds: $durationSeconds, restSeconds: $restSeconds)';
}


}

/// @nodoc
abstract mixin class $SetLogModelCopyWith<$Res>  {
  factory $SetLogModelCopyWith(SetLogModel value, $Res Function(SetLogModel) _then) = _$SetLogModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'set_order') int setOrder,@JsonKey(name: 'is_drop_set') bool isDropSet, bool isWarmup, bool isCompleted,@JsonKey(name: 'weight_kg') double? weightKg, int? reps, double? rpe, int? rir,@JsonKey(name: 'max_velocity') double? maxVelocity,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'rest_seconds') int? restSeconds
});




}
/// @nodoc
class _$SetLogModelCopyWithImpl<$Res>
    implements $SetLogModelCopyWith<$Res> {
  _$SetLogModelCopyWithImpl(this._self, this._then);

  final SetLogModel _self;
  final $Res Function(SetLogModel) _then;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? setOrder = null,Object? isDropSet = null,Object? isWarmup = null,Object? isCompleted = null,Object? weightKg = freezed,Object? reps = freezed,Object? rpe = freezed,Object? rir = freezed,Object? maxVelocity = freezed,Object? durationSeconds = freezed,Object? restSeconds = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,isDropSet: null == isDropSet ? _self.isDropSet : isDropSet // ignore: cast_nullable_to_non_nullable
as bool,isWarmup: null == isWarmup ? _self.isWarmup : isWarmup // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,rpe: freezed == rpe ? _self.rpe : rpe // ignore: cast_nullable_to_non_nullable
as double?,rir: freezed == rir ? _self.rir : rir // ignore: cast_nullable_to_non_nullable
as int?,maxVelocity: freezed == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: freezed == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetLogModel].
extension SetLogModelPatterns on SetLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetLogModel value)  $default,){
final _that = this;
switch (_that) {
case _SetLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _SetLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'set_order')  int setOrder, @JsonKey(name: 'is_drop_set')  bool isDropSet,  bool isWarmup,  bool isCompleted, @JsonKey(name: 'weight_kg')  double? weightKg,  int? reps,  double? rpe,  int? rir, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetLogModel() when $default != null:
return $default(_that.id,_that.setOrder,_that.isDropSet,_that.isWarmup,_that.isCompleted,_that.weightKg,_that.reps,_that.rpe,_that.rir,_that.maxVelocity,_that.durationSeconds,_that.restSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'set_order')  int setOrder, @JsonKey(name: 'is_drop_set')  bool isDropSet,  bool isWarmup,  bool isCompleted, @JsonKey(name: 'weight_kg')  double? weightKg,  int? reps,  double? rpe,  int? rir, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds)  $default,) {final _that = this;
switch (_that) {
case _SetLogModel():
return $default(_that.id,_that.setOrder,_that.isDropSet,_that.isWarmup,_that.isCompleted,_that.weightKg,_that.reps,_that.rpe,_that.rir,_that.maxVelocity,_that.durationSeconds,_that.restSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'set_order')  int setOrder, @JsonKey(name: 'is_drop_set')  bool isDropSet,  bool isWarmup,  bool isCompleted, @JsonKey(name: 'weight_kg')  double? weightKg,  int? reps,  double? rpe,  int? rir, @JsonKey(name: 'max_velocity')  double? maxVelocity, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'rest_seconds')  int? restSeconds)?  $default,) {final _that = this;
switch (_that) {
case _SetLogModel() when $default != null:
return $default(_that.id,_that.setOrder,_that.isDropSet,_that.isWarmup,_that.isCompleted,_that.weightKg,_that.reps,_that.rpe,_that.rir,_that.maxVelocity,_that.durationSeconds,_that.restSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetLogModel implements SetLogModel {
  const _SetLogModel({this.id, @JsonKey(name: 'set_order') required this.setOrder, @JsonKey(name: 'is_drop_set') this.isDropSet = false, this.isWarmup = false, this.isCompleted = false, @JsonKey(name: 'weight_kg') this.weightKg, this.reps, this.rpe, this.rir, @JsonKey(name: 'max_velocity') this.maxVelocity, @JsonKey(name: 'duration_seconds') this.durationSeconds, @JsonKey(name: 'rest_seconds') this.restSeconds});
  factory _SetLogModel.fromJson(Map<String, dynamic> json) => _$SetLogModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'set_order') final  int setOrder;
@override@JsonKey(name: 'is_drop_set') final  bool isDropSet;
@override@JsonKey() final  bool isWarmup;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey(name: 'weight_kg') final  double? weightKg;
@override final  int? reps;
@override final  double? rpe;
@override final  int? rir;
@override@JsonKey(name: 'max_velocity') final  double? maxVelocity;
@override@JsonKey(name: 'duration_seconds') final  int? durationSeconds;
@override@JsonKey(name: 'rest_seconds') final  int? restSeconds;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLogModelCopyWith<_SetLogModel> get copyWith => __$SetLogModelCopyWithImpl<_SetLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.isDropSet, isDropSet) || other.isDropSet == isDropSet)&&(identical(other.isWarmup, isWarmup) || other.isWarmup == isWarmup)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.rpe, rpe) || other.rpe == rpe)&&(identical(other.rir, rir) || other.rir == rir)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,setOrder,isDropSet,isWarmup,isCompleted,weightKg,reps,rpe,rir,maxVelocity,durationSeconds,restSeconds);

@override
String toString() {
  return 'SetLogModel(id: $id, setOrder: $setOrder, isDropSet: $isDropSet, isWarmup: $isWarmup, isCompleted: $isCompleted, weightKg: $weightKg, reps: $reps, rpe: $rpe, rir: $rir, maxVelocity: $maxVelocity, durationSeconds: $durationSeconds, restSeconds: $restSeconds)';
}


}

/// @nodoc
abstract mixin class _$SetLogModelCopyWith<$Res> implements $SetLogModelCopyWith<$Res> {
  factory _$SetLogModelCopyWith(_SetLogModel value, $Res Function(_SetLogModel) _then) = __$SetLogModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'set_order') int setOrder,@JsonKey(name: 'is_drop_set') bool isDropSet, bool isWarmup, bool isCompleted,@JsonKey(name: 'weight_kg') double? weightKg, int? reps, double? rpe, int? rir,@JsonKey(name: 'max_velocity') double? maxVelocity,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'rest_seconds') int? restSeconds
});




}
/// @nodoc
class __$SetLogModelCopyWithImpl<$Res>
    implements _$SetLogModelCopyWith<$Res> {
  __$SetLogModelCopyWithImpl(this._self, this._then);

  final _SetLogModel _self;
  final $Res Function(_SetLogModel) _then;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? setOrder = null,Object? isDropSet = null,Object? isWarmup = null,Object? isCompleted = null,Object? weightKg = freezed,Object? reps = freezed,Object? rpe = freezed,Object? rir = freezed,Object? maxVelocity = freezed,Object? durationSeconds = freezed,Object? restSeconds = freezed,}) {
  return _then(_SetLogModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,isDropSet: null == isDropSet ? _self.isDropSet : isDropSet // ignore: cast_nullable_to_non_nullable
as bool,isWarmup: null == isWarmup ? _self.isWarmup : isWarmup // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,rpe: freezed == rpe ? _self.rpe : rpe // ignore: cast_nullable_to_non_nullable
as double?,rir: freezed == rir ? _self.rir : rir // ignore: cast_nullable_to_non_nullable
as int?,maxVelocity: freezed == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: freezed == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
