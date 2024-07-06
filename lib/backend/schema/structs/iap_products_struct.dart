// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IapProductsStruct extends BaseStruct {
  IapProductsStruct({
    String? id,
    String? status,
    String? iapGoogleProductId,
    String? iapAppleProductId,
    int? price,
  })  : _id = id,
        _status = status,
        _iapGoogleProductId = iapGoogleProductId,
        _iapAppleProductId = iapAppleProductId,
        _price = price;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "iap_google_product_id" field.
  String? _iapGoogleProductId;
  String get iapGoogleProductId => _iapGoogleProductId ?? '';
  set iapGoogleProductId(String? val) => _iapGoogleProductId = val;

  bool hasIapGoogleProductId() => _iapGoogleProductId != null;

  // "iap_apple_product_id" field.
  String? _iapAppleProductId;
  String get iapAppleProductId => _iapAppleProductId ?? '';
  set iapAppleProductId(String? val) => _iapAppleProductId = val;

  bool hasIapAppleProductId() => _iapAppleProductId != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static IapProductsStruct fromMap(Map<String, dynamic> data) =>
      IapProductsStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        iapGoogleProductId: data['iap_google_product_id'] as String?,
        iapAppleProductId: data['iap_apple_product_id'] as String?,
        price: castToType<int>(data['price']),
      );

  static IapProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? IapProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'iap_google_product_id': _iapGoogleProductId,
        'iap_apple_product_id': _iapAppleProductId,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'iap_google_product_id': serializeParam(
          _iapGoogleProductId,
          ParamType.String,
        ),
        'iap_apple_product_id': serializeParam(
          _iapAppleProductId,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
      }.withoutNulls;

  static IapProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      IapProductsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        iapGoogleProductId: deserializeParam(
          data['iap_google_product_id'],
          ParamType.String,
          false,
        ),
        iapAppleProductId: deserializeParam(
          data['iap_apple_product_id'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IapProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IapProductsStruct &&
        id == other.id &&
        status == other.status &&
        iapGoogleProductId == other.iapGoogleProductId &&
        iapAppleProductId == other.iapAppleProductId &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, status, iapGoogleProductId, iapAppleProductId, price]);
}

IapProductsStruct createIapProductsStruct({
  String? id,
  String? status,
  String? iapGoogleProductId,
  String? iapAppleProductId,
  int? price,
}) =>
    IapProductsStruct(
      id: id,
      status: status,
      iapGoogleProductId: iapGoogleProductId,
      iapAppleProductId: iapAppleProductId,
      price: price,
    );
