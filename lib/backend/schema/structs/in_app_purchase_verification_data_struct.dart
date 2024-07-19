// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InAppPurchaseVerificationDataStruct extends BaseStruct {
  InAppPurchaseVerificationDataStruct({
    InAppPurchaseLocalVerificationDataStruct? localVerificationData,
    String? serverVerificationData,
    String? source,
  })  : _localVerificationData = localVerificationData,
        _serverVerificationData = serverVerificationData,
        _source = source;

  // "localVerificationData" field.
  InAppPurchaseLocalVerificationDataStruct? _localVerificationData;
  InAppPurchaseLocalVerificationDataStruct get localVerificationData =>
      _localVerificationData ?? InAppPurchaseLocalVerificationDataStruct();
  set localVerificationData(InAppPurchaseLocalVerificationDataStruct? val) =>
      _localVerificationData = val;

  void updateLocalVerificationData(
      Function(InAppPurchaseLocalVerificationDataStruct) updateFn) {
    updateFn(
        _localVerificationData ??= InAppPurchaseLocalVerificationDataStruct());
  }

  bool hasLocalVerificationData() => _localVerificationData != null;

  // "serverVerificationData" field.
  String? _serverVerificationData;
  String get serverVerificationData => _serverVerificationData ?? '';
  set serverVerificationData(String? val) => _serverVerificationData = val;

  bool hasServerVerificationData() => _serverVerificationData != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  static InAppPurchaseVerificationDataStruct fromMap(
          Map<String, dynamic> data) =>
      InAppPurchaseVerificationDataStruct(
        localVerificationData:
            InAppPurchaseLocalVerificationDataStruct.maybeFromMap(
                data['localVerificationData']),
        serverVerificationData: data['serverVerificationData'] as String?,
        source: data['source'] as String?,
      );

  static InAppPurchaseVerificationDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? InAppPurchaseVerificationDataStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'localVerificationData': _localVerificationData?.toMap(),
        'serverVerificationData': _serverVerificationData,
        'source': _source,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localVerificationData': serializeParam(
          _localVerificationData,
          ParamType.DataStruct,
        ),
        'serverVerificationData': serializeParam(
          _serverVerificationData,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
      }.withoutNulls;

  static InAppPurchaseVerificationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InAppPurchaseVerificationDataStruct(
        localVerificationData: deserializeStructParam(
          data['localVerificationData'],
          ParamType.DataStruct,
          false,
          structBuilder:
              InAppPurchaseLocalVerificationDataStruct.fromSerializableMap,
        ),
        serverVerificationData: deserializeParam(
          data['serverVerificationData'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InAppPurchaseVerificationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InAppPurchaseVerificationDataStruct &&
        localVerificationData == other.localVerificationData &&
        serverVerificationData == other.serverVerificationData &&
        source == other.source;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([localVerificationData, serverVerificationData, source]);
}

InAppPurchaseVerificationDataStruct createInAppPurchaseVerificationDataStruct({
  InAppPurchaseLocalVerificationDataStruct? localVerificationData,
  String? serverVerificationData,
  String? source,
}) =>
    InAppPurchaseVerificationDataStruct(
      localVerificationData:
          localVerificationData ?? InAppPurchaseLocalVerificationDataStruct(),
      serverVerificationData: serverVerificationData,
      source: source,
    );
