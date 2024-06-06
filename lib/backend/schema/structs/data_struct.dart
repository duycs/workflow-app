// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    ProgramsIdStruct? programsId,
    LessonsStruct? lessionsId,
  })  : _programsId = programsId,
        _lessionsId = lessionsId;

  // "programs_id" field.
  ProgramsIdStruct? _programsId;
  ProgramsIdStruct get programsId => _programsId ?? ProgramsIdStruct();
  set programsId(ProgramsIdStruct? val) => _programsId = val;
  void updateProgramsId(Function(ProgramsIdStruct) updateFn) =>
      updateFn(_programsId ??= ProgramsIdStruct());
  bool hasProgramsId() => _programsId != null;

  // "lessions_id" field.
  LessonsStruct? _lessionsId;
  LessonsStruct get lessionsId => _lessionsId ?? LessonsStruct();
  set lessionsId(LessonsStruct? val) => _lessionsId = val;
  void updateLessionsId(Function(LessonsStruct) updateFn) =>
      updateFn(_lessionsId ??= LessonsStruct());
  bool hasLessionsId() => _lessionsId != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        programsId: ProgramsIdStruct.maybeFromMap(data['programs_id']),
        lessionsId: LessonsStruct.maybeFromMap(data['lessions_id']),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'programs_id': _programsId?.toMap(),
        'lessions_id': _lessionsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'programs_id': serializeParam(
          _programsId,
          ParamType.DataStruct,
        ),
        'lessions_id': serializeParam(
          _lessionsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        programsId: deserializeStructParam(
          data['programs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramsIdStruct.fromSerializableMap,
        ),
        lessionsId: deserializeStructParam(
          data['lessions_id'],
          ParamType.DataStruct,
          false,
          structBuilder: LessonsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        programsId == other.programsId &&
        lessionsId == other.lessionsId;
  }

  @override
  int get hashCode => const ListEquality().hash([programsId, lessionsId]);
}

DataStruct createDataStruct({
  ProgramsIdStruct? programsId,
  LessonsStruct? lessionsId,
}) =>
    DataStruct(
      programsId: programsId ?? ProgramsIdStruct(),
      lessionsId: lessionsId ?? LessonsStruct(),
    );
