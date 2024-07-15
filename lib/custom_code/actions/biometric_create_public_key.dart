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

// import '/flutter_flow/custom_functions.dart'; // Imports custom functions

import 'index.dart'; // Imports other custom actions

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:asn1lib/asn1lib.dart';

Future<String?> biometricCreatePublicKey() async {
  final storage = FlutterSecureStorage();
  const publicKeyKey = 'biometric_public_key';
  const privateKeyKey = 'biometric_private_key';

  try {
    AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keyPair =
        _generateRSAKeyPair();

    String publicKeyPem = _encodePublicKeyToPem(keyPair.publicKey);
    String privateKeyPem = _encodePrivateKeyToPem(keyPair.privateKey);

    await storage.write(key: publicKeyKey, value: publicKeyPem);
    await storage.write(key: privateKeyKey, value: privateKeyPem);

    return base64.encode(utf8.encode(publicKeyPem));
  } catch (e) {
    print('Lỗi khi tạo cặp khóa mới: $e');
    return null;
  }
}

AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> _generateRSAKeyPair() {
  final secureRandom = FortunaRandom();

  // Khởi tạo FortunaRandom với seed
  final seedSource = Random.secure();
  final seeds = List<int>.generate(32, (_) => seedSource.nextInt(256));
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

  final keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64);
  final keyGenerator = RSAKeyGenerator()
    ..init(ParametersWithRandom(keyParams, secureRandom));

  final pair = keyGenerator.generateKeyPair();
  final publicKey = pair.publicKey as RSAPublicKey;
  final privateKey = pair.privateKey as RSAPrivateKey;

  return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(publicKey, privateKey);
}

String _encodePublicKeyToPem(RSAPublicKey publicKey) {
  final algorithmSeq = ASN1Sequence();
  final algorithmAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList(
      [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
  final paramsAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
  algorithmSeq.add(algorithmAsn1Obj);
  algorithmSeq.add(paramsAsn1Obj);

  final publicKeySeq = ASN1Sequence();
  publicKeySeq.add(ASN1Integer(publicKey.modulus!));
  publicKeySeq.add(ASN1Integer(publicKey.exponent!));
  final publicKeySeqBitString =
      ASN1BitString(Uint8List.fromList(publicKeySeq.encodedBytes));

  final topLevelSeq = ASN1Sequence();
  topLevelSeq.add(algorithmSeq);
  topLevelSeq.add(publicKeySeqBitString);
  final dataBase64 = base64.encode(topLevelSeq.encodedBytes);

  return """-----BEGIN PUBLIC KEY-----\r\n$dataBase64\r\n-----END PUBLIC KEY-----""";
}

String _encodePrivateKeyToPem(RSAPrivateKey privateKey) {
  final topLevelSeq = ASN1Sequence();
  topLevelSeq.add(ASN1Integer(BigInt.from(0))); // Version
  topLevelSeq.add(ASN1Integer(privateKey.n!));
  topLevelSeq.add(ASN1Integer(privateKey.exponent!));
  topLevelSeq.add(ASN1Integer(privateKey.privateExponent!));
  topLevelSeq.add(ASN1Integer(privateKey.p!));
  topLevelSeq.add(ASN1Integer(privateKey.q!));
  topLevelSeq.add(ASN1Integer(
      privateKey.privateExponent! % (privateKey.p! - BigInt.from(1))));
  topLevelSeq.add(ASN1Integer(
      privateKey.privateExponent! % (privateKey.q! - BigInt.from(1))));
  topLevelSeq.add(ASN1Integer(privateKey.q!.modInverse(privateKey.p!)));

  final dataBase64 = base64.encode(topLevelSeq.encodedBytes);

  return """-----BEGIN PRIVATE KEY-----\r\n$dataBase64\r\n-----END PRIVATE KEY-----""";
}
