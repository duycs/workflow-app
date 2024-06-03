// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionObjectStruct extends BaseStruct {
  QuestionObjectStruct({
    String? id,
    String? status,
    String? content,
    String? answerType,
    String? dateCreated,
    String? dateUpdated,
    int? autoCorrect,
    List<QuestionAnswerObjectStruct>? answers,
    OrganizationIdStruct? organizationId,
  })  : _id = id,
        _status = status,
        _content = content,
        _answerType = answerType,
        _dateCreated = dateCreated,
        _dateUpdated = dateUpdated,
        _autoCorrect = autoCorrect,
        _answers = answers,
        _organizationId = organizationId;

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

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;
  bool hasDateUpdated() => _dateUpdated != null;

  // "auto_correct" field.
  int? _autoCorrect;
  int get autoCorrect => _autoCorrect ?? 0;
  set autoCorrect(int? val) => _autoCorrect = val;
  void incrementAutoCorrect(int amount) => _autoCorrect = autoCorrect + amount;
  bool hasAutoCorrect() => _autoCorrect != null;

  // "answers" field.
  List<QuestionAnswerObjectStruct>? _answers;
  List<QuestionAnswerObjectStruct> get answers => _answers ?? const [];
  set answers(List<QuestionAnswerObjectStruct>? val) => _answers = val;
  void updateAnswers(Function(List<QuestionAnswerObjectStruct>) updateFn) =>
      updateFn(_answers ??= []);
  bool hasAnswers() => _answers != null;

  // "organization_id" field.
  OrganizationIdStruct? _organizationId;
  OrganizationIdStruct get organizationId =>
      _organizationId ?? OrganizationIdStruct();
  set organizationId(OrganizationIdStruct? val) => _organizationId = val;
  void updateOrganizationId(Function(OrganizationIdStruct) updateFn) =>
      updateFn(_organizationId ??= OrganizationIdStruct());
  bool hasOrganizationId() => _organizationId != null;

  static QuestionObjectStruct fromMap(Map<String, dynamic> data) =>
      QuestionObjectStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        content: data['content'] as String?,
        answerType: data['answer_type'] as String?,
        dateCreated: data['date_created'] as String?,
        dateUpdated: data['date_updated'] as String?,
        autoCorrect: castToType<int>(data['auto_correct']),
        answers: getStructList(
          data['answers'],
          QuestionAnswerObjectStruct.fromMap,
        ),
        organizationId:
            OrganizationIdStruct.maybeFromMap(data['organization_id']),
      );

  static QuestionObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'content': _content,
        'answer_type': _answerType,
        'date_created': _dateCreated,
        'date_updated': _dateUpdated,
        'auto_correct': _autoCorrect,
        'answers': _answers?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId?.toMap(),
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
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'answer_type': serializeParam(
          _answerType,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
        'auto_correct': serializeParam(
          _autoCorrect,
          ParamType.int,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.DataStruct,
          true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static QuestionObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionObjectStruct(
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
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
          ParamType.String,
          false,
        ),
        autoCorrect: deserializeParam(
          data['auto_correct'],
          ParamType.int,
          false,
        ),
        answers: deserializeStructParam<QuestionAnswerObjectStruct>(
          data['answers'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionAnswerObjectStruct.fromSerializableMap,
        ),
        organizationId: deserializeStructParam(
          data['organization_id'],
          ParamType.DataStruct,
          false,
          structBuilder: OrganizationIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionObjectStruct &&
        id == other.id &&
        status == other.status &&
        content == other.content &&
        answerType == other.answerType &&
        dateCreated == other.dateCreated &&
        dateUpdated == other.dateUpdated &&
        autoCorrect == other.autoCorrect &&
        listEquality.equals(answers, other.answers) &&
        organizationId == other.organizationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        content,
        answerType,
        dateCreated,
        dateUpdated,
        autoCorrect,
        answers,
        organizationId
      ]);
}

QuestionObjectStruct createQuestionObjectStruct({
  String? id,
  String? status,
  String? content,
  String? answerType,
  String? dateCreated,
  String? dateUpdated,
  int? autoCorrect,
  OrganizationIdStruct? organizationId,
}) =>
    QuestionObjectStruct(
      id: id,
      status: status,
      content: content,
      answerType: answerType,
      dateCreated: dateCreated,
      dateUpdated: dateUpdated,
      autoCorrect: autoCorrect,
      organizationId: organizationId ?? OrganizationIdStruct(),
    );
