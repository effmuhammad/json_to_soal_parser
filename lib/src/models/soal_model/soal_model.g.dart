// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoalModelImpl _$$SoalModelImplFromJson(Map<String, dynamic> json) =>
    _$SoalModelImpl(
      answer: json['answer'] as String,
      answerDetail: (json['answerDetail'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      choices: (json['choices'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      question:
          (json['question'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SoalModelImplToJson(_$SoalModelImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'answerDetail': instance.answerDetail,
      'choices': instance.choices,
      'question': instance.question,
    };
