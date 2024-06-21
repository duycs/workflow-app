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
import 'package:crypto_keys/crypto_keys.dart';
import 'dart:typed_data';

String? sshkey(
  String str,
  String? sshkeyPubKeyEncoding,
  bool boolCheck,
) {
  // Create a key pair from a JWK representation
  var keyPair = new KeyPair.fromJwk({
    "kty": str,
    "k": "AyM1SysPpbyDfgZld3umj1qzKObwVMkoqQ-EstJQLr_T-1qS0gZH75"
        "aKtMN3Yj0iPS4hcgUuTwjAzZr1Z9CAow"
  });

  // The private key can be used for signing
  var publicKey = keyPair.publicKey;

  // A key pair has a private and public key, possibly one of them is null, if
  // required info was not available when construction
  // The private key can be used for signing
  var privateKey = keyPair.privateKey;

  // Create a signer for the key using the HMAC/SHA-256 algorithm
  var signer = privateKey?.createSigner(algorithms.signing.hmac.sha256);
  var signature = signer?.sign(str.codeUnits);

  print('123213');
  var hexPublickey = publicKey.hashCode.toRadixString(16);
  var hexSignature = signature?.data.hashCode.toRadixString(16);
  print(hexPublickey);
  print(hexSignature);
  //     {curve = 'secp256r1'}) {
  //   var param =
  //       curve == 'secp256r1' ? ECCurve_secp256r1() : ECCurve_secp256k1();
  //   var keyParams = ECKeyGeneratorParameters(param);

  //   var random = FortunaRandom();
  //   random.seed(KeyParameter(_seed()));

  //   var generator = ECKeyGenerator();
  //   generator.init(ParametersWithRandom(keyParams, random));

  //   return generator.generateKeyPair();

  // Uint8List _seed() {
  //   var random = Random.secure();
  //   var seed = List<int>.generate(32, (_) => random.nextInt(256));
  //   return Uint8List.fromList(seed);
  // }

  // ;
  // print(AsymmetricKeyPair(publicKey, privateKey));
  if (boolCheck) {
    return hexPublickey;
  } else {
    return hexSignature;
  }
}
