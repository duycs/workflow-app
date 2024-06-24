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

Future exportExcelGetOneTest(dynamic item) async {
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
      "Tên bài thi",
      "Tên bài học",
      "Trạng thái",
      "Thời gian thi",
      "Thời gian kết thúc thi",
      "Phần trăm điểm",
      "Điểm đạt bài thi",
      "Thang điểm",
      "Số câu đúng",
      "Số câu sai"
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

    if (data["staff_tests"] != null && data["staff_tests"].isNotEmpty) {
      for (var test in data["staff_tests"]) {
        String testName =
            test["test_id"] != null && test["test_id"]["name"] != null
                ? test["test_id"]["name"]
                : '';
        String lessonName =
            test["lession_id"] != null && test["lession_id"]["name"] != null
                ? test["lession_id"]["name"]
                : '';
        String testStatus = test["pass"] != null
            ? (test["pass"] == 1 ? 'Đạt' : 'Chưa đạt')
            : 'Chưa làm';
        String dateStart = formatDate(test["date_start"] ?? '');
        String dateEnd = formatDate(test["date_end"] ?? '');
        String percentCorrect = test["percent_correct"] != null
            ? test["percent_correct"].toString()
            : '';
        String goodScore =
            test["test_id"] != null && test["test_id"]["good_score"] != null
                ? test["test_id"]["good_score"].toString()
                : '';
        String score = test["score"] != null ? test["score"].toString() : '';
        String totalCorrect = test["total_correct"] != null
            ? test["total_correct"].toString()
            : '';
        String totalIncorrect = test["total_incorrect"] != null
            ? test["total_incorrect"].toString()
            : '';

        sheetObject.appendRow([
          userName,
          title,
          branchName,
          departmentName,
          email,
          status,
          phone,
          testName,
          lessonName,
          testStatus,
          dateStart,
          dateEnd,
          percentCorrect,
          goodScore,
          score,
          totalCorrect,
          totalIncorrect
        ]);
      }
    } else {
      // Handle case where no tests exist
      sheetObject.appendRow([
        userName,
        title,
        branchName,
        departmentName,
        email,
        status,
        phone,
        '', // testName
        '', // lessonName
        '', // testStatus
        '', // dateStart
        '', // dateEnd
        '', // percentCorrect
        '', // goodScore
        '', // score
        '', // totalCorrect
        '', // totalIncorrect
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
    await Share.shareXFiles([XFile(filePath)]);

    if (Platform.isAndroid) {
      Fluttertoast.showToast(msg: 'Tải xuống thành công');
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Đã xảy ra lỗi: $e');
  }
}
