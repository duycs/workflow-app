// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserOperationStruct extends BaseStruct {
  UserOperationStruct({
    String? id,
    String? firstName,
  })  : _id = id,
        _firstName = firstName;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  static UserOperationStruct fromMap(Map<String, dynamic> data) =>
      UserOperationStruct(
        id: data['id'] as String?,
        firstName: data['first_name'] as String?,
      );

  static UserOperationStruct? maybeFromMap(dynamic data) => data is Map
      ? UserOperationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserOperationStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserOperationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserOperationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserOperationStruct &&
        id == other.id &&
        firstName == other.firstName;
  }

  @override
  int get hashCode => const ListEquality().hash([id, firstName]);
}

UserOperationStruct createUserOperationStruct({
  String? id,
  String? firstName,
}) =>
    UserOperationStruct(
      id: id,
      firstName: firstName,
    );
