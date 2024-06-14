// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepListDataStruct extends BaseStruct {
  StepListDataStruct({
    List<StepsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<StepsStruct>? _data;
  List<StepsStruct> get data => _data ?? const [];
  set data(List<StepsStruct>? val) => _data = val;

  void updateData(Function(List<StepsStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static StepListDataStruct fromMap(Map<String, dynamic> data) =>
      StepListDataStruct(
        data: getStructList(
          data['data'],
          StepsStruct.fromMap,
        ),
      );

  static StepListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StepListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StepListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StepListDataStruct(
        data: deserializeStructParam<StepsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StepsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StepListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StepListDataStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StepListDataStruct createStepListDataStruct() => StepListDataStruct();
