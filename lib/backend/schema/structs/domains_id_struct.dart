// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsIdStruct extends BaseStruct {
  DomainsIdStruct({
    String? id,
    String? name,
  })  : _id = id,
        _name = name;

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

  static DomainsIdStruct fromMap(Map<String, dynamic> data) => DomainsIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static DomainsIdStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
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
      }.withoutNulls;

  static DomainsIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsIdStruct(
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
      );

  @override
  String toString() => 'DomainsIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsIdStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

DomainsIdStruct createDomainsIdStruct({
  String? id,
  String? name,
}) =>
    DomainsIdStruct(
      id: id,
      name: name,
    );
