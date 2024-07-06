// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OneWorkFlowDataStruct extends BaseStruct {
  OneWorkFlowDataStruct({
    WorkflowsStruct? data,
  }) : _data = data;

  // "data" field.
  WorkflowsStruct? _data;
  WorkflowsStruct get data => _data ?? WorkflowsStruct();
  set data(WorkflowsStruct? val) => _data = val;

  void updateData(Function(WorkflowsStruct) updateFn) {
    updateFn(_data ??= WorkflowsStruct());
  }

  bool hasData() => _data != null;

  static OneWorkFlowDataStruct fromMap(Map<String, dynamic> data) =>
      OneWorkFlowDataStruct(
        data: WorkflowsStruct.maybeFromMap(data['data']),
      );

  static OneWorkFlowDataStruct? maybeFromMap(dynamic data) => data is Map
      ? OneWorkFlowDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static OneWorkFlowDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      OneWorkFlowDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: WorkflowsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OneWorkFlowDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OneWorkFlowDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

OneWorkFlowDataStruct createOneWorkFlowDataStruct({
  WorkflowsStruct? data,
}) =>
    OneWorkFlowDataStruct(
      data: data ?? WorkflowsStruct(),
    );
