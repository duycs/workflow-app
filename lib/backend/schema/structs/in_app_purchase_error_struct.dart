// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InAppPurchaseErrorStruct extends BaseStruct {
  InAppPurchaseErrorStruct({
    String? code,
    String? message,
  })  : _code = code,
        _message = message;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static InAppPurchaseErrorStruct fromMap(Map<String, dynamic> data) =>
      InAppPurchaseErrorStruct(
        code: data['code'] as String?,
        message: data['message'] as String?,
      );

  static InAppPurchaseErrorStruct? maybeFromMap(dynamic data) => data is Map
      ? InAppPurchaseErrorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static InAppPurchaseErrorStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InAppPurchaseErrorStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InAppPurchaseErrorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InAppPurchaseErrorStruct &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([code, message]);
}

InAppPurchaseErrorStruct createInAppPurchaseErrorStruct({
  String? code,
  String? message,
}) =>
    InAppPurchaseErrorStruct(
      code: code,
      message: message,
    );
