// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramIdCreateDepartmentsStruct extends BaseStruct {
  ProgramIdCreateDepartmentsStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static ProgramIdCreateDepartmentsStruct fromMap(Map<String, dynamic> data) =>
      ProgramIdCreateDepartmentsStruct(
        id: data['id'] as String?,
      );

  static ProgramIdCreateDepartmentsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ProgramIdCreateDepartmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramIdCreateDepartmentsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramIdCreateDepartmentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramIdCreateDepartmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramIdCreateDepartmentsStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

ProgramIdCreateDepartmentsStruct createProgramIdCreateDepartmentsStruct({
  String? id,
}) =>
    ProgramIdCreateDepartmentsStruct(
      id: id,
    );
