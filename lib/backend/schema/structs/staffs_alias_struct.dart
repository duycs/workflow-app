// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsAliasStruct extends BaseStruct {
  StaffsAliasStruct({
    List<DepartmentsStruct>? departments,
    List<StaffIdStruct>? staffs,
  })  : _departments = departments,
        _staffs = staffs;

  // "departments" field.
  List<DepartmentsStruct>? _departments;
  List<DepartmentsStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentsStruct>? val) => _departments = val;
  void updateDepartments(Function(List<DepartmentsStruct>) updateFn) =>
      updateFn(_departments ??= []);
  bool hasDepartments() => _departments != null;

  // "staffs" field.
  List<StaffIdStruct>? _staffs;
  List<StaffIdStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffIdStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<StaffIdStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  static StaffsAliasStruct fromMap(Map<String, dynamic> data) =>
      StaffsAliasStruct(
        departments: getStructList(
          data['departments'],
          DepartmentsStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffIdStruct.fromMap,
        ),
      );

  static StaffsAliasStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsAliasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static StaffsAliasStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffsAliasStruct(
        departments: deserializeStructParam<DepartmentsStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentsStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffIdStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffsAliasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffsAliasStruct &&
        listEquality.equals(departments, other.departments) &&
        listEquality.equals(staffs, other.staffs);
  }

  @override
  int get hashCode => const ListEquality().hash([departments, staffs]);
}

StaffsAliasStruct createStaffsAliasStruct() => StaffsAliasStruct();
