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
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// Future callApi() async {
//   final prefs = await SharedPreferences.getInstance();
//   final accessToken1 = prefs.getString('accessToken') ?? '';
//   print("accessToken1:${accessToken1}");
//   final url =
//       Uri.parse('https://workflow-api-dev.pexnic.com/items/notifications/$id');
//   final response = await http.patch(
//     url,
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $accessToken2',
//     },
//     body: jsonEncode(<String, String>{'status': 'archived'}),
//   );

//   if (response.statusCode == 200) {
//     print('API call successful');
//   } else {
//     print('Failed to call API: ${response.statusCode}');
//   }
//   // Add your function code here!
// }
Future callApi(BuildContext context) async {
  // Add your function code here!
  OneSignal.initialize("014e851d-ca32-4c5e-840e-236166738a06");

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    OneSignal.Notifications.addClickListener((event) {
      // lấy thông báo
      var notificationId = event.notification.notificationId;
      print(notificationId);
      var additionalData = event.notification.additionalData;
      print("additionalData: $additionalData");
      var payload = NotiPayload.fromJson(additionalData ?? {});
      print("payload.screen: ${payload.screen}");
      // if (alert != null) {
      //   context.goNamed("ProcedurePublishedList");
      // }
      FFAppState().update(() {
        FFAppState().alertCheck = payload.screen.toString();
        FFAppState().idCheck = payload.data.id;
      });
    });
  });
}

class NotiPayload {
  final String screen;
  final NotiData data;

  NotiPayload(this.screen, this.data);

  factory NotiPayload.fromJson(Map json) {
    return NotiPayload(json['screen'], NotiData.fromJson(json['data']));
  }
}

class NotiData {
  final String id;

  NotiData(this.id);

  factory NotiData.fromJson(Map json) {
    return NotiData(json?['id']);
  }
}
