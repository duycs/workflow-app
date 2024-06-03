// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsTestsListStruct extends BaseStruct {
  StaffsTestsListStruct({
    String? id,
    String? status,
    int? score,
    String? dateStart,
    String? dateEnd,
    int? totalCorrect,
    int? totalIncorrect,
    String? staffId,
    TestListStruct? testId,
    String? name,
    String? dateCreated,
    int? durationMinutes,
    String? description,
    StaffTestLessonStruct? lessionId,
    String? percentCorrect,
    int? goodScore,
  })  : _id = id,
        _status = status,
        _score = score,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _totalCorrect = totalCorrect,
        _totalIncorrect = totalIncorrect,
        _staffId = staffId,
        _testId = testId,
        _name = name,
        _dateCreated = dateCreated,
        _durationMinutes = durationMinutes,
        _description = description,
        _lessionId = lessionId,
        _percentCorrect = percentCorrect,
        _goodScore = goodScore;

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

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;
  void incrementScore(int amount) => _score = score + amount;
  bool hasScore() => _score != null;

  // "date_start" field.
  String? _dateStart;
  String get dateStart => _dateStart ?? '';
  set dateStart(String? val) => _dateStart = val;
  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;
  bool hasDateEnd() => _dateEnd != null;

  // "total_correct" field.
  int? _totalCorrect;
  int get totalCorrect => _totalCorrect ?? 0;
  set totalCorrect(int? val) => _totalCorrect = val;
  void incrementTotalCorrect(int amount) =>
      _totalCorrect = totalCorrect + amount;
  bool hasTotalCorrect() => _totalCorrect != null;

  // "total_incorrect" field.
  int? _totalIncorrect;
  int get totalIncorrect => _totalIncorrect ?? 0;
  set totalIncorrect(int? val) => _totalIncorrect = val;
  void incrementTotalIncorrect(int amount) =>
      _totalIncorrect = totalIncorrect + amount;
  bool hasTotalIncorrect() => _totalIncorrect != null;

  // "staff_id" field.
  String? _staffId;
  String get staffId => _staffId ?? '';
  set staffId(String? val) => _staffId = val;
  bool hasStaffId() => _staffId != null;

  // "test_id" field.
  TestListStruct? _testId;
  TestListStruct get testId => _testId ?? TestListStruct();
  set testId(TestListStruct? val) => _testId = val;
  void updateTestId(Function(TestListStruct) updateFn) =>
      updateFn(_testId ??= TestListStruct());
  bool hasTestId() => _testId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  set durationMinutes(int? val) => _durationMinutes = val;
  void incrementDurationMinutes(int amount) =>
      _durationMinutes = durationMinutes + amount;
  bool hasDurationMinutes() => _durationMinutes != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "lession_id" field.
  StaffTestLessonStruct? _lessionId;
  StaffTestLessonStruct get lessionId => _lessionId ?? StaffTestLessonStruct();
  set lessionId(StaffTestLessonStruct? val) => _lessionId = val;
  void updateLessionId(Function(StaffTestLessonStruct) updateFn) =>
      updateFn(_lessionId ??= StaffTestLessonStruct());
  bool hasLessionId() => _lessionId != null;

  // "percent_correct" field.
  String? _percentCorrect;
  String get percentCorrect => _percentCorrect ?? '';
  set percentCorrect(String? val) => _percentCorrect = val;
  bool hasPercentCorrect() => _percentCorrect != null;

  // "good_score" field.
  int? _goodScore;
  int get goodScore => _goodScore ?? 0;
  set goodScore(int? val) => _goodScore = val;
  void incrementGoodScore(int amount) => _goodScore = goodScore + amount;
  bool hasGoodScore() => _goodScore != null;

  static StaffsTestsListStruct fromMap(Map<String, dynamic> data) =>
      StaffsTestsListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        score: castToType<int>(data['score']),
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        totalCorrect: castToType<int>(data['total_correct']),
        totalIncorrect: castToType<int>(data['total_incorrect']),
        staffId: data['staff_id'] as String?,
        testId: TestListStruct.maybeFromMap(data['test_id']),
        name: data['name'] as String?,
        dateCreated: data['date_created'] as String?,
        durationMinutes: castToType<int>(data['duration_minutes']),
        description: data['description'] as String?,
        lessionId: StaffTestLessonStruct.maybeFromMap(data['lession_id']),
        percentCorrect: data['percent_correct'] as String?,
        goodScore: castToType<int>(data['good_score']),
      );

  static StaffsTestsListStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsTestsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'score': _score,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'total_correct': _totalCorrect,
        'total_incorrect': _totalIncorrect,
        'staff_id': _staffId,
        'test_id': _testId?.toMap(),
        'name': _name,
        'date_created': _dateCreated,
        'duration_minutes': _durationMinutes,
        'description': _description,
        'lession_id': _lessionId?.toMap(),
        'percent_correct': _percentCorrect,
        'good_score': _goodScore,
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
        'score': serializeParam(
          _score,
          ParamType.int,
        ),
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'total_correct': serializeParam(
          _totalCorrect,
          ParamType.int,
        ),
        'total_incorrect': serializeParam(
          _totalIncorrect,
          ParamType.int,
        ),
        'staff_id': serializeParam(
          _staffId,
          ParamType.String,
        ),
        'test_id': serializeParam(
          _testId,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'duration_minutes': serializeParam(
          _durationMinutes,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'lession_id': serializeParam(
          _lessionId,
          ParamType.DataStruct,
        ),
        'percent_correct': serializeParam(
          _percentCorrect,
          ParamType.String,
        ),
        'good_score': serializeParam(
          _goodScore,
          ParamType.int,
        ),
      }.withoutNulls;

  static StaffsTestsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffsTestsListStruct(
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
        score: deserializeParam(
          data['score'],
          ParamType.int,
          false,
        ),
        dateStart: deserializeParam(
          data['date_start'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        totalCorrect: deserializeParam(
          data['total_correct'],
          ParamType.int,
          false,
        ),
        totalIncorrect: deserializeParam(
          data['total_incorrect'],
          ParamType.int,
          false,
        ),
        staffId: deserializeParam(
          data['staff_id'],
          ParamType.String,
          false,
        ),
        testId: deserializeStructParam(
          data['test_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TestListStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        durationMinutes: deserializeParam(
          data['duration_minutes'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        lessionId: deserializeStructParam(
          data['lession_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffTestLessonStruct.fromSerializableMap,
        ),
        percentCorrect: deserializeParam(
          data['percent_correct'],
          ParamType.String,
          false,
        ),
        goodScore: deserializeParam(
          data['good_score'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StaffsTestsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffsTestsListStruct &&
        id == other.id &&
        status == other.status &&
        score == other.score &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        totalCorrect == other.totalCorrect &&
        totalIncorrect == other.totalIncorrect &&
        staffId == other.staffId &&
        testId == other.testId &&
        name == other.name &&
        dateCreated == other.dateCreated &&
        durationMinutes == other.durationMinutes &&
        description == other.description &&
        lessionId == other.lessionId &&
        percentCorrect == other.percentCorrect &&
        goodScore == other.goodScore;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        score,
        dateStart,
        dateEnd,
        totalCorrect,
        totalIncorrect,
        staffId,
        testId,
        name,
        dateCreated,
        durationMinutes,
        description,
        lessionId,
        percentCorrect,
        goodScore
      ]);
}

StaffsTestsListStruct createStaffsTestsListStruct({
  String? id,
  String? status,
  int? score,
  String? dateStart,
  String? dateEnd,
  int? totalCorrect,
  int? totalIncorrect,
  String? staffId,
  TestListStruct? testId,
  String? name,
  String? dateCreated,
  int? durationMinutes,
  String? description,
  StaffTestLessonStruct? lessionId,
  String? percentCorrect,
  int? goodScore,
}) =>
    StaffsTestsListStruct(
      id: id,
      status: status,
      score: score,
      dateStart: dateStart,
      dateEnd: dateEnd,
      totalCorrect: totalCorrect,
      totalIncorrect: totalIncorrect,
      staffId: staffId,
      testId: testId ?? TestListStruct(),
      name: name,
      dateCreated: dateCreated,
      durationMinutes: durationMinutes,
      description: description,
      lessionId: lessionId ?? StaffTestLessonStruct(),
      percentCorrect: percentCorrect,
      goodScore: goodScore,
    );
