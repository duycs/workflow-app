// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileDataStruct extends BaseStruct {
  FileDataStruct({
    String? organizationsId,
    FileIDDataTypeStruct? directusFilesId,
    int? id,
  })  : _organizationsId = organizationsId,
        _directusFilesId = directusFilesId,
        _id = id;

  // "organizations_id" field.
  String? _organizationsId;
  String get organizationsId => _organizationsId ?? '';
  set organizationsId(String? val) => _organizationsId = val;
  bool hasOrganizationsId() => _organizationsId != null;

  // "directus_files_id" field.
  FileIDDataTypeStruct? _directusFilesId;
  FileIDDataTypeStruct get directusFilesId =>
      _directusFilesId ?? FileIDDataTypeStruct();
  set directusFilesId(FileIDDataTypeStruct? val) => _directusFilesId = val;
  void updateDirectusFilesId(Function(FileIDDataTypeStruct) updateFn) =>
      updateFn(_directusFilesId ??= FileIDDataTypeStruct());
  bool hasDirectusFilesId() => _directusFilesId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static FileDataStruct fromMap(Map<String, dynamic> data) => FileDataStruct(
        organizationsId: data['organizations_id'] as String?,
        directusFilesId:
            FileIDDataTypeStruct.maybeFromMap(data['directus_files_id']),
        id: castToType<int>(data['id']),
      );

  static FileDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'organizations_id': _organizationsId,
        'directus_files_id': _directusFilesId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'organizations_id': serializeParam(
          _organizationsId,
          ParamType.String,
        ),
        'directus_files_id': serializeParam(
          _directusFilesId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static FileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileDataStruct(
        organizationsId: deserializeParam(
          data['organizations_id'],
          ParamType.String,
          false,
        ),
        directusFilesId: deserializeStructParam(
          data['directus_files_id'],
          ParamType.DataStruct,
          false,
          structBuilder: FileIDDataTypeStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileDataStruct &&
        organizationsId == other.organizationsId &&
        directusFilesId == other.directusFilesId &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([organizationsId, directusFilesId, id]);
}

FileDataStruct createFileDataStruct({
  String? organizationsId,
  FileIDDataTypeStruct? directusFilesId,
  int? id,
}) =>
    FileDataStruct(
      organizationsId: organizationsId,
      directusFilesId: directusFilesId ?? FileIDDataTypeStruct(),
      id: id,
    );
