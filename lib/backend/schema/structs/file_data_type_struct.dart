// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileDataTypeStruct extends BaseStruct {
  FileDataTypeStruct({
    FileIDDataTypeStruct? directusFilesId,
  }) : _directusFilesId = directusFilesId;

  // "directus_files_id" field.
  FileIDDataTypeStruct? _directusFilesId;
  FileIDDataTypeStruct get directusFilesId =>
      _directusFilesId ?? FileIDDataTypeStruct();
  set directusFilesId(FileIDDataTypeStruct? val) => _directusFilesId = val;
  void updateDirectusFilesId(Function(FileIDDataTypeStruct) updateFn) =>
      updateFn(_directusFilesId ??= FileIDDataTypeStruct());
  bool hasDirectusFilesId() => _directusFilesId != null;

  static FileDataTypeStruct fromMap(Map<String, dynamic> data) =>
      FileDataTypeStruct(
        directusFilesId:
            FileIDDataTypeStruct.maybeFromMap(data['directus_files_id']),
      );

  static FileDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? FileDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'directus_files_id': _directusFilesId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'directus_files_id': serializeParam(
          _directusFilesId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FileDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileDataTypeStruct(
        directusFilesId: deserializeStructParam(
          data['directus_files_id'],
          ParamType.DataStruct,
          false,
          structBuilder: FileIDDataTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FileDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileDataTypeStruct &&
        directusFilesId == other.directusFilesId;
  }

  @override
  int get hashCode => const ListEquality().hash([directusFilesId]);
}

FileDataTypeStruct createFileDataTypeStruct({
  FileIDDataTypeStruct? directusFilesId,
}) =>
    FileDataTypeStruct(
      directusFilesId: directusFilesId ?? FileIDDataTypeStruct(),
    );
