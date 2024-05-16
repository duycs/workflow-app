// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsListListStruct extends BaseStruct {
  DomainsListListStruct({
    String? id,
    String? status,
    String? userCreated,
    String? dateCreated,
    String? name,
    String? description,
  })  : _id = id,
        _status = status,
        _userCreated = userCreated,
        _dateCreated = dateCreated,
        _name = name,
        _description = description;

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
  String? _userCreated;
  String get userCreated => _userCreated ?? '';
  set userCreated(String? val) => _userCreated = val;
  bool hasUserCreated() => _userCreated != null;

  // "date_created" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;
  bool hasDateCreated() => _dateCreated != null;

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

  static DomainsListListStruct fromMap(Map<String, dynamic> data) =>
      DomainsListListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        userCreated: data['user_created'] as String?,
        dateCreated: data['date_created'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static DomainsListListStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsListListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'user_created': _userCreated,
        'date_created': _dateCreated,
        'name': _name,
        'description': _description,
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
          ParamType.String,
        ),
        'date_created': serializeParam(
          _dateCreated,
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
      }.withoutNulls;

  static DomainsListListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsListListStruct(
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
        userCreated: deserializeParam(
          data['user_created'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['date_created'],
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
      );

  @override
  String toString() => 'DomainsListListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsListListStruct &&
        id == other.id &&
        status == other.status &&
        userCreated == other.userCreated &&
        dateCreated == other.dateCreated &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, status, userCreated, dateCreated, name, description]);
}

DomainsListListStruct createDomainsListListStruct({
  String? id,
  String? status,
  String? userCreated,
  String? dateCreated,
  String? name,
  String? description,
}) =>
    DomainsListListStruct(
      id: id,
      status: status,
      userCreated: userCreated,
      dateCreated: dateCreated,
      name: name,
      description: description,
    );
