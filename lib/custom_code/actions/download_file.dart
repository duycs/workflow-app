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
    // Kiểm tra quyền lưu trữ
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Tự động yêu cầu cấp quyền truy cập lưu trữ nếu chưa được cấp
      await Permission.storage.request();
    }

    Uri uri = Uri.parse(url);

    // Xác định tên và phần mở rộng của tệp
    String fileName = customFileName != null
        ? customFileName.toLowerCase().replaceAll(' ', '-')
        : url.split('/').last.toLowerCase();

    String extension = customFileExtension != null
        ? customFileExtension.split('.').last
        : fileName.split('.').last;

    String extensionFirst =
        customFileExtension != null ? customFileExtension.split('.').first : '';

    // Xác định thư mục tải xuống dựa trên nền tảng
    String directoryPath;
    if (Platform.isAndroid) {
      // Sử dụng đường dẫn cố định tới thư mục Downloads trên Android
      directoryPath = '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      // Thư mục Download trên iOS
      directoryPath = (await getApplicationDocumentsDirectory()).path;
    } else {
      throw UnsupportedError('Unsupported platform');
    }

    // Tạo đường dẫn đầy đủ cho tệp
    final path = '$directoryPath/$fileName-$extensionFirst.$extension';

    // Lấy tệp từ URL
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
          msg: "Tải xuống thất bại: ${response.reasonPhrase}");
      return;
    }

    final bytes = response.bodyBytes;

    // Ghi tệp vào đường dẫn đã xác định
    final file = File(path);
    await file.writeAsBytes(bytes);

    // Ghi log đường dẫn lưu tệp
    print("File saved at: $path");
    Fluttertoast.showToast(msg: "Tệp đã được tải xuống thành công: $path");
    // Chia sẻ tệp với người dùng
    Share.shareFiles([path], text: "Tệp của bạn đã được tải xuống");
  } catch (e) {
    Fluttertoast.showToast(msg: "Lỗi khi tải xuống tệp: ${e.toString()}");
    print("Error downloading file: ${e.toString()}");
  }
}
