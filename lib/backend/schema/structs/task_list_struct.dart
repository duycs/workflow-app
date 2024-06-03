// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskListStruct extends BaseStruct {
  TaskListStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    String? content,
    String? actionType,
    String? dateStart,
    String? dateEnd,
    String? deadline,
    int? estimateInSecond,
    List<StaffInTaskListStruct>? staffs,
    TaskStruct? workflowId,
    List<OperationListStruct>? operations,
    int? publishedCount,
    List<StepsStruct>? stepId,
    int? number,
    int? current,
    OrganizationIdStruct? organizationId,
    SubmitStaffIdStruct? submitStaffId,
    String? dateCreated,
    String? timeOperate,
    UserStruct? createdUserId,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _content = content,
        _actionType = actionType,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _deadline = deadline,
        _estimateInSecond = estimateInSecond,
        _staffs = staffs,
        _workflowId = workflowId,
        _operations = operations,
        _publishedCount = publishedCount,
        _stepId = stepId,
        _number = number,
        _current = current,
        _organizationId = organizationId,
        _submitStaffId = submitStaffId,
        _dateCreated = dateCreated,
        _timeOperate = timeOperate,
        _createdUserId = createdUserId;

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

  // "date_start" field.
  String? _dateStart;
  String get dateStart => _dateStart ?? '';
  set dateStart(String? val) => _dateStart = val;
  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;
  bool hasDateEnd() => _dateEnd != null;

  // "deadline" field.
  String? _deadline;
  String get deadline => _deadline ?? '';
  set deadline(String? val) => _deadline = val;
  bool hasDeadline() => _deadline != null;

  // "estimate_in_second" field.
  int? _estimateInSecond;
  int get estimateInSecond => _estimateInSecond ?? 0;
  set estimateInSecond(int? val) => _estimateInSecond = val;
  void incrementEstimateInSecond(int amount) =>
      _estimateInSecond = estimateInSecond + amount;
  bool hasEstimateInSecond() => _estimateInSecond != null;

  // "staffs" field.
  List<StaffInTaskListStruct>? _staffs;
  List<StaffInTaskListStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffInTaskListStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<StaffInTaskListStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  // "workflow_id" field.
  TaskStruct? _workflowId;
  TaskStruct get workflowId => _workflowId ?? TaskStruct();
  set workflowId(TaskStruct? val) => _workflowId = val;
  void updateWorkflowId(Function(TaskStruct) updateFn) =>
      updateFn(_workflowId ??= TaskStruct());
  bool hasWorkflowId() => _workflowId != null;

  // "operations" field.
  List<OperationListStruct>? _operations;
  List<OperationListStruct> get operations => _operations ?? const [];
  set operations(List<OperationListStruct>? val) => _operations = val;
  void updateOperations(Function(List<OperationListStruct>) updateFn) =>
      updateFn(_operations ??= []);
  bool hasOperations() => _operations != null;

  // "published_count" field.
  int? _publishedCount;
  int get publishedCount => _publishedCount ?? 0;
  set publishedCount(int? val) => _publishedCount = val;
  void incrementPublishedCount(int amount) =>
      _publishedCount = publishedCount + amount;
  bool hasPublishedCount() => _publishedCount != null;

  // "step_id" field.
  List<StepsStruct>? _stepId;
  List<StepsStruct> get stepId => _stepId ?? const [];
  set stepId(List<StepsStruct>? val) => _stepId = val;
  void updateStepId(Function(List<StepsStruct>) updateFn) =>
      updateFn(_stepId ??= []);
  bool hasStepId() => _stepId != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "current" field.
  int? _current;
  int get current => _current ?? 0;
  set current(int? val) => _current = val;
  void incrementCurrent(int amount) => _current = current + amount;
  bool hasCurrent() => _current != null;

  // "organization_id" field.
  OrganizationIdStruct? _organizationId;
  OrganizationIdStruct get organizationId =>
      _organizationId ?? OrganizationIdStruct();
  set organizationId(OrganizationIdStruct? val) => _organizationId = val;
  void updateOrganizationId(Function(OrganizationIdStruct) updateFn) =>
      updateFn(_organizationId ??= OrganizationIdStruct());
  bool hasOrganizationId() => _organizationId != null;

  // "submit_staff_id" field.
  SubmitStaffIdStruct? _submitStaffId;
  SubmitStaffIdStruct get submitStaffId =>
      _submitStaffId ?? SubmitStaffIdStruct();
  set submitStaffId(SubmitStaffIdStruct? val) => _submitStaffId = val;
  void updateSubmitStaffId(Function(SubmitStaffIdStruct) updateFn) =>
      updateFn(_submitStaffId ??= SubmitStaffIdStruct());
  bool hasSubmitStaffId() => _submitStaffId != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

  // "time_operate" field.
  String? _timeOperate;
  String get timeOperate => _timeOperate ?? '';
  set timeOperate(String? val) => _timeOperate = val;
  bool hasTimeOperate() => _timeOperate != null;

  // "created_user_id" field.
  UserStruct? _createdUserId;
  UserStruct get createdUserId => _createdUserId ?? UserStruct();
  set createdUserId(UserStruct? val) => _createdUserId = val;
  void updateCreatedUserId(Function(UserStruct) updateFn) =>
      updateFn(_createdUserId ??= UserStruct());
  bool hasCreatedUserId() => _createdUserId != null;

  static TaskListStruct fromMap(Map<String, dynamic> data) => TaskListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        actionType: data['action_type'] as String?,
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        deadline: data['deadline'] as String?,
        estimateInSecond: castToType<int>(data['estimate_in_second']),
        staffs: getStructList(
          data['staffs'],
          StaffInTaskListStruct.fromMap,
        ),
        workflowId: TaskStruct.maybeFromMap(data['workflow_id']),
        operations: getStructList(
          data['operations'],
          OperationListStruct.fromMap,
        ),
        publishedCount: castToType<int>(data['published_count']),
        stepId: getStructList(
          data['step_id'],
          StepsStruct.fromMap,
        ),
        number: castToType<int>(data['number']),
        current: castToType<int>(data['current']),
        organizationId:
            OrganizationIdStruct.maybeFromMap(data['organization_id']),
        submitStaffId:
            SubmitStaffIdStruct.maybeFromMap(data['submit_staff_id']),
        dateCreated: data['date_created'] as String?,
        timeOperate: data['time_operate'] as String?,
        createdUserId: UserStruct.maybeFromMap(data['created_user_id']),
      );

  static TaskListStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'content': _content,
        'action_type': _actionType,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'deadline': _deadline,
        'estimate_in_second': _estimateInSecond,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'workflow_id': _workflowId?.toMap(),
        'operations': _operations?.map((e) => e.toMap()).toList(),
        'published_count': _publishedCount,
        'step_id': _stepId?.map((e) => e.toMap()).toList(),
        'number': _number,
        'current': _current,
        'organization_id': _organizationId?.toMap(),
        'submit_staff_id': _submitStaffId?.toMap(),
        'date_created': _dateCreated,
        'time_operate': _timeOperate,
        'created_user_id': _createdUserId?.toMap(),
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
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'action_type': serializeParam(
          _actionType,
          ParamType.String,
        ),
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'deadline': serializeParam(
          _deadline,
          ParamType.String,
        ),
        'estimate_in_second': serializeParam(
          _estimateInSecond,
          ParamType.int,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
        'workflow_id': serializeParam(
          _workflowId,
          ParamType.DataStruct,
        ),
        'operations': serializeParam(
          _operations,
          ParamType.DataStruct,
          true,
        ),
        'published_count': serializeParam(
          _publishedCount,
          ParamType.int,
        ),
        'step_id': serializeParam(
          _stepId,
          ParamType.DataStruct,
          true,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'current': serializeParam(
          _current,
          ParamType.int,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.DataStruct,
        ),
        'submit_staff_id': serializeParam(
          _submitStaffId,
          ParamType.DataStruct,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'time_operate': serializeParam(
          _timeOperate,
          ParamType.String,
        ),
        'created_user_id': serializeParam(
          _createdUserId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TaskListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskListStruct(
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
        dateStart: deserializeParam(
          data['date_start'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        deadline: deserializeParam(
          data['deadline'],
          ParamType.String,
          false,
        ),
        estimateInSecond: deserializeParam(
          data['estimate_in_second'],
          ParamType.int,
          false,
        ),
        staffs: deserializeStructParam<StaffInTaskListStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffInTaskListStruct.fromSerializableMap,
        ),
        workflowId: deserializeStructParam(
          data['workflow_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskStruct.fromSerializableMap,
        ),
        operations: deserializeStructParam<OperationListStruct>(
          data['operations'],
          ParamType.DataStruct,
          true,
          structBuilder: OperationListStruct.fromSerializableMap,
        ),
        publishedCount: deserializeParam(
          data['published_count'],
          ParamType.int,
          false,
        ),
        stepId: deserializeStructParam<StepsStruct>(
          data['step_id'],
          ParamType.DataStruct,
          true,
          structBuilder: StepsStruct.fromSerializableMap,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        current: deserializeParam(
          data['current'],
          ParamType.int,
          false,
        ),
        organizationId: deserializeStructParam(
          data['organization_id'],
          ParamType.DataStruct,
          false,
          structBuilder: OrganizationIdStruct.fromSerializableMap,
        ),
        submitStaffId: deserializeStructParam(
          data['submit_staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: SubmitStaffIdStruct.fromSerializableMap,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        timeOperate: deserializeParam(
          data['time_operate'],
          ParamType.String,
          false,
        ),
        createdUserId: deserializeStructParam(
          data['created_user_id'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        content == other.content &&
        actionType == other.actionType &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        deadline == other.deadline &&
        estimateInSecond == other.estimateInSecond &&
        listEquality.equals(staffs, other.staffs) &&
        workflowId == other.workflowId &&
        listEquality.equals(operations, other.operations) &&
        publishedCount == other.publishedCount &&
        listEquality.equals(stepId, other.stepId) &&
        number == other.number &&
        current == other.current &&
        organizationId == other.organizationId &&
        submitStaffId == other.submitStaffId &&
        dateCreated == other.dateCreated &&
        timeOperate == other.timeOperate &&
        createdUserId == other.createdUserId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        content,
        actionType,
        dateStart,
        dateEnd,
        deadline,
        estimateInSecond,
        staffs,
        workflowId,
        operations,
        publishedCount,
        stepId,
        number,
        current,
        organizationId,
        submitStaffId,
        dateCreated,
        timeOperate,
        createdUserId
      ]);
}

TaskListStruct createTaskListStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  String? content,
  String? actionType,
  String? dateStart,
  String? dateEnd,
  String? deadline,
  int? estimateInSecond,
  TaskStruct? workflowId,
  int? publishedCount,
  int? number,
  int? current,
  OrganizationIdStruct? organizationId,
  SubmitStaffIdStruct? submitStaffId,
  String? dateCreated,
  String? timeOperate,
  UserStruct? createdUserId,
}) =>
    TaskListStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      content: content,
      actionType: actionType,
      dateStart: dateStart,
      dateEnd: dateEnd,
      deadline: deadline,
      estimateInSecond: estimateInSecond,
      workflowId: workflowId ?? TaskStruct(),
      publishedCount: publishedCount,
      number: number,
      current: current,
      organizationId: organizationId ?? OrganizationIdStruct(),
      submitStaffId: submitStaffId ?? SubmitStaffIdStruct(),
      dateCreated: dateCreated,
      timeOperate: timeOperate,
      createdUserId: createdUserId ?? UserStruct(),
    );
