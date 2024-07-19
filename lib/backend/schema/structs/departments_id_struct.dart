// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsIdStruct extends BaseStruct {
  DepartmentsIdStruct({
    int? id,
    DepartmentsStruct? departmentsId,
    List<StaffsStepStruct>? checkStaff,
  })  : _id = id,
        _departmentsId = departmentsId,
        _checkStaff = checkStaff;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "departments_id" field.
  DepartmentsStruct? _departmentsId;
  DepartmentsStruct get departmentsId => _departmentsId ?? DepartmentsStruct();
  set departmentsId(DepartmentsStruct? val) => _departmentsId = val;

  void updateDepartmentsId(Function(DepartmentsStruct) updateFn) {
    updateFn(_departmentsId ??= DepartmentsStruct());
  }

  bool hasDepartmentsId() => _departmentsId != null;

  // "checkStaff" field.
  List<StaffsStepStruct>? _checkStaff;
  List<StaffsStepStruct> get checkStaff => _checkStaff ?? const [];
  set checkStaff(List<StaffsStepStruct>? val) => _checkStaff = val;

  void updateCheckStaff(Function(List<StaffsStepStruct>) updateFn) {
    updateFn(_checkStaff ??= []);
  }

  bool hasCheckStaff() => _checkStaff != null;

  static DepartmentsIdStruct fromMap(Map<String, dynamic> data) =>
      DepartmentsIdStruct(
        id: castToType<int>(data['id']),
        departmentsId: DepartmentsStruct.maybeFromMap(data['departments_id']),
        checkStaff: getStructList(
          data['checkStaff'],
          StaffsStepStruct.fromMap,
        ),
      );

  static DepartmentsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'departments_id': _departmentsId?.toMap(),
        'checkStaff': _checkStaff?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
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

  static DepartmentsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartmentsIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
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
  String toString() => 'DepartmentsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DepartmentsIdStruct &&
        id == other.id &&
        departmentsId == other.departmentsId &&
        listEquality.equals(checkStaff, other.checkStaff);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, departmentsId, checkStaff]);
}

DepartmentsIdStruct createDepartmentsIdStruct({
  int? id,
  DepartmentsStruct? departmentsId,
}) =>
    DepartmentsIdStruct(
      id: id,
      departmentsId: departmentsId ?? DepartmentsStruct(),
    );
