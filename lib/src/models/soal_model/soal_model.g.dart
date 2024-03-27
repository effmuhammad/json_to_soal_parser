// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoalModelImpl _$$SoalModelImplFromJson(Map<String, dynamic> json) =>
    _$SoalModelImpl(
      jawaban: json['jawaban'] as String,
      pembahasan: (json['pembahasan'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pilihan: (json['pilihan'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      pertanyaan: (json['pertanyaan'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SoalModelImplToJson(_$SoalModelImpl instance) =>
    <String, dynamic>{
      'jawaban': instance.jawaban,
      'pembahasan': instance.pembahasan,
      'pilihan': instance.pilihan,
      'pertanyaan': instance.pertanyaan,
    };
