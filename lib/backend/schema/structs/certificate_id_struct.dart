// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificateIdStruct extends BaseStruct {
  CertificateIdStruct({
    String? code,
    String? id,
  })  : _code = code,
        _id = id;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static CertificateIdStruct fromMap(Map<String, dynamic> data) =>
      CertificateIdStruct(
        code: data['code'] as String?,
        id: data['id'] as String?,
      );

  static CertificateIdStruct? maybeFromMap(dynamic data) => data is Map
      ? CertificateIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CertificateIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      CertificateIdStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CertificateIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CertificateIdStruct && code == other.code && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([code, id]);
}

CertificateIdStruct createCertificateIdStruct({
  String? code,
  String? id,
}) =>
    CertificateIdStruct(
      code: code,
      id: id,
    );
