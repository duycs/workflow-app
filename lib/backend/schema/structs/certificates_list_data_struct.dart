// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificatesListDataStruct extends BaseStruct {
  CertificatesListDataStruct({
    CertificatesStruct? data,
  }) : _data = data;

  // "data" field.
  CertificatesStruct? _data;
  CertificatesStruct get data => _data ?? CertificatesStruct();
  set data(CertificatesStruct? val) => _data = val;

  void updateData(Function(CertificatesStruct) updateFn) {
    updateFn(_data ??= CertificatesStruct());
  }

  bool hasData() => _data != null;

  static CertificatesListDataStruct fromMap(Map<String, dynamic> data) =>
      CertificatesListDataStruct(
        data: CertificatesStruct.maybeFromMap(data['data']),
      );

  static CertificatesListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CertificatesListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CertificatesListDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CertificatesListDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: CertificatesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CertificatesListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CertificatesListDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

CertificatesListDataStruct createCertificatesListDataStruct({
  CertificatesStruct? data,
}) =>
    CertificatesListDataStruct(
      data: data ?? CertificatesStruct(),
    );
