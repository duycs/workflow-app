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

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:basic_utils/basic_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> biometricCreatePublicKey() async {
  final storage = FlutterSecureStorage();
  const publicKeyKey = 'biometric_public_key';
  const privateKeyKey = 'biometric_private_key';
  const emailKey = 'wf_email';

  try {
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair =
        CryptoUtils.generateRSAKeyPair();

    String publicKeyPem =
        CryptoUtils.encodeRSAPublicKeyToPem(keyPair.publicKey as RSAPublicKey);
    String privateKeyPem = CryptoUtils.encodeRSAPrivateKeyToPem(
        keyPair.privateKey as RSAPrivateKey);

    await storage.write(key: publicKeyKey, value: publicKeyPem);
    await storage.write(key: privateKeyKey, value: privateKeyPem);

    // Lấy email từ SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('wf_email');

    // Lưu email vào FlutterSecureStorage
    if (email != null) {
      await storage.write(key: emailKey, value: email);
    }

    return base64.encode(utf8.encode(publicKeyPem));
  } catch (e) {
    print('Lỗi khi tạo cặp khóa mới: $e');
    return null;
  }
}
