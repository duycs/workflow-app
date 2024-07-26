// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestAnswerStaffStruct extends BaseStruct {
  RequestAnswerStaffStruct({
    String? status,
    int? correct,
    String? answerType,
    String? staffId,
    String? questionId,
    List<AnswersListStruct>? answers,
    String? answerContent,
    String? staffTestId,
  })  : _status = status,
        _correct = correct,
        _answerType = answerType,
        _staffId = staffId,
        _questionId = questionId,
        _answers = answers,
        _answerContent = answerContent,
        _staffTestId = staffTestId;

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

  // "answer_type" field.
  String? _answerType;
  String get answerType => _answerType ?? '';
  set answerType(String? val) => _answerType = val;

  bool hasAnswerType() => _answerType != null;

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;

  bool hasStaffId() => _staffId != null;

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  set questionId(String? val) => _questionId = val;

  bool hasQuestionId() => _questionId != null;

  // "answers" field.
  List<AnswersListStruct>? _answers;
  List<AnswersListStruct> get answers => _answers ?? const [];
  set answers(List<AnswersListStruct>? val) => _answers = val;

  void updateAnswers(Function(List<AnswersListStruct>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "answer_content" field.
  String? _answerContent;
  String get answerContent => _answerContent ?? '';
  set answerContent(String? val) => _answerContent = val;

  bool hasAnswerContent() => _answerContent != null;

  // "staff_test_id" field.
  String? _staffTestId;
  String get staffTestId => _staffTestId ?? '';
  set staffTestId(String? val) => _staffTestId = val;

  bool hasStaffTestId() => _staffTestId != null;

  static RequestAnswerStaffStruct fromMap(Map<String, dynamic> data) =>
      RequestAnswerStaffStruct(
        status: data['status'] as String?,
        correct: castToType<int>(data['correct']),
        answerType: data['answer_type'] as String?,
        staffId: data['staff_id'] as String?,
        questionId: data['question_id'] as String?,
        answers: getStructList(
          data['answers'],
          AnswersListStruct.fromMap,
        ),
        answerContent: data['answer_content'] as String?,
        staffTestId: data['staff_test_id'] as String?,
      );

  static RequestAnswerStaffStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestAnswerStaffStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'correct': _correct,
        'answer_type': _answerType,
        'staff_id': _staffId,
        'question_id': _questionId,
        'answers': _answers?.map((e) => e.toMap()).toList(),
        'answer_content': _answerContent,
        'staff_test_id': _staffTestId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'correct': serializeParam(
          _correct,
          ParamType.int,
        ),
        'answer_type': serializeParam(
          _answerType,
          ParamType.String,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
        'question_id': serializeParam(
          _questionId,
          ParamType.String,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.DataStruct,
          isList: true,
        ),
        'answer_content': serializeParam(
          _answerContent,
          ParamType.String,
        ),
        'staff_test_id': serializeParam(
          _staffTestId,
          ParamType.String,
        ),
      }.withoutNulls;

  static RequestAnswerStaffStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RequestAnswerStaffStruct(
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
        answerType: deserializeParam(
          data['answer_type'],
          ParamType.String,
          false,
        ),
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
        questionId: deserializeParam(
          data['question_id'],
          ParamType.String,
          false,
        ),
        answers: deserializeStructParam<AnswersListStruct>(
          data['answers'],
          ParamType.DataStruct,
          true,
          structBuilder: AnswersListStruct.fromSerializableMap,
        ),
        answerContent: deserializeParam(
          data['answer_content'],
          ParamType.String,
          false,
        ),
        staffTestId: deserializeParam(
          data['staff_test_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RequestAnswerStaffStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RequestAnswerStaffStruct &&
        status == other.status &&
        correct == other.correct &&
        answerType == other.answerType &&
        staffId == other.staffId &&
        questionId == other.questionId &&
        listEquality.equals(answers, other.answers) &&
        answerContent == other.answerContent &&
        staffTestId == other.staffTestId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        status,
        correct,
        answerType,
        staffId,
        questionId,
        answers,
        answerContent,
        staffTestId
      ]);
}

RequestAnswerStaffStruct createRequestAnswerStaffStruct({
  String? status,
  int? correct,
  String? answerType,
  String? staffId,
  String? questionId,
  String? answerContent,
  String? staffTestId,
}) =>
    RequestAnswerStaffStruct(
      status: status,
      correct: correct,
      answerType: answerType,
      staffId: staffId,
      questionId: questionId,
      answerContent: answerContent,
      staffTestId: staffTestId,
    );
