// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffTasksStruct extends BaseStruct {
  StaffTasksStruct({
    StaffTasksIdStruct? tasksId,
    int? id,
  })  : _tasksId = tasksId,
        _id = id;

  // "tasks_id" field.
  StaffTasksIdStruct? _tasksId;
  StaffTasksIdStruct get tasksId => _tasksId ?? StaffTasksIdStruct();
  set tasksId(StaffTasksIdStruct? val) => _tasksId = val;

  void updateTasksId(Function(StaffTasksIdStruct) updateFn) {
    updateFn(_tasksId ??= StaffTasksIdStruct());
  }

  bool hasTasksId() => _tasksId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static StaffTasksStruct fromMap(Map<String, dynamic> data) =>
      StaffTasksStruct(
        tasksId: StaffTasksIdStruct.maybeFromMap(data['tasks_id']),
        id: castToType<int>(data['id']),
      );

  static StaffTasksStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffTasksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tasks_id': _tasksId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tasks_id': serializeParam(
          _tasksId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static StaffTasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffTasksStruct(
        tasksId: deserializeStructParam(
          data['tasks_id'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffTasksIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StaffTasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffTasksStruct &&
        tasksId == other.tasksId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([tasksId, id]);
}

StaffTasksStruct createStaffTasksStruct({
  StaffTasksIdStruct? tasksId,
  int? id,
}) =>
    StaffTasksStruct(
      tasksId: tasksId ?? StaffTasksIdStruct(),
      id: id,
    );
