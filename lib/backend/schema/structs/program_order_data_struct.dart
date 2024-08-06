// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramOrderDataStruct extends BaseStruct {
  ProgramOrderDataStruct({
    List<ProgramOrderStruct>? data,
  }) : _data = data;

  // "data" field.
  List<ProgramOrderStruct>? _data;
  List<ProgramOrderStruct> get data => _data ?? const [];
  set data(List<ProgramOrderStruct>? val) => _data = val;

  void updateData(Function(List<ProgramOrderStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ProgramOrderDataStruct fromMap(Map<String, dynamic> data) =>
      ProgramOrderDataStruct(
        data: getStructList(
          data['data'],
          ProgramOrderStruct.fromMap,
        ),
      );

  static ProgramOrderDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramOrderDataStruct.fromMap(data.cast<String, dynamic>())
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

  static ProgramOrderDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramOrderDataStruct(
        data: deserializeStructParam<ProgramOrderStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramOrderStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramOrderDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramOrderDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ProgramOrderDataStruct createProgramOrderDataStruct() =>
    ProgramOrderDataStruct();
