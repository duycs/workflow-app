// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileUploadStruct extends BaseStruct {
  FileUploadStruct({
    List<FileStruct>? data,
  }) : _data = data;

  // "data" field.
  List<FileStruct>? _data;
  List<FileStruct> get data => _data ?? const [];
  set data(List<FileStruct>? val) => _data = val;

  void updateData(Function(List<FileStruct>) updateFn) {
    updateFn(data ??= []);
  }

  bool hasData() => _data != null;

  static FileUploadStruct fromMap(Map<String, dynamic> data) =>
      FileUploadStruct(
        data: getStructList(
          data['data'],
          FileStruct.fromMap,
        ),
      );

  static FileUploadStruct? maybeFromMap(dynamic data) => data is Map
      ? FileUploadStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FileUploadStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileUploadStruct(
        data: deserializeStructParam<FileStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: FileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FileUploadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FileUploadStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

FileUploadStruct createFileUploadStruct() => FileUploadStruct();
