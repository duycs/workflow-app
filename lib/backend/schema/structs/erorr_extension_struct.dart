// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErorrExtensionStruct extends BaseStruct {
  ErorrExtensionStruct({
    String? code,
  }) : _code = code;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;
  bool hasCode() => _code != null;

  static ErorrExtensionStruct fromMap(Map<String, dynamic> data) =>
      ErorrExtensionStruct(
        code: data['code'] as String?,
      );

  static ErorrExtensionStruct? maybeFromMap(dynamic data) => data is Map
      ? ErorrExtensionStruct.fromMap(data.cast<String, dynamic>())
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

  static ErorrExtensionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErorrExtensionStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErorrExtensionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErorrExtensionStruct && code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([code]);
}

ErorrExtensionStruct createErorrExtensionStruct({
  String? code,
}) =>
    ErorrExtensionStruct(
      code: code,
    );
