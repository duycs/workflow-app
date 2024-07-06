// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileDataTypeStruct extends BaseStruct {
  FileDataTypeStruct({
    FileIDDataTypeStruct? directusFilesId,
    int? id,
  })  : _directusFilesId = directusFilesId,
        _id = id;

  // "directus_files_id" field.
  FileIDDataTypeStruct? _directusFilesId;
  FileIDDataTypeStruct get directusFilesId =>
      _directusFilesId ?? FileIDDataTypeStruct();
  set directusFilesId(FileIDDataTypeStruct? val) => _directusFilesId = val;

  void updateDirectusFilesId(Function(FileIDDataTypeStruct) updateFn) {
    updateFn(_directusFilesId ??= FileIDDataTypeStruct());
  }

  bool hasDirectusFilesId() => _directusFilesId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static FileDataTypeStruct fromMap(Map<String, dynamic> data) =>
      FileDataTypeStruct(
        directusFilesId:
            FileIDDataTypeStruct.maybeFromMap(data['directus_files_id']),
        id: castToType<int>(data['id']),
      );

  static FileDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? FileDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'directus_files_id': _directusFilesId?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'directus_files_id': serializeParam(
          _directusFilesId,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
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
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FileDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileDataTypeStruct &&
        directusFilesId == other.directusFilesId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([directusFilesId, id]);
}

FileDataTypeStruct createFileDataTypeStruct({
  FileIDDataTypeStruct? directusFilesId,
  int? id,
}) =>
    FileDataTypeStruct(
      directusFilesId: directusFilesId ?? FileIDDataTypeStruct(),
      id: id,
    );
