// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramStruct extends BaseStruct {
  ProgramStruct({
    ProgramIdStruct? programsId,
  }) : _programsId = programsId;

  // "programs_id" field.
  ProgramIdStruct? _programsId;
  ProgramIdStruct get programsId => _programsId ?? ProgramIdStruct();
  set programsId(ProgramIdStruct? val) => _programsId = val;
  void updateProgramsId(Function(ProgramIdStruct) updateFn) =>
      updateFn(_programsId ??= ProgramIdStruct());
  bool hasProgramsId() => _programsId != null;

  static ProgramStruct fromMap(Map<String, dynamic> data) => ProgramStruct(
        programsId: ProgramIdStruct.maybeFromMap(data['programs_id']),
      );

  static ProgramStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProgramStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'programs_id': _programsId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'programs_id': serializeParam(
          _programsId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProgramStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramStruct(
        programsId: deserializeStructParam(
          data['programs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramStruct && programsId == other.programsId;
  }

  @override
  int get hashCode => const ListEquality().hash([programsId]);
}

ProgramStruct createProgramStruct({
  ProgramIdStruct? programsId,
}) =>
    ProgramStruct(
      programsId: programsId ?? ProgramIdStruct(),
    );
