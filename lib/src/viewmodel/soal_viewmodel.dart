import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';

class SoalViewModel {
  static List<SoalModel> fromJsonList(List<Map<String, Object?>> jsonList) =>
      jsonList.map((e) => SoalModel.fromJson(e)).toList();
}
