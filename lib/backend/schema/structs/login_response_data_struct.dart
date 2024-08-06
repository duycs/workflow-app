// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginResponseDataStruct extends BaseStruct {
  LoginResponseDataStruct({
    LoginResponseStruct? data,
  }) : _data = data;

  // "data" field.
  LoginResponseStruct? _data;
  LoginResponseStruct get data => _data ?? LoginResponseStruct();
  set data(LoginResponseStruct? val) => _data = val;

  void updateData(Function(LoginResponseStruct) updateFn) {
    updateFn(_data ??= LoginResponseStruct());
  }

  bool hasData() => _data != null;

  static LoginResponseDataStruct fromMap(Map<String, dynamic> data) =>
      LoginResponseDataStruct(
        data: LoginResponseStruct.maybeFromMap(data['data']),
      );

  static LoginResponseDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginResponseDataStruct.fromMap(data.cast<String, dynamic>())
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

  static LoginResponseDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LoginResponseDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: LoginResponseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LoginResponseDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginResponseDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LoginResponseDataStruct createLoginResponseDataStruct({
  LoginResponseStruct? data,
}) =>
    LoginResponseDataStruct(
      data: data ?? LoginResponseStruct(),
    );
