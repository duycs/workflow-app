// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesListStruct extends BaseStruct {
  CategoriesListStruct({
    String? id,
    String? status,
    String? name,
  })  : _id = id,
        _status = status,
        _name = name;

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

  static CategoriesListStruct fromMap(Map<String, dynamic> data) =>
      CategoriesListStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
      );

  static CategoriesListStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'name': _name,
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
      }.withoutNulls;

  static CategoriesListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesListStruct(
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
      );

  @override
  String toString() => 'CategoriesListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriesListStruct &&
        id == other.id &&
        status == other.status &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, status, name]);
}

CategoriesListStruct createCategoriesListStruct({
  String? id,
  String? status,
  String? name,
}) =>
    CategoriesListStruct(
      id: id,
      status: status,
      name: name,
    );
