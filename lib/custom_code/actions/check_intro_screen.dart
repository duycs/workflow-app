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

Future<bool> checkIntroScreen() async {
  final prefs = await SharedPreferences.getInstance();
  final bool? isFirstTime = prefs.getBool('first_time');

  if (isFirstTime == null) {
    await prefs.setBool('first_time', true);
    return FFAppState().isFirstTime = true; // This means it's the first time
  } else {
    return FFAppState().isFirstTime = false;
  }

  // Add your function code here!
}
