// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyProgramListDataStruct extends BaseStruct {
  StudyProgramListDataStruct({
    List<StudyProgramListStruct>? data,
    MetaDataStruct? meta,
  })  : _data = data,
        _meta = meta;

  // "data" field.
  List<StudyProgramListStruct>? _data;
  List<StudyProgramListStruct> get data => _data ?? const [];
  set data(List<StudyProgramListStruct>? val) => _data = val;

  void updateData(Function(List<StudyProgramListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  // "meta" field.
  MetaDataStruct? _meta;
  MetaDataStruct get meta => _meta ?? MetaDataStruct();
  set meta(MetaDataStruct? val) => _meta = val;

  void updateMeta(Function(MetaDataStruct) updateFn) {
    updateFn(_meta ??= MetaDataStruct());
  }

  bool hasMeta() => _meta != null;

  static StudyProgramListDataStruct fromMap(Map<String, dynamic> data) =>
      StudyProgramListDataStruct(
        data: getStructList(
          data['data'],
          StudyProgramListStruct.fromMap,
        ),
        meta: MetaDataStruct.maybeFromMap(data['meta']),
      );

  static StudyProgramListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StudyProgramListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
        'meta': _meta?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StudyProgramListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudyProgramListDataStruct(
        data: deserializeStructParam<StudyProgramListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: StudyProgramListStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudyProgramListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudyProgramListDataStruct &&
        listEquality.equals(data, other.data) &&
        meta == other.meta;
  }

  @override
  int get hashCode => const ListEquality().hash([data, meta]);
}

StudyProgramListDataStruct createStudyProgramListDataStruct({
  MetaDataStruct? meta,
}) =>
    StudyProgramListDataStruct(
      meta: meta ?? MetaDataStruct(),
    );
