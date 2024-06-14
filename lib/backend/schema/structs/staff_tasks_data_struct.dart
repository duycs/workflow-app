// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffTasksDataStruct extends BaseStruct {
  StaffTasksDataStruct({
    StaffListStruct? data,
  }) : _data = data;

  // "data" field.
  StaffListStruct? _data;
  StaffListStruct get data => _data ?? StaffListStruct();
  set data(StaffListStruct? val) => _data = val;

  void updateData(Function(StaffListStruct) updateFn) {
    updateFn(data ??= StaffListStruct());
  }

  bool hasData() => _data != null;

  static StaffTasksDataStruct fromMap(Map<String, dynamic> data) =>
      StaffTasksDataStruct(
        data: StaffListStruct.maybeFromMap(data['data']),
      );

  static StaffTasksDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffTasksDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StaffTasksDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffTasksDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: StaffListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffTasksDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffTasksDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StaffTasksDataStruct createStaffTasksDataStruct({
  StaffListStruct? data,
}) =>
    StaffTasksDataStruct(
      data: data ?? StaffListStruct(),
    );
