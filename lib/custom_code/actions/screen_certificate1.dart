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

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

void main() {
  runApp(MyApp());
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
              screenCertificate1(
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

Future screenCertificate1(
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
        Widget containerWithKey = Builder(
          builder: (context) => RepaintBoundary(
            key: containerKey,
            child: container,
          ),
        );

        await captureAndSave(containerWithKey, containerKey);
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
    Widget containerWithKey, GlobalKey containerKey) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MaterialApp(home: Scaffold(body: containerWithKey)));

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
      Share.shareFiles([filePath]);

      // Close the app after saving (optional)
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      print('Failed to capture widget as image');
    }
  } catch (e) {
    print('Error capturing and saving screenshot: $e');
  }
}

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
      child: RepaintBoundary(
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity: 0.2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.memory(
                          imageBytes,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Text(
                    //   nameOr,
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //     fontFamily: 'Nunito Sans',
                    //   ),
                    // ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        nameOr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Nunito Sans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                    Text(
                      'Độc lập - Tự do - Hạnh phúc',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                    Text(
                      'Chứng nhận',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Đã hoàn thành: "$program"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Từ ngày $dateStart đến ngày $dateEnd',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Nunito Sans',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  return null;
}

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}
