// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificatesStruct extends BaseStruct {
  CertificatesStruct({
    String? code,
    List<String>? programs,
  })  : _code = code,
        _programs = programs;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "programs" field.
  List<String>? _programs;
  List<String> get programs => _programs ?? const [];
  set programs(List<String>? val) => _programs = val;

  void updatePrograms(Function(List<String>) updateFn) {
    updateFn(_programs ??= []);
  }

  bool hasPrograms() => _programs != null;

  static CertificatesStruct fromMap(Map<String, dynamic> data) =>
      CertificatesStruct(
        code: data['code'] as String?,
        programs: getDataList(data['programs']),
      );

  static CertificatesStruct? maybeFromMap(dynamic data) => data is Map
      ? CertificatesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'programs': _programs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CertificatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CertificatesStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        programs: deserializeParam<String>(
          data['programs'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CertificatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CertificatesStruct &&
        code == other.code &&
        listEquality.equals(programs, other.programs);
  }

  @override
  int get hashCode => const ListEquality().hash([code, programs]);
}

CertificatesStruct createCertificatesStruct({
  String? code,
}) =>
    CertificatesStruct(
      code: code,
    );
