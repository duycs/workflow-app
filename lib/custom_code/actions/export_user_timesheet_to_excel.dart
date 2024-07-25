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

Future exportUserTimesheetToExcel(List<dynamic> item) async {
  try {
    String extensionFirst = generateRandomString(12);
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
      "Năm",
      "Tháng",
      "Ngày",
      "Trạng thái chấm công",
      "Ca làm việc",
      "Giờ bắt đầu",
      "Giờ kết thúc",
      "Giờ check-in NV",
      "Giờ check-out NV"
    ]);

    for (var data in item) {
      String userName = data["staff_id"]?["user_id"]?["first_name"] ?? '';
      String title = data["staff_id"]?["title"] ?? '';
      String branchName = data["staff_id"]?["branch_id"]?["name"] ?? '';
      String departmentName = data["staff_id"]?["department_id"]?["name"] ?? '';
      String email = data["staff_id"]?["user_id"]?["email"] ?? '';
      String userStatus = data["staff_id"]?["user_id"]?["status"] == 'active'
          ? 'Hoạt động'
          : 'Không hoạt động';
      String phone = data["staff_id"]?["phone"] ?? '';
      String dateCreated = formatDate(data["date_created"], withTime: false);

      String timesheetStatus;
      switch (data["status"]) {
        case "0":
          timesheetStatus = "Chưa chấm công";
          break;
        case "1":
          timesheetStatus = "Đi làm";
          break;
        case "2":
          timesheetStatus = "1/2 ngày";
          break;
        case "3":
          timesheetStatus = "Nghỉ có lý do";
          break;
        case "4":
          timesheetStatus = "Nghỉ không lý do";
          break;
        case "5":
          timesheetStatus = "Nghỉ có lương";
          break;
        default:
          timesheetStatus = "Không xác định";
      }

      if (data["shift_days"] != null && data["shift_days"].isNotEmpty) {
        for (var shift in data["shift_days"]) {
          String shiftStatus = shift["status"] ?? '';
          String shiftStartTime = shift["shift_id"]?["start_time"] ?? '';
          String shiftEndTime = shift["shift_id"]?["end_time"] ?? '';
          String shiftName = shift["shift_id"]?["name"] ?? '';

          if (shift["shift_checks"] != null &&
              shift["shift_checks"].isNotEmpty) {
            for (var check in shift["shift_checks"]) {
              String checkinTime =
                  formatDate(check["checkin"] ?? '', withTime: true);
              String checkoutTime =
                  formatDate(check["checkout"] ?? '', withTime: true);

              sheetObject.appendRow([
                userName,
                title,
                branchName,
                departmentName,
                email,
                userStatus,
                phone,
                dateCreated.split('-')[2],
                dateCreated.split('-')[1],
                // dateCreated.split('-')[0],
                dateCreated,
                timesheetStatus,
                shiftName,
                shiftStartTime,
                shiftEndTime,
                checkinTime,
                checkoutTime
              ]);
            }
          } else {
            sheetObject.appendRow([
              userName,
              title,
              branchName,
              departmentName,
              email,
              userStatus,
              phone,
              dateCreated.split('-')[2],
              dateCreated.split('-')[1],
              // dateCreated.split('-')[0],
              dateCreated,
              timesheetStatus,
              shiftName,
              shiftStartTime,
              shiftEndTime,
              '',
              ''
            ]);
          }
        }
      } else {
        sheetObject.appendRow([
          userName,
          title,
          branchName,
          departmentName,
          email,
          userStatus,
          phone,
          dateCreated.split('-')[2],
          dateCreated.split('-')[1],
          // dateCreated.split('-')[0],
          dateCreated,
          timesheetStatus,
          '',
          '',
          '',
          '',
          ''
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
        '$directoryPath/bao-cao-ve-cham-cong-$extensionFirst.xlsx';
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

String generateRandomString(int length) {
  final random = Random();
  const availableChars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();
  return randomString;
}

String formatDate(String date, {bool withTime = false}) {
  if (date == null || date.isEmpty) return '';
  try {
    DateTime parsedDate = DateTime.parse(date);
    if (withTime) {
      return DateFormat('dd-MM-yyyy HH:mm:ss').format(parsedDate);
    } else {
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    }
  } catch (e) {
    print('Error parsing date: $e');
    return '';
  }
}
