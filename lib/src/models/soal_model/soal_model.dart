import 'package:freezed_annotation/freezed_annotation.dart';

part 'soal_model.freezed.dart';

part 'soal_model.g.dart';

@freezed
class SoalModel with _$SoalModel {
  const factory SoalModel({
    required int id,
    required String answer,
    required List<String> answerDetail,
    required Map<String, List<String>> choices,
    required List<String> question,
  }) = _SoalModel;

  factory SoalModel.fromJson(Map<String, Object?> json) {
    if (json['answerDetail'] is! List) {
      json['answerDetail'] = [json['answerDetail']];
    }

    if (json['question'] is! List) {
      json['question'] = [json['question']];
    }

    json['choices'] =
        (json['choices'] as Map<String, dynamic>).map((key, value) {
      if (value is! List) {
        return MapEntry(key, [value]);
      }
      return MapEntry(key, value);
    });

    return _$SoalModelFromJson(json);
  }
}
