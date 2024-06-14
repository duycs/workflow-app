// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizationIdStruct extends BaseStruct {
  OrganizationIdStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static OrganizationIdStruct fromMap(Map<String, dynamic> data) =>
      OrganizationIdStruct(
        id: data['id'] as String?,
      );

  static OrganizationIdStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizationIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrganizationIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrganizationIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrganizationIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrganizationIdStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

OrganizationIdStruct createOrganizationIdStruct({
  String? id,
}) =>
    OrganizationIdStruct(
      id: id,
    );
