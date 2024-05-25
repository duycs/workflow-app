// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkflowsStruct extends BaseStruct {
  WorkflowsStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    UserStruct? userCreated,
    List<StepsStruct>? steps,
    String? cron,
    int? number,
    String? domainId,
    String? categoryId,
    int? template,
    String? type,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _userCreated = userCreated,
        _steps = steps,
        _cron = cron,
        _number = number,
        _domainId = domainId,
        _categoryId = categoryId,
        _template = template,
        _type = type;

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

  // "user_created" field.
  UserStruct? _userCreated;
  UserStruct get userCreated => _userCreated ?? UserStruct();
  set userCreated(UserStruct? val) => _userCreated = val;
  void updateUserCreated(Function(UserStruct) updateFn) =>
      updateFn(_userCreated ??= UserStruct());
  bool hasUserCreated() => _userCreated != null;

  // "steps" field.
  List<StepsStruct>? _steps;
  List<StepsStruct> get steps => _steps ?? const [];
  set steps(List<StepsStruct>? val) => _steps = val;
  void updateSteps(Function(List<StepsStruct>) updateFn) =>
      updateFn(_steps ??= []);
  bool hasSteps() => _steps != null;

  // "cron" field.
  String? _cron;
  String get cron => _cron ?? '';
  set cron(String? val) => _cron = val;
  bool hasCron() => _cron != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "domain_id" field.
  String? _domainId;
  String get domainId => _domainId ?? '';
  set domainId(String? val) => _domainId = val;
  bool hasDomainId() => _domainId != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;
  bool hasCategoryId() => _categoryId != null;

  // "template" field.
  int? _template;
  int get template => _template ?? 0;
  set template(int? val) => _template = val;
  void incrementTemplate(int amount) => _template = template + amount;
  bool hasTemplate() => _template != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static WorkflowsStruct fromMap(Map<String, dynamic> data) => WorkflowsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        steps: getStructList(
          data['steps'],
          StepsStruct.fromMap,
        ),
        cron: data['cron'] as String?,
        number: castToType<int>(data['number']),
        domainId: data['domain_id'] as String?,
        categoryId: data['category_id'] as String?,
        template: castToType<int>(data['template']),
        type: data['type'] as String?,
      );

  static WorkflowsStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkflowsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'user_created': _userCreated?.toMap(),
        'steps': _steps?.map((e) => e.toMap()).toList(),
        'cron': _cron,
        'number': _number,
        'domain_id': _domainId,
        'category_id': _categoryId,
        'template': _template,
        'type': _type,
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
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.DataStruct,
          true,
        ),
        'cron': serializeParam(
          _cron,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'domain_id': serializeParam(
          _domainId,
          ParamType.String,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'template': serializeParam(
          _template,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkflowsStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkflowsStruct(
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
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        steps: deserializeStructParam<StepsStruct>(
          data['steps'],
          ParamType.DataStruct,
          true,
          structBuilder: StepsStruct.fromSerializableMap,
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
        domainId: deserializeParam(
          data['domain_id'],
          ParamType.String,
          false,
        ),
        categoryId: deserializeParam(
          data['category_id'],
          ParamType.String,
          false,
        ),
        template: deserializeParam(
          data['template'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkflowsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkflowsStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        userCreated == other.userCreated &&
        listEquality.equals(steps, other.steps) &&
        cron == other.cron &&
        number == other.number &&
        domainId == other.domainId &&
        categoryId == other.categoryId &&
        template == other.template &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        name,
        description,
        userCreated,
        steps,
        cron,
        number,
        domainId,
        categoryId,
        template,
        type
      ]);
}

WorkflowsStruct createWorkflowsStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  UserStruct? userCreated,
  String? cron,
  int? number,
  String? domainId,
  String? categoryId,
  int? template,
  String? type,
}) =>
    WorkflowsStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      userCreated: userCreated ?? UserStruct(),
      cron: cron,
      number: number,
      domainId: domainId,
      categoryId: categoryId,
      template: template,
      type: type,
    );
