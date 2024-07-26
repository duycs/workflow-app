// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeLessonListDataStruct extends BaseStruct {
  EmployeeLessonListDataStruct({
    List<EmployeeLessonListStruct>? data,
    MetaDataStruct? meta,
  })  : _data = data,
        _meta = meta;

  // "data" field.
  List<EmployeeLessonListStruct>? _data;
  List<EmployeeLessonListStruct> get data => _data ?? const [];
  set data(List<EmployeeLessonListStruct>? val) => _data = val;

  void updateData(Function(List<EmployeeLessonListStruct>) updateFn) {
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

  static EmployeeLessonListDataStruct fromMap(Map<String, dynamic> data) =>
      EmployeeLessonListDataStruct(
        data: getStructList(
          data['data'],
          EmployeeLessonListStruct.fromMap,
        ),
        meta: MetaDataStruct.maybeFromMap(data['meta']),
      );

  static EmployeeLessonListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeLessonListDataStruct.fromMap(data.cast<String, dynamic>())
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

  static EmployeeLessonListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeLessonListDataStruct(
        data: deserializeStructParam<EmployeeLessonListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: EmployeeLessonListStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EmployeeLessonListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EmployeeLessonListDataStruct &&
        listEquality.equals(data, other.data) &&
        meta == other.meta;
  }

  @override
  int get hashCode => const ListEquality().hash([data, meta]);
}

EmployeeLessonListDataStruct createEmployeeLessonListDataStruct({
  MetaDataStruct? meta,
}) =>
    EmployeeLessonListDataStruct(
      meta: meta ?? MetaDataStruct(),
    );
