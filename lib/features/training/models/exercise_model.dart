import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
abstract class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String id,
    required String name,
    @JsonKey(name: 'sport_id') required String sportId,
    String? description,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'primary_muscles') @Default([]) List<String> primaryMuscles,
    @JsonKey(name: 'secondary_muscles') @Default([]) List<String> secondaryMuscles,
    @JsonKey(name: 'training_types') @Default([]) List<String> trainingTypes,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
}
