// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentListDataStruct extends BaseStruct {
  DepartmentListDataStruct({
    List<DepartmentListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<DepartmentListStruct>? _data;
  List<DepartmentListStruct> get data => _data ?? const [];
  set data(List<DepartmentListStruct>? val) => _data = val;
  void updateData(Function(List<DepartmentListStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static DepartmentListDataStruct fromMap(Map<String, dynamic> data) =>
      DepartmentListDataStruct(
        data: getStructList(
          data['data'],
          DepartmentListStruct.fromMap,
        ),
      );

  static DepartmentListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static DepartmentListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DepartmentListDataStruct(
        data: deserializeStructParam<DepartmentListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DepartmentListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DepartmentListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

DepartmentListDataStruct createDepartmentListDataStruct() =>
    DepartmentListDataStruct();
