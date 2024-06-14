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
  })  : _id = id,
        _name = name,
        _status = status,
        _current = current;

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

  static StaffTasksIdStruct fromMap(Map<String, dynamic> data) =>
      StaffTasksIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        status: data['status'] as String?,
        current: castToType<int>(data['current']),
      );

  static StaffTasksIdStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffTasksIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'status': _status,
        'current': _current,
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
      );

  @override
  String toString() => 'StaffTasksIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffTasksIdStruct &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        current == other.current;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, status, current]);
}

StaffTasksIdStruct createStaffTasksIdStruct({
  String? id,
  String? name,
  String? status,
  int? current,
}) =>
    StaffTasksIdStruct(
      id: id,
      name: name,
      status: status,
      current: current,
    );
