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

Future exportExcelTest(dynamic item) async {
  try {
    String extensionFirst = generateRandomString(12);
    final Map<String, dynamic> parsedData =
        item is String ? jsonDecode(item) : item;

    if (!(parsedData.containsKey('data') && parsedData['data'] is List)) {
      throw FormatException(
          'Cấu trúc JSON không hợp lệ hoặc thiếu mảng dữ liệu.');
    }

    final List<dynamic> dataList = parsedData['data'];
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
      "Thời gian bắt đầu thi",
      "Thời gian kết thúc thi",
      "Phần trăm điểm(%)",
      "Điểm đạt bài thi",
      "Thang điểm",
      "Số câu đúng",
      "Số câu sai"
    ]);

    for (var item in dataList) {
      String userName =
          item["user_id"] != null && item["user_id"]["first_name"] != null
              ? item["user_id"]["first_name"]
              : '';
      String title = item["title"] ?? '';
      String branchName =
          item["branch_id"] != null && item["branch_id"]["name"] != null
              ? item["branch_id"]["name"]
              : '';
      String departmentName =
          item["department_id"] != null && item["department_id"]["name"] != null
              ? item["department_id"]["name"]
              : '';
      String email = item["user_id"] != null && item["user_id"]["email"] != null
          ? item["user_id"]["email"]
          : '';
      String phone = item["phone"] ?? '';
      String status =
          item["status"] == 'active' ? 'Hoạt động' : 'Không hoạt động';

      if (item["staff_tests"] != null && item["staff_tests"].isNotEmpty) {
        for (var test in item["staff_tests"]) {
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
          '',
          '',
          '',
          '',
          '',
          '',
        ]);
      }
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
        '$directoryPath/bao-cao-ve-tien-do-bai-thi-cua-nhan-vien-$extensionFirst.xlsx';
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
