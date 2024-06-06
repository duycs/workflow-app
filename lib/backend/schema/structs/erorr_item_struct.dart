// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErorrItemStruct extends BaseStruct {
  ErorrItemStruct({
    String? message,
    ErorrExtensionStruct? extensions,
  })  : _message = message,
        _extensions = extensions;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "extensions" field.
  ErorrExtensionStruct? _extensions;
  ErorrExtensionStruct get extensions => _extensions ?? ErorrExtensionStruct();
  set extensions(ErorrExtensionStruct? val) => _extensions = val;
  void updateExtensions(Function(ErorrExtensionStruct) updateFn) =>
      updateFn(_extensions ??= ErorrExtensionStruct());
  bool hasExtensions() => _extensions != null;

  static ErorrItemStruct fromMap(Map<String, dynamic> data) => ErorrItemStruct(
        message: data['message'] as String?,
        extensions: ErorrExtensionStruct.maybeFromMap(data['extensions']),
      );

  static ErorrItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ErorrItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'extensions': _extensions?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'extensions': serializeParam(
          _extensions,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ErorrItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErorrItemStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        extensions: deserializeStructParam(
          data['extensions'],
          ParamType.DataStruct,
          false,
          structBuilder: ErorrExtensionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ErorrItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErorrItemStruct &&
        message == other.message &&
        extensions == other.extensions;
  }

  @override
  int get hashCode => const ListEquality().hash([message, extensions]);
}

ErorrItemStruct createErorrItemStruct({
  String? message,
  ErorrExtensionStruct? extensions,
}) =>
    ErorrItemStruct(
      message: message,
      extensions: extensions ?? ErorrExtensionStruct(),
    );
