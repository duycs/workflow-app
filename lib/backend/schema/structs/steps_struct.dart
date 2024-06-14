// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepsStruct extends BaseStruct {
  StepsStruct({
    String? id,
    String? status,
    String? description,
    String? executeType,
    String? dateStart,
    String? dateEnd,
    String? cron,
    int? number,
    WorkflowsStruct? workflowId,
    TasksStruct? taskId,
    List<OperationsStruct>? operations,
    List<StaffsStepStruct>? staffs,
    String? name,
    String? actionType,
    String? staffsAlias,
    int? estimateInSecond,
    String? timeOperate,
    List<DepartmentListStruct>? departments,
  })  : _id = id,
        _status = status,
        _description = description,
        _executeType = executeType,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _cron = cron,
        _number = number,
        _workflowId = workflowId,
        _taskId = taskId,
        _operations = operations,
        _staffs = staffs,
        _name = name,
        _actionType = actionType,
        _staffsAlias = staffsAlias,
        _estimateInSecond = estimateInSecond,
        _timeOperate = timeOperate,
        _departments = departments;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "execute_type" field.
  String? _executeType;
  String get executeType => _executeType ?? '';
  set executeType(String? val) => _executeType = val;

  bool hasExecuteType() => _executeType != null;

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

  // "cron" field.
  String? _cron;
  String get cron => _cron ?? '';
  set cron(String? val) => _cron = val;

  bool hasCron() => _cron != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "workflow_id" field.
  WorkflowsStruct? _workflowId;
  WorkflowsStruct get workflowId => _workflowId ?? WorkflowsStruct();
  set workflowId(WorkflowsStruct? val) => _workflowId = val;

  void updateWorkflowId(Function(WorkflowsStruct) updateFn) {
    updateFn(workflowId ??= WorkflowsStruct());
  }

  bool hasWorkflowId() => _workflowId != null;

  // "task_id" field.
  TasksStruct? _taskId;
  TasksStruct get taskId => _taskId ?? TasksStruct();
  set taskId(TasksStruct? val) => _taskId = val;

  void updateTaskId(Function(TasksStruct) updateFn) {
    updateFn(taskId ??= TasksStruct());
  }

  bool hasTaskId() => _taskId != null;

  // "operations" field.
  List<OperationsStruct>? _operations;
  List<OperationsStruct> get operations => _operations ?? const [];
  set operations(List<OperationsStruct>? val) => _operations = val;

  void updateOperations(Function(List<OperationsStruct>) updateFn) {
    updateFn(operations ??= []);
  }

  bool hasOperations() => _operations != null;

  // "staffs" field.
  List<StaffsStepStruct>? _staffs;
  List<StaffsStepStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStepStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffsStepStruct>) updateFn) {
    updateFn(staffs ??= []);
  }

  bool hasStaffs() => _staffs != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "action_type" field.
  String? _actionType;
  String get actionType => _actionType ?? '';
  set actionType(String? val) => _actionType = val;

  bool hasActionType() => _actionType != null;

  // "staffs_alias" field.
  String? _staffsAlias;
  String get staffsAlias => _staffsAlias ?? '';
  set staffsAlias(String? val) => _staffsAlias = val;

  bool hasStaffsAlias() => _staffsAlias != null;

  // "estimate_in_second" field.
  int? _estimateInSecond;
  int get estimateInSecond => _estimateInSecond ?? 0;
  set estimateInSecond(int? val) => _estimateInSecond = val;

  void incrementEstimateInSecond(int amount) =>
      estimateInSecond = estimateInSecond + amount;

  bool hasEstimateInSecond() => _estimateInSecond != null;

  // "time_operate" field.
  String? _timeOperate;
  String get timeOperate => _timeOperate ?? '';
  set timeOperate(String? val) => _timeOperate = val;

  bool hasTimeOperate() => _timeOperate != null;

  // "departments" field.
  List<DepartmentListStruct>? _departments;
  List<DepartmentListStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentListStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentListStruct>) updateFn) {
    updateFn(departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  static StepsStruct fromMap(Map<String, dynamic> data) => StepsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        description: data['description'] as String?,
        executeType: data['execute_type'] as String?,
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        cron: data['cron'] as String?,
        number: castToType<int>(data['number']),
        workflowId: WorkflowsStruct.maybeFromMap(data['workflow_id']),
        taskId: TasksStruct.maybeFromMap(data['task_id']),
        operations: getStructList(
          data['operations'],
          OperationsStruct.fromMap,
        ),
        staffs: getStructList(
          data['staffs'],
          StaffsStepStruct.fromMap,
        ),
        name: data['name'] as String?,
        actionType: data['action_type'] as String?,
        staffsAlias: data['staffs_alias'] as String?,
        estimateInSecond: castToType<int>(data['estimate_in_second']),
        timeOperate: data['time_operate'] as String?,
        departments: getStructList(
          data['departments'],
          DepartmentListStruct.fromMap,
        ),
      );

  static StepsStruct? maybeFromMap(dynamic data) =>
      data is Map ? StepsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'description': _description,
        'execute_type': _executeType,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'cron': _cron,
        'number': _number,
        'workflow_id': _workflowId?.toMap(),
        'task_id': _taskId?.toMap(),
        'operations': _operations?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'name': _name,
        'action_type': _actionType,
        'staffs_alias': _staffsAlias,
        'estimate_in_second': _estimateInSecond,
        'time_operate': _timeOperate,
        'departments': _departments?.map((e) => e.toMap()).toList(),
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'execute_type': serializeParam(
          _executeType,
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
        'cron': serializeParam(
          _cron,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'workflow_id': serializeParam(
          _workflowId,
          ParamType.DataStruct,
        ),
        'task_id': serializeParam(
          _taskId,
          ParamType.DataStruct,
        ),
        'operations': serializeParam(
          _operations,
          ParamType.DataStruct,
          isList: true,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'action_type': serializeParam(
          _actionType,
          ParamType.String,
        ),
        'staffs_alias': serializeParam(
          _staffsAlias,
          ParamType.String,
        ),
        'estimate_in_second': serializeParam(
          _estimateInSecond,
          ParamType.int,
        ),
        'time_operate': serializeParam(
          _timeOperate,
          ParamType.String,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static StepsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StepsStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        executeType: deserializeParam(
          data['execute_type'],
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
        cron: deserializeParam(
          data['cron'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        workflowId: deserializeStructParam(
          data['workflow_id'],
          ParamType.DataStruct,
          false,
          structBuilder: WorkflowsStruct.fromSerializableMap,
        ),
        taskId: deserializeStructParam(
          data['task_id'],
          ParamType.DataStruct,
          false,
          structBuilder: TasksStruct.fromSerializableMap,
        ),
        operations: deserializeStructParam<OperationsStruct>(
          data['operations'],
          ParamType.DataStruct,
          true,
          structBuilder: OperationsStruct.fromSerializableMap,
        ),
        staffs: deserializeStructParam<StaffsStepStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: StaffsStepStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        actionType: deserializeParam(
          data['action_type'],
          ParamType.String,
          false,
        ),
        staffsAlias: deserializeParam(
          data['staffs_alias'],
          ParamType.String,
          false,
        ),
        estimateInSecond: deserializeParam(
          data['estimate_in_second'],
          ParamType.int,
          false,
        ),
        timeOperate: deserializeParam(
          data['time_operate'],
          ParamType.String,
          false,
        ),
        departments: deserializeStructParam<DepartmentListStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StepsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StepsStruct &&
        id == other.id &&
        status == other.status &&
        description == other.description &&
        executeType == other.executeType &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        cron == other.cron &&
        number == other.number &&
        workflowId == other.workflowId &&
        taskId == other.taskId &&
        listEquality.equals(operations, other.operations) &&
        listEquality.equals(staffs, other.staffs) &&
        name == other.name &&
        actionType == other.actionType &&
        staffsAlias == other.staffsAlias &&
        estimateInSecond == other.estimateInSecond &&
        timeOperate == other.timeOperate &&
        listEquality.equals(departments, other.departments);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        description,
        executeType,
        dateStart,
        dateEnd,
        cron,
        number,
        workflowId,
        taskId,
        operations,
        staffs,
        name,
        actionType,
        staffsAlias,
        estimateInSecond,
        timeOperate,
        departments
      ]);
}

StepsStruct createStepsStruct({
  String? id,
  String? status,
  String? description,
  String? executeType,
  String? dateStart,
  String? dateEnd,
  String? cron,
  int? number,
  WorkflowsStruct? workflowId,
  TasksStruct? taskId,
  String? name,
  String? actionType,
  String? staffsAlias,
  int? estimateInSecond,
  String? timeOperate,
}) =>
    StepsStruct(
      id: id,
      status: status,
      description: description,
      executeType: executeType,
      dateStart: dateStart,
      dateEnd: dateEnd,
      cron: cron,
      number: number,
      workflowId: workflowId ?? WorkflowsStruct(),
      taskId: taskId ?? TasksStruct(),
      name: name,
      actionType: actionType,
      staffsAlias: staffsAlias,
      estimateInSecond: estimateInSecond,
      timeOperate: timeOperate,
    );
