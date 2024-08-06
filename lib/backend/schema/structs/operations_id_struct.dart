// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OperationsIdStruct extends BaseStruct {
  OperationsIdStruct({
    String? id,
    String? name,
    String? description,
    String? content,
    String? actionType,
    String? operationId,
    String? result,
    String? status,
    List<FileDataTypeStruct>? files,
    String? dateUpdated,
  })  : _id = id,
        _name = name,
        _description = description,
        _content = content,
        _actionType = actionType,
        _operationId = operationId,
        _result = result,
        _status = status,
        _files = files,
        _dateUpdated = dateUpdated;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "action_type" field.
  String? _actionType;
  String get actionType => _actionType ?? '';
  set actionType(String? val) => _actionType = val;

  bool hasActionType() => _actionType != null;

  // "operation_id" field.
  String? _operationId;
  String get operationId => _operationId ?? '';
  set operationId(String? val) => _operationId = val;

  bool hasOperationId() => _operationId != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;

  bool hasResult() => _result != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "files" field.
  List<FileDataTypeStruct>? _files;
  List<FileDataTypeStruct> get files => _files ?? const [];
  set files(List<FileDataTypeStruct>? val) => _files = val;

  void updateFiles(Function(List<FileDataTypeStruct>) updateFn) {
    updateFn(_files ??= []);
  }

  bool hasFiles() => _files != null;

  // "date_updated" field.
  String? _dateUpdated;
  String get dateUpdated => _dateUpdated ?? '';
  set dateUpdated(String? val) => _dateUpdated = val;

  bool hasDateUpdated() => _dateUpdated != null;

  static OperationsIdStruct fromMap(Map<String, dynamic> data) =>
      OperationsIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        actionType: data['action_type'] as String?,
        operationId: data['operation_id'] as String?,
        result: data['result'] as String?,
        status: data['status'] as String?,
        files: getStructList(
          data['files'],
          FileDataTypeStruct.fromMap,
        ),
        dateUpdated: data['date_updated'] as String?,
      );

  static OperationsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? OperationsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'content': _content,
        'action_type': _actionType,
        'operation_id': _operationId,
        'result': _result,
        'status': _status,
        'files': _files?.map((e) => e.toMap()).toList(),
        'date_updated': _dateUpdated,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'action_type': serializeParam(
          _actionType,
          ParamType.String,
        ),
        'operation_id': serializeParam(
          _operationId,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
          isList: true,
        ),
        'date_updated': serializeParam(
          _dateUpdated,
          ParamType.String,
        ),
      }.withoutNulls;

  static OperationsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      OperationsIdStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        actionType: deserializeParam(
          data['action_type'],
          ParamType.String,
          false,
        ),
        operationId: deserializeParam(
          data['operation_id'],
          ParamType.String,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        files: deserializeStructParam<FileDataTypeStruct>(
          data['files'],
          ParamType.DataStruct,
          true,
          structBuilder: FileDataTypeStruct.fromSerializableMap,
        ),
        dateUpdated: deserializeParam(
          data['date_updated'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OperationsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OperationsIdStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        content == other.content &&
        actionType == other.actionType &&
        operationId == other.operationId &&
        result == other.result &&
        status == other.status &&
        listEquality.equals(files, other.files) &&
        dateUpdated == other.dateUpdated;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        content,
        actionType,
        operationId,
        result,
        status,
        files,
        dateUpdated
      ]);
}

OperationsIdStruct createOperationsIdStruct({
  String? id,
  String? name,
  String? description,
  String? content,
  String? actionType,
  String? operationId,
  String? result,
  String? status,
  String? dateUpdated,
}) =>
    OperationsIdStruct(
      id: id,
      name: name,
      description: description,
      content: content,
      actionType: actionType,
      operationId: operationId,
      result: result,
      status: status,
      dateUpdated: dateUpdated,
    );
