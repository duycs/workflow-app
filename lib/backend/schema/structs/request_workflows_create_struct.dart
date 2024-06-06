// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestWorkflowsCreateStruct extends BaseStruct {
  RequestWorkflowsCreateStruct({
    String? name,
    String? description,
    String? status,
    String? cron,
    int? limitPublished,
    int? remind,
    int? remindInSecond,
    int? remind2,
    String? departmentId,
    String? branchId,
    String? organizationId,
    List<StaffsStepStruct>? staffs,
    List<DepartmentsIdStruct>? departments,
    String? id,
  })  : _name = name,
        _description = description,
        _status = status,
        _cron = cron,
        _limitPublished = limitPublished,
        _remind = remind,
        _remindInSecond = remindInSecond,
        _remind2 = remind2,
        _departmentId = departmentId,
        _branchId = branchId,
        _organizationId = organizationId,
        _staffs = staffs,
        _departments = departments,
        _id = id;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "cron" field.
  String? _cron;
  String get cron => _cron ?? '';
  set cron(String? val) => _cron = val;
  bool hasCron() => _cron != null;

  // "limit_published" field.
  int? _limitPublished;
  int get limitPublished => _limitPublished ?? 0;
  set limitPublished(int? val) => _limitPublished = val;
  void incrementLimitPublished(int amount) =>
      _limitPublished = limitPublished + amount;
  bool hasLimitPublished() => _limitPublished != null;

  // "remind" field.
  int? _remind;
  int get remind => _remind ?? 0;
  set remind(int? val) => _remind = val;
  void incrementRemind(int amount) => _remind = remind + amount;
  bool hasRemind() => _remind != null;

  // "remind_in_second" field.
  int? _remindInSecond;
  int get remindInSecond => _remindInSecond ?? 0;
  set remindInSecond(int? val) => _remindInSecond = val;
  void incrementRemindInSecond(int amount) =>
      _remindInSecond = remindInSecond + amount;
  bool hasRemindInSecond() => _remindInSecond != null;

  // "remind_2" field.
  int? _remind2;
  int get remind2 => _remind2 ?? 0;
  set remind2(int? val) => _remind2 = val;
  void incrementRemind2(int amount) => _remind2 = remind2 + amount;
  bool hasRemind2() => _remind2 != null;

  // "department_id" field.
  String? _departmentId;
  String get departmentId => _departmentId ?? '';
  set departmentId(String? val) => _departmentId = val;
  bool hasDepartmentId() => _departmentId != null;

  // "branch_id" field.
  String? _branchId;
  String get branchId => _branchId ?? '';
  set branchId(String? val) => _branchId = val;
  bool hasBranchId() => _branchId != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;
  bool hasOrganizationId() => _organizationId != null;

  // "staffs" field.
  List<StaffsStepStruct>? _staffs;
  List<StaffsStepStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStepStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<StaffsStepStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  // "departments" field.
  List<DepartmentsIdStruct>? _departments;
  List<DepartmentsIdStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentsIdStruct>? val) => _departments = val;
  void updateDepartments(Function(List<DepartmentsIdStruct>) updateFn) =>
      updateFn(_departments ??= []);
  bool hasDepartments() => _departments != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static RequestWorkflowsCreateStruct fromMap(Map<String, dynamic> data) =>
      RequestWorkflowsCreateStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        status: data['status'] as String?,
        cron: data['cron'] as String?,
        limitPublished: castToType<int>(data['limit_published']),
        remind: castToType<int>(data['remind']),
        remindInSecond: castToType<int>(data['remind_in_second']),
        remind2: castToType<int>(data['remind_2']),
        departmentId: data['department_id'] as String?,
        branchId: data['branch_id'] as String?,
        organizationId: data['organization_id'] as String?,
        staffs: getStructList(
          data['staffs'],
          StaffsStepStruct.fromMap,
        ),
        departments: getStructList(
          data['departments'],
          DepartmentsIdStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static RequestWorkflowsCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestWorkflowsCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'status': _status,
        'cron': _cron,
        'limit_published': _limitPublished,
        'remind': _remind,
        'remind_in_second': _remindInSecond,
        'remind_2': _remind2,
        'department_id': _departmentId,
        'branch_id': _branchId,
        'organization_id': _organizationId,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'cron': serializeParam(
          _cron,
          ParamType.String,
        ),
        'limit_published': serializeParam(
          _limitPublished,
          ParamType.int,
        ),
        'remind': serializeParam(
          _remind,
          ParamType.int,
        ),
        'remind_in_second': serializeParam(
          _remindInSecond,
          ParamType.int,
        ),
        'remind_2': serializeParam(
          _remind2,
          ParamType.int,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static RequestWorkflowsCreateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RequestWorkflowsCreateStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        cron: deserializeParam(
          data['cron'],
          ParamType.String,
          false,
        ),
        limitPublished: deserializeParam(
          data['limit_published'],
          ParamType.int,
          false,
        ),
        remind: deserializeParam(
          data['remind'],
          ParamType.int,
          false,
        ),
        remindInSecond: deserializeParam(
          data['remind_in_second'],
          ParamType.int,
          false,
        ),
        remind2: deserializeParam(
          data['remind_2'],
          ParamType.int,
          false,
        ),
        departmentId: deserializeParam(
          data['department_id'],
          ParamType.String,
          false,
        ),
        branchId: deserializeParam(
          data['branch_id'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        staffs: deserializeStructParam<StaffsStepStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStepStruct.fromSerializableMap,
        ),
        departments: deserializeStructParam<DepartmentsIdStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentsIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RequestWorkflowsCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RequestWorkflowsCreateStruct &&
        name == other.name &&
        description == other.description &&
        status == other.status &&
        cron == other.cron &&
        limitPublished == other.limitPublished &&
        remind == other.remind &&
        remindInSecond == other.remindInSecond &&
        remind2 == other.remind2 &&
        departmentId == other.departmentId &&
        branchId == other.branchId &&
        organizationId == other.organizationId &&
        listEquality.equals(staffs, other.staffs) &&
        listEquality.equals(departments, other.departments) &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        status,
        cron,
        limitPublished,
        remind,
        remindInSecond,
        remind2,
        departmentId,
        branchId,
        organizationId,
        staffs,
        departments,
        id
      ]);
}

RequestWorkflowsCreateStruct createRequestWorkflowsCreateStruct({
  String? name,
  String? description,
  String? status,
  String? cron,
  int? limitPublished,
  int? remind,
  int? remindInSecond,
  int? remind2,
  String? departmentId,
  String? branchId,
  String? organizationId,
  String? id,
}) =>
    RequestWorkflowsCreateStruct(
      name: name,
      description: description,
      status: status,
      cron: cron,
      limitPublished: limitPublished,
      remind: remind,
      remindInSecond: remindInSecond,
      remind2: remind2,
      departmentId: departmentId,
      branchId: branchId,
      organizationId: organizationId,
      id: id,
    );
