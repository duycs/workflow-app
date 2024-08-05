// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimekeepingsListDataStruct extends BaseStruct {
  TimekeepingsListDataStruct({
    List<TimekeepingsStruct>? data,
  }) : _data = data;

  // "data" field.
  List<TimekeepingsStruct>? _data;
  List<TimekeepingsStruct> get data => _data ?? const [];
  set data(List<TimekeepingsStruct>? val) => _data = val;

  void updateData(Function(List<TimekeepingsStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static TimekeepingsListDataStruct fromMap(Map<String, dynamic> data) =>
      TimekeepingsListDataStruct(
        data: getStructList(
          data['data'],
          TimekeepingsStruct.fromMap,
        ),
      );

  static TimekeepingsListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TimekeepingsListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static TimekeepingsListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimekeepingsListDataStruct(
        data: deserializeStructParam<TimekeepingsStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: TimekeepingsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TimekeepingsListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TimekeepingsListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

TimekeepingsListDataStruct createTimekeepingsListDataStruct() =>
    TimekeepingsListDataStruct();
