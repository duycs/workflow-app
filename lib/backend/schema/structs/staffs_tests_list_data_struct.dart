// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsTestsListDataStruct extends BaseStruct {
  StaffsTestsListDataStruct({
    List<StaffsTestsListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<StaffsTestsListStruct>? _data;
  List<StaffsTestsListStruct> get data => _data ?? const [];
  set data(List<StaffsTestsListStruct>? val) => _data = val;
  void updateData(Function(List<StaffsTestsListStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static StaffsTestsListDataStruct fromMap(Map<String, dynamic> data) =>
      StaffsTestsListDataStruct(
        data: getStructList(
          data['data'],
          StaffsTestsListStruct.fromMap,
        ),
      );

  static StaffsTestsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsTestsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StaffsTestsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StaffsTestsListDataStruct(
        data: deserializeStructParam<StaffsTestsListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsTestsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffsTestsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffsTestsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StaffsTestsListDataStruct createStaffsTestsListDataStruct() =>
    StaffsTestsListDataStruct();
