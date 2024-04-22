// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksStruct extends BaseStruct {
  TasksStruct({
    String? id,
    String? status,
    String? name,
    String? description,
    String? content,
    String? dateStart,
    String? dateEnd,
    List<TasksStaffsIdStruct>? staffs,
  })  : _id = id,
        _status = status,
        _name = name,
        _description = description,
        _content = content,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _staffs = staffs;

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

  // "staffs" field.
  List<TasksStaffsIdStruct>? _staffs;
  List<TasksStaffsIdStruct> get staffs => _staffs ?? const [];
  set staffs(List<TasksStaffsIdStruct>? val) => _staffs = val;
  void updateStaffs(Function(List<TasksStaffsIdStruct>) updateFn) =>
      updateFn(_staffs ??= []);
  bool hasStaffs() => _staffs != null;

  static TasksStruct fromMap(Map<String, dynamic> data) => TasksStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        content: data['content'] as String?,
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        staffs: getStructList(
          data['staffs'],
          TasksStaffsIdStruct.fromMap,
        ),
      );

  static TasksStruct? maybeFromMap(dynamic data) =>
      data is Map ? TasksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'content': _content,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'staffs': _staffs?.map((e) => e.toMap()).toList(),
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
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'staffs': serializeParam(
          _staffs,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksStruct(
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
        staffs: deserializeStructParam<TasksStaffsIdStruct>(
          data['staffs'],
          ParamType.DataStruct,
          true,
          structBuilder: TasksStaffsIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TasksStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        content == other.content &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        listEquality.equals(staffs, other.staffs);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, status, name, description, content, dateStart, dateEnd, staffs]);
}

TasksStruct createTasksStruct({
  String? id,
  String? status,
  String? name,
  String? description,
  String? content,
  String? dateStart,
  String? dateEnd,
}) =>
    TasksStruct(
      id: id,
      status: status,
      name: name,
      description: description,
      content: content,
      dateStart: dateStart,
      dateEnd: dateEnd,
    );
