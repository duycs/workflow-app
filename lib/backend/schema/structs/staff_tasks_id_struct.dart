// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffTasksIdStruct extends BaseStruct {
  StaffTasksIdStruct({
    String? id,
    String? name,
    String? status,
    int? current,
    String? deadline,
    String? dateEnd,
    int? overDeadline,
    SubmitStaffIdStruct? submitStaffId,
  })  : _id = id,
        _name = name,
        _status = status,
        _current = current,
        _deadline = deadline,
        _dateEnd = dateEnd,
        _overDeadline = overDeadline,
        _submitStaffId = submitStaffId;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "current" field.
  int? _current;
  int get current => _current ?? 0;
  set current(int? val) => _current = val;

  void incrementCurrent(int amount) => current = current + amount;

  bool hasCurrent() => _current != null;

  // "deadline" field.
  String? _deadline;
  String get deadline => _deadline ?? '';
  set deadline(String? val) => _deadline = val;

  bool hasDeadline() => _deadline != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;

  bool hasDateEnd() => _dateEnd != null;

  // "over_deadline" field.
  int? _overDeadline;
  int get overDeadline => _overDeadline ?? 0;
  set overDeadline(int? val) => _overDeadline = val;

  void incrementOverDeadline(int amount) =>
      overDeadline = overDeadline + amount;

  bool hasOverDeadline() => _overDeadline != null;

  // "submit_staff_id" field.
  SubmitStaffIdStruct? _submitStaffId;
  SubmitStaffIdStruct get submitStaffId =>
      _submitStaffId ?? SubmitStaffIdStruct();
  set submitStaffId(SubmitStaffIdStruct? val) => _submitStaffId = val;

  void updateSubmitStaffId(Function(SubmitStaffIdStruct) updateFn) {
    updateFn(_submitStaffId ??= SubmitStaffIdStruct());
  }

  bool hasSubmitStaffId() => _submitStaffId != null;

  static StaffTasksIdStruct fromMap(Map<String, dynamic> data) =>
      StaffTasksIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        status: data['status'] as String?,
        current: castToType<int>(data['current']),
        deadline: data['deadline'] as String?,
        dateEnd: data['date_end'] as String?,
        overDeadline: castToType<int>(data['over_deadline']),
        submitStaffId:
            SubmitStaffIdStruct.maybeFromMap(data['submit_staff_id']),
      );

  static StaffTasksIdStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffTasksIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'status': _status,
        'current': _current,
        'deadline': _deadline,
        'date_end': _dateEnd,
        'over_deadline': _overDeadline,
        'submit_staff_id': _submitStaffId?.toMap(),
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
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'current': serializeParam(
          _current,
          ParamType.int,
        ),
        'deadline': serializeParam(
          _deadline,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'over_deadline': serializeParam(
          _overDeadline,
          ParamType.int,
        ),
        'submit_staff_id': serializeParam(
          _submitStaffId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StaffTasksIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffTasksIdStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        current: deserializeParam(
          data['current'],
          ParamType.int,
          false,
        ),
        deadline: deserializeParam(
          data['deadline'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        overDeadline: deserializeParam(
          data['over_deadline'],
          ParamType.int,
          false,
        ),
        submitStaffId: deserializeStructParam(
          data['submit_staff_id'],
          ParamType.DataStruct,
          false,
          structBuilder: SubmitStaffIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StaffTasksIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffTasksIdStruct &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        current == other.current &&
        deadline == other.deadline &&
        dateEnd == other.dateEnd &&
        overDeadline == other.overDeadline &&
        submitStaffId == other.submitStaffId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        status,
        current,
        deadline,
        dateEnd,
        overDeadline,
        submitStaffId
      ]);
}

StaffTasksIdStruct createStaffTasksIdStruct({
  String? id,
  String? name,
  String? status,
  int? current,
  String? deadline,
  String? dateEnd,
  int? overDeadline,
  SubmitStaffIdStruct? submitStaffId,
}) =>
    StaffTasksIdStruct(
      id: id,
      name: name,
      status: status,
      current: current,
      deadline: deadline,
      dateEnd: dateEnd,
      overDeadline: overDeadline,
      submitStaffId: submitStaffId ?? SubmitStaffIdStruct(),
    );
