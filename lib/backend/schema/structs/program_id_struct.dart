// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramIdStruct extends BaseStruct {
  ProgramIdStruct({
    String? id,
    String? name,
    String? status,
  })  : _id = id,
        _name = name,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static ProgramIdStruct fromMap(Map<String, dynamic> data) => ProgramIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        status: data['status'] as String?,
      );

  static ProgramIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramIdStruct &&
        id == other.id &&
        name == other.name &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, status]);
}

ProgramIdStruct createProgramIdStruct({
  String? id,
  String? name,
  String? status,
}) =>
    ProgramIdStruct(
      id: id,
      name: name,
      status: status,
    );
