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

import 'package:flutter/services.dart';

Future<void> closeApp(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Đóng ứng dụng"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text("Thoát"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Exit the app
                    Navigator.of(context).pop();
                    Future.delayed(Duration(milliseconds: 500), () {
                      SystemNavigator.pop();
                    });
                  },
                  child: Text("Đóng"),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
