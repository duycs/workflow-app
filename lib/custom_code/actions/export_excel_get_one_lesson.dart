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

import 'dart:convert';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';
import 'package:intl/intl.dart';

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

String formatDate(String dateStr) {
  if (dateStr.isEmpty) return '';
  try {
    final DateTime date = DateTime.parse(dateStr);
    return DateFormat('dd-MM-yyyy').format(date);
  } catch (e) {
    return '';
  }
}

Future exportExcelGetOneLesson(dynamic item) async {
  // Add your function code here!
  try {
    String extensionFirst = generateRandomString(12);
    final Map<String, dynamic> parsedData =
        item is String ? jsonDecode(item) : item;

    if (!(parsedData.containsKey('data') && parsedData['data'] is Map)) {
      throw FormatException(
          'Cấu trúc JSON không hợp lệ hoặc thiếu đối tượng dữ liệu.');
    }

    final Map<String, dynamic> data = parsedData['data'];
    var excel = Excel.createExcel();
    String sheetName = "Sheet1";
    Sheet sheetObject = excel[sheetName];

    sheetObject.appendRow([
      "Tên",
      "Chức vụ",
      "Chi nhánh",
      "Bộ phận",
      "Email",
      "Trạng thái hoạt động",
      "Số điện thoại",
      "Tên bài học",
      "Tên chương trình",
      "Trạng thái",
      "Thời gian tạo",
      "Thời hạn học",
      "Thời gian bắt đầu",
    ]);

    String userName =
        data["user_id"] != null && data["user_id"]["first_name"] != null
            ? data["user_id"]["first_name"]
            : '';
    String title = data["title"] ?? '';
    String branchName =
        data["branch_id"] != null && data["branch_id"]["name"] != null
            ? data["branch_id"]["name"]
            : '';
    String departmentName =
        data["department_id"] != null && data["department_id"]["name"] != null
            ? data["department_id"]["name"]
            : '';
    String email = data["user_id"] != null && data["user_id"]["email"] != null
        ? data["user_id"]["email"]
        : '';
    String phone = data["phone"] ?? '';
    String status =
        data["status"] == 'active' ? 'Hoạt động' : 'Không hoạt động';

    if (data["staff_lessions"] != null && data["staff_lessions"].isNotEmpty) {
      for (var lesson in data["staff_lessions"]) {
        String lessonName =
            lesson["lession_id"] != null && lesson["lession_id"]["name"] != null
                ? lesson["lession_id"]["name"]
                : '';
        String programName =
            lesson["program_id"] != null && lesson["program_id"]["name"] != null
                ? lesson["program_id"]["name"]
                : '';
        String lessonStatus = lesson["status"] == 'draft'
            ? 'Chưa học'
            : lesson["status"] == 'done'
                ? 'Hoàn thành'
                : lesson["status"] == 'inprogress'
                    ? 'Đang học'
                    : '';
        String dateCreated = formatDate(lesson["date_created"] ?? '');
        String deadline = formatDate(lesson["deadline"] ?? '');
        String dateStart = formatDate(lesson["date_start"] ?? '');

        sheetObject.appendRow([
          userName,
          title,
          branchName,
          departmentName,
          email,
          status,
          phone,
          lessonName,
          programName,
          lessonStatus,
          dateCreated,
          deadline,
          dateStart,
        ]);
      }
    } else {
      // Handle case where no lessons exist
      sheetObject.appendRow([
        userName,
        title,
        branchName,
        departmentName,
        email,
        status,
        phone,
        '', // lessonName
        '', // programName
        '', // lessonStatus
        '', // dateCreated
        '', // deadline
        '', // dateStart
      ]);
    }

    String directoryPath;
    if (Platform.isAndroid) {
      directoryPath = '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      directoryPath = (await getApplicationDocumentsDirectory()).path;
    } else {
      throw UnsupportedError('Nền tảng không được hỗ trợ');
    }

    String filePath =
        '$directoryPath/bao-cao-ve-tien-do-bai-hoc-cua-nhan-vien-$extensionFirst.xlsx';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);
    await Share.shareXFiles([XFile(filePath)]);

    if (Platform.isAndroid) {
      Fluttertoast.showToast(msg: 'Tải xuống thành công');
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Đã xảy ra lỗi: $e');
  }
}
