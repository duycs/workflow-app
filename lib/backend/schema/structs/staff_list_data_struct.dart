// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffListDataStruct extends BaseStruct {
  StaffListDataStruct({
    List<StaffListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<StaffListStruct>? _data;
  List<StaffListStruct> get data => _data ?? const [];
  set data(List<StaffListStruct>? val) => _data = val;

  void updateData(Function(List<StaffListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static StaffListDataStruct fromMap(Map<String, dynamic> data) =>
      StaffListDataStruct(
        data: getStructList(
          data['data'],
          StaffListStruct.fromMap,
        ),
      );

  static StaffListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StaffListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffListDataStruct(
        data: deserializeStructParam<StaffListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StaffListDataStruct createStaffListDataStruct() => StaffListDataStruct();
