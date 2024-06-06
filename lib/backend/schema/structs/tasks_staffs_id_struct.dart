// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksStaffsIdStruct extends BaseStruct {
  TasksStaffsIdStruct({
    String? id,
    StaffIdStruct? staffsId,
  })  : _id = id,
        _staffsId = staffsId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "staffs_id" field.
  StaffIdStruct? _staffsId;
  StaffIdStruct get staffsId => _staffsId ?? StaffIdStruct();
  set staffsId(StaffIdStruct? val) => _staffsId = val;
  void updateStaffsId(Function(StaffIdStruct) updateFn) =>
      updateFn(_staffsId ??= StaffIdStruct());
  bool hasStaffsId() => _staffsId != null;

  static TasksStaffsIdStruct fromMap(Map<String, dynamic> data) =>
      TasksStaffsIdStruct(
        id: data['id'] as String?,
        staffsId: StaffIdStruct.maybeFromMap(data['staffs_id']),
      );

  static TasksStaffsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? TasksStaffsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'staffs_id': _staffsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'staffs_id': serializeParam(
          _staffsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TasksStaffsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksStaffsIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        staffsId: deserializeStructParam(
          data['staffs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TasksStaffsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksStaffsIdStruct &&
        id == other.id &&
        staffsId == other.staffsId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, staffsId]);
}

TasksStaffsIdStruct createTasksStaffsIdStruct({
  String? id,
  StaffIdStruct? staffsId,
}) =>
    TasksStaffsIdStruct(
      id: id,
      staffsId: staffsId ?? StaffIdStruct(),
    );
