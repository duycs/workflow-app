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

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future notifiAddServer(String staffId) async {
  // Add your function code here!
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("014e851d-ca32-4c5e-840e-236166738a06");

  OneSignal.Notifications.requestPermission(true);

  OneSignal.login(staffId);
  print("StaffId: " + staffId);
  debugPrint("StaffId: " + staffId);
  // OneSignal.User.pushSubscription.addObserver((state) {
  //   print(OneSignal.User.pushSubscription.optedIn);
  //   print(OneSignal.User.pushSubscription.id);
  //   print(OneSignal.User.pushSubscription.token);
  //   print(state.current.jsonRepresentation());
  // });

  // OneSignal.User.addObserver((state) {
  //   var userState = state.jsonRepresentation();
  //   print('OneSignal user changed: $userState');
  // });

  // OneSignal.Notifications.addPermissionObserver((state) {
  //   print("Has permission " + state.toString());
  // });
}
