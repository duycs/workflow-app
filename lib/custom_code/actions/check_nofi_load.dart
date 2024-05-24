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

// Automatic FlutterFlow importsCustom action checkNofiLoad cannot be parsed

import 'package:fluttertoast/fluttertoast.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future checkNofiLoad() async {
  // Add your function code here!

  OneSignal.initialize("014e851d-ca32-4c5e-840e-236166738a06");

  Future<Map<String, String>> tagsFuture = OneSignal.User.getTags();
  // Đợi Future hoàn thành và xử lý kết quả
  // tagsFuture.then((tags) {
  //   // Lấy giá trị của tag 'contents' và 'data'
  //   var demo = tags['contents'];
  //   var demo2 = tags['data'];
  //   var check = tags['test2'];

  //   // Hiển thị giá trị trong toast
  //   Fluttertoast.showToast(
  //     msg:
  //         '${demo.toString()} ${demo2.toString()} ${tags} ${tagsFuture} ${check.toString()}',
  //     gravity: ToastGravity.TOP,
  //     toastLength: Toast.LENGTH_LONG,
  //   );
  // });
  // // Xác định hàm xử lý khi có thông báo được nhận
  // OneSignal.shared
  //     .setNotificationReceivedHandler((OSNotification notification) {
  //   print('Thông báo được nhận: ${notification.jsonRepresentation()}');

  //   // Hiển thị thông báo trong một cửa sổ cảnh báo
  //   // Bạn cần sử dụng plugin Flutter để hiển thị cửa sổ cảnh báo, ví dụ: fluttertoast
  //   // showToast(notification.title + ': ' + notification.body);
  //   Fluttertoast.showToast(
  //     msg: notification.jsonRepresentation(),
  //     gravity: ToastGravity.TOP, // Thiết lập vị trí hiển thị của toast
  //     toastLength: Toast.LENGTH_LONG, // Độ dài hiển thị của toast
  //   );
  // });

  // // Xác định hàm xử lý khi người dùng mở thông báo
  // OneSignal.shared
  //     .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //   print('Thông báo đã mở: ${result.notification.jsonRepresentation()}');
  //   Fluttertoast.showToast(
  //     msg: notification.title + ': ' + notification.body,
  //     gravity: ToastGravity.TOP, // Thiết lập vị trí hiển thị của toast
  //     toastLength: Toast.LENGTH_LONG, // Độ dài hiển thị của toast
  //   );

  //   // Xử lý khi thông báo được mở, ví dụ: mở một trang web liên kết
  //   // launch(result.notification.url);
  // });
}
