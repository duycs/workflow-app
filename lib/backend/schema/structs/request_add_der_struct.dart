// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestAddDerStruct extends BaseStruct {
  RequestAddDerStruct({
    List<DepartmentListStruct>? departments,
  }) : _departments = departments;

  // "departments" field.
  List<DepartmentListStruct>? _departments;
  List<DepartmentListStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentListStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentListStruct>) updateFn) {
    updateFn(_departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  static RequestAddDerStruct fromMap(Map<String, dynamic> data) =>
      RequestAddDerStruct(
        departments: getStructList(
          data['departments'],
          DepartmentListStruct.fromMap,
        ),
      );

  static RequestAddDerStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestAddDerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'departments': _departments?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RequestAddDerStruct fromSerializableMap(Map<String, dynamic> data) =>
      RequestAddDerStruct(
        departments: deserializeStructParam<DepartmentListStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RequestAddDerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RequestAddDerStruct &&
        listEquality.equals(departments, other.departments);
  }

  @override
  int get hashCode => const ListEquality().hash([departments]);
}

RequestAddDerStruct createRequestAddDerStruct() => RequestAddDerStruct();
