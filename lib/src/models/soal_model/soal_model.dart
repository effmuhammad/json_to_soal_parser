import 'package:freezed_annotation/freezed_annotation.dart';

part 'soal_model.freezed.dart';

part 'soal_model.g.dart';

@freezed
class SoalModel with _$SoalModel {
  const factory SoalModel({
    required String answer,
    required List<String> answerDetail,
    required Map<String, List<String>> choices,
    required List<String> question,
  }) = _SoalModel;

  factory SoalModel.fromJson(Map<String, Object?> json) =>
      _$SoalModelFromJson(json);
}
