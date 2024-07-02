// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

extension PurchaseDetailsExtension on AppStorePurchaseDetails {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'productId': productID,
      'transactionId': purchaseID,
      'status': status.toString(),
      'transactionDate': transactionDate,
      'verificationData': {
        'localVerificationData': {
          'purchaseToken': verificationData.localVerificationData,
          'productId': skPaymentTransaction.payment.productIdentifier,
          'quantity': skPaymentTransaction.payment.quantity,
        },
        'serverVerificationData': verificationData.serverVerificationData,
        'source': verificationData.source,
      },
      'skPaymentTransaction': {
        'transactionIdentifier': skPaymentTransaction.transactionIdentifier,
        'transactionTimeStamp': skPaymentTransaction.transactionTimeStamp,
        'transactionState': skPaymentTransaction.transactionState.toString(),
        'payment': {
          'productIdentifier': skPaymentTransaction.payment.productIdentifier,
          'quantity': skPaymentTransaction.payment.quantity,
        },
      },
      'error': error != null
          ? {
              'code': error!.code,
              'message': error!.message,
            }
          : null,
    };

    return data;
  }
}

Future<dynamic> openAppleInAppPurchases(
    String productId, bool isConsumable) async {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  // productId = 'com.pexnic.comos.product_129k';

  // Kiểm tra xem Google Pay có khả dụng không
  final bool available = await _inAppPurchase.isAvailable();
  if (!available) {
    return jsonEncode({
      'productId': productId,
      'error': {
        'code': '01',
        'message':
            'Phương thức thanh toán không khả dụng. Bạn vui lòng quay lại sau.'
      }
    });
  }

  // Tạo danh sách các sản phẩm cần mua
  final ProductDetailsResponse response =
      await _inAppPurchase.queryProductDetails({
    productId,
  });
  final List<ProductDetails> products = response.productDetails;

  if (products.isEmpty) {
    return jsonEncode({
      'productId': productId,
      'error': {
        'code': '02',
        'message':
            'Sản phẩm không khả dụng trên Store. Bạn vui lòng quay lại sau.'
      }
    });
  }

  // Lắng nghe các giao dịch đang chờ xử lý và hoàn tất chúng
  final Completer<String> completer = Completer<String>();
  _inAppPurchase.purchaseStream
      .listen((List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  });

  // Mở UI thanh toán
  final PurchaseParam purchaseParam =
      PurchaseParam(productDetails: products.first);

  int retryCount = 0;
  const int maxRetries = 3;

  while (retryCount < maxRetries) {
    try {
      if (isConsumable) {
        _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
      } else {
        _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      }
      break; // Thoát khỏi vòng lặp nếu không có lỗi
    } on PlatformException catch (e) {
      if (e.code == 'storekit_duplicate_product_object') {
        // Hoàn tất giao dịch đang chờ xử lý
        final List<PurchaseDetails> pendingPurchases =
            await _inAppPurchase.purchaseStream.first;
        for (var purchase in pendingPurchases) {
          if (purchase.productID == productId &&
              purchase.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchase);
          }
        }
        retryCount++;
      } else {
        rethrow;
      }
    }
  }

  if (retryCount == maxRetries) {
    return jsonEncode({
      'productId': productId,
      'error': {
        'code': '03',
        'message': 'Không thể hoàn tất giao dịch sau nhiều lần thử.'
      }
    });
  }

  // Lắng nghe kết quả thanh toán
  _inAppPurchase.purchaseStream
      .listen((List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      var data = purchaseDetails as AppStorePurchaseDetails;
      if (purchaseDetails.status == PurchaseStatus.purchased) {
        // Thanh toán thành công, trả về thông tin giao dịch dưới dạng JSON
        final transactionInfo = jsonEncode(data.toJson());
        completer.complete(transactionInfo);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        // Thanh toán thất bại, trả về thông tin lỗi dưới dạng JSON
        final errorInfo = jsonEncode(data.toJson());
        completer.complete(errorInfo);
      }

      // Hoàn tất giao dịch
      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  });

  return completer.future;
}
