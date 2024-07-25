// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftListStruct extends BaseStruct {
  ShiftListStruct({
    String? id,
    String? status,
    UserStruct? userCreated,
    String? dateCreated,
    String? startTime,
    String? endTime,
    String? name,
    int? normal,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _startTime = startTime,
        _endTime = endTime,
        _name = name,
        _normal = normal;

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

  // "user_created" field.
  UserStruct? _userCreated;
  UserStruct get userCreated => _userCreated ?? UserStruct();
  set userCreated(UserStruct? val) => _userCreated = val;

  void updateUserCreated(Function(UserStruct) updateFn) {
    updateFn(_userCreated ??= UserStruct());
  }

  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "normal" field.
  int? _normal;
  int get normal => _normal ?? 0;
  set normal(int? val) => _normal = val;

  void incrementNormal(int amount) => normal = normal + amount;

  bool hasNormal() => _normal != null;

  static ShiftListStruct fromMap(Map<String, dynamic> data) => ShiftListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: UserStruct.maybeFromMap(data['user_created']),
        dateCreated: data['date_created'] as String?,
        startTime: data['start_time'] as String?,
        endTime: data['end_time'] as String?,
        name: data['name'] as String?,
        normal: castToType<int>(data['normal']),
      );

  static ShiftListStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated?.toMap(),
        'date_created': _dateCreated,
        'start_time': _startTime,
        'end_time': _endTime,
        'name': _name,
        'normal': _normal,
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
        'user_created': serializeParam(
          _userCreated,
          ParamType.DataStruct,
        ),
        'date_created': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'normal': serializeParam(
          _normal,
          ParamType.int,
        ),
      }.withoutNulls;

  static ShiftListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftListStruct(
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
        userCreated: deserializeStructParam(
          data['user_created'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        normal: deserializeParam(
          data['normal'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ShiftListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftListStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        name == other.name &&
        normal == other.normal;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, status, userCreated, dateCreated, startTime, endTime, name, normal]);
}

ShiftListStruct createShiftListStruct({
  String? id,
  String? status,
  UserStruct? userCreated,
  String? dateCreated,
  String? startTime,
  String? endTime,
  String? name,
  int? normal,
}) =>
    ShiftListStruct(
      id: id,
      status: status,
      userCreated: userCreated ?? UserStruct(),
      dateCreated: dateCreated,
      startTime: startTime,
      endTime: endTime,
      name: name,
      normal: normal,
    );
