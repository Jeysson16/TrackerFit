import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_day_model.dart';

part 'workout_template_model.freezed.dart';
part 'workout_template_model.g.dart';

@freezed
abstract class WorkoutTemplateModel with _$WorkoutTemplateModel {
  const factory WorkoutTemplateModel({
    required String id,
    required String name,
    @JsonKey(name: 'sport_id') required String sportId,
    String? description,
    @Default(false) bool isSmartGenerated,
    @Default([]) List<WorkoutDayModel> days,
  }) = _WorkoutTemplateModel;

  factory WorkoutTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutTemplateModelFromJson(json);
}
