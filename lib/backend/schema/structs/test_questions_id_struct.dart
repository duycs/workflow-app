// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestQuestionsIdStruct extends BaseStruct {
  TestQuestionsIdStruct({
    String? id,
    String? content,
    String? status,
    String? answerType,
    int? autoCorrect,
    List<AnswersListStruct>? answers,
  })  : _id = id,
        _content = content,
        _status = status,
        _answerType = answerType,
        _autoCorrect = autoCorrect,
        _answers = answers;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

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
  List<AnswersListStruct>? _answers;
  List<AnswersListStruct> get answers => _answers ?? const [];
  set answers(List<AnswersListStruct>? val) => _answers = val;

  void updateAnswers(Function(List<AnswersListStruct>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  static TestQuestionsIdStruct fromMap(Map<String, dynamic> data) =>
      TestQuestionsIdStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        status: data['status'] as String?,
        answerType: data['answer_type'] as String?,
        autoCorrect: castToType<int>(data['auto_correct']),
        answers: getStructList(
          data['answers'],
          AnswersListStruct.fromMap,
        ),
      );

  static TestQuestionsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? TestQuestionsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'status': _status,
        'answer_type': _answerType,
        'auto_correct': _autoCorrect,
        'answers': _answers?.map((e) => e.toMap()).toList(),
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
        'status': serializeParam(
          _status,
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
      }.withoutNulls;

  static TestQuestionsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestQuestionsIdStruct(
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
        status: deserializeParam(
          data['status'],
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
        answers: deserializeStructParam<AnswersListStruct>(
          data['answers'],
          ParamType.DataStruct,
          true,
          structBuilder: AnswersListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TestQuestionsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestQuestionsIdStruct &&
        id == other.id &&
        content == other.content &&
        status == other.status &&
        answerType == other.answerType &&
        autoCorrect == other.autoCorrect &&
        listEquality.equals(answers, other.answers);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, content, status, answerType, autoCorrect, answers]);
}

TestQuestionsIdStruct createTestQuestionsIdStruct({
  String? id,
  String? content,
  String? status,
  String? answerType,
  int? autoCorrect,
}) =>
    TestQuestionsIdStruct(
      id: id,
      content: content,
      status: status,
      answerType: answerType,
      autoCorrect: autoCorrect,
    );
