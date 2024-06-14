// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessionDataMarketStatusStruct extends BaseStruct {
  LessionDataMarketStatusStruct({
    StudyProgramListStruct? data,
  }) : _data = data;

  // "data" field.
  StudyProgramListStruct? _data;
  StudyProgramListStruct get data => _data ?? StudyProgramListStruct();
  set data(StudyProgramListStruct? val) => _data = val;

  void updateData(Function(StudyProgramListStruct) updateFn) {
    updateFn(data ??= StudyProgramListStruct());
  }

  bool hasData() => _data != null;

  static LessionDataMarketStatusStruct fromMap(Map<String, dynamic> data) =>
      LessionDataMarketStatusStruct(
        data: StudyProgramListStruct.maybeFromMap(data['data']),
      );

  static LessionDataMarketStatusStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? LessionDataMarketStatusStruct.fromMap(data.cast<String, dynamic>())
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

  static LessionDataMarketStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LessionDataMarketStatusStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: StudyProgramListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessionDataMarketStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessionDataMarketStatusStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LessionDataMarketStatusStruct createLessionDataMarketStatusStruct({
  StudyProgramListStruct? data,
}) =>
    LessionDataMarketStatusStruct(
      data: data ?? StudyProgramListStruct(),
    );
