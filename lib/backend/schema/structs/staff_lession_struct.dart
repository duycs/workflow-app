// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffLessionStruct extends BaseStruct {
  StaffLessionStruct({
    String? id,
    String? status,
  })  : _id = id,
        _status = status;

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

  static StaffLessionStruct fromMap(Map<String, dynamic> data) =>
      StaffLessionStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
      );

  static StaffLessionStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffLessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
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
      }.withoutNulls;

  static StaffLessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffLessionStruct(
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
      );

  @override
  String toString() => 'StaffLessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffLessionStruct &&
        id == other.id &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([id, status]);
}

StaffLessionStruct createStaffLessionStruct({
  String? id,
  String? status,
}) =>
    StaffLessionStruct(
      id: id,
      status: status,
    );
