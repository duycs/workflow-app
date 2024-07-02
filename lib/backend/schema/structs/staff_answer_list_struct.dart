// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffAnswerListStruct extends BaseStruct {
  StaffAnswerListStruct({
    String? id,
    String? status,
    int? correct,
    String? answerContent,
    String? answerType,
    TestListStruct? testId,
    List<AnswersListStruct>? answers,
    QuestionObjectStruct? questionId,
  })  : _id = id,
        _status = status,
        _correct = correct,
        _answerContent = answerContent,
        _answerType = answerType,
        _testId = testId,
        _answers = answers,
        _questionId = questionId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "correct" field.
  int? _correct;
  int get correct => _correct ?? 0;
  set correct(int? val) => _correct = val;

  void incrementCorrect(int amount) => correct = correct + amount;

  bool hasCorrect() => _correct != null;

  // "answer_content" field.
  String? _answerContent;
  String get answerContent => _answerContent ?? '';
  set answerContent(String? val) => _answerContent = val;

  bool hasAnswerContent() => _answerContent != null;

  // "answer_type" field.
  String? _answerType;
  String get answerType => _answerType ?? '';
  set answerType(String? val) => _answerType = val;

  bool hasAnswerType() => _answerType != null;

  // "test_id" field.
  TestListStruct? _testId;
  TestListStruct get testId => _testId ?? TestListStruct();
  set testId(TestListStruct? val) => _testId = val;

  void updateTestId(Function(TestListStruct) updateFn) {
    updateFn(_testId ??= TestListStruct());
  }

  bool hasTestId() => _testId != null;

  // "answers" field.
  List<AnswersListStruct>? _answers;
  List<AnswersListStruct> get answers => _answers ?? const [];
  set answers(List<AnswersListStruct>? val) => _answers = val;

  void updateAnswers(Function(List<AnswersListStruct>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "question_id" field.
  QuestionObjectStruct? _questionId;
  QuestionObjectStruct get questionId => _questionId ?? QuestionObjectStruct();
  set questionId(QuestionObjectStruct? val) => _questionId = val;

  void updateQuestionId(Function(QuestionObjectStruct) updateFn) {
    updateFn(_questionId ??= QuestionObjectStruct());
  }

  bool hasQuestionId() => _questionId != null;

  static StaffAnswerListStruct fromMap(Map<String, dynamic> data) =>
      StaffAnswerListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        correct: castToType<int>(data['correct']),
        answerContent: data['answer_content'] as String?,
        answerType: data['answer_type'] as String?,
        testId: TestListStruct.maybeFromMap(data['test_id']),
        answers: getStructList(
          data['answers'],
          AnswersListStruct.fromMap,
        ),
        questionId: QuestionObjectStruct.maybeFromMap(data['question_id']),
      );

  static StaffAnswerListStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffAnswerListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'correct': _correct,
        'answer_content': _answerContent,
        'answer_type': _answerType,
        'test_id': _testId?.toMap(),
        'answers': _answers?.map((e) => e.toMap()).toList(),
        'question_id': _questionId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'correct': serializeParam(
          _correct,
          ParamType.int,
        ),
        'answer_content': serializeParam(
          _answerContent,
          ParamType.String,
        ),
        'answer_type': serializeParam(
          _answerType,
          ParamType.String,
        ),
        'test_id': serializeParam(
          _testId,
          ParamType.DataStruct,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.DataStruct,
          isList: true,
        ),
        'question_id': serializeParam(
          _questionId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StaffAnswerListStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffAnswerListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        correct: deserializeParam(
          data['correct'],
          ParamType.int,
          false,
        ),
        answerContent: deserializeParam(
          data['answer_content'],
          ParamType.String,
          false,
        ),
        answerType: deserializeParam(
          data['answer_type'],
          ParamType.String,
          false,
        ),
        testId: deserializeStructParam(
          data['test_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TestListStruct.fromSerializableMap,
        ),
        answers: deserializeStructParam<AnswersListStruct>(
          data['answers'],
          ParamType.DataStruct,
          true,
          structBuilder: AnswersListStruct.fromSerializableMap,
        ),
        questionId: deserializeStructParam(
          data['question_id'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionObjectStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffAnswerListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffAnswerListStruct &&
        id == other.id &&
        status == other.status &&
        correct == other.correct &&
        answerContent == other.answerContent &&
        answerType == other.answerType &&
        testId == other.testId &&
        listEquality.equals(answers, other.answers) &&
        questionId == other.questionId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        correct,
        answerContent,
        answerType,
        testId,
        answers,
        questionId
      ]);
}

StaffAnswerListStruct createStaffAnswerListStruct({
  String? id,
  String? status,
  int? correct,
  String? answerContent,
  String? answerType,
  TestListStruct? testId,
  QuestionObjectStruct? questionId,
}) =>
    StaffAnswerListStruct(
      id: id,
      status: status,
      correct: correct,
      answerContent: answerContent,
      answerType: answerType,
      testId: testId ?? TestListStruct(),
      questionId: questionId ?? QuestionObjectStruct(),
    );
