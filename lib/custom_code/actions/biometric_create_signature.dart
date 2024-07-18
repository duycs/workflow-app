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
import 'package:pointycastle/export.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:asn1lib/asn1lib.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:basic_utils/basic_utils.dart';

Future<dynamic> biometricCreateSignature() async {
  final storage = FlutterSecureStorage();
  const privateKeyKey = 'biometric_private_key';
  const emailKey = 'wf_email';

  try {
    String? privateKeyPem = await storage.read(key: privateKeyKey);
    String? email = await storage.read(key: emailKey);

    if (privateKeyPem == null) {
      print('Lỗi khi lấy private key.');
      return null;
    }

    if (email == null) {
      print('Lỗi null trên email.');
      return null;
    }

    final dataToSign = utf8.encode(email);
    final privateKey =
        encrypt.RSAKeyParser().parse(privateKeyPem) as RSAPrivateKey;

    String signature = base64Encode(CryptoUtils.rsaSign(privateKey, dataToSign,
        algorithmName: 'SHA-256/RSA'));

    Map<String, dynamic> result = {'email': email, 'signature': signature};

    return result;
  } catch (e) {
    print('Lỗi khi tạo chữ ký: $e');
    return null;
  }
}
