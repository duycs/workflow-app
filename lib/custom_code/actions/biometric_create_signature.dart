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

Future<String?> biometricCreateSignature() async {
  final storage = FlutterSecureStorage();
  const privateKeyKey = 'biometric_private_key';
  final random = Random.secure();

  try {
    String? privateKeyPem = await storage.read(key: privateKeyKey);
    if (privateKeyPem == null) {
      throw Exception('Private key not found');
    }

    final data =
        Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));

    String cleanedPem = privateKeyPem
        .replaceAll('-----BEGIN PRIVATE KEY-----', '')
        .replaceAll('-----END PRIVATE KEY-----', '')
        .replaceAll(RegExp(r'[\r\n]+'), '');

    final privateKeyBytes = base64.decode(cleanedPem);

    BigInt bytesToBigInt(List<int> bytes) {
      BigInt result = BigInt.from(0);
      for (int i = 0; i < bytes.length; i++) {
        result += BigInt.from(bytes[bytes.length - 1 - i]) << (8 * i);
      }
      return result;
    }

    final privateKeySequence = ASN1Sequence.fromBytes(privateKeyBytes);
    final privateKey = RSAPrivateKey(
        bytesToBigInt(privateKeySequence.elements[1].valueBytes()), // modulus
        bytesToBigInt(
            privateKeySequence.elements[3].valueBytes()), // privateExponent
        bytesToBigInt(privateKeySequence.elements[4].valueBytes()), // p
        bytesToBigInt(privateKeySequence.elements[5].valueBytes()) // q
        );

    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));

    final signature = signer.generateSignature(data);
    final signatureBytes = signature.bytes;

    return base64.encode(signatureBytes);
  } catch (e) {
    print('Lỗi khi tạo chữ ký: $e');
    return null;
  }
}
