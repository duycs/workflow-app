// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgaramsCreateDepartmentsStruct extends BaseStruct {
  ProgaramsCreateDepartmentsStruct({
    ProgramIdCreateDepartmentsStruct? programsId,
  }) : _programsId = programsId;

  // "programs_id" field.
  ProgramIdCreateDepartmentsStruct? _programsId;
  ProgramIdCreateDepartmentsStruct get programsId =>
      _programsId ?? ProgramIdCreateDepartmentsStruct();
  set programsId(ProgramIdCreateDepartmentsStruct? val) => _programsId = val;

  void updateProgramsId(Function(ProgramIdCreateDepartmentsStruct) updateFn) {
    updateFn(programsId ??= ProgramIdCreateDepartmentsStruct());
  }

  bool hasProgramsId() => _programsId != null;

  static ProgaramsCreateDepartmentsStruct fromMap(Map<String, dynamic> data) =>
      ProgaramsCreateDepartmentsStruct(
        programsId:
            ProgramIdCreateDepartmentsStruct.maybeFromMap(data['programs_id']),
      );

  static ProgaramsCreateDepartmentsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ProgaramsCreateDepartmentsStruct.fromMap(data.cast<String, dynamic>())
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

  static ProgaramsCreateDepartmentsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgaramsCreateDepartmentsStruct(
        programsId: deserializeStructParam(
          data['programs_id'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramIdCreateDepartmentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgaramsCreateDepartmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgaramsCreateDepartmentsStruct &&
        programsId == other.programsId;
  }

  @override
  int get hashCode => const ListEquality().hash([programsId]);
}

ProgaramsCreateDepartmentsStruct createProgaramsCreateDepartmentsStruct({
  ProgramIdCreateDepartmentsStruct? programsId,
}) =>
    ProgaramsCreateDepartmentsStruct(
      programsId: programsId ?? ProgramIdCreateDepartmentsStruct(),
    );
