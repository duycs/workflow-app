// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserIdStaffStruct extends BaseStruct {
  UserIdStaffStruct({
    String? id,
    String? role,
    String? firstName,
    String? avatar,
    String? email,
    String? status,
  })  : _id = id,
        _role = role,
        _firstName = firstName,
        _avatar = avatar,
        _email = email,
        _status = status;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static UserIdStaffStruct fromMap(Map<String, dynamic> data) =>
      UserIdStaffStruct(
        id: data['id'] as String?,
        role: data['role'] as String?,
        firstName: data['first_name'] as String?,
        avatar: data['avatar'] as String?,
        email: data['email'] as String?,
        status: data['status'] as String?,
      );

  static UserIdStaffStruct? maybeFromMap(dynamic data) => data is Map
      ? UserIdStaffStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'role': _role,
        'first_name': _firstName,
        'avatar': _avatar,
        'email': _email,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserIdStaffStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserIdStaffStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
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
  String toString() => 'UserIdStaffStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserIdStaffStruct &&
        id == other.id &&
        role == other.role &&
        firstName == other.firstName &&
        avatar == other.avatar &&
        email == other.email &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, role, firstName, avatar, email, status]);
}

UserIdStaffStruct createUserIdStaffStruct({
  String? id,
  String? role,
  String? firstName,
  String? avatar,
  String? email,
  String? status,
}) =>
    UserIdStaffStruct(
      id: id,
      role: role,
      firstName: firstName,
      avatar: avatar,
      email: email,
      status: status,
    );
