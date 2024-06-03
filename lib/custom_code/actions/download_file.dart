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

import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'dart:math';

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

Future<void> downloadFile(
  String url,
  String customFileName,
  String customFileExtension,
) async {
  if (url == null || url.isEmpty) {
    Fluttertoast.showToast(msg: "Đường link không hợp lệ");
    return;
  }

  try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    Uri uri = Uri.parse(url);

    String fileName = customFileName != null
        ? customFileName.toLowerCase().replaceAll(' ', '-')
        : url.split('/').last.toLowerCase();

    String extension = customFileExtension != null
        ? customFileExtension.split('.').last
        : fileName.split('.').last;

    String extensionFirst = generateRandomString(9);

    String directoryPath;
    if (Platform.isAndroid) {
      directoryPath = '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      directoryPath = (await getApplicationDocumentsDirectory()).path;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    final path = '$directoryPath/$fileName-$extensionFirst.$extension';
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      Fluttertoast.showToast(msg: "Tải xuống thất bại");
      return;
    }
    final bytes = response.bodyBytes;
    final file = File(path);
    await file.writeAsBytes(bytes);
    print("File saved at");
    Fluttertoast.showToast(msg: "Tệp đã được tải xuống thành công");
    Fluttertoast.showToast(msg: "Sharing file...");
    Share.shareFiles([path], text: " ");
    Share.shareFiles([path], text: " ")?.catchError((e) => print(e));
    Fluttertoast.showToast(msg: "File shared successfully.");
  } catch (e) {
    Fluttertoast.showToast(msg: "Lỗi khi tải xuống tệp");
    print("Error downloading file");
  }
}
