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

import '/index.dart';

Future navigatorToLogin() async {
  // Add your function code here!
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigatorKey.currentState!
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginWidget()));
}
