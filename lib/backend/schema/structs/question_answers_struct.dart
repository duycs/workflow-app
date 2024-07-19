// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionAnswersStruct extends BaseStruct {
  QuestionAnswersStruct({
    String? id,
    String? content,
    String? answerType,
    int? autoCorrect,
    List<QuestionAnswersIdStruct>? answers,
    List<QuestionAnswersIdStruct>? answersId,
  })  : _id = id,
        _content = content,
        _answerType = answerType,
        _autoCorrect = autoCorrect,
        _answers = answers,
        _answersId = answersId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "answer_type" field.
  String? _answerType;
  String get answerType => _answerType ?? '';
  set answerType(String? val) => _answerType = val;

  bool hasAnswerType() => _answerType != null;

  // "auto_correct" field.
  int? _autoCorrect;
  int get autoCorrect => _autoCorrect ?? 0;
  set autoCorrect(int? val) => _autoCorrect = val;

  void incrementAutoCorrect(int amount) => autoCorrect = autoCorrect + amount;

  bool hasAutoCorrect() => _autoCorrect != null;

  // "answers" field.
  List<QuestionAnswersIdStruct>? _answers;
  List<QuestionAnswersIdStruct> get answers => _answers ?? const [];
  set answers(List<QuestionAnswersIdStruct>? val) => _answers = val;

  void updateAnswers(Function(List<QuestionAnswersIdStruct>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "answers_id" field.
  List<QuestionAnswersIdStruct>? _answersId;
  List<QuestionAnswersIdStruct> get answersId => _answersId ?? const [];
  set answersId(List<QuestionAnswersIdStruct>? val) => _answersId = val;

  void updateAnswersId(Function(List<QuestionAnswersIdStruct>) updateFn) {
    updateFn(_answersId ??= []);
  }

  bool hasAnswersId() => _answersId != null;

  static QuestionAnswersStruct fromMap(Map<String, dynamic> data) =>
      QuestionAnswersStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        answerType: data['answer_type'] as String?,
        autoCorrect: castToType<int>(data['auto_correct']),
        answers: getStructList(
          data['answers'],
          QuestionAnswersIdStruct.fromMap,
        ),
        answersId: getStructList(
          data['answers_id'],
          QuestionAnswersIdStruct.fromMap,
        ),
      );

  static QuestionAnswersStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionAnswersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'answer_type': _answerType,
        'auto_correct': _autoCorrect,
        'answers': _answers?.map((e) => e.toMap()).toList(),
        'answers_id': _answersId?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'answer_type': serializeParam(
          _answerType,
          ParamType.String,
        ),
        'auto_correct': serializeParam(
          _autoCorrect,
          ParamType.int,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.DataStruct,
          isList: true,
        ),
        'answers_id': serializeParam(
          _answersId,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionAnswersStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionAnswersStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        answerType: deserializeParam(
          data['answer_type'],
          ParamType.String,
          false,
        ),
        autoCorrect: deserializeParam(
          data['auto_correct'],
          ParamType.int,
          false,
        ),
        answers: deserializeStructParam<QuestionAnswersIdStruct>(
          data['answers'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionAnswersIdStruct.fromSerializableMap,
        ),
        answersId: deserializeStructParam<QuestionAnswersIdStruct>(
          data['answers_id'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionAnswersIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionAnswersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionAnswersStruct &&
        id == other.id &&
        content == other.content &&
        answerType == other.answerType &&
        autoCorrect == other.autoCorrect &&
        listEquality.equals(answers, other.answers) &&
        listEquality.equals(answersId, other.answersId);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, content, answerType, autoCorrect, answers, answersId]);
}

QuestionAnswersStruct createQuestionAnswersStruct({
  String? id,
  String? content,
  String? answerType,
  int? autoCorrect,
}) =>
    QuestionAnswersStruct(
      id: id,
      content: content,
      answerType: answerType,
      autoCorrect: autoCorrect,
    );
