// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InAppPurchaseResponseStruct extends BaseStruct {
  InAppPurchaseResponseStruct({
    String? productId,
    String? transactionId,
    String? status,
    String? transactionDate,
    InAppPurchaseVerificationDataStruct? verificationData,
    InAppPurchaseErrorStruct? error,
  })  : _productId = productId,
        _transactionId = transactionId,
        _status = status,
        _transactionDate = transactionDate,
        _verificationData = verificationData,
        _error = error;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  set transactionId(String? val) => _transactionId = val;

  bool hasTransactionId() => _transactionId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "transactionDate" field.
  String? _transactionDate;
  String get transactionDate => _transactionDate ?? '';
  set transactionDate(String? val) => _transactionDate = val;

  bool hasTransactionDate() => _transactionDate != null;

  // "verificationData" field.
  InAppPurchaseVerificationDataStruct? _verificationData;
  InAppPurchaseVerificationDataStruct get verificationData =>
      _verificationData ?? InAppPurchaseVerificationDataStruct();
  set verificationData(InAppPurchaseVerificationDataStruct? val) =>
      _verificationData = val;

  void updateVerificationData(
      Function(InAppPurchaseVerificationDataStruct) updateFn) {
    updateFn(verificationData ??= InAppPurchaseVerificationDataStruct());
  }

  bool hasVerificationData() => _verificationData != null;

  // "error" field.
  InAppPurchaseErrorStruct? _error;
  InAppPurchaseErrorStruct get error => _error ?? InAppPurchaseErrorStruct();
  set error(InAppPurchaseErrorStruct? val) => _error = val;

  void updateError(Function(InAppPurchaseErrorStruct) updateFn) {
    updateFn(error ??= InAppPurchaseErrorStruct());
  }

  bool hasError() => _error != null;

  static InAppPurchaseResponseStruct fromMap(Map<String, dynamic> data) =>
      InAppPurchaseResponseStruct(
        productId: data['productId'] as String?,
        transactionId: data['transactionId'] as String?,
        status: data['status'] as String?,
        transactionDate: data['transactionDate'] as String?,
        verificationData: InAppPurchaseVerificationDataStruct.maybeFromMap(
            data['verificationData']),
        error: InAppPurchaseErrorStruct.maybeFromMap(data['error']),
      );

  static InAppPurchaseResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? InAppPurchaseResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'productId': _productId,
        'transactionId': _transactionId,
        'status': _status,
        'transactionDate': _transactionDate,
        'verificationData': _verificationData?.toMap(),
        'error': _error?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'transactionId': serializeParam(
          _transactionId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'transactionDate': serializeParam(
          _transactionDate,
          ParamType.String,
        ),
        'verificationData': serializeParam(
          _verificationData,
          ParamType.DataStruct,
        ),
        'error': serializeParam(
          _error,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static InAppPurchaseResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InAppPurchaseResponseStruct(
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        transactionId: deserializeParam(
          data['transactionId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        transactionDate: deserializeParam(
          data['transactionDate'],
          ParamType.String,
          false,
        ),
        verificationData: deserializeStructParam(
          data['verificationData'],
          ParamType.DataStruct,
          false,
          structBuilder:
              InAppPurchaseVerificationDataStruct.fromSerializableMap,
        ),
        error: deserializeStructParam(
          data['error'],
          ParamType.DataStruct,
          false,
          structBuilder: InAppPurchaseErrorStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InAppPurchaseResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InAppPurchaseResponseStruct &&
        productId == other.productId &&
        transactionId == other.transactionId &&
        status == other.status &&
        transactionDate == other.transactionDate &&
        verificationData == other.verificationData &&
        error == other.error;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productId,
        transactionId,
        status,
        transactionDate,
        verificationData,
        error
      ]);
}

InAppPurchaseResponseStruct createInAppPurchaseResponseStruct({
  String? productId,
  String? transactionId,
  String? status,
  String? transactionDate,
  InAppPurchaseVerificationDataStruct? verificationData,
  InAppPurchaseErrorStruct? error,
}) =>
    InAppPurchaseResponseStruct(
      productId: productId,
      transactionId: transactionId,
      status: status,
      transactionDate: transactionDate,
      verificationData:
          verificationData ?? InAppPurchaseVerificationDataStruct(),
      error: error ?? InAppPurchaseErrorStruct(),
    );
