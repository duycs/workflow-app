// ignore_for_file: unnecessary_getters_setters


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
    int? estimateInDay,
    String? dateCreate,
    String? dateCreated,
    String? imageCover,
    int? template,
    String? price,
    String? authorId,
    String? copyrightProgramId,
    String? copyrightOrganizationId,
    int? version,
    int? private,
    int? limitInvite,
    int? inviteCount,
    String? domainId,
    String? categoryId,
    List<DepartmentsIdStruct>? departments,
    UserStruct? userCreated,
    bool? checkBoxProgram,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _durationHours = durationHours,
        _lessions = lessions,
        _tests = tests,
        _studioIdTest = studioIdTest,
        _organizationId = organizationId,
        _estimateInDay = estimateInDay,
        _dateCreate = dateCreate,
        _dateCreated = dateCreated,
        _imageCover = imageCover,
        _template = template,
        _price = price,
        _authorId = authorId,
        _copyrightProgramId = copyrightProgramId,
        _copyrightOrganizationId = copyrightOrganizationId,
        _version = version,
        _private = private,
        _limitInvite = limitInvite,
        _inviteCount = inviteCount,
        _domainId = domainId,
        _categoryId = categoryId,
        _departments = departments,
        _userCreated = userCreated,
        _checkBoxProgram = checkBoxProgram;

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
      durationHours = durationHours + amount;

  bool hasDurationHours() => _durationHours != null;

  // "lessions" field.
  List<StudyProgramListLessionsIdStruct>? _lessions;
  List<StudyProgramListLessionsIdStruct> get lessions => _lessions ?? const [];
  set lessions(List<StudyProgramListLessionsIdStruct>? val) => _lessions = val;

  void updateLessions(
      Function(List<StudyProgramListLessionsIdStruct>) updateFn) {
    updateFn(lessions ??= []);
  }

  bool hasLessions() => _lessions != null;

  // "tests" field.
  List<StudyProgramListTestIdStruct>? _tests;
  List<StudyProgramListTestIdStruct> get tests => _tests ?? const [];
  set tests(List<StudyProgramListTestIdStruct>? val) => _tests = val;

  void updateTests(Function(List<StudyProgramListTestIdStruct>) updateFn) {
    updateFn(tests ??= []);
  }

  bool hasTests() => _tests != null;

  // "studioIdTest" field.
  List<StaffsTestsListStruct>? _studioIdTest;
  List<StaffsTestsListStruct> get studioIdTest => _studioIdTest ?? const [];
  set studioIdTest(List<StaffsTestsListStruct>? val) => _studioIdTest = val;

  void updateStudioIdTest(Function(List<StaffsTestsListStruct>) updateFn) {
    updateFn(studioIdTest ??= []);
  }

  bool hasStudioIdTest() => _studioIdTest != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "estimate_in_day" field.
  int? _estimateInDay;
  int get estimateInDay => _estimateInDay ?? 0;
  set estimateInDay(int? val) => _estimateInDay = val;

  void incrementEstimateInDay(int amount) =>
      estimateInDay = estimateInDay + amount;

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

  void incrementTemplate(int amount) => template = template + amount;

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

  // "copyright_program_id" field.
  String? _copyrightProgramId;
  String get copyrightProgramId => _copyrightProgramId ?? '';
  set copyrightProgramId(String? val) => _copyrightProgramId = val;

  bool hasCopyrightProgramId() => _copyrightProgramId != null;

  // "copyright_organization_id" field.
  String? _copyrightOrganizationId;
  String get copyrightOrganizationId => _copyrightOrganizationId ?? '';
  set copyrightOrganizationId(String? val) => _copyrightOrganizationId = val;

  bool hasCopyrightOrganizationId() => _copyrightOrganizationId != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  set version(int? val) => _version = val;

  void incrementVersion(int amount) => version = version + amount;

  bool hasVersion() => _version != null;

  // "private" field.
  int? _private;
  int get private => _private ?? 0;
  set private(int? val) => _private = val;

  void incrementPrivate(int amount) => private = private + amount;

  bool hasPrivate() => _private != null;

  // "limit_invite" field.
  int? _limitInvite;
  int get limitInvite => _limitInvite ?? 0;
  set limitInvite(int? val) => _limitInvite = val;

  void incrementLimitInvite(int amount) => limitInvite = limitInvite + amount;

  bool hasLimitInvite() => _limitInvite != null;

  // "invite_count" field.
  int? _inviteCount;
  int get inviteCount => _inviteCount ?? 0;
  set inviteCount(int? val) => _inviteCount = val;

  void incrementInviteCount(int amount) => inviteCount = inviteCount + amount;

  bool hasInviteCount() => _inviteCount != null;

  // "domain_id" field.
  String? _domainId;
  String get domainId => _domainId ?? '';
  set domainId(String? val) => _domainId = val;

  bool hasDomainId() => _domainId != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "departments" field.
  List<DepartmentsIdStruct>? _departments;
  List<DepartmentsIdStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentsIdStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentsIdStruct>) updateFn) {
    updateFn(departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  // "user_created" field.
  UserStruct? _userCreated;
  UserStruct get userCreated => _userCreated ?? UserStruct();
  set userCreated(UserStruct? val) => _userCreated = val;

  void updateUserCreated(Function(UserStruct) updateFn) {
    updateFn(userCreated ??= UserStruct());
  }

  bool hasUserCreated() => _userCreated != null;

  // "checkBoxProgram" field.
  bool? _checkBoxProgram;
  bool get checkBoxProgram => _checkBoxProgram ?? false;
  set checkBoxProgram(bool? val) => _checkBoxProgram = val;

  bool hasCheckBoxProgram() => _checkBoxProgram != null;

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
        estimateInDay: castToType<int>(data['estimate_in_day']),
        dateCreate: data['date_create'] as String?,
        dateCreated: data['date_created'] as String?,
        imageCover: data['image_cover'] as String?,
        template: castToType<int>(data['template']),
        price: data['price'] as String?,
        authorId: data['author_id'] as String?,
        copyrightProgramId: data['copyright_program_id'] as String?,
        copyrightOrganizationId: data['copyright_organization_id'] as String?,
        version: castToType<int>(data['version']),
        private: castToType<int>(data['private']),
        limitInvite: castToType<int>(data['limit_invite']),
        inviteCount: castToType<int>(data['invite_count']),
        domainId: data['domain_id'] as String?,
        categoryId: data['category_id'] as String?,
        departments: getStructList(
          data['departments'],
          DepartmentsIdStruct.fromMap,
        ),
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        checkBoxProgram: data['checkBoxProgram'] as bool?,
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
        'estimate_in_day': _estimateInDay,
        'date_create': _dateCreate,
        'date_created': _dateCreated,
        'image_cover': _imageCover,
        'template': _template,
        'price': _price,
        'author_id': _authorId,
        'copyright_program_id': _copyrightProgramId,
        'copyright_organization_id': _copyrightOrganizationId,
        'version': _version,
        'private': _private,
        'limit_invite': _limitInvite,
        'invite_count': _inviteCount,
        'domain_id': _domainId,
        'category_id': _categoryId,
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'user_created': _userCreated?.toMap(),
        'checkBoxProgram': _checkBoxProgram,
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
          isList: true,
        ),
        'tests': serializeParam(
          _tests,
          ParamType.DataStruct,
          isList: true,
        ),
        'studioIdTest': serializeParam(
          _studioIdTest,
          ParamType.DataStruct,
          isList: true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
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
        'copyright_program_id': serializeParam(
          _copyrightProgramId,
          ParamType.String,
        ),
        'copyright_organization_id': serializeParam(
          _copyrightOrganizationId,
          ParamType.String,
        ),
        'version': serializeParam(
          _version,
          ParamType.int,
        ),
        'private': serializeParam(
          _private,
          ParamType.int,
        ),
        'limit_invite': serializeParam(
          _limitInvite,
          ParamType.int,
        ),
        'invite_count': serializeParam(
          _inviteCount,
          ParamType.int,
        ),
        'domain_id': serializeParam(
          _domainId,
          ParamType.String,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'checkBoxProgram': serializeParam(
          _checkBoxProgram,
          ParamType.bool,
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
        copyrightProgramId: deserializeParam(
          data['copyright_program_id'],
          ParamType.String,
          false,
        ),
        copyrightOrganizationId: deserializeParam(
          data['copyright_organization_id'],
          ParamType.String,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.int,
          false,
        ),
        private: deserializeParam(
          data['private'],
          ParamType.int,
          false,
        ),
        limitInvite: deserializeParam(
          data['limit_invite'],
          ParamType.int,
          false,
        ),
        inviteCount: deserializeParam(
          data['invite_count'],
          ParamType.int,
          false,
        ),
        domainId: deserializeParam(
          data['domain_id'],
          ParamType.String,
          false,
        ),
        categoryId: deserializeParam(
          data['category_id'],
          ParamType.String,
          false,
        ),
        departments: deserializeStructParam<DepartmentsIdStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentsIdStruct.fromSerializableMap,
        ),
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        checkBoxProgram: deserializeParam(
          data['checkBoxProgram'],
          ParamType.bool,
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
        estimateInDay == other.estimateInDay &&
        dateCreate == other.dateCreate &&
        dateCreated == other.dateCreated &&
        imageCover == other.imageCover &&
        template == other.template &&
        price == other.price &&
        authorId == other.authorId &&
        copyrightProgramId == other.copyrightProgramId &&
        copyrightOrganizationId == other.copyrightOrganizationId &&
        version == other.version &&
        private == other.private &&
        limitInvite == other.limitInvite &&
        inviteCount == other.inviteCount &&
        domainId == other.domainId &&
        categoryId == other.categoryId &&
        listEquality.equals(departments, other.departments) &&
        userCreated == other.userCreated &&
        checkBoxProgram == other.checkBoxProgram;
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
        estimateInDay,
        dateCreate,
        dateCreated,
        imageCover,
        template,
        price,
        authorId,
        copyrightProgramId,
        copyrightOrganizationId,
        version,
        private,
        limitInvite,
        inviteCount,
        domainId,
        categoryId,
        departments,
        userCreated,
        checkBoxProgram
      ]);
}

StudyProgramListStruct createStudyProgramListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  int? durationHours,
  String? organizationId,
  int? estimateInDay,
  String? dateCreate,
  String? dateCreated,
  String? imageCover,
  int? template,
  String? price,
  String? authorId,
  String? copyrightProgramId,
  String? copyrightOrganizationId,
  int? version,
  int? private,
  int? limitInvite,
  int? inviteCount,
  String? domainId,
  String? categoryId,
  UserStruct? userCreated,
  bool? checkBoxProgram,
}) =>
    StudyProgramListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      durationHours: durationHours,
      organizationId: organizationId,
      estimateInDay: estimateInDay,
      dateCreate: dateCreate,
      dateCreated: dateCreated,
      imageCover: imageCover,
      template: template,
      price: price,
      authorId: authorId,
      copyrightProgramId: copyrightProgramId,
      copyrightOrganizationId: copyrightOrganizationId,
      version: version,
      private: private,
      limitInvite: limitInvite,
      inviteCount: inviteCount,
      domainId: domainId,
      categoryId: categoryId,
      userCreated: userCreated ?? UserStruct(),
      checkBoxProgram: checkBoxProgram,
    );
