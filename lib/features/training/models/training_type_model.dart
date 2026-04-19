import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_type_model.freezed.dart';
part 'training_type_model.g.dart';

@freezed
abstract class TrainingTypeModel with _$TrainingTypeModel {
  const factory TrainingTypeModel({
    required String id,
    @JsonKey(name: 'sport_id') required String sportId,
    required String name,
    String? description,
  }) = _TrainingTypeModel;

  factory TrainingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingTypeModelFromJson(json);
}
