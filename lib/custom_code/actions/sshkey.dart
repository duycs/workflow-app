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

import 'dart:convert';

import 'dart:typed_data';
import 'package:pointycastle/export.dart';

String sshkey(
  String str,
  String? sshkeyPubKeyEncoding,
  bool boolCheck,
) {
  // Mã hóa chuỗi thành Base64
  String code = '${str} eworkflow';
  String encodedString = base64.encode(utf8.encode(code));
  return encodedString;
}

AsymmetricKeyPair generateRsaKeyPair() {
  final secureRandom = SecureRandom('Fortuna')
    ..seed(KeyParameter(Uint8List.fromList('seed'.codeUnits)));

  final keyGen = RSAKeyGenerator()
    ..init(ParametersWithRandom(
      RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64),
      secureRandom,
    ));

  return keyGen.generateKeyPair();
}

Uint8List publicKeyToBytes(RSAPublicKey publicKey) {
  final modulus = publicKey.modulus!;
  final exponent = publicKey.exponent!;

  final modulusBytes = _encodeBigInt(modulus);
  final exponentBytes = _encodeBigInt(exponent);

  final bytes = Uint8List(modulusBytes.length + exponentBytes.length);
  bytes.setRange(0, modulusBytes.length, modulusBytes);
  bytes.setRange(modulusBytes.length, bytes.length, exponentBytes);

  return bytes;
}

Uint8List _encodeBigInt(BigInt number) {
  final data = number.toRadixString(16);
  final padding = (data.length % 2 == 1)
      ? '0$data'
      : data; // Ensure even number of characters
  return Uint8List.fromList(List.generate(padding.length ~/ 2,
      (i) => int.parse(padding.substring(2 * i, 2 * i + 2), radix: 16)));
}
