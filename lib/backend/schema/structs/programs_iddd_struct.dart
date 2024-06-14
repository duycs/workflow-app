// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsIdddStruct extends BaseStruct {
  ProgramsIdddStruct({
    ProgramsIdStruct? programsId,
  }) : _programsId = programsId;

  // "programs_id" field.
  ProgramsIdStruct? _programsId;
  ProgramsIdStruct get programsId => _programsId ?? ProgramsIdStruct();
  set programsId(ProgramsIdStruct? val) => _programsId = val;

  void updateProgramsId(Function(ProgramsIdStruct) updateFn) {
    updateFn(programsId ??= ProgramsIdStruct());
  }

  bool hasProgramsId() => _programsId != null;

  static ProgramsIdddStruct fromMap(Map<String, dynamic> data) =>
      ProgramsIdddStruct(
        programsId: ProgramsIdStruct.maybeFromMap(data['programs_id']),
      );

  static ProgramsIdddStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramsIdddStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static ProgramsIdddStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramsIdddStruct(
        programsId: deserializeStructParam(
          data['programs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramsIdddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramsIdddStruct && programsId == other.programsId;
  }

  @override
  int get hashCode => const ListEquality().hash([programsId]);
}

ProgramsIdddStruct createProgramsIdddStruct({
  ProgramsIdStruct? programsId,
}) =>
    ProgramsIdddStruct(
      programsId: programsId ?? ProgramsIdStruct(),
    );
