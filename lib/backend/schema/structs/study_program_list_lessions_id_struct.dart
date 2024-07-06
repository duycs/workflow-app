// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyProgramListLessionsIdStruct extends BaseStruct {
  StudyProgramListLessionsIdStruct({
    LessonsStruct? lessionsId,
  }) : _lessionsId = lessionsId;

  // "lessions_id" field.
  LessonsStruct? _lessionsId;
  LessonsStruct get lessionsId => _lessionsId ?? LessonsStruct();
  set lessionsId(LessonsStruct? val) => _lessionsId = val;

  void updateLessionsId(Function(LessonsStruct) updateFn) {
    updateFn(_lessionsId ??= LessonsStruct());
  }

  bool hasLessionsId() => _lessionsId != null;

  static StudyProgramListLessionsIdStruct fromMap(Map<String, dynamic> data) =>
      StudyProgramListLessionsIdStruct(
        lessionsId: LessonsStruct.maybeFromMap(data['lessions_id']),
      );

  static StudyProgramListLessionsIdStruct? maybeFromMap(dynamic data) => data
          is Map
      ? StudyProgramListLessionsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lessions_id': _lessionsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lessions_id': serializeParam(
          _lessionsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StudyProgramListLessionsIdStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudyProgramListLessionsIdStruct(
        lessionsId: deserializeStructParam(
          data['lessions_id'],
          ParamType.DataStruct,
          false,
          structBuilder: LessonsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudyProgramListLessionsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudyProgramListLessionsIdStruct &&
        lessionsId == other.lessionsId;
  }

  @override
  int get hashCode => const ListEquality().hash([lessionsId]);
}

StudyProgramListLessionsIdStruct createStudyProgramListLessionsIdStruct({
  LessonsStruct? lessionsId,
}) =>
    StudyProgramListLessionsIdStruct(
      lessionsId: lessionsId ?? LessonsStruct(),
    );
