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

String sshkey(
  String str,
  String? sshkeyPubKeyEncoding,
  bool boolCheck,
) {
  // Create a key pair from a JWK representation
  var keyPair = new KeyPair.fromJwk({
    "kty": "oct",
    "k": "AyM1SysPpbyDfgZld3umj1qzKObwVMkoqQ-EstJQLr_T-1qS0gZH75"
        "aKtMN3Yj0iPS4hcgUuTwjAzZr1Z9CAow"
  });

  // A key pair has a private and public key, possibly one of them is null, if
  // required info was not available when construction
  // The private key can be used for signing
  var privateKey = keyPair.privateKey;

  // The private key can be used for signing
  var publicKey = keyPair.publicKey;

  // Create a signer for the key using the HMAC/SHA-256 algorithm
  var signer = privateKey?.createSigner(algorithms.signing.hmac.sha256);

  if (boolCheck) {
    return publicKey.toString();
  } else {
    return signer.toString();
  }
}
