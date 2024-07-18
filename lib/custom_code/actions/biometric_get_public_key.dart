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
import '/custom_code/actions/biometric_create_public_key.dart' as create_block;

Future<String?> biometricGetPublicKey() async {
  final storage = FlutterSecureStorage();
  const publicKeyKey = 'biometric_public_key';
  const emailKey = 'wf_email';

  try {
    String? publicKeyPem = await storage.read(key: publicKeyKey);
    String? email = await storage.read(key: emailKey);

    if (publicKeyPem == null) {
      print('Không tồn tại public key.');
      return null;
    }

    return base64Encode(utf8.encode(publicKeyPem));
  } catch (e) {
    print('Lỗi khi lấy public key: $e');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
