// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoalModel _$SoalModelFromJson(Map<String, dynamic> json) {
  return _SoalModel.fromJson(json);
}

/// @nodoc
mixin _$SoalModel {
  String get jawaban => throw _privateConstructorUsedError;
  List<String> get pembahasan => throw _privateConstructorUsedError;
  Map<String, List<String>> get pilihan => throw _privateConstructorUsedError;
  List<String> get soal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoalModelCopyWith<SoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoalModelCopyWith<$Res> {
  factory $SoalModelCopyWith(SoalModel value, $Res Function(SoalModel) then) =
      _$SoalModelCopyWithImpl<$Res, SoalModel>;
  @useResult
  $Res call(
      {String jawaban,
      List<String> pembahasan,
      Map<String, List<String>> pilihan,
      List<String> soal});
}

/// @nodoc
class _$SoalModelCopyWithImpl<$Res, $Val extends SoalModel>
    implements $SoalModelCopyWith<$Res> {
  _$SoalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jawaban = null,
    Object? pembahasan = null,
    Object? pilihan = null,
    Object? soal = null,
  }) {
    return _then(_value.copyWith(
      jawaban: null == jawaban
          ? _value.jawaban
          : jawaban // ignore: cast_nullable_to_non_nullable
              as String,
      pembahasan: null == pembahasan
          ? _value.pembahasan
          : pembahasan // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pilihan: null == pilihan
          ? _value.pilihan
          : pilihan // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      soal: null == soal
          ? _value.soal
          : soal // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoalModelImplCopyWith<$Res>
    implements $SoalModelCopyWith<$Res> {
  factory _$$SoalModelImplCopyWith(
          _$SoalModelImpl value, $Res Function(_$SoalModelImpl) then) =
      __$$SoalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String jawaban,
      List<String> pembahasan,
      Map<String, List<String>> pilihan,
      List<String> soal});
}

/// @nodoc
class __$$SoalModelImplCopyWithImpl<$Res>
    extends _$SoalModelCopyWithImpl<$Res, _$SoalModelImpl>
    implements _$$SoalModelImplCopyWith<$Res> {
  __$$SoalModelImplCopyWithImpl(
      _$SoalModelImpl _value, $Res Function(_$SoalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jawaban = null,
    Object? pembahasan = null,
    Object? pilihan = null,
    Object? soal = null,
  }) {
    return _then(_$SoalModelImpl(
      jawaban: null == jawaban
          ? _value.jawaban
          : jawaban // ignore: cast_nullable_to_non_nullable
              as String,
      pembahasan: null == pembahasan
          ? _value._pembahasan
          : pembahasan // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pilihan: null == pilihan
          ? _value._pilihan
          : pilihan // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      soal: null == soal
          ? _value._soal
          : soal // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoalModelImpl implements _SoalModel {
  const _$SoalModelImpl(
      {required this.jawaban,
      required final List<String> pembahasan,
      required final Map<String, List<String>> pilihan,
      required final List<String> soal})
      : _pembahasan = pembahasan,
        _pilihan = pilihan,
        _soal = soal;

  factory _$SoalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoalModelImplFromJson(json);

  @override
  final String jawaban;
  final List<String> _pembahasan;
  @override
  List<String> get pembahasan {
    if (_pembahasan is EqualUnmodifiableListView) return _pembahasan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pembahasan);
  }

  final Map<String, List<String>> _pilihan;
  @override
  Map<String, List<String>> get pilihan {
    if (_pilihan is EqualUnmodifiableMapView) return _pilihan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pilihan);
  }

  final List<String> _soal;
  @override
  List<String> get soal {
    if (_soal is EqualUnmodifiableListView) return _soal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soal);
  }

  @override
  String toString() {
    return 'SoalModel(jawaban: $jawaban, pembahasan: $pembahasan, pilihan: $pilihan, soal: $soal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoalModelImpl &&
            (identical(other.jawaban, jawaban) || other.jawaban == jawaban) &&
            const DeepCollectionEquality()
                .equals(other._pembahasan, _pembahasan) &&
            const DeepCollectionEquality().equals(other._pilihan, _pilihan) &&
            const DeepCollectionEquality().equals(other._soal, _soal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jawaban,
      const DeepCollectionEquality().hash(_pembahasan),
      const DeepCollectionEquality().hash(_pilihan),
      const DeepCollectionEquality().hash(_soal));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoalModelImplCopyWith<_$SoalModelImpl> get copyWith =>
      __$$SoalModelImplCopyWithImpl<_$SoalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoalModelImplToJson(
      this,
    );
  }
}

abstract class _SoalModel implements SoalModel {
  const factory _SoalModel(
      {required final String jawaban,
      required final List<String> pembahasan,
      required final Map<String, List<String>> pilihan,
      required final List<String> soal}) = _$SoalModelImpl;

  factory _SoalModel.fromJson(Map<String, dynamic> json) =
      _$SoalModelImpl.fromJson;

  @override
  String get jawaban;
  @override
  List<String> get pembahasan;
  @override
  Map<String, List<String>> get pilihan;
  @override
  List<String> get soal;
  @override
  @JsonKey(ignore: true)
  _$$SoalModelImplCopyWith<_$SoalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
