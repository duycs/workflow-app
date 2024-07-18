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

Future secureStorageDelete(String key) async {
  // Add your function code here!
  final storage = FlutterSecureStorage();
  try {
    await storage.delete(key: key);
  } catch (e) {
    print('Lỗi xoá key từ secure storage: $e');
  }
}
