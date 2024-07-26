// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdateTaskDataTypeStruct extends BaseStruct {
  UpdateTaskDataTypeStruct({
    String? status,
    String? result,
    List<FileDataTypeStruct>? files,
  })  : _status = status,
        _result = result,
        _files = files;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;

  bool hasResult() => _result != null;

  // "files" field.
  List<FileDataTypeStruct>? _files;
  List<FileDataTypeStruct> get files => _files ?? const [];
  set files(List<FileDataTypeStruct>? val) => _files = val;

  void updateFiles(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(_files ??= []);
  }

  bool hasFiles() => _files != null;

  static UpdateTaskDataTypeStruct fromMap(Map<String, dynamic> data) =>
      UpdateTaskDataTypeStruct(
        status: data['status'] as String?,
        result: data['result'] as String?,
        files: getStructList(
          data['files'],
          FileDataTypeStruct.fromMap,
        ),
      );

  static UpdateTaskDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? UpdateTaskDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'result': _result,
        'files': _files?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UpdateTaskDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UpdateTaskDataTypeStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
        files: deserializeStructParam<FileDataTypeStruct>(
          data['files'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UpdateTaskDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UpdateTaskDataTypeStruct &&
        status == other.status &&
        result == other.result &&
        listEquality.equals(files, other.files);
  }

  @override
  int get hashCode => const ListEquality().hash([status, result, files]);
}

UpdateTaskDataTypeStruct createUpdateTaskDataTypeStruct({
  String? status,
  String? result,
}) =>
    UpdateTaskDataTypeStruct(
      status: status,
      result: result,
    );
