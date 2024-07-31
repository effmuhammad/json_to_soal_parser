import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String answer,
    required List<String> answerDetail,
    required Map<String, List<String>> choices,
    required List<String> question,
  }) = _Question;

  // factory Question.fromJson(Map<String, Object?> json) =>
  //     _$QuestionFromJson(json);

  factory Question.fromJson(Map<String, Object?> json) {
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

    return Question(
      id: json['id'] as int,
      answer: json['answer'] as String,
      answerDetail:
          (json['answerDetail'] as List).map((e) => e as String).toList(),
      choices: (json['choices'] as Map<String, dynamic>).map((key, value) {
        return MapEntry(key, (value as List).map((e) => e as String).toList());
      }),
      question: (json['question'] as List).map((e) => e as String).toList(),
    );
  }
}
