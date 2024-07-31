// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  List<String> get answerDetail => throw _privateConstructorUsedError;
  Map<String, List<String>> get choices => throw _privateConstructorUsedError;
  List<String> get question => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      String answer,
      List<String> answerDetail,
      Map<String, List<String>> choices,
      List<String> question});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? answerDetail = null,
    Object? choices = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerDetail: null == answerDetail
          ? _value.answerDetail
          : answerDetail // ignore: cast_nullable_to_non_nullable
              as List<String>,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String answer,
      List<String> answerDetail,
      Map<String, List<String>> choices,
      List<String> question});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? answerDetail = null,
    Object? choices = null,
    Object? question = null,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerDetail: null == answerDetail
          ? _value._answerDetail
          : answerDetail // ignore: cast_nullable_to_non_nullable
              as List<String>,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      question: null == question
          ? _value._question
          : question // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {required this.id,
      required this.answer,
      required final List<String> answerDetail,
      required final Map<String, List<String>> choices,
      required final List<String> question})
      : _answerDetail = answerDetail,
        _choices = choices,
        _question = question;

  @override
  final int id;
  @override
  final String answer;
  final List<String> _answerDetail;
  @override
  List<String> get answerDetail {
    if (_answerDetail is EqualUnmodifiableListView) return _answerDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerDetail);
  }

  final Map<String, List<String>> _choices;
  @override
  Map<String, List<String>> get choices {
    if (_choices is EqualUnmodifiableMapView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_choices);
  }

  final List<String> _question;
  @override
  List<String> get question {
    if (_question is EqualUnmodifiableListView) return _question;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_question);
  }

  @override
  String toString() {
    return 'Question(id: $id, answer: $answer, answerDetail: $answerDetail, choices: $choices, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._answerDetail, _answerDetail) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality().equals(other._question, _question));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      answer,
      const DeepCollectionEquality().hash(_answerDetail),
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(_question));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);
}

abstract class _Question implements Question {
  const factory _Question(
      {required final int id,
      required final String answer,
      required final List<String> answerDetail,
      required final Map<String, List<String>> choices,
      required final List<String> question}) = _$QuestionImpl;

  @override
  int get id;
  @override
  String get answer;
  @override
  List<String> get answerDetail;
  @override
  Map<String, List<String>> get choices;
  @override
  List<String> get question;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
