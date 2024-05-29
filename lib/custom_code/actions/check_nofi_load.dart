// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow importsCustom action checkNofiLoad cannot be parsed

import 'package:onesignal_flutter/onesignal_flutter.dart';

import '/flutter_flow/flutter_flow_util.dart';

void checkNofiLoad(BuildContext context) async {
  // Add your function code here!

  OneSignal.initialize(
      "014e851d-ca32-4c5e-840e-236166738a06");

  Future<Map<String, String>> tagsFuture =
      OneSignal.User.getTags();
  print('context moi moi moii moinmoi');

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    OneSignal.Notifications.addClickListener((event) {
      // lấy thông báo
      var additionalData =
          event.notification.additionalData;
      print("additionalData: $additionalData");
      var payload =
          NotiPayload.fromJson(additionalData ?? {});
      print("payload.scrren: ${payload.screen}");
      // if (alert != null) {
      //   context.goNamed("ProcedurePublishedList");
      // }
      switch (payload.screen) {
        case "2":
          {
            context.pushNamed('TaskListWait');
            return;
          }
        case "3":
          {
            context.pushNamed('StudyProgramListUser');
            return;
          }
        case "4":
          {
            context.pushNamed('StudyProgramListUser');
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
            return;
          }
      }

      FFAppState().update(() {
        FFAppState().alertCheck = payload.screen;
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
    return NotiPayload(
        json['screen'], NotiData.fromJson(json['data']));
  }
}

class NotiData {
  final String id;

  NotiData(this.id);

  factory NotiData.fromJson(Map json) {
    return NotiData(json?['id']);
  }
}
