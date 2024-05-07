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

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkLoginSharePreferences(
  String key1,
  String key2,
) async {
  // Add your function code here!
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value1 = prefs.getString(key1);
  String? value2 = prefs.getString(key2);

  // Kiểm tra xem cả hai key đều có giá trị không
  return (value1 != null && value2 != null);
}
