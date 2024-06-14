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

import 'package:flutter/services.dart';

Future<void> closeApp() async {
  // runApp(MaterialApp(
  //   home: YourPage(),
  // ));
}

// class YourPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      Future.delayed(Duration(seconds: 1), () {
//       closeApp();
//     });
//     return WillPopScope(
//       onWillPop: () => handleBackNavigation(context),
//       child: Center(
//           child: YourContentWidget(),
//         ),
//     );
//   }
// }

// Future<bool> handleBackNavigation(BuildContext context) async {
//   bool exitApp = false;
//   exitApp = await showExitDialog(context);
//   return exitApp;
// }

// Future<bool> showExitDialog(BuildContext context) async {
//   bool exitApp = false;
//   await showDialog(
//     context: context,
//     barrierDismissible: false,
//     barrierColor: Colors.black.withOpacity(0.4),
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                 ),
//               ),
//               Text(
//                 'Do you really want to exit?',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(false);
//                     },
//                     child: Text('Stay'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       exitApp = true;
//                       Navigator.of(context).pop(true);
//                     },
//                     child: Text('Exit'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
//   return exitApp;
// }
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
