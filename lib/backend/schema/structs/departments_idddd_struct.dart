// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsIddddStruct extends BaseStruct {
  DepartmentsIddddStruct({
    DepartmentsStruct? departmentsId,
  }) : _departmentsId = departmentsId;

  // "departments_id" field.
  DepartmentsStruct? _departmentsId;
  DepartmentsStruct get departmentsId => _departmentsId ?? DepartmentsStruct();
  set departmentsId(DepartmentsStruct? val) => _departmentsId = val;

  void updateDepartmentsId(Function(DepartmentsStruct) updateFn) {
    updateFn(_departmentsId ??= DepartmentsStruct());
  }

  bool hasDepartmentsId() => _departmentsId != null;

  static DepartmentsIddddStruct fromMap(Map<String, dynamic> data) =>
      DepartmentsIddddStruct(
        departmentsId: DepartmentsStruct.maybeFromMap(data['departments_id']),
      );

  static DepartmentsIddddStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentsIddddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'departments_id': _departmentsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departments_id': serializeParam(
          _departmentsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DepartmentsIddddStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DepartmentsIddddStruct(
        departmentsId: deserializeStructParam(
          data['departments_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DepartmentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DepartmentsIddddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepartmentsIddddStruct &&
        departmentsId == other.departmentsId;
  }

  @override
  int get hashCode => const ListEquality().hash([departmentsId]);
}

DepartmentsIddddStruct createDepartmentsIddddStruct({
  DepartmentsStruct? departmentsId,
}) =>
    DepartmentsIddddStruct(
      departmentsId: departmentsId ?? DepartmentsStruct(),
    );
