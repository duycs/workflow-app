// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkflowsListDataStruct extends BaseStruct {
  WorkflowsListDataStruct({
    List<WorkflowsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<WorkflowsStruct>? _data;
  List<WorkflowsStruct> get data => _data ?? const [];
  set data(List<WorkflowsStruct>? val) => _data = val;

  void updateData(Function(List<WorkflowsStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static WorkflowsListDataStruct fromMap(Map<String, dynamic> data) =>
      WorkflowsListDataStruct(
        data: getStructList(
          data['data'],
          WorkflowsStruct.fromMap,
        ),
      );

  static WorkflowsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkflowsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static WorkflowsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WorkflowsListDataStruct(
        data: deserializeStructParam<WorkflowsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: WorkflowsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WorkflowsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkflowsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

WorkflowsListDataStruct createWorkflowsListDataStruct() =>
    WorkflowsListDataStruct();
