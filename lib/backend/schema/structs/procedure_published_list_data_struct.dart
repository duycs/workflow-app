// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcedurePublishedListDataStruct extends BaseStruct {
  ProcedurePublishedListDataStruct({
    List<ProcedurePublishedListStruct>? data,
  }) : _data = data;

  // "data" field.
  List<ProcedurePublishedListStruct>? _data;
  List<ProcedurePublishedListStruct> get data => _data ?? const [];
  set data(List<ProcedurePublishedListStruct>? val) => _data = val;

  void updateData(Function(List<ProcedurePublishedListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ProcedurePublishedListDataStruct fromMap(Map<String, dynamic> data) =>
      ProcedurePublishedListDataStruct(
        data: getStructList(
          data['data'],
          ProcedurePublishedListStruct.fromMap,
        ),
      );

  static ProcedurePublishedListDataStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ProcedurePublishedListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static ProcedurePublishedListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedListDataStruct(
        data: deserializeStructParam<ProcedurePublishedListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: ProcedurePublishedListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProcedurePublishedListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProcedurePublishedListDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ProcedurePublishedListDataStruct createProcedurePublishedListDataStruct() =>
    ProcedurePublishedListDataStruct();
