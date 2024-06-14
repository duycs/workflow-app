// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProcedurePublishedUserCreatedIdStruct extends BaseStruct {
  ProcedurePublishedUserCreatedIdStruct({
    String? id,
    String? firstName,
    String? email,
  })  : _id = id,
        _firstName = firstName,
        _email = email;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static ProcedurePublishedUserCreatedIdStruct fromMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedUserCreatedIdStruct(
        id: data['id'] as String?,
        firstName: data['first_name'] as String?,
        email: data['email'] as String?,
      );

  static ProcedurePublishedUserCreatedIdStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ProcedurePublishedUserCreatedIdStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'email': _email,
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProcedurePublishedUserCreatedIdStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProcedurePublishedUserCreatedIdStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProcedurePublishedUserCreatedIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProcedurePublishedUserCreatedIdStruct &&
        id == other.id &&
        firstName == other.firstName &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([id, firstName, email]);
}

ProcedurePublishedUserCreatedIdStruct
    createProcedurePublishedUserCreatedIdStruct({
  String? id,
  String? firstName,
  String? email,
}) =>
        ProcedurePublishedUserCreatedIdStruct(
          id: id,
          firstName: firstName,
          email: email,
        );
