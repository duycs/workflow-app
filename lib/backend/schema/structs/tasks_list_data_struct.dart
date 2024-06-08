// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksListDataStruct extends BaseStruct {
  TasksListDataStruct({
    List<TasksStruct>? data,
  }) : _data = data;

  // "data" field.
  List<TasksStruct>? _data;
  List<TasksStruct> get data => _data ?? const [];
  set data(List<TasksStruct>? val) => _data = val;
  void updateData(Function(List<TasksStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static TasksListDataStruct fromMap(Map<String, dynamic> data) =>
      TasksListDataStruct(
        data: getStructList(
          data['data'],
          TasksStruct.fromMap,
        ),
      );

  static TasksListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TasksListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TasksListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksListDataStruct(
        data: deserializeStructParam<TasksStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: TasksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TasksListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TasksListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

TasksListDataStruct createTasksListDataStruct() => TasksListDataStruct();
