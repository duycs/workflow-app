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
import 'package:fast_rsa/fast_rsa.dart';

Future<String?> sshkey(
  String str,
  String? sshkeyPubKeyEncoding,
  bool boolCheck,
) async {
  // // Create a key pair from a JWK representation
  // var keyPair = new KeyPair.fromJwk({
  //   "kty": "oct",
  //   "k": "AyM1SysPpbyDfgZld3umj1qzKObwVMkoqQ-EstJQLr_T-1qS0gZH75"
  //       "aKtMN3Yj0iPS4hcgUuTwjAzZr1Z9CAow"
  // });

  // // The private key can be used for signing
  // var publicKey = keyPair.publicKey;

  // // A key pair has a private and public key, possibly one of them is null, if
  // // required info was not available when construction
  // // The private key can be used for signing
  // var privateKey = keyPair.privateKey;

  // // Create a signer for the key using the HMAC/SHA-256 algorithm
  // var signer = privateKey?.createSigner(algorithms.signing.hmac.sha256);
  // var signature = signer?.sign(str.codeUnits);
  // var hexPublickey = publicKey.hashCode.toRadixString(16);
  // var hexSignature = signature?.data.hashCode.toRadixString(16);
  // print('hexSignature');
  // print(hexSignature);
  // if (boolCheck) {
  //   return hexPublickey;
  // } else {
  //   return hexSignature;
  // }
  try {
    PKCS12KeyPair _pkcs12KeyPair = PKCS12KeyPair("", "", "");

    const pkcs12 =
        '''MIIQSQIBAzCCEA8GCSqGSIb3DQEHAaCCEAAEgg/8MIIP+DCCBi8GCSqGSIb3DQEHBqCCBiAwggYcAgEAMIIGFQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQI/pTmUKFwK/UCAggAgIIF6N5rjkv/eidrXYlkrkyl2EBNfK8hQU+cJt0lkLt6zVC+ddNWTHJW4R98rhFGqYvSRHP13H65Pq+zG8nFu4WyRog3qO/rOcQPNCFeJQ1k1RUa7HSxUgjki8s7WG+EsuA39jqZDrVDdaU2gWrgR9Oj5d5/zITYu7Rr37I+S1es9otUBusYPd/YaNwtWyLuZJikDjQuMxtHEzyRshu0fylDloTFLGSmdQQR2DxQDWffoi3Hq1Ga7KoDW9kgqZPAyOOeRf24Y3dqNYJbJ9Sk5w5GNQldGy++LH26fhcu+/fXMxjq590Z2mJguDGbKf4JtAXEaFQGE7UQFULjdh4dmfl45Wv4rhfyst+BA6wvW3EClJ3/7a/pmtM0SmiGmIxKO3AYsqCljkRJvpE5Ph5SmsX8HJQBMX0AkYzQI9KmSuCyuze64y4VmW0ZLxfL/rmJn1UIywaznQcE/f2eN52K39eo96P1rY19hbTx+b+pSTnpFnxf8evkbVvLKLug0ifZcw+cIF+AeUS/SRVA06icC6ul2vdAsc78tlSXkVBzV/dj1ohIU6i3atO7Lz+OIHRlh02IVtCW/Pwgm44kmxYu6ZM3P1uQjVympBkelD/4wBLdZMCUwP4z9wGD9gQUVzxspwL3d9NHRdd1JLVFxoLG0kmt1zj2EEMTyPuHtGMyzhRRM6qDu11JUTDgyO1dFHmWqBbWyrPe1gAaGvZUaMrmv2ekvncOgvMZEIbvxEVf3nH49lBJ5hqBNBHDPgIjQcrpF4ym5ghWq/fmoH27Wn5wKyJkfs54TLy7AWM125zqINntTN89MfIcqLLBumlgRfy0QnsZiAzeQf6ELrrMUw1LqV9PPwTGlcqk9CfVI2jaDYGSKtkbrr''';

    // tạo privateKey

    var privateKey = await RSA.convertJWKToPrivateKey(str, pkcs12);

    print('result ${privateKey}');
    var publicKey = await RSA.convertJWKToPublicKey(str, pkcs12);
    if (publicKey != null) {
      print('result ${publicKey}');
      return publicKey;
    } else
      null;
  } catch (e) {
    print('erro ${e}');
    return null;
  }
}
