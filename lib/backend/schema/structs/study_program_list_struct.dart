// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyProgramListStruct extends BaseStruct {
  StudyProgramListStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    int? durationHours,
    List<StudyProgramListLessionsIdStruct>? lessions,
    List<StudyProgramListTestIdStruct>? tests,
    List<StaffsTestsListStruct>? studioIdTest,
    String? organizationId,
    DepartmentsIdStruct? departments,
    int? estimateInDay,
    String? dateCreate,
    String? dateCreated,
    String? imageCover,
    int? template,
    String? price,
    String? authorId,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _durationHours = durationHours,
        _lessions = lessions,
        _tests = tests,
        _studioIdTest = studioIdTest,
        _organizationId = organizationId,
        _departments = departments,
        _estimateInDay = estimateInDay,
        _dateCreate = dateCreate,
        _dateCreated = dateCreated,
        _imageCover = imageCover,
        _template = template,
        _price = price,
        _authorId = authorId;

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

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  set durationHours(int? val) => _durationHours = val;
  void incrementDurationHours(int amount) =>
      _durationHours = durationHours + amount;
  bool hasDurationHours() => _durationHours != null;

  // "lessions" field.
  List<StudyProgramListLessionsIdStruct>? _lessions;
  List<StudyProgramListLessionsIdStruct> get lessions => _lessions ?? const [];
  set lessions(List<StudyProgramListLessionsIdStruct>? val) => _lessions = val;
  void updateLessions(
          Function(List<StudyProgramListLessionsIdStruct>) updateFn) =>
      updateFn(_lessions ??= []);
  bool hasLessions() => _lessions != null;

  // "tests" field.
  List<StudyProgramListTestIdStruct>? _tests;
  List<StudyProgramListTestIdStruct> get tests => _tests ?? const [];
  set tests(List<StudyProgramListTestIdStruct>? val) => _tests = val;
  void updateTests(Function(List<StudyProgramListTestIdStruct>) updateFn) =>
      updateFn(_tests ??= []);
  bool hasTests() => _tests != null;

  // "studioIdTest" field.
  List<StaffsTestsListStruct>? _studioIdTest;
  List<StaffsTestsListStruct> get studioIdTest => _studioIdTest ?? const [];
  set studioIdTest(List<StaffsTestsListStruct>? val) => _studioIdTest = val;
  void updateStudioIdTest(Function(List<StaffsTestsListStruct>) updateFn) =>
      updateFn(_studioIdTest ??= []);
  bool hasStudioIdTest() => _studioIdTest != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;
  bool hasOrganizationId() => _organizationId != null;

  // "departments" field.
  DepartmentsIdStruct? _departments;
  DepartmentsIdStruct get departments => _departments ?? DepartmentsIdStruct();
  set departments(DepartmentsIdStruct? val) => _departments = val;
  void updateDepartments(Function(DepartmentsIdStruct) updateFn) =>
      updateFn(_departments ??= DepartmentsIdStruct());
  bool hasDepartments() => _departments != null;

  // "estimate_in_day" field.
  int? _estimateInDay;
  int get estimateInDay => _estimateInDay ?? 0;
  set estimateInDay(int? val) => _estimateInDay = val;
  void incrementEstimateInDay(int amount) =>
      _estimateInDay = estimateInDay + amount;
  bool hasEstimateInDay() => _estimateInDay != null;

  // "date_create" field.
  String? _dateCreate;
  String get dateCreate => _dateCreate ?? '';
  set dateCreate(String? val) => _dateCreate = val;
  bool hasDateCreate() => _dateCreate != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "image_cover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  set imageCover(String? val) => _imageCover = val;
  bool hasImageCover() => _imageCover != null;

  // "template" field.
  int? _template;
  int get template => _template ?? 0;
  set template(int? val) => _template = val;
  void incrementTemplate(int amount) => _template = template + amount;
  bool hasTemplate() => _template != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  // "author_id" field.
  String? _authorId;
  String get authorId => _authorId ?? '';
  set authorId(String? val) => _authorId = val;
  bool hasAuthorId() => _authorId != null;

  static StudyProgramListStruct fromMap(Map<String, dynamic> data) =>
      StudyProgramListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        durationHours: castToType<int>(data['duration_hours']),
        lessions: getStructList(
          data['lessions'],
          StudyProgramListLessionsIdStruct.fromMap,
        ),
        tests: getStructList(
          data['tests'],
          StudyProgramListTestIdStruct.fromMap,
        ),
        studioIdTest: getStructList(
          data['studioIdTest'],
          StaffsTestsListStruct.fromMap,
        ),
        organizationId: data['organization_id'] as String?,
        departments: DepartmentsIdStruct.maybeFromMap(data['departments']),
        estimateInDay: castToType<int>(data['estimate_in_day']),
        dateCreate: data['date_create'] as String?,
        dateCreated: data['date_created'] as String?,
        imageCover: data['image_cover'] as String?,
        template: castToType<int>(data['template']),
        price: data['price'] as String?,
        authorId: data['author_id'] as String?,
      );

  static StudyProgramListStruct? maybeFromMap(dynamic data) => data is Map
      ? StudyProgramListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'duration_hours': _durationHours,
        'lessions': _lessions?.map((e) => e.toMap()).toList(),
        'tests': _tests?.map((e) => e.toMap()).toList(),
        'studioIdTest': _studioIdTest?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId,
        'departments': _departments?.toMap(),
        'estimate_in_day': _estimateInDay,
        'date_create': _dateCreate,
        'date_created': _dateCreated,
        'image_cover': _imageCover,
        'template': _template,
        'price': _price,
        'author_id': _authorId,
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
        'duration_hours': serializeParam(
          _durationHours,
          ParamType.int,
        ),
        'lessions': serializeParam(
          _lessions,
          ParamType.DataStruct,
          true,
        ),
        'tests': serializeParam(
          _tests,
          ParamType.DataStruct,
          true,
        ),
        'studioIdTest': serializeParam(
          _studioIdTest,
          ParamType.DataStruct,
          true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
        ),
        'estimate_in_day': serializeParam(
          _estimateInDay,
          ParamType.int,
        ),
        'date_create': serializeParam(
          _dateCreate,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'image_cover': serializeParam(
          _imageCover,
          ParamType.String,
        ),
        'template': serializeParam(
          _template,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'author_id': serializeParam(
          _authorId,
          ParamType.String,
        ),
      }.withoutNulls;

  static StudyProgramListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudyProgramListStruct(
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
        durationHours: deserializeParam(
          data['duration_hours'],
          ParamType.int,
          false,
        ),
        lessions: deserializeStructParam<StudyProgramListLessionsIdStruct>(
          data['lessions'],
          ParamType.DataStruct,
          true,
          structBuilder: StudyProgramListLessionsIdStruct.fromSerializableMap,
        ),
        tests: deserializeStructParam<StudyProgramListTestIdStruct>(
          data['tests'],
          ParamType.DataStruct,
          true,
          structBuilder: StudyProgramListTestIdStruct.fromSerializableMap,
        ),
        studioIdTest: deserializeStructParam<StaffsTestsListStruct>(
          data['studioIdTest'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsTestsListStruct.fromSerializableMap,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        departments: deserializeStructParam(
          data['departments'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentsIdStruct.fromSerializableMap,
        ),
        estimateInDay: deserializeParam(
          data['estimate_in_day'],
          ParamType.int,
          false,
        ),
        dateCreate: deserializeParam(
          data['date_create'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        imageCover: deserializeParam(
          data['image_cover'],
          ParamType.String,
          false,
        ),
        template: deserializeParam(
          data['template'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        authorId: deserializeParam(
          data['author_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StudyProgramListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudyProgramListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        durationHours == other.durationHours &&
        listEquality.equals(lessions, other.lessions) &&
        listEquality.equals(tests, other.tests) &&
        listEquality.equals(studioIdTest, other.studioIdTest) &&
        organizationId == other.organizationId &&
        departments == other.departments &&
        estimateInDay == other.estimateInDay &&
        dateCreate == other.dateCreate &&
        dateCreated == other.dateCreated &&
        imageCover == other.imageCover &&
        template == other.template &&
        price == other.price &&
        authorId == other.authorId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        durationHours,
        lessions,
        tests,
        studioIdTest,
        organizationId,
        departments,
        estimateInDay,
        dateCreate,
        dateCreated,
        imageCover,
        template,
        price,
        authorId
      ]);
}

StudyProgramListStruct createStudyProgramListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  int? durationHours,
  String? organizationId,
  DepartmentsIdStruct? departments,
  int? estimateInDay,
  String? dateCreate,
  String? dateCreated,
  String? imageCover,
  int? template,
  String? price,
  String? authorId,
}) =>
    StudyProgramListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      durationHours: durationHours,
      organizationId: organizationId,
      departments: departments ?? DepartmentsIdStruct(),
      estimateInDay: estimateInDay,
      dateCreate: dateCreate,
      dateCreated: dateCreated,
      imageCover: imageCover,
      template: template,
      price: price,
      authorId: authorId,
    );
