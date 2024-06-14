// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdStruct extends BaseStruct {
  IdStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static IdStruct fromMap(Map<String, dynamic> data) => IdStruct(
        id: data['id'] as String?,
      );

  static IdStruct? maybeFromMap(dynamic data) =>
      data is Map ? IdStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static IdStruct fromSerializableMap(Map<String, dynamic> data) => IdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

IdStruct createIdStruct({
  String? id,
}) =>
    IdStruct(
      id: id,
    );
