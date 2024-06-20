// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataSettingStruct extends BaseStruct {
  DataSettingStruct({
    int? enableBiometric,
    String? publicKey,
  })  : _enableBiometric = enableBiometric,
        _publicKey = publicKey;

  // "enable_biometric" field.
  int? _enableBiometric;
  int get enableBiometric => _enableBiometric ?? 0;
  set enableBiometric(int? val) => _enableBiometric = val;

  void incrementEnableBiometric(int amount) =>
      enableBiometric = enableBiometric + amount;

  bool hasEnableBiometric() => _enableBiometric != null;

  // "public_key" field.
  String? _publicKey;
  String get publicKey => _publicKey ?? '';
  set publicKey(String? val) => _publicKey = val;

  bool hasPublicKey() => _publicKey != null;

  static DataSettingStruct fromMap(Map<String, dynamic> data) =>
      DataSettingStruct(
        enableBiometric: castToType<int>(data['enable_biometric']),
        publicKey: data['public_key'] as String?,
      );

  static DataSettingStruct? maybeFromMap(dynamic data) => data is Map
      ? DataSettingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'enable_biometric': _enableBiometric,
        'public_key': _publicKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'enable_biometric': serializeParam(
          _enableBiometric,
          ParamType.int,
        ),
        'public_key': serializeParam(
          _publicKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataSettingStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataSettingStruct(
        enableBiometric: deserializeParam(
          data['enable_biometric'],
          ParamType.int,
          false,
        ),
        publicKey: deserializeParam(
          data['public_key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataSettingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataSettingStruct &&
        enableBiometric == other.enableBiometric &&
        publicKey == other.publicKey;
  }

  @override
  int get hashCode => const ListEquality().hash([enableBiometric, publicKey]);
}

DataSettingStruct createDataSettingStruct({
  int? enableBiometric,
  String? publicKey,
}) =>
    DataSettingStruct(
      enableBiometric: enableBiometric,
      publicKey: publicKey,
    );
