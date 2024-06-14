// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffAnswerListDataStruct extends BaseStruct {
  StaffAnswerListDataStruct({
    List<StaffAnswerListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<StaffAnswerListStruct>? _data;
  List<StaffAnswerListStruct> get data => _data ?? const [];
  set data(List<StaffAnswerListStruct>? val) => _data = val;

  void updateData(Function(List<StaffAnswerListStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static StaffAnswerListDataStruct fromMap(Map<String, dynamic> data) =>
      StaffAnswerListDataStruct(
        data: getStructList(
          data['data'],
          StaffAnswerListStruct.fromMap,
        ),
      );

  static StaffAnswerListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffAnswerListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StaffAnswerListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StaffAnswerListDataStruct(
        data: deserializeStructParam<StaffAnswerListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffAnswerListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffAnswerListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaffAnswerListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

StaffAnswerListDataStruct createStaffAnswerListDataStruct() =>
    StaffAnswerListDataStruct();
