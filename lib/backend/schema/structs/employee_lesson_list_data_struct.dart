// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeLessonListDataStruct extends BaseStruct {
  EmployeeLessonListDataStruct({
    List<EmployeeLessonListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<EmployeeLessonListStruct>? _data;
  List<EmployeeLessonListStruct> get data => _data ?? const [];
  set data(List<EmployeeLessonListStruct>? val) => _data = val;
  void updateData(Function(List<EmployeeLessonListStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static EmployeeLessonListDataStruct fromMap(Map<String, dynamic> data) =>
      EmployeeLessonListDataStruct(
        data: getStructList(
          data['data'],
          EmployeeLessonListStruct.fromMap,
        ),
      );

  static EmployeeLessonListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeLessonListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static EmployeeLessonListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeLessonListDataStruct(
        data: deserializeStructParam<EmployeeLessonListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: EmployeeLessonListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EmployeeLessonListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EmployeeLessonListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

EmployeeLessonListDataStruct createEmployeeLessonListDataStruct() =>
    EmployeeLessonListDataStruct();
