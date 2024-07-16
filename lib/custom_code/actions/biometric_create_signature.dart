// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:asn1lib/asn1lib.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:basic_utils/basic_utils.dart';

Future<String?> biometricCreateSignature() async {
  final storage = FlutterSecureStorage();
  const privateKeyKey = 'biometric_private_key';
  final dataToSign = utf8.encode('hanoi@mail.com');

  try {
    String? privateKeyPem = await storage.read(key: privateKeyKey);
  
    if (publicKeyPem == null || privateKeyPem == null) {
      print('Lỗi khi lấy hoặc tạo public key: $e');
      return null;
    }

    final privateKey =
        encrypt.RSAKeyParser().parse(privateKeyPem) as RSAPrivateKey;

    return base64Encode(CryptoUtils.rsaPssSign(privateKey, dataToSign, algorithm: 'SHA-256/PSS'));
  } catch (e) {
    print('Lỗi khi tạo chữ ký: $e');
    return null;
  }
}