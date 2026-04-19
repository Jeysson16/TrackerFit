import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_model.freezed.dart';
part 'sport_model.g.dart';

@freezed
abstract class SportModel with _$SportModel {
  const factory SportModel({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'icon_name') String? iconName,
  }) = _SportModel;

  factory SportModel.fromJson(Map<String, dynamic> json) =>
      _$SportModelFromJson(json);
}
