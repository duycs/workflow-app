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

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:share_plus/share_plus.dart';

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

Future<Uint8List?> captureWidgetToImage(GlobalKey key) async {
  try {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<String> getSaveDirectory() async {
  String directoryPath;
  if (Platform.isAndroid) {
    directoryPath = '/storage/emulated/0/Download';
  } else if (Platform.isIOS) {
    directoryPath = (await getApplicationDocumentsDirectory()).path;
  } else {
    throw UnsupportedError('Unsupported platform');
  }
  return directoryPath;
}

Future<void> screenCertificate(
  BuildContext context,
  String tagContainer,
  String program,
  String dateStart,
  String dateEnd,
  String linkImage,
  String nameOr,
  String userName,
  String position,
) async {
  try {
    final response = await http.get(Uri.parse(linkImage));
    if (response.statusCode == 200) {
      Uint8List imageBytes = response.bodyBytes;
      GlobalKey containerKey = GlobalKey();

      Widget? container = findContainerByTag(
        tagContainer,
        program,
        dateStart,
        dateEnd,
        imageBytes,
        nameOr,
        userName,
        position,
      );

      if (container != null) {
        await captureAndSave(context, container, containerKey);
      } else {
        print('Container not found with tag: $tagContainer');
      }
    } else {
      print('Failed to load image from URL: $linkImage');
    }
  } catch (e) {
    print('Error capturing screenshot: $e');
  }
}

Future<void> captureAndSave(
    BuildContext context, Widget container, GlobalKey containerKey) async {
  try {
    final overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: Center(
          child: RepaintBoundary(
            key: containerKey,
            child: container,
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 1));

    Uint8List? imageBytes = await captureWidgetToImage(containerKey);

    if (imageBytes != null) {
      String extensionFirst = generateRandomString(12);
      String directoryPath = await getSaveDirectory();
      String filePath = '$directoryPath/captured_image-$extensionFirst.png';

      File file = File(filePath);
      await file.writeAsBytes(imageBytes);

      print('Image saved at: $filePath');

      Fluttertoast.showToast(
        msg: 'Chứng chỉ đã được lưu lại',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Share.shareXFiles([XFile(filePath)]);
    } else {
      print('Failed to capture widget as image');
    }

    overlayEntry.remove();
  } catch (e) {
    print('Error capturing and saving screenshot: $e');
  }
}

// Widget? findContainerByTag(
//   String tag,
//   String program,
//   String dateStart,
//   String dateEnd,
//   Uint8List imageBytes,
//   String nameOr,
//   String userName,
//   String position,
// ) {
//   if (tag == 'Stack') {
//     return Center(
//       child: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200,
//             color: Colors.grey[200],
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Opacity(
//                           opacity: 0.3,
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                               size: 60,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Text(
//                                 'Độc lập - Tự do - Hạnh phúc',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                               Text(
//                                 'Chứng nhận',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                               Text(
//                                 userName,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 'Chức vụ: \"$position\"',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Đã hoàn thành: \"$program\"',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Text(
//                                 'Từ ngày $dateStart đến ngày $dateEnd',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 10,
//             right: 10,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     child: Image.memory(
//                       imageBytes,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 50,
//                   alignment: Alignment.center,
//                   child: Text(
//                     nameOr,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 8,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   return null;
// }
Widget? findContainerByTag(
  String tag,
  String program,
  String dateStart,
  String dateEnd,
  Uint8List imageBytes,
  String nameOr,
  String userName,
  String position,
) {
  if (tag == 'Stack') {
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                              size: 80,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Độc lập - Tự do - Hạnh phúc',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Chứng nhận',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                userName,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Chức vụ: \"$position\"',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Đã hoàn thành: \"$program\"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Từ ngày $dateStart đến ngày $dateEnd',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    nameOr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  return null;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Capture Widget to Image'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              screenCertificate(
                context,
                'Stack',
                'Chương trình mẫu',
                '01/01/2023',
                '31/12/2023',
                'https://example.com/image.png',
                'Nguyễn Văn A',
                'Người dùng mẫu',
                'Tên công ty',
              );
            },
            child: Text('Capture Screenshot'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
