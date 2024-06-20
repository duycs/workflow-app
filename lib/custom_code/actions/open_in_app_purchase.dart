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

import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

extension PurchaseDetailsExtension on PurchaseDetails {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'productId': productID,
      'transactionId': purchaseID,
      'status': status.toString(),
      'transactionDate': transactionDate,
      'verificationData': {
        'localVerificationData': verificationData.localVerificationData,
        'serverVerificationData': verificationData.serverVerificationData,
        'source': verificationData.source,
      },
      'error': error != null
          ? {
              'code': error!.code,
              'message': error!.message,
            }
          : null,
    };

    // Chỉ thêm thông tin skPaymentTransaction nếu đang chạy trên iOS
    if (!kIsWeb && Platform.isIOS && this is SKPaymentTransactionWrapper) {
      final SKPaymentTransactionWrapper iosDetails =
          this as SKPaymentTransactionWrapper;
      data['skPaymentTransaction'] = {
        'transactionIdentifier': iosDetails.transactionIdentifier,
        'transactionDate': iosDetails.transactionTimeStamp,
        'transactionState': iosDetails.transactionState.toString(),
      };
    }
    // Chỉ thêm thông tin bổ sung nếu đang chạy trên iOS
    if (!kIsWeb && Platform.isIOS) {
      data['ios'] = {
        'transactionIdentifier':
            (this as SKPaymentTransactionWrapper).transactionIdentifier,
        'transactionDate':
            (this as SKPaymentTransactionWrapper).transactionTimeStamp,
        'transactionState':
            (this as SKPaymentTransactionWrapper).transactionState.toString(),
      };
    }

    return data;
  }
}

Future<dynamic> openInAppPurchase(String productId, bool isConsumable) async {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  // Kiểm tra xem Google Pay có khả dụng không
  final bool available = await _inAppPurchase.isAvailable();
  if (!available) {
    throw PlatformException(code: 'Google Pay không khả dụng');
  }

  // Tạo danh sách các sản phẩm cần mua
  final ProductDetailsResponse response =
      await _inAppPurchase.queryProductDetails({productId});
  final List<ProductDetails> products = response.productDetails;

  if (products.isEmpty) {
    throw PlatformException(code: 'Không tìm thấy sản phẩm');
  }

  // Mở Google Pay để thanh toán
  final PurchaseParam purchaseParam =
      PurchaseParam(productDetails: products.first);

  if (isConsumable) {
    _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
  } else {
    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  // Lắng nghe kết quả thanh toán
  final Completer<String> completer = Completer<String>();
  _inAppPurchase.purchaseStream
      .listen((List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.purchased) {
        // Thanh toán thành công, trả về thông tin giao dịch dưới dạng JSON
        final transactionInfo = jsonEncode(purchaseDetails.toJson());
        completer.complete(transactionInfo);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        // Thanh toán thất bại, trả về thông tin lỗi dưới dạng JSON
        final errorInfo = jsonEncode(purchaseDetails.toJson());
        completer.complete(errorInfo);
      }
    }
  });

  return completer.future;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
