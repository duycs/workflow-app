// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainsIdMarketStruct extends BaseStruct {
  DomainsIdMarketStruct({
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

  static DomainsIdMarketStruct fromMap(Map<String, dynamic> data) =>
      DomainsIdMarketStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static DomainsIdMarketStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainsIdMarketStruct.fromMap(data.cast<String, dynamic>())
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

  static DomainsIdMarketStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainsIdMarketStruct(
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
  String toString() => 'DomainsIdMarketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainsIdMarketStruct &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

DomainsIdMarketStruct createDomainsIdMarketStruct({
  String? id,
  String? name,
}) =>
    DomainsIdMarketStruct(
      id: id,
      name: name,
    );
