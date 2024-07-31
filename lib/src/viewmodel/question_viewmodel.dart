import 'package:json_to_soal_parser/src/models/question.dart';

class SoalViewModel {
  static List<Question> fromJsonList(List<Map<String, Object?>> jsonList) =>
      jsonList.map((e) => Question.fromJson(e)).toList();
}
