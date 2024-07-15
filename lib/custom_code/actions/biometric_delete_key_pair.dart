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

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> biometricDeleteKeyPair() async {
  final _storage = FlutterSecureStorage();
  final _publicKeyKey = 'biometric_public_key';
  final _privateKeyKey = 'biometric_private_key';

  try {
    await _storage.delete(key: _publicKeyKey);
    await _storage.delete(key: _privateKeyKey);
    return true;
  } catch (e) {
    print('Lỗi khi xóa cặp khóa: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
