// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffsProgramsListDataStruct extends BaseStruct {
  StaffsProgramsListDataStruct({
    List<StaffsProgramsListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<StaffsProgramsListStruct>? _data;
  List<StaffsProgramsListStruct> get data => _data ?? const [];
  set data(List<StaffsProgramsListStruct>? val) => _data = val;

  void updateData(Function(List<StaffsProgramsListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static StaffsProgramsListDataStruct fromMap(Map<String, dynamic> data) =>
      StaffsProgramsListDataStruct(
        data: getStructList(
          data['data'],
          StaffsProgramsListStruct.fromMap,
        ),
      );

  static StaffsProgramsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffsProgramsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StaffsProgramsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StaffsProgramsListDataStruct(
        data: deserializeStructParam<StaffsProgramsListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsProgramsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffsProgramsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffsProgramsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StaffsProgramsListDataStruct createStaffsProgramsListDataStruct() =>
    StaffsProgramsListDataStruct();
