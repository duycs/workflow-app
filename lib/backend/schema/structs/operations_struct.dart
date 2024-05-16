// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OperationsStruct extends BaseStruct {
  OperationsStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    OperationsIdStruct? operationsId,
    String? content,
    String? actionType,
    String? dateCreated,
    String? organizationId,
    String? userCreated,
    String? executeId,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _operationsId = operationsId,
        _content = content,
        _actionType = actionType,
        _dateCreated = dateCreated,
        _organizationId = organizationId,
        _userCreated = userCreated,
        _executeId = executeId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

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

  // "operations_id" field.
  OperationsIdStruct? _operationsId;
  OperationsIdStruct get operationsId => _operationsId ?? OperationsIdStruct();
  set operationsId(OperationsIdStruct? val) => _operationsId = val;
  void updateOperationsId(Function(OperationsIdStruct) updateFn) =>
      updateFn(_operationsId ??= OperationsIdStruct());
  bool hasOperationsId() => _operationsId != null;

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

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;
  bool hasOrganizationId() => _organizationId != null;

  // "user_created" field.
  String? _userCreated;
  String get userCreated => _userCreated ?? '';
  set userCreated(String? val) => _userCreated = val;
  bool hasUserCreated() => _userCreated != null;

  // "execute_id" field.
  String? _executeId;
  String get executeId => _executeId ?? '';
  set executeId(String? val) => _executeId = val;
  bool hasExecuteId() => _executeId != null;

  static OperationsStruct fromMap(Map<String, dynamic> data) =>
      OperationsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        operationsId: OperationsIdStruct.maybeFromMap(data['operations_id']),
        content: data['content'] as String?,
        actionType: data['action_type'] as String?,
        dateCreated: data['date_created'] as String?,
        organizationId: data['organization_id'] as String?,
        userCreated: data['user_created'] as String?,
        executeId: data['execute_id'] as String?,
      );

  static OperationsStruct? maybeFromMap(dynamic data) => data is Map
      ? OperationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'operations_id': _operationsId?.toMap(),
        'content': _content,
        'action_type': _actionType,
        'date_created': _dateCreated,
        'organization_id': _organizationId,
        'user_created': _userCreated,
        'execute_id': _executeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
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
        'operations_id': serializeParam(
          _operationsId,
          ParamType.DataStruct,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'action_type': serializeParam(
          _actionType,
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.String,
        ),
        'execute_id': serializeParam(
          _executeId,
          ParamType.String,
        ),
      }.withoutNulls;

  static OperationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OperationsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
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
        operationsId: deserializeStructParam(
          data['operations_id'],
          ParamType.DataStruct,
          false,
          structBuilder: OperationsIdStruct.fromSerializableMap,
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
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeParam(
          data['user_created'],
          ParamType.String,
          false,
        ),
        executeId: deserializeParam(
          data['execute_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OperationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OperationsStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        operationsId == other.operationsId &&
        content == other.content &&
        actionType == other.actionType &&
        dateCreated == other.dateCreated &&
        organizationId == other.organizationId &&
        userCreated == other.userCreated &&
        executeId == other.executeId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        operationsId,
        content,
        actionType,
        dateCreated,
        organizationId,
        userCreated,
        executeId
      ]);
}

OperationsStruct createOperationsStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  OperationsIdStruct? operationsId,
  String? content,
  String? actionType,
  String? dateCreated,
  String? organizationId,
  String? userCreated,
  String? executeId,
}) =>
    OperationsStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      operationsId: operationsId ?? OperationsIdStruct(),
      content: content,
      actionType: actionType,
      dateCreated: dateCreated,
      organizationId: organizationId,
      userCreated: userCreated,
      executeId: executeId,
    );
