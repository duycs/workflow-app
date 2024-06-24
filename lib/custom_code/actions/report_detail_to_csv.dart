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

String translateActionType(String actionType) {
  switch (actionType) {
    case 'image':
      return 'Chụp ảnh';
    case 'upload_file':
      return 'Upload file';
    case 'submit_text':
      return 'Nhập văn bản';
    case 'approve':
      return 'Phê duyệt';
    case 'to_do_list':
      return 'Check list công việc';
    default:
      return actionType;
  }
}

String translateStatus(String status, int current) {
  if (status == 'todo') {
    return current == 1 ? 'Đang thực hiện' : 'Chưa thực hiện';
  } else if (status == 'done') {
    return 'Hoàn thành';
  } else {
    return status;
  }
}

Future<void> reportDetailToCsv(dynamic item) async {
  try {
    String extensionFirst = generateRandomString(12);
    final Map<String, dynamic> parsedData =
        item is String ? jsonDecode(item) : item;

    if (!parsedData.containsKey('data') || parsedData['data'] == null) {
      throw FormatException('Cấu trúc JSON không hợp lệ hoặc thiếu dữ liệu.');
    }

    final data = parsedData['data'];
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
      "Tên task",
      "Trạng thái",
      "Thuộc quy trình",
      "Thời gian tạo",
      "Thời gian thực hiện",
      "Thời gian kết thúc",
      "Kiểu hành động",
      "Nội dung",
      "Kết quả",
      "File"
    ]);

    String userName = data["user_id"]?["first_name"] ?? '';
    String title = data["title"] ?? '';
    String branchName = data["branch_id"]?["name"] ?? '';
    String departmentName = data["department_id"]?["name"] ?? '';
    String email = data["user_id"]?["email"] ?? '';
    String status =
        data["status"] == 'active' ? 'Hoạt động' : 'Không hoạt động';
    String phone = data["phone"] ?? '';

    for (var task in data["tasks"] ?? []) {
      String taskName = task["tasks_id"]?["name"] ?? '';
      String taskStatus = translateStatus(
          task["tasks_id"]?["status"] ?? '', task["tasks_id"]?["current"] ?? 0);
      String workflowName = task["tasks_id"]?["workflow_id"]?["name"] ?? '';
      String dateCreated = formatDate(task["tasks_id"]?["date_created"] ?? '');
      String dateStart = formatDate(task["tasks_id"]?["date_start"] ?? '');
      String dateEnd = formatDate(task["tasks_id"]?["date_end"] ?? '');
      String actionType =
          translateActionType(task["tasks_id"]?["action_type"] ?? '');

      for (var operation in task["tasks_id"]?["operations"] ?? []) {
        String content = operation["operations_id"]?["content"] ?? '';
        String result = operation["operations_id"]?["result"] ?? '';

        if (operation["operations_id"]?["files"] != null &&
            operation["operations_id"]["files"].isNotEmpty) {
          for (var file in operation["operations_id"]["files"]) {
            String fileName =
                file["directus_files_id"]?["filename_download"] ?? '';
            sheetObject.appendRow([
              userName,
              title,
              branchName,
              departmentName,
              email,
              status,
              phone,
              taskName,
              taskStatus,
              workflowName,
              dateCreated,
              dateStart,
              dateEnd,
              actionType,
              content,
              result,
              fileName,
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
            taskName,
            taskStatus,
            workflowName,
            dateCreated,
            dateStart,
            dateEnd,
            actionType,
            content,
            result,
            '',
          ]);
        }
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
        '$directoryPath/bao-cao-chi-tiet-nhan-vien-$extensionFirst.xlsx';
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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
