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

Future exportExcelGetOne(dynamic item) async {
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
      "Tên chương trình",
      "Trạng thái chương trình",
      "Thời gian tạo",
      "Thời hạn học",
      "Số bài học",
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

    if (data["staff_programs"] != null && data["staff_programs"].isNotEmpty) {
      for (var program in data["staff_programs"]) {
        String programName = program["program_id"] != null &&
                program["program_id"]["name"] != null
            ? program["program_id"]["name"]
            : '';
        String programStatus = program["status"] == 'draft'
            ? 'Chưa học'
            : program["status"] == 'done'
                ? 'Hoàn thành'
                : program["status"] == 'inprogress'
                    ? 'Đang học'
                    : '';
        String dateCreated = formatDate(program["date_created"] ?? '');
        String deadline = formatDate(program["deadline"] ?? '');
        int numberOfLessons = program["program_id"] != null &&
                program["program_id"]["lessions"] != null
            ? program["program_id"]["lessions"].length
            : 0;

        sheetObject.appendRow([
          userName,
          title,
          branchName,
          departmentName,
          email,
          status,
          phone,
          programName,
          programStatus,
          dateCreated,
          deadline,
          numberOfLessons,
        ]);
      }
    } else {
      sheetObject.appendRow([
        userName,
        title,
        branchName,
        departmentName,
        email,
        status,
        phone,
        '',
        '',
        '',
        '',
        0,
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
        '$directoryPath/bao-cao-ve-tien-do-chuong-trinh-dao-tao-cua-nhan-vien-$extensionFirst.xlsx';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    if (Platform.isAndroid) {
      Fluttertoast.showToast(msg: 'Tải xuống thành công');
    }
    await Future.delayed(Duration(seconds: 1));

    await Share.shareXFiles([XFile(filePath)]);
  } catch (e) {
    Fluttertoast.showToast(msg: 'Đã xảy ra lỗi: $e');
  }
}
