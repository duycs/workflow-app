// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffListStruct extends BaseStruct {
  StaffListStruct({
    String? id,
    String? status,
    String? cccd,
    String? gender,
    String? phone,
    String? dob,
    BranchListStruct? branchId,
    DepartmentListStruct? departmentId,
    UserStruct? userId,
    String? title,
    List<StaffTasksStruct>? tasks,
    bool? check,
    List<StaffLessionStruct>? staffLessions,
    List<TestListStruct>? staffTests,
    List<StaffsProgramsListStruct>? staffPrograms,
    String? slogan,
    String? description,
  })  : _id = id,
        _status = status,
        _cccd = cccd,
        _gender = gender,
        _phone = phone,
        _dob = dob,
        _branchId = branchId,
        _departmentId = departmentId,
        _userId = userId,
        _title = title,
        _tasks = tasks,
        _check = check,
        _staffLessions = staffLessions,
        _staffTests = staffTests,
        _staffPrograms = staffPrograms,
        _slogan = slogan,
        _description = description;

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

  // "cccd" field.
  String? _cccd;
  String get cccd => _cccd ?? '';
  set cccd(String? val) => _cccd = val;

  bool hasCccd() => _cccd != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "branch_id" field.
  BranchListStruct? _branchId;
  BranchListStruct get branchId => _branchId ?? BranchListStruct();
  set branchId(BranchListStruct? val) => _branchId = val;

  void updateBranchId(Function(BranchListStruct) updateFn) {
    updateFn(_branchId ??= BranchListStruct());
  }

  bool hasBranchId() => _branchId != null;

  // "department_id" field.
  DepartmentListStruct? _departmentId;
  DepartmentListStruct get departmentId =>
      _departmentId ?? DepartmentListStruct();
  set departmentId(DepartmentListStruct? val) => _departmentId = val;

  void updateDepartmentId(Function(DepartmentListStruct) updateFn) {
    updateFn(_departmentId ??= DepartmentListStruct());
  }

  bool hasDepartmentId() => _departmentId != null;

  // "user_id" field.
  UserStruct? _userId;
  UserStruct get userId => _userId ?? UserStruct();
  set userId(UserStruct? val) => _userId = val;

  void updateUserId(Function(UserStruct) updateFn) {
    updateFn(_userId ??= UserStruct());
  }

  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "tasks" field.
  List<StaffTasksStruct>? _tasks;
  List<StaffTasksStruct> get tasks => _tasks ?? const [];
  set tasks(List<StaffTasksStruct>? val) => _tasks = val;

  void updateTasks(Function(List<StaffTasksStruct>) updateFn) {
    updateFn(_tasks ??= []);
  }

  bool hasTasks() => _tasks != null;

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  set check(bool? val) => _check = val;

  bool hasCheck() => _check != null;

  // "staff_lessions" field.
  List<StaffLessionStruct>? _staffLessions;
  List<StaffLessionStruct> get staffLessions => _staffLessions ?? const [];
  set staffLessions(List<StaffLessionStruct>? val) => _staffLessions = val;

  void updateStaffLessions(Function(List<StaffLessionStruct>) updateFn) {
    updateFn(_staffLessions ??= []);
  }

  bool hasStaffLessions() => _staffLessions != null;

  // "staff_tests" field.
  List<TestListStruct>? _staffTests;
  List<TestListStruct> get staffTests => _staffTests ?? const [];
  set staffTests(List<TestListStruct>? val) => _staffTests = val;

  void updateStaffTests(Function(List<TestListStruct>) updateFn) {
    updateFn(_staffTests ??= []);
  }

  bool hasStaffTests() => _staffTests != null;

  // "staff_programs" field.
  List<StaffsProgramsListStruct>? _staffPrograms;
  List<StaffsProgramsListStruct> get staffPrograms =>
      _staffPrograms ?? const [];
  set staffPrograms(List<StaffsProgramsListStruct>? val) =>
      _staffPrograms = val;

  void updateStaffPrograms(Function(List<StaffsProgramsListStruct>) updateFn) {
    updateFn(_staffPrograms ??= []);
  }

  bool hasStaffPrograms() => _staffPrograms != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  set slogan(String? val) => _slogan = val;

  bool hasSlogan() => _slogan != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static StaffListStruct fromMap(Map<String, dynamic> data) => StaffListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        cccd: data['cccd'] as String?,
        gender: data['gender'] as String?,
        phone: data['phone'] as String?,
        dob: data['dob'] as String?,
        branchId: BranchListStruct.maybeFromMap(data['branch_id']),
        departmentId: DepartmentListStruct.maybeFromMap(data['department_id']),
        userId: UserStruct.maybeFromMap(data['user_id']),
        title: data['title'] as String?,
        tasks: getStructList(
          data['tasks'],
          StaffTasksStruct.fromMap,
        ),
        check: data['check'] as bool?,
        staffLessions: getStructList(
          data['staff_lessions'],
          StaffLessionStruct.fromMap,
        ),
        staffTests: getStructList(
          data['staff_tests'],
          TestListStruct.fromMap,
        ),
        staffPrograms: getStructList(
          data['staff_programs'],
          StaffsProgramsListStruct.fromMap,
        ),
        slogan: data['slogan'] as String?,
        description: data['description'] as String?,
      );

  static StaffListStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'cccd': _cccd,
        'gender': _gender,
        'phone': _phone,
        'dob': _dob,
        'branch_id': _branchId?.toMap(),
        'department_id': _departmentId?.toMap(),
        'user_id': _userId?.toMap(),
        'title': _title,
        'tasks': _tasks?.map((e) => e.toMap()).toList(),
        'check': _check,
        'staff_lessions': _staffLessions?.map((e) => e.toMap()).toList(),
        'staff_tests': _staffTests?.map((e) => e.toMap()).toList(),
        'staff_programs': _staffPrograms?.map((e) => e.toMap()).toList(),
        'slogan': _slogan,
        'description': _description,
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
        'cccd': serializeParam(
          _cccd,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.DataStruct,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.DataStruct,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.DataStruct,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'tasks': serializeParam(
          _tasks,
          ParamType.DataStruct,
          isList: true,
        ),
        'check': serializeParam(
          _check,
          ParamType.bool,
        ),
        'staff_lessions': serializeParam(
          _staffLessions,
          ParamType.DataStruct,
          isList: true,
        ),
        'staff_tests': serializeParam(
          _staffTests,
          ParamType.DataStruct,
          isList: true,
        ),
        'staff_programs': serializeParam(
          _staffPrograms,
          ParamType.DataStruct,
          isList: true,
        ),
        'slogan': serializeParam(
          _slogan,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffListStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffListStruct(
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
        cccd: deserializeParam(
          data['cccd'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
        branchId: deserializeStructParam(
          data['branch_id'],
          ParamType.DataStruct,
          false,
          structBuilder: BranchListStruct.fromSerializableMap,
        ),
        departmentId: deserializeStructParam(
          data['department_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
        userId: deserializeStructParam(
          data['user_id'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        tasks: deserializeStructParam<StaffTasksStruct>(
          data['tasks'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffTasksStruct.fromSerializableMap,
        ),
        check: deserializeParam(
          data['check'],
          ParamType.bool,
          false,
        ),
        staffLessions: deserializeStructParam<StaffLessionStruct>(
          data['staff_lessions'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffLessionStruct.fromSerializableMap,
        ),
        staffTests: deserializeStructParam<TestListStruct>(
          data['staff_tests'],
          ParamType.DataStruct,
          true,
          structBuilder: TestListStruct.fromSerializableMap,
        ),
        staffPrograms: deserializeStructParam<StaffsProgramsListStruct>(
          data['staff_programs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsProgramsListStruct.fromSerializableMap,
        ),
        slogan: deserializeParam(
          data['slogan'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StaffListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffListStruct &&
        id == other.id &&
        status == other.status &&
        cccd == other.cccd &&
        gender == other.gender &&
        phone == other.phone &&
        dob == other.dob &&
        branchId == other.branchId &&
        departmentId == other.departmentId &&
        userId == other.userId &&
        title == other.title &&
        listEquality.equals(tasks, other.tasks) &&
        check == other.check &&
        listEquality.equals(staffLessions, other.staffLessions) &&
        listEquality.equals(staffTests, other.staffTests) &&
        listEquality.equals(staffPrograms, other.staffPrograms) &&
        slogan == other.slogan &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        cccd,
        gender,
        phone,
        dob,
        branchId,
        departmentId,
        userId,
        title,
        tasks,
        check,
        staffLessions,
        staffTests,
        staffPrograms,
        slogan,
        description
      ]);
}

StaffListStruct createStaffListStruct({
  String? id,
  String? status,
  String? cccd,
  String? gender,
  String? phone,
  String? dob,
  BranchListStruct? branchId,
  DepartmentListStruct? departmentId,
  UserStruct? userId,
  String? title,
  bool? check,
  String? slogan,
  String? description,
}) =>
    StaffListStruct(
      id: id,
      status: status,
      cccd: cccd,
      gender: gender,
      phone: phone,
      dob: dob,
      branchId: branchId ?? BranchListStruct(),
      departmentId: departmentId ?? DepartmentListStruct(),
      userId: userId ?? UserStruct(),
      title: title,
      check: check,
      slogan: slogan,
      description: description,
    );
