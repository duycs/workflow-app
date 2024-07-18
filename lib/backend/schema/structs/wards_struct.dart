// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WardsStruct extends BaseStruct {
  WardsStruct({
    String? id,
    String? name,
    String? status,
    String? districtId,
  })  : _id = id,
        _name = name,
        _status = status,
        _districtId = districtId;

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

  // "district_id" field.
  String? _districtId;
  String get districtId => _districtId ?? '';
  set districtId(String? val) => _districtId = val;

  bool hasDistrictId() => _districtId != null;

  static WardsStruct fromMap(Map<String, dynamic> data) => WardsStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        status: data['status'] as String?,
        districtId: data['district_id'] as String?,
      );

  static WardsStruct? maybeFromMap(dynamic data) =>
      data is Map ? WardsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'status': _status,
        'district_id': _districtId,
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
        'district_id': serializeParam(
          _districtId,
          ParamType.String,
        ),
      }.withoutNulls;

  static WardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      WardsStruct(
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
        districtId: deserializeParam(
          data['district_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WardsStruct &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        districtId == other.districtId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, status, districtId]);
}

WardsStruct createWardsStruct({
  String? id,
  String? name,
  String? status,
  String? districtId,
}) =>
    WardsStruct(
      id: id,
      name: name,
      status: status,
      districtId: districtId,
    );
