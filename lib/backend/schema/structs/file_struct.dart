// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileStruct extends BaseStruct {
  FileStruct({
    String? id,
    String? type,
    String? filenameDownload,
  })  : _id = id,
        _type = type,
        _filenameDownload = filenameDownload;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "filename_download" field.
  String? _filenameDownload;
  String get filenameDownload => _filenameDownload ?? '';
  set filenameDownload(String? val) => _filenameDownload = val;

  bool hasFilenameDownload() => _filenameDownload != null;

  static FileStruct fromMap(Map<String, dynamic> data) => FileStruct(
        id: data['id'] as String?,
        type: data['type'] as String?,
        filenameDownload: data['filename_download'] as String?,
      );

  static FileStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'type': _type,
        'filename_download': _filenameDownload,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'filename_download': serializeParam(
          _filenameDownload,
          ParamType.String,
        ),
      }.withoutNulls;

  static FileStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        filenameDownload: deserializeParam(
          data['filename_download'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileStruct &&
        id == other.id &&
        type == other.type &&
        filenameDownload == other.filenameDownload;
  }

  @override
  int get hashCode => const ListEquality().hash([id, type, filenameDownload]);
}

FileStruct createFileStruct({
  String? id,
  String? type,
  String? filenameDownload,
}) =>
    FileStruct(
      id: id,
      type: type,
      filenameDownload: filenameDownload,
    );
