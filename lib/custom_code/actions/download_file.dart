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

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

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
    Uri uri = Uri.parse(url);

    String fileName = customFileName != null
        ? customFileName.toLowerCase().replaceAll(' ', '-')
        : url.split('/').last.toLowerCase();

    String extension =
        customFileExtension != null ? customFileExtension.split('.').last : '';

    String extensionFirst =
        customFileExtension != null ? customFileExtension.split('.').first : '';

    Directory? directory = await DownloadsPathProvider.downloadsDirectory;
    if (directory == null) {
      Fluttertoast.showToast(msg: "Lỗi khi lấy thư mục lưu trữ");
      return;
    }

    final path = '${directory.path}/$fileName-$extensionFirst.$extension';

    final response = await http.get(uri);
    final bytes = response.bodyBytes;

    final file = File(path);
    await file.writeAsBytes(bytes);

    Fluttertoast.showToast(msg: "Tệp đã được tải xuống thành công");
  } catch (e) {
    Fluttertoast.showToast(msg: "Tệp đã tồn tại");
    print("Tệp đã tồn tại");
  }
}
