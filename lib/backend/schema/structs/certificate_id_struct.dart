// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificateIdStruct extends BaseStruct {
  CertificateIdStruct({
    String? code,
  }) : _code = code;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static CertificateIdStruct fromMap(Map<String, dynamic> data) =>
      CertificateIdStruct(
        code: data['code'] as String?,
      );

  static CertificateIdStruct? maybeFromMap(dynamic data) => data is Map
      ? CertificateIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
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
      );

  @override
  String toString() => 'CertificateIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CertificateIdStruct && code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([code]);
}

CertificateIdStruct createCertificateIdStruct({
  String? code,
}) =>
    CertificateIdStruct(
      code: code,
    );
