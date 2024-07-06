// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkflowsStepCreateStruct extends BaseStruct {
  WorkflowsStepCreateStruct({
    String? id,
    String? status,
    String? description,
    String? executeType,
    String? dateStart,
    String? dateEnd,
    String? cron,
    int? number,
    TasksStruct? taskId,
    List<OperationsStruct>? operations,
    List<StaffsStepStruct>? staffs,
    String? name,
    String? actionType,
    String? workflowId,
    String? staffsAlias,
    int? limitPublished,
    int? remind2,
    int? remind,
    String? timeOperate,
    int? estimateInSecond,
    int? remindInSecond,
    List<DepartmentListStruct>? departments,
    String? departmentId,
  })  : _id = id,
        _status = status,
        _description = description,
        _executeType = executeType,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _cron = cron,
        _number = number,
        _taskId = taskId,
        _operations = operations,
        _staffs = staffs,
        _name = name,
        _actionType = actionType,
        _workflowId = workflowId,
        _staffsAlias = staffsAlias,
        _limitPublished = limitPublished,
        _remind2 = remind2,
        _remind = remind,
        _timeOperate = timeOperate,
        _estimateInSecond = estimateInSecond,
        _remindInSecond = remindInSecond,
        _departments = departments,
        _departmentId = departmentId;

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

  // "task_id" field.
  TasksStruct? _taskId;
  TasksStruct get taskId => _taskId ?? TasksStruct();
  set taskId(TasksStruct? val) => _taskId = val;

  void updateTaskId(Function(TasksStruct) updateFn) {
    updateFn(_taskId ??= TasksStruct());
  }

  bool hasTaskId() => _taskId != null;

  // "operations" field.
  List<OperationsStruct>? _operations;
  List<OperationsStruct> get operations => _operations ?? const [];
  set operations(List<OperationsStruct>? val) => _operations = val;

  void updateOperations(Function(List<OperationsStruct>) updateFn) {
    updateFn(_operations ??= []);
  }

  bool hasOperations() => _operations != null;

  // "staffs" field.
  List<StaffsStepStruct>? _staffs;
  List<StaffsStepStruct> get staffs => _staffs ?? const [];
  set staffs(List<StaffsStepStruct>? val) => _staffs = val;

  void updateStaffs(Function(List<StaffsStepStruct>) updateFn) {
    updateFn(_staffs ??= []);
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

  // "workflow_id" field.
  String? _workflowId;
  String get workflowId => _workflowId ?? '';
  set workflowId(String? val) => _workflowId = val;

  bool hasWorkflowId() => _workflowId != null;

  // "staffs_alias" field.
  String? _staffsAlias;
  String get staffsAlias => _staffsAlias ?? '';
  set staffsAlias(String? val) => _staffsAlias = val;

  bool hasStaffsAlias() => _staffsAlias != null;

  // "limit_published" field.
  int? _limitPublished;
  int get limitPublished => _limitPublished ?? 0;
  set limitPublished(int? val) => _limitPublished = val;

  void incrementLimitPublished(int amount) =>
      limitPublished = limitPublished + amount;

  bool hasLimitPublished() => _limitPublished != null;

  // "remind_2" field.
  int? _remind2;
  int get remind2 => _remind2 ?? 0;
  set remind2(int? val) => _remind2 = val;

  void incrementRemind2(int amount) => remind2 = remind2 + amount;

  bool hasRemind2() => _remind2 != null;

  // "remind" field.
  int? _remind;
  int get remind => _remind ?? 0;
  set remind(int? val) => _remind = val;

  void incrementRemind(int amount) => remind = remind + amount;

  bool hasRemind() => _remind != null;

  // "time_operate" field.
  String? _timeOperate;
  String get timeOperate => _timeOperate ?? '';
  set timeOperate(String? val) => _timeOperate = val;

  bool hasTimeOperate() => _timeOperate != null;

  // "estimate_in_second" field.
  int? _estimateInSecond;
  int get estimateInSecond => _estimateInSecond ?? 0;
  set estimateInSecond(int? val) => _estimateInSecond = val;

  void incrementEstimateInSecond(int amount) =>
      estimateInSecond = estimateInSecond + amount;

  bool hasEstimateInSecond() => _estimateInSecond != null;

  // "remind_in_second" field.
  int? _remindInSecond;
  int get remindInSecond => _remindInSecond ?? 0;
  set remindInSecond(int? val) => _remindInSecond = val;

  void incrementRemindInSecond(int amount) =>
      remindInSecond = remindInSecond + amount;

  bool hasRemindInSecond() => _remindInSecond != null;

  // "departments" field.
  List<DepartmentListStruct>? _departments;
  List<DepartmentListStruct> get departments => _departments ?? const [];
  set departments(List<DepartmentListStruct>? val) => _departments = val;

  void updateDepartments(Function(List<DepartmentListStruct>) updateFn) {
    updateFn(_departments ??= []);
  }

  bool hasDepartments() => _departments != null;

  // "department_id" field.
  String? _departmentId;
  String get departmentId => _departmentId ?? '';
  set departmentId(String? val) => _departmentId = val;

  bool hasDepartmentId() => _departmentId != null;

  static WorkflowsStepCreateStruct fromMap(Map<String, dynamic> data) =>
      WorkflowsStepCreateStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        description: data['description'] as String?,
        executeType: data['execute_type'] as String?,
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        cron: data['cron'] as String?,
        number: castToType<int>(data['number']),
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
        workflowId: data['workflow_id'] as String?,
        staffsAlias: data['staffs_alias'] as String?,
        limitPublished: castToType<int>(data['limit_published']),
        remind2: castToType<int>(data['remind_2']),
        remind: castToType<int>(data['remind']),
        timeOperate: data['time_operate'] as String?,
        estimateInSecond: castToType<int>(data['estimate_in_second']),
        remindInSecond: castToType<int>(data['remind_in_second']),
        departments: getStructList(
          data['departments'],
          DepartmentListStruct.fromMap,
        ),
        departmentId: data['department_id'] as String?,
      );

  static WorkflowsStepCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkflowsStepCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'description': _description,
        'execute_type': _executeType,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'cron': _cron,
        'number': _number,
        'task_id': _taskId?.toMap(),
        'operations': _operations?.map((e) => e.toMap()).toList(),
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
        'name': _name,
        'action_type': _actionType,
        'workflow_id': _workflowId,
        'staffs_alias': _staffsAlias,
        'limit_published': _limitPublished,
        'remind_2': _remind2,
        'remind': _remind,
        'time_operate': _timeOperate,
        'estimate_in_second': _estimateInSecond,
        'remind_in_second': _remindInSecond,
        'departments': _departments?.map((e) => e.toMap()).toList(),
        'department_id': _departmentId,
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
        'workflow_id': serializeParam(
          _workflowId,
          ParamType.String,
        ),
        'staffs_alias': serializeParam(
          _staffsAlias,
          ParamType.String,
        ),
        'limit_published': serializeParam(
          _limitPublished,
          ParamType.int,
        ),
        'remind_2': serializeParam(
          _remind2,
          ParamType.int,
        ),
        'remind': serializeParam(
          _remind,
          ParamType.int,
        ),
        'time_operate': serializeParam(
          _timeOperate,
          ParamType.String,
        ),
        'estimate_in_second': serializeParam(
          _estimateInSecond,
          ParamType.int,
        ),
        'remind_in_second': serializeParam(
          _remindInSecond,
          ParamType.int,
        ),
        'departments': serializeParam(
          _departments,
          ParamType.DataStruct,
          isList: true,
        ),
        'department_id': serializeParam(
          _departmentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkflowsStepCreateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WorkflowsStepCreateStruct(
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
        workflowId: deserializeParam(
          data['workflow_id'],
          ParamType.String,
          false,
        ),
        staffsAlias: deserializeParam(
          data['staffs_alias'],
          ParamType.String,
          false,
        ),
        limitPublished: deserializeParam(
          data['limit_published'],
          ParamType.int,
          false,
        ),
        remind2: deserializeParam(
          data['remind_2'],
          ParamType.int,
          false,
        ),
        remind: deserializeParam(
          data['remind'],
          ParamType.int,
          false,
        ),
        timeOperate: deserializeParam(
          data['time_operate'],
          ParamType.String,
          false,
        ),
        estimateInSecond: deserializeParam(
          data['estimate_in_second'],
          ParamType.int,
          false,
        ),
        remindInSecond: deserializeParam(
          data['remind_in_second'],
          ParamType.int,
          false,
        ),
        departments: deserializeStructParam<DepartmentListStruct>(
          data['departments'],
          ParamType.DataStruct,
          true,
          structBuilder: DepartmentListStruct.fromSerializableMap,
        ),
        departmentId: deserializeParam(
          data['department_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkflowsStepCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkflowsStepCreateStruct &&
        id == other.id &&
        status == other.status &&
        description == other.description &&
        executeType == other.executeType &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        cron == other.cron &&
        number == other.number &&
        taskId == other.taskId &&
        listEquality.equals(operations, other.operations) &&
        listEquality.equals(staffs, other.staffs) &&
        name == other.name &&
        actionType == other.actionType &&
        workflowId == other.workflowId &&
        staffsAlias == other.staffsAlias &&
        limitPublished == other.limitPublished &&
        remind2 == other.remind2 &&
        remind == other.remind &&
        timeOperate == other.timeOperate &&
        estimateInSecond == other.estimateInSecond &&
        remindInSecond == other.remindInSecond &&
        listEquality.equals(departments, other.departments) &&
        departmentId == other.departmentId;
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
        taskId,
        operations,
        staffs,
        name,
        actionType,
        workflowId,
        staffsAlias,
        limitPublished,
        remind2,
        remind,
        timeOperate,
        estimateInSecond,
        remindInSecond,
        departments,
        departmentId
      ]);
}

WorkflowsStepCreateStruct createWorkflowsStepCreateStruct({
  String? id,
  String? status,
  String? description,
  String? executeType,
  String? dateStart,
  String? dateEnd,
  String? cron,
  int? number,
  TasksStruct? taskId,
  String? name,
  String? actionType,
  String? workflowId,
  String? staffsAlias,
  int? limitPublished,
  int? remind2,
  int? remind,
  String? timeOperate,
  int? estimateInSecond,
  int? remindInSecond,
  String? departmentId,
}) =>
    WorkflowsStepCreateStruct(
      id: id,
      status: status,
      description: description,
      executeType: executeType,
      dateStart: dateStart,
      dateEnd: dateEnd,
      cron: cron,
      number: number,
      taskId: taskId ?? TasksStruct(),
      name: name,
      actionType: actionType,
      workflowId: workflowId,
      staffsAlias: staffsAlias,
      limitPublished: limitPublished,
      remind2: remind2,
      remind: remind,
      timeOperate: timeOperate,
      estimateInSecond: estimateInSecond,
      remindInSecond: remindInSecond,
      departmentId: departmentId,
    );
