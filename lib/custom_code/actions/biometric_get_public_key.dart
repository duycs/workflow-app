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
  const privateKeyKey = 'biometric_private_key';

  try {
    String? storedPublicKey = await storage.read(key: publicKeyKey);
    String? storedPrivateKey = await storage.read(key: privateKeyKey);

    if (storedPublicKey != null && storedPrivateKey != null) {
      if (await _verifyKeyPair(storedPublicKey, storedPrivateKey)) {
        return base64.encode(utf8.encode(storedPublicKey));
      }
    }

    // Tạo cặp khóa mới nếu không tồn tại hoặc xác thực thất bại
    return await create_block.biometricCreatePublicKey();
  } catch (e) {
    print('Lỗi khi lấy hoặc tạo public key: $e');
    return null;
  }
}

Future<bool> _verifyKeyPair(String publicKeyPem, String privateKeyPem) async {
  try {
    RSAPublicKey publicKey = _decodePublicKeyFromPem(publicKeyPem);
    RSAPrivateKey privateKey = _decodePrivateKeyFromPem(privateKeyPem);

    final random = Random.secure();
    final data =
        Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));

    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));
    final signature = signer.generateSignature(data);

    final verifier = RSASigner(SHA256Digest(), '0609608648016503040201');
    verifier.init(false, PublicKeyParameter<RSAPublicKey>(publicKey));
    return verifier.verifySignature(data, signature);
  } catch (e) {
    print('Lỗi khi xác thực cặp khóa: $e');
    return false;
  }
}

RSAPublicKey _decodePublicKeyFromPem(String publicKeyPem) {
  final pemContent = publicKeyPem
      .replaceAll('-----BEGIN PUBLIC KEY-----', '')
      .replaceAll('-----END PUBLIC KEY-----', '')
      .replaceAll('\n', '');
  final asn1Bytes = base64.decode(pemContent);
  final asn1Parser = ASN1Parser(asn1Bytes);
  final topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
  final publicKeyBitString = topLevelSeq.elements[1] as ASN1BitString;
  final publicKeyAsn = ASN1Parser(publicKeyBitString.valueBytes());
  final publicKeySeq = publicKeyAsn.nextObject() as ASN1Sequence;
  final modulus = publicKeySeq.elements[0] as ASN1Integer;
  final exponent = publicKeySeq.elements[1] as ASN1Integer;
  return RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);
}

RSAPrivateKey _decodePrivateKeyFromPem(String privateKeyPem) {
  final pemContent = privateKeyPem
      .replaceAll('-----BEGIN PRIVATE KEY-----', '')
      .replaceAll('-----END PRIVATE KEY-----', '')
      .replaceAll('\n', '');
  final asn1Bytes = base64.decode(pemContent);
  final asn1Parser = ASN1Parser(asn1Bytes);
  final topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
  final privateKey = topLevelSeq.elements[2] as ASN1OctetString;
  final keyAsn = ASN1Parser(privateKey.octets);
  final pkSeq = keyAsn.nextObject() as ASN1Sequence;

  final modulus = pkSeq.elements[1] as ASN1Integer;
  final privateExponent = pkSeq.elements[3] as ASN1Integer;
  final p = pkSeq.elements[4] as ASN1Integer;
  final q = pkSeq.elements[5] as ASN1Integer;

  return RSAPrivateKey(
    modulus.valueAsBigInteger,
    privateExponent.valueAsBigInteger,
    p.valueAsBigInteger,
    q.valueAsBigInteger,
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
