// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OperationsListDataStruct extends BaseStruct {
  OperationsListDataStruct({
    List<OperationsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<OperationsStruct>? _data;
  List<OperationsStruct> get data => _data ?? const [];
  set data(List<OperationsStruct>? val) => _data = val;

  void updateData(Function(List<OperationsStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static OperationsListDataStruct fromMap(Map<String, dynamic> data) =>
      OperationsListDataStruct(
        data: getStructList(
          data['data'],
          OperationsStruct.fromMap,
        ),
      );

  static OperationsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? OperationsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static OperationsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OperationsListDataStruct(
        data: deserializeStructParam<OperationsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: OperationsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OperationsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OperationsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

OperationsListDataStruct createOperationsListDataStruct() =>
    OperationsListDataStruct();
