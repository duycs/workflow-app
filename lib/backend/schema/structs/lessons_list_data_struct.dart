// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsListDataStruct extends BaseStruct {
  LessonsListDataStruct({
    List<LessonsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<LessonsStruct>? _data;
  List<LessonsStruct> get data => _data ?? const [];
  set data(List<LessonsStruct>? val) => _data = val;
  void updateData(Function(List<LessonsStruct>) updateFn) =>
      updateFn(_data ??= []);
  bool hasData() => _data != null;

  static LessonsListDataStruct fromMap(Map<String, dynamic> data) =>
      LessonsListDataStruct(
        data: getStructList(
          data['data'],
          LessonsStruct.fromMap,
        ),
      );

  static LessonsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static LessonsListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonsListDataStruct(
        data: deserializeStructParam<LessonsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: LessonsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessonsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessonsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LessonsListDataStruct createLessonsListDataStruct() => LessonsListDataStruct();
