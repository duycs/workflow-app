// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetStaffInfoStruct extends BaseStruct {
  GetStaffInfoStruct({
    StaffListInfoStruct? staff,
    DepartmentListStruct? department,
    BranchListStruct? branch,
  })  : _staff = staff,
        _department = department,
        _branch = branch;

  // "staff" field.
  StaffListInfoStruct? _staff;
  StaffListInfoStruct get staff => _staff ?? StaffListInfoStruct();
  set staff(StaffListInfoStruct? val) => _staff = val;

  void updateStaff(Function(StaffListInfoStruct) updateFn) {
    updateFn(staff ??= StaffListInfoStruct());
  }

  bool hasStaff() => _staff != null;

  // "department" field.
  DepartmentListStruct? _department;
  DepartmentListStruct get department => _department ?? DepartmentListStruct();
  set department(DepartmentListStruct? val) => _department = val;

  void updateDepartment(Function(DepartmentListStruct) updateFn) {
    updateFn(department ??= DepartmentListStruct());
  }

  bool hasDepartment() => _department != null;

  // "branch" field.
  BranchListStruct? _branch;
  BranchListStruct get branch => _branch ?? BranchListStruct();
  set branch(BranchListStruct? val) => _branch = val;

  void updateBranch(Function(BranchListStruct) updateFn) {
    updateFn(branch ??= BranchListStruct());
  }

  bool hasBranch() => _branch != null;

  static GetStaffInfoStruct fromMap(Map<String, dynamic> data) =>
      GetStaffInfoStruct(
        staff: StaffListInfoStruct.maybeFromMap(data['staff']),
        department: DepartmentListStruct.maybeFromMap(data['department']),
        branch: BranchListStruct.maybeFromMap(data['branch']),
      );

  static GetStaffInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? GetStaffInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'staff': _staff?.toMap(),
        'department': _department?.toMap(),
        'branch': _branch?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'staff': serializeParam(
          _staff,
          ParamType.DataStruct,
        ),
        'department': serializeParam(
          _department,
          ParamType.DataStruct,
        ),
        'branch': serializeParam(
          _branch,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GetStaffInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetStaffInfoStruct(
        staff: deserializeStructParam(
          data['staff'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListInfoStruct.fromSerializableMap,
        ),
        department: deserializeStructParam(
          data['department'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
        branch: deserializeStructParam(
          data['branch'],
          ParamType.DataStruct,
          false,
          structBuilder: BranchListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GetStaffInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetStaffInfoStruct &&
        staff == other.staff &&
        department == other.department &&
        branch == other.branch;
  }

  @override
  int get hashCode => const ListEquality().hash([staff, department, branch]);
}

GetStaffInfoStruct createGetStaffInfoStruct({
  StaffListInfoStruct? staff,
  DepartmentListStruct? department,
  BranchListStruct? branch,
}) =>
    GetStaffInfoStruct(
      staff: staff ?? StaffListInfoStruct(),
      department: department ?? DepartmentListStruct(),
      branch: branch ?? BranchListStruct(),
    );
