// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchIdStruct extends BaseStruct {
  BranchIdStruct({
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

  static BranchIdStruct fromMap(Map<String, dynamic> data) => BranchIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static BranchIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? BranchIdStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static BranchIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchIdStruct(
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
  String toString() => 'BranchIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BranchIdStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

BranchIdStruct createBranchIdStruct({
  String? id,
  String? name,
}) =>
    BranchIdStruct(
      id: id,
      name: name,
    );
