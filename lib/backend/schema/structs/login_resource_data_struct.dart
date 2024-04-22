// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginResourceDataStruct extends BaseStruct {
  LoginResourceDataStruct({
    LoginResourceStruct? data,
  }) : _data = data;

  // "data" field.
  LoginResourceStruct? _data;
  LoginResourceStruct get data => _data ?? LoginResourceStruct();
  set data(LoginResourceStruct? val) => _data = val;
  void updateData(Function(LoginResourceStruct) updateFn) =>
      updateFn(_data ??= LoginResourceStruct());
  bool hasData() => _data != null;

  static LoginResourceDataStruct fromMap(Map<String, dynamic> data) =>
      LoginResourceDataStruct(
        data: LoginResourceStruct.maybeFromMap(data['data']),
      );

  static LoginResourceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginResourceDataStruct.fromMap(data.cast<String, dynamic>())
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

  static LoginResourceDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LoginResourceDataStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: LoginResourceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LoginResourceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginResourceDataStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LoginResourceDataStruct createLoginResourceDataStruct({
  LoginResourceStruct? data,
}) =>
    LoginResourceDataStruct(
      data: data ?? LoginResourceStruct(),
    );
