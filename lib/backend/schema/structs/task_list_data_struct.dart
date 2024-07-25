// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskListDataStruct extends BaseStruct {
  TaskListDataStruct({
    List<TaskListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<TaskListStruct>? _data;
  List<TaskListStruct> get data => _data ?? const [];
  set data(List<TaskListStruct>? val) => _data = val;

  void updateData(Function(List<TaskListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static TaskListDataStruct fromMap(Map<String, dynamic> data) =>
      TaskListDataStruct(
        data: getStructList(
          data['data'],
          TaskListStruct.fromMap,
        ),
      );

  static TaskListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TaskListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskListDataStruct(
        data: deserializeStructParam<TaskListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: TaskListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskListDataStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

TaskListDataStruct createTaskListDataStruct() => TaskListDataStruct();
