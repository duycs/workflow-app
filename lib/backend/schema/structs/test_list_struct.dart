// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestListStruct extends BaseStruct {
  TestListStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    int? durationMinutes,
    List<TestQuestionsStruct>? questions,
    String? organizationId,
    int? goodScore,
    String? percentCorrect,
    TestUserCreatedStruct? userCreated,
    int? pass,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _durationMinutes = durationMinutes,
        _questions = questions,
        _organizationId = organizationId,
        _goodScore = goodScore,
        _percentCorrect = percentCorrect,
        _userCreated = userCreated,
        _pass = pass;

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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  set durationMinutes(int? val) => _durationMinutes = val;

  void incrementDurationMinutes(int amount) =>
      durationMinutes = durationMinutes + amount;

  bool hasDurationMinutes() => _durationMinutes != null;

  // "questions" field.
  List<TestQuestionsStruct>? _questions;
  List<TestQuestionsStruct> get questions => _questions ?? const [];
  set questions(List<TestQuestionsStruct>? val) => _questions = val;

  void updateQuestions(Function(List<TestQuestionsStruct>) updateFn) {
    updateFn(_questions ??= []);
  }

  bool hasQuestions() => _questions != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "good_score" field.
  int? _goodScore;
  int get goodScore => _goodScore ?? 0;
  set goodScore(int? val) => _goodScore = val;

  void incrementGoodScore(int amount) => goodScore = goodScore + amount;

  bool hasGoodScore() => _goodScore != null;

  // "percent_correct" field.
  String? _percentCorrect;
  String get percentCorrect => _percentCorrect ?? '';
  set percentCorrect(String? val) => _percentCorrect = val;

  bool hasPercentCorrect() => _percentCorrect != null;

  // "user_created" field.
  TestUserCreatedStruct? _userCreated;
  TestUserCreatedStruct get userCreated =>
      _userCreated ?? TestUserCreatedStruct();
  set userCreated(TestUserCreatedStruct? val) => _userCreated = val;

  void updateUserCreated(Function(TestUserCreatedStruct) updateFn) {
    updateFn(_userCreated ??= TestUserCreatedStruct());
  }

  bool hasUserCreated() => _userCreated != null;

  // "pass" field.
  int? _pass;
  int get pass => _pass ?? 0;
  set pass(int? val) => _pass = val;

  void incrementPass(int amount) => pass = pass + amount;

  bool hasPass() => _pass != null;

  static TestListStruct fromMap(Map<String, dynamic> data) => TestListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        durationMinutes: castToType<int>(data['duration_minutes']),
        questions: getStructList(
          data['questions'],
          TestQuestionsStruct.fromMap,
        ),
        organizationId: data['organization_id'] as String?,
        goodScore: castToType<int>(data['good_score']),
        percentCorrect: data['percent_correct'] as String?,
        userCreated: TestUserCreatedStruct.maybeFromMap(data['user_created']),
        pass: castToType<int>(data['pass']),
      );

  static TestListStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'duration_minutes': _durationMinutes,
        'questions': _questions?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId,
        'good_score': _goodScore,
        'percent_correct': _percentCorrect,
        'user_created': _userCreated?.toMap(),
        'pass': _pass,
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration_minutes': serializeParam(
          _durationMinutes,
          ParamType.int,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.DataStruct,
          isList: true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'good_score': serializeParam(
          _goodScore,
          ParamType.int,
        ),
        'percent_correct': serializeParam(
          _percentCorrect,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'pass': serializeParam(
          _pass,
          ParamType.int,
        ),
      }.withoutNulls;

  static TestListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestListStruct(
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        durationMinutes: deserializeParam(
          data['duration_minutes'],
          ParamType.int,
          false,
        ),
        questions: deserializeStructParam<TestQuestionsStruct>(
          data['questions'],
          ParamType.DataStruct,
          true,
          structBuilder: TestQuestionsStruct.fromSerializableMap,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        goodScore: deserializeParam(
          data['good_score'],
          ParamType.int,
          false,
        ),
        percentCorrect: deserializeParam(
          data['percent_correct'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: TestUserCreatedStruct.fromSerializableMap,
        ),
        pass: deserializeParam(
          data['pass'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TestListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        durationMinutes == other.durationMinutes &&
        listEquality.equals(questions, other.questions) &&
        organizationId == other.organizationId &&
        goodScore == other.goodScore &&
        percentCorrect == other.percentCorrect &&
        userCreated == other.userCreated &&
        pass == other.pass;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        durationMinutes,
        questions,
        organizationId,
        goodScore,
        percentCorrect,
        userCreated,
        pass
      ]);
}

TestListStruct createTestListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  int? durationMinutes,
  String? organizationId,
  int? goodScore,
  String? percentCorrect,
  TestUserCreatedStruct? userCreated,
  int? pass,
}) =>
    TestListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      durationMinutes: durationMinutes,
      organizationId: organizationId,
      goodScore: goodScore,
      percentCorrect: percentCorrect,
      userCreated: userCreated ?? TestUserCreatedStruct(),
      pass: pass,
    );
