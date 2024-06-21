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

// Flutter imports
import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

// Custom imports

// Function to export Excel
Future<void> exportExcel(String jsonData) async {
  try {
    // Decode JSON data
    Map<String, dynamic> data = jsonDecode(jsonData);

    // Extract data list from JSON
    List<dynamic> dataList = data['data'];

    // Create Excel instance and add headers to sheet
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    sheet.appendRow([
      'Sắp xếp',
      'ID',
      'Tiêu đề',
      'Trạng thái',
      'CCCD',
      'Giới tính',
      'Điện thoại',
      'Ngày sinh',
      'Vai trò người dùng',
      'ID người dùng',
      'Email',
      'Tên',
      'Họ',
      'Trạng thái người dùng',
      'Avatar',
      'ID tổ chức',
      'Tên tổ chức',
      'ID chi nhánh',
      'Tên chi nhánh',
      'ID phòng ban',
      'Tên phòng ban'
    ]);

    // Iterate through data list and add rows to Excel sheet
    for (var item in dataList) {
      sheet.appendRow([
        item['sort'].toString(),
        item['id'].toString(),
        item['title'].toString(),
        item['status'].toString(),
        item['cccd'].toString(),
        item['gender'].toString(),
        item['phone'].toString(),
        item['dob'].toString(),
        item['user_id']['role'].toString(),
        item['user_id']['id'].toString(),
        item['user_id']['email'].toString(),
        item['user_id']['first_name'].toString(),
        item['user_id']['last_name'].toString(),
        item['user_id']['status'].toString(),
        item['user_id']['avatar'].toString(),
        item['organization_id']['id'].toString(),
        item['organization_id']['name'].toString(),
        item['branch_id'] != null ? item['branch_id']['id'].toString() : '',
        item['branch_id'] != null ? item['branch_id']['name'].toString() : '',
        item['department_id'] != null
            ? item['department_id']['id'].toString()
            : '',
        item['department_id'] != null
            ? item['department_id']['name'].toString()
            : '',
      ]);
    }

    // Encode Excel data to bytes
    final fileBytes = excel.encode();

    // Prepare file path for saving
    final fileName = 'du_lieu_xuat_excel.xlsx';
    final dir = await getExternalStorageDirectory();
    final filePath = '${dir?.path}/$fileName';

    // Write Excel bytes to file
    final file = File(filePath);
    await file.writeAsBytes(fileBytes!);

    // Open the exported Excel file
    await OpenFile.open(filePath);
  } catch (e) {
    print('Lỗi khi xuất Excel: $e');
  }
}
