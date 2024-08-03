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

import 'package:path/path.dart';

Future showToast(
  BuildContext context,
  String message,
  Color colorText,
  Color colorBackground,
) async {
  // Tạo overlay entry
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: colorBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: colorText,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ),
  );

  // Thêm overlay entry vào overlay
  Overlay.of(context).insert(overlayEntry);

  // Thoát overlay sau một khoảng thời gian
  await Future.delayed(Duration(seconds: 2));

  overlayEntry.remove();
}
