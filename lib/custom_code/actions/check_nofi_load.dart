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

Future callApi(String id) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken') ?? '';
  print("accessToken:${accessToken}");
  final url =
      Uri.parse('https://workflow-api-dev.pexnic.com/items/notifications/$id');
  final response = await http.patch(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
    body: jsonEncode(<String, String>{'status': 'archived'}),
  );

  if (response.statusCode == 200) {
    print('API call successful');
  } else {
    print('Failed to call API: ${response.statusCode}');
  }
  // Add your function code here!
}

Future<void> checkNofiLoad(BuildContext context) async {
  // Add your function code here!
  OneSignal.initialize("014e851d-ca32-4c5e-840e-236166738a06");

  Future<Map<String, String>> tagsFuture = OneSignal.User.getTags();

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    OneSignal.Notifications.addClickListener((event) async {
      // lấy thông báo
      var additionalData = event.notification.additionalData;
      print("additionalData: $additionalData");
      var payload = NotiPayload.fromJson(additionalData ?? {});
      print("payload.screen: ${payload.screen}");
      // if (alert != null) {
      //   context.goNamed("ProcedurePublishedList");
      // }
      switch (payload.screen) {
        case "2":
          {
            context.pushNamed('TaskListWait');
            await callApi(payload.data.id);
            return;
          }
        case "3":
          {
            context.pushNamed('StudyProgramListUser');
            await callApi(payload.data.id);

            return;
          }
        case "4":
          {
            context.pushNamed('StudyProgramListUser');
            await callApi(payload.data.id);

            return;
          }
        case "5":
          {
            context.pushNamed(
              'LessonDetail',
              queryParameters: {
                'idLesson': serializeParam(
                  payload.data.id,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
            await callApi(payload.data.id);

            return;
          }
        case "8":
          {
            context.pushNamed('OrderList');
            await callApi(payload.data.id);

            return;
          }
        default:
          {
            context.pushNamed(
              'TaskList',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
            await callApi(payload.data.id);

            return;
          }
      }

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
