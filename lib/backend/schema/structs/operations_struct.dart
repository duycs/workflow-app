// ignore_for_file: unnecessary_getters_setters


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
    String? executeId,
    String? flowId,
    UserOperationStruct? userCreated,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _operationsId = operationsId,
        _content = content,
        _actionType = actionType,
        _dateCreated = dateCreated,
        _organizationId = organizationId,
        _executeId = executeId,
        _flowId = flowId,
        _userCreated = userCreated;

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

  // "execute_id" field.
  String? _executeId;
  String get executeId => _executeId ?? '';
  set executeId(String? val) => _executeId = val;
  bool hasExecuteId() => _executeId != null;

  // "flow_id" field.
  String? _flowId;
  String get flowId => _flowId ?? '';
  set flowId(String? val) => _flowId = val;
  bool hasFlowId() => _flowId != null;

  // "user_created" field.
  UserOperationStruct? _userCreated;
  UserOperationStruct get userCreated => _userCreated ?? UserOperationStruct();
  set userCreated(UserOperationStruct? val) => _userCreated = val;
  void updateUserCreated(Function(UserOperationStruct) updateFn) =>
      updateFn(_userCreated ??= UserOperationStruct());
  bool hasUserCreated() => _userCreated != null;

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
        executeId: data['execute_id'] as String?,
        flowId: data['flow_id'] as String?,
        userCreated: UserOperationStruct.maybeFromMap(data['user_created']),
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
        'execute_id': _executeId,
        'flow_id': _flowId,
        'user_created': _userCreated?.toMap(),
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
        'execute_id': serializeParam(
          _executeId,
          ParamType.String,
        ),
        'flow_id': serializeParam(
          _flowId,
          ParamType.String,
        ),
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
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
        executeId: deserializeParam(
          data['execute_id'],
          ParamType.String,
          false,
        ),
        flowId: deserializeParam(
          data['flow_id'],
          ParamType.String,
          false,
        ),
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserOperationStruct.fromSerializableMap,
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
        executeId == other.executeId &&
        flowId == other.flowId &&
        userCreated == other.userCreated;
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
        executeId,
        flowId,
        userCreated
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
  String? executeId,
  String? flowId,
  UserOperationStruct? userCreated,
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
      executeId: executeId,
      flowId: flowId,
      userCreated: userCreated ?? UserOperationStruct(),
    );
