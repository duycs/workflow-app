// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadListFileStruct extends BaseStruct {
  UploadListFileStruct({
    List<FileDataStruct>? create,
    List<int>? delete,
  })  : _create = create,
        _delete = delete;

  // "create" field.
  List<FileDataStruct>? _create;
  List<FileDataStruct> get create => _create ?? const [];
  set create(List<FileDataStruct>? val) => _create = val;

  void updateCreate(Function(List<FileDataStruct>) updateFn) {
    updateFn(create ??= []);
  }

  bool hasCreate() => _create != null;

  // "delete" field.
  List<int>? _delete;
  List<int> get delete => _delete ?? const [];
  set delete(List<int>? val) => _delete = val;

  void updateDelete(Function(List<int>) updateFn) {
    updateFn(delete ??= []);
  }

  bool hasDelete() => _delete != null;

  static UploadListFileStruct fromMap(Map<String, dynamic> data) =>
      UploadListFileStruct(
        create: getStructList(
          data['create'],
          FileDataStruct.fromMap,
        ),
        delete: getDataList(data['delete']),
      );

  static UploadListFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadListFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'create': _create?.map((e) => e.toMap()).toList(),
        'delete': _delete,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'create': serializeParam(
          _create,
          ParamType.DataStruct,
          isList: true,
        ),
        'delete': serializeParam(
          _delete,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static UploadListFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploadListFileStruct(
        create: deserializeStructParam<FileDataStruct>(
          data['create'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataStruct.fromSerializableMap,
        ),
        delete: deserializeParam<int>(
          data['delete'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'UploadListFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UploadListFileStruct &&
        listEquality.equals(create, other.create) &&
        listEquality.equals(delete, other.delete);
  }

  @override
  int get hashCode => const ListEquality().hash([create, delete]);
}

UploadListFileStruct createUploadListFileStruct() => UploadListFileStruct();
