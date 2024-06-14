// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentListStruct extends BaseStruct {
  DepartmentListStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    String? code,
    BranchIdStruct? branchId,
    List<ProgramStruct>? programs,
    List<StaffListStruct>? staffs,
    String? organizationId,
    bool? checkDep,
    DepartmentsStruct? departmentsId,
    List<StaffsStepStruct>? checkStaff,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _code = code,
        _branchId = branchId,
        _programs = programs,
        _staffs = staffs,
        _organizationId = organizationId,
        _checkDep = checkDep,
        _departmentsId = departmentsId,
        _checkStaff = checkStaff;

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

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "branch_id" field.
  BranchIdStruct? _branchId;
  BranchIdStruct get branchId => _branchId ?? BranchIdStruct();
  set branchId(BranchIdStruct? val) => _branchId = val;

  void updateBranchId(Function(BranchIdStruct) updateFn) {
    updateFn(branchId ??= BranchIdStruct());
  }

  bool hasBranchId() => _branchId != null;

  // "programs" field.
  List<ProgramStruct>? _programs;
  List<ProgramStruct> get programs => _programs ?? const [];
  set programs(List<ProgramStruct>? val) => _programs = val;

  void updatePrograms(Function(List<ProgramStruct>) updateFn) {
    updateFn(programs ??= []);
  }

  bool hasPrograms() => _programs != null;

  // "staffs" field.
  List<StaffListStruct>? _staffs;
  List<StaffListStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffListStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffListStruct>) updateFn) {
    updateFn(staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;

  bool hasOrganizationId() => _organizationId != null;

  // "checkDep" field.
  bool? _checkDep;
  bool get checkDep => _checkDep ?? false;
  set checkDep(bool? val) => _checkDep = val;

  bool hasCheckDep() => _checkDep != null;

  // "departments_id" field.
  DepartmentsStruct? _departmentsId;
  DepartmentsStruct get departmentsId => _departmentsId ?? DepartmentsStruct();
  set departmentsId(DepartmentsStruct? val) => _departmentsId = val;

  void updateDepartmentsId(Function(DepartmentsStruct) updateFn) {
    updateFn(departmentsId ??= DepartmentsStruct());
  }

  bool hasDepartmentsId() => _departmentsId != null;

  // "checkStaff" field.
  List<StaffsStepStruct>? _checkStaff;
  List<StaffsStepStruct> get checkStaff => _checkStaff ?? const [];
  set checkStaff(List<StaffsStepStruct>? val) => _checkStaff = val;

  void updateCheckStaff(Function(List<StaffsStepStruct>) updateFn) {
    updateFn(checkStaff ??= []);
  }

  bool hasCheckStaff() => _checkStaff != null;

  static DepartmentListStruct fromMap(Map<String, dynamic> data) =>
      DepartmentListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        code: data['code'] as String?,
        branchId: BranchIdStruct.maybeFromMap(data['branch_id']),
        programs: getStructList(
          data['programs'],
          ProgramStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffListStruct.fromMap,
        ),
        organizationId: data['organization_id'] as String?,
        checkDep: data['checkDep'] as bool?,
        departmentsId: DepartmentsStruct.maybeFromMap(data['departments_id']),
        checkStaff: getStructList(
          data['checkStaff'],
          StaffsStepStruct.fromMap,
        ),
      );

  static DepartmentListStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'code': _code,
        'branch_id': _branchId?.toMap(),
        'programs': _programs?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'organization_id': _organizationId,
        'checkDep': _checkDep,
        'departments_id': _departmentsId?.toMap(),
        'checkStaff': _checkStaff?.map((e) => e.toMap()).toList(),
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
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.DataStruct,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'checkDep': serializeParam(
          _checkDep,
          ParamType.bool,
        ),
        'departments_id': serializeParam(
          _departmentsId,
          ParamType.DataStruct,
        ),
        'checkStaff': serializeParam(
          _checkStaff,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DepartmentListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartmentListStruct(
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
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        branchId: deserializeStructParam(
          data['branch_id'],
          ParamType.DataStruct,
          false,
          structBuilder: BranchIdStruct.fromSerializableMap,
        ),
        programs: deserializeStructParam<ProgramStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffListStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        checkDep: deserializeParam(
          data['checkDep'],
          ParamType.bool,
          false,
        ),
        departmentsId: deserializeStructParam(
          data['departments_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentsStruct.fromSerializableMap,
        ),
        checkStaff: deserializeStructParam<StaffsStepStruct>(
          data['checkStaff'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStepStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DepartmentListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DepartmentListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        code == other.code &&
        branchId == other.branchId &&
        listEquality.equals(programs, other.programs) &&
        listEquality.equals(staffs, other.staffs) &&
        organizationId == other.organizationId &&
        checkDep == other.checkDep &&
        departmentsId == other.departmentsId &&
        listEquality.equals(checkStaff, other.checkStaff);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        code,
        branchId,
        programs,
        staffs,
        organizationId,
        checkDep,
        departmentsId,
        checkStaff
      ]);
}

DepartmentListStruct createDepartmentListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  String? code,
  BranchIdStruct? branchId,
  String? organizationId,
  bool? checkDep,
  DepartmentsStruct? departmentsId,
}) =>
    DepartmentListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      code: code,
      branchId: branchId ?? BranchIdStruct(),
      organizationId: organizationId,
      checkDep: checkDep,
      departmentsId: departmentsId ?? DepartmentsStruct(),
    );
