// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestQuestionsStruct extends BaseStruct {
  RequestQuestionsStruct({
    String? id,
    String? content,
    String? answerType,
    int? autoCorrect,
    List<QuestionAnswersIdStruct>? answers,
    String? status,
    String? organizationId,
  })  : _id = id,
        _content = content,
        _answerType = answerType,
        _autoCorrect = autoCorrect,
        _answers = answers,
        _status = status,
        _organizationId = organizationId;

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
    updateFn(answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  static RequestQuestionsStruct fromMap(Map<String, dynamic> data) =>
      RequestQuestionsStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        answerType: data['answer_type'] as String?,
        autoCorrect: castToType<int>(data['auto_correct']),
        answers: getStructList(
          data['answers'],
          QuestionAnswersIdStruct.fromMap,
        ),
        status: data['status'] as String?,
        organizationId: data['organization_id'] as String?,
      );

  static RequestQuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestQuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'answer_type': _answerType,
        'auto_correct': _autoCorrect,
        'answers': _answers?.map((e) => e.toMap()).toList(),
        'status': _status,
        'organization_id': _organizationId,
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
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static RequestQuestionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RequestQuestionsStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RequestQuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RequestQuestionsStruct &&
        id == other.id &&
        content == other.content &&
        answerType == other.answerType &&
        autoCorrect == other.autoCorrect &&
        listEquality.equals(answers, other.answers) &&
        status == other.status &&
        organizationId == other.organizationId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, content, answerType, autoCorrect, answers, status, organizationId]);
}

RequestQuestionsStruct createRequestQuestionsStruct({
  String? id,
  String? content,
  String? answerType,
  int? autoCorrect,
  String? status,
  String? organizationId,
}) =>
    RequestQuestionsStruct(
      id: id,
      content: content,
      answerType: answerType,
      autoCorrect: autoCorrect,
      status: status,
      organizationId: organizationId,
    );
