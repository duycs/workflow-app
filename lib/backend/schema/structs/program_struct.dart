// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramStruct extends BaseStruct {
  ProgramStruct({
    ProgramIdStruct? programsId,
    bool? checkPrograms,
  })  : _programsId = programsId,
        _checkPrograms = checkPrograms;

  // "programs_id" field.
  ProgramIdStruct? _programsId;
  ProgramIdStruct get programsId => _programsId ?? ProgramIdStruct();
  set programsId(ProgramIdStruct? val) => _programsId = val;

  void updateProgramsId(Function(ProgramIdStruct) updateFn) {
    updateFn(_programsId ??= ProgramIdStruct());
  }

  bool hasProgramsId() => _programsId != null;

  // "checkPrograms" field.
  bool? _checkPrograms;
  bool get checkPrograms => _checkPrograms ?? false;
  set checkPrograms(bool? val) => _checkPrograms = val;

  bool hasCheckPrograms() => _checkPrograms != null;

  static ProgramStruct fromMap(Map<String, dynamic> data) => ProgramStruct(
        programsId: ProgramIdStruct.maybeFromMap(data['programs_id']),
        checkPrograms: data['checkPrograms'] as bool?,
      );

  static ProgramStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProgramStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'programs_id': _programsId?.toMap(),
        'checkPrograms': _checkPrograms,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'programs_id': serializeParam(
          _programsId,
          ParamType.DataStruct,
        ),
        'checkPrograms': serializeParam(
          _checkPrograms,
          ParamType.bool,
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
        checkPrograms: deserializeParam(
          data['checkPrograms'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramStruct &&
        programsId == other.programsId &&
        checkPrograms == other.checkPrograms;
  }

  @override
  int get hashCode => const ListEquality().hash([programsId, checkPrograms]);
}

ProgramStruct createProgramStruct({
  ProgramIdStruct? programsId,
  bool? checkPrograms,
}) =>
    ProgramStruct(
      programsId: programsId ?? ProgramIdStruct(),
      checkPrograms: checkPrograms,
    );
