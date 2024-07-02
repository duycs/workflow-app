// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramLessonDataStruct extends BaseStruct {
  ProgramLessonDataStruct({
    List<DataStruct>? data,
  }) : _data = data;

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ProgramLessonDataStruct fromMap(Map<String, dynamic> data) =>
      ProgramLessonDataStruct(
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static ProgramLessonDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramLessonDataStruct.fromMap(data.cast<String, dynamic>())
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

  static ProgramLessonDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramLessonDataStruct(
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramLessonDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramLessonDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ProgramLessonDataStruct createProgramLessonDataStruct() =>
    ProgramLessonDataStruct();
