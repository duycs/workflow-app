// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsListStruct extends BaseStruct {
  DomainsListStruct({
    String? id,
    String? status,
    String? name,
    bool? check,
  })  : _id = id,
        _status = status,
        _name = name,
        _check = check;

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

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  set check(bool? val) => _check = val;

  bool hasCheck() => _check != null;

  static DomainsListStruct fromMap(Map<String, dynamic> data) =>
      DomainsListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        check: data['check'] as bool?,
      );

  static DomainsListStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
        'check': _check,
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
        'check': serializeParam(
          _check,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DomainsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsListStruct(
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
        check: deserializeParam(
          data['check'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DomainsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        check == other.check;
  }

  @override
  int get hashCode => const ListEquality().hash([id, status, name, check]);
}

DomainsListStruct createDomainsListStruct({
  String? id,
  String? status,
  String? name,
  bool? check,
}) =>
    DomainsListStruct(
      id: id,
      status: status,
      name: name,
      check: check,
    );
