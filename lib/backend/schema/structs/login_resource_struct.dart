// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginResourceStruct extends BaseStruct {
  LoginResourceStruct({
    String? accessToken,
    int? expires,
    String? refreshToken,
  })  : _accessToken = accessToken,
        _expires = expires,
        _refreshToken = refreshToken;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;
  bool hasAccessToken() => _accessToken != null;

  // "expires" field.
  int? _expires;
  int get expires => _expires ?? 0;
  set expires(int? val) => _expires = val;
  void incrementExpires(int amount) => _expires = expires + amount;
  bool hasExpires() => _expires != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;
  bool hasRefreshToken() => _refreshToken != null;

  static LoginResourceStruct fromMap(Map<String, dynamic> data) =>
      LoginResourceStruct(
        accessToken: data['access_token'] as String?,
        expires: castToType<int>(data['expires']),
        refreshToken: data['refresh_token'] as String?,
      );

  static LoginResourceStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginResourceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'expires': _expires,
        'refresh_token': _refreshToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'expires': serializeParam(
          _expires,
          ParamType.int,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginResourceStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginResourceStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        expires: deserializeParam(
          data['expires'],
          ParamType.int,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginResourceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginResourceStruct &&
        accessToken == other.accessToken &&
        expires == other.expires &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([accessToken, expires, refreshToken]);
}

LoginResourceStruct createLoginResourceStruct({
  String? accessToken,
  int? expires,
  String? refreshToken,
}) =>
    LoginResourceStruct(
      accessToken: accessToken,
      expires: expires,
      refreshToken: refreshToken,
    );
