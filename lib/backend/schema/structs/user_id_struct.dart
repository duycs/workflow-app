// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserIdStruct extends BaseStruct {
  UserIdStruct({
    String? firstName,
    String? lastName,
    String? avatar,
  })  : _firstName = firstName,
        _lastName = lastName,
        _avatar = avatar;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  static UserIdStruct fromMap(Map<String, dynamic> data) => UserIdStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        avatar: data['avatar'] as String?,
      );

  static UserIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'avatar': _avatar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserIdStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserIdStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        avatar == other.avatar;
  }

  @override
  int get hashCode => const ListEquality().hash([firstName, lastName, avatar]);
}

UserIdStruct createUserIdStruct({
  String? firstName,
  String? lastName,
  String? avatar,
}) =>
    UserIdStruct(
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
