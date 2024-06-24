// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InAppPurchaseLocalVerificationDataStruct extends BaseStruct {
  InAppPurchaseLocalVerificationDataStruct({
    String? orderId,
    String? packageName,
    String? productId,
    int? purchaseTime,
    int? purchaseState,
    String? purchaseToken,
    int? quantity,
    bool? acknowledged,
  })  : _orderId = orderId,
        _packageName = packageName,
        _productId = productId,
        _purchaseTime = purchaseTime,
        _purchaseState = purchaseState,
        _purchaseToken = purchaseToken,
        _quantity = quantity,
        _acknowledged = acknowledged;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "packageName" field.
  String? _packageName;
  String get packageName => _packageName ?? '';
  set packageName(String? val) => _packageName = val;

  bool hasPackageName() => _packageName != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "purchaseTime" field.
  int? _purchaseTime;
  int get purchaseTime => _purchaseTime ?? 0;
  set purchaseTime(int? val) => _purchaseTime = val;

  void incrementPurchaseTime(int amount) =>
      purchaseTime = purchaseTime + amount;

  bool hasPurchaseTime() => _purchaseTime != null;

  // "purchaseState" field.
  int? _purchaseState;
  int get purchaseState => _purchaseState ?? 0;
  set purchaseState(int? val) => _purchaseState = val;

  void incrementPurchaseState(int amount) =>
      purchaseState = purchaseState + amount;

  bool hasPurchaseState() => _purchaseState != null;

  // "purchaseToken" field.
  String? _purchaseToken;
  String get purchaseToken => _purchaseToken ?? '';
  set purchaseToken(String? val) => _purchaseToken = val;

  bool hasPurchaseToken() => _purchaseToken != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "acknowledged" field.
  bool? _acknowledged;
  bool get acknowledged => _acknowledged ?? false;
  set acknowledged(bool? val) => _acknowledged = val;

  bool hasAcknowledged() => _acknowledged != null;

  static InAppPurchaseLocalVerificationDataStruct fromMap(
          Map<String, dynamic> data) =>
      InAppPurchaseLocalVerificationDataStruct(
        orderId: data['orderId'] as String?,
        packageName: data['packageName'] as String?,
        productId: data['productId'] as String?,
        purchaseTime: castToType<int>(data['purchaseTime']),
        purchaseState: castToType<int>(data['purchaseState']),
        purchaseToken: data['purchaseToken'] as String?,
        quantity: castToType<int>(data['quantity']),
        acknowledged: data['acknowledged'] as bool?,
      );

  static InAppPurchaseLocalVerificationDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? InAppPurchaseLocalVerificationDataStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'orderId': _orderId,
        'packageName': _packageName,
        'productId': _productId,
        'purchaseTime': _purchaseTime,
        'purchaseState': _purchaseState,
        'purchaseToken': _purchaseToken,
        'quantity': _quantity,
        'acknowledged': _acknowledged,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderId': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'packageName': serializeParam(
          _packageName,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'purchaseTime': serializeParam(
          _purchaseTime,
          ParamType.int,
        ),
        'purchaseState': serializeParam(
          _purchaseState,
          ParamType.int,
        ),
        'purchaseToken': serializeParam(
          _purchaseToken,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'acknowledged': serializeParam(
          _acknowledged,
          ParamType.bool,
        ),
      }.withoutNulls;

  static InAppPurchaseLocalVerificationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InAppPurchaseLocalVerificationDataStruct(
        orderId: deserializeParam(
          data['orderId'],
          ParamType.String,
          false,
        ),
        packageName: deserializeParam(
          data['packageName'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        purchaseTime: deserializeParam(
          data['purchaseTime'],
          ParamType.int,
          false,
        ),
        purchaseState: deserializeParam(
          data['purchaseState'],
          ParamType.int,
          false,
        ),
        purchaseToken: deserializeParam(
          data['purchaseToken'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        acknowledged: deserializeParam(
          data['acknowledged'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'InAppPurchaseLocalVerificationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InAppPurchaseLocalVerificationDataStruct &&
        orderId == other.orderId &&
        packageName == other.packageName &&
        productId == other.productId &&
        purchaseTime == other.purchaseTime &&
        purchaseState == other.purchaseState &&
        purchaseToken == other.purchaseToken &&
        quantity == other.quantity &&
        acknowledged == other.acknowledged;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderId,
        packageName,
        productId,
        purchaseTime,
        purchaseState,
        purchaseToken,
        quantity,
        acknowledged
      ]);
}

InAppPurchaseLocalVerificationDataStruct
    createInAppPurchaseLocalVerificationDataStruct({
  String? orderId,
  String? packageName,
  String? productId,
  int? purchaseTime,
  int? purchaseState,
  String? purchaseToken,
  int? quantity,
  bool? acknowledged,
}) =>
        InAppPurchaseLocalVerificationDataStruct(
          orderId: orderId,
          packageName: packageName,
          productId: productId,
          purchaseTime: purchaseTime,
          purchaseState: purchaseState,
          purchaseToken: purchaseToken,
          quantity: quantity,
          acknowledged: acknowledged,
        );
