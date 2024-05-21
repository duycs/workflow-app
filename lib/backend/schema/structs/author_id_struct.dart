// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorIdStruct extends BaseStruct {
  AuthorIdStruct({
    String? id,
    String? alias,
  })  : _id = id,
        _alias = alias;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  set alias(String? val) => _alias = val;
  bool hasAlias() => _alias != null;

  static AuthorIdStruct fromMap(Map<String, dynamic> data) => AuthorIdStruct(
        id: data['id'] as String?,
        alias: data['alias'] as String?,
      );

  static AuthorIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuthorIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'alias': _alias,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'alias': serializeParam(
          _alias,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthorIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthorIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        alias: deserializeParam(
          data['alias'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthorIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthorIdStruct && id == other.id && alias == other.alias;
  }

  @override
  int get hashCode => const ListEquality().hash([id, alias]);
}

AuthorIdStruct createAuthorIdStruct({
  String? id,
  String? alias,
}) =>
    AuthorIdStruct(
      id: id,
      alias: alias,
    );
