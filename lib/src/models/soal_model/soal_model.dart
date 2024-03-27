import 'package:freezed_annotation/freezed_annotation.dart';

part 'soal_model.freezed.dart';

part 'soal_model.g.dart';

@freezed
class SoalModel with _$SoalModel {
  const factory SoalModel({
    required String jawaban,
    required List<String> pembahasan,
    required Map<String, List<String>> pilihan,
    required List<String> pertanyaan,
  }) = _SoalModel;

  factory SoalModel.fromJson(Map<String, Object?> json) =>
      _$SoalModelFromJson(json);
}
