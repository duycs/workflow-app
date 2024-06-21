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
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> exportExcel(String jsonData) async {
  // Parse JSON data
  Map<String, dynamic> data = jsonDecode(jsonData);

  // Lấy danh sách dữ liệu từ key 'data'
  List<dynamic> dataList = data['data'];

  // Tạo workbook và sheet cho Excel
  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];

  // Định nghĩa các cột trong Excel
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

  // Thêm dòng dữ liệu từ JSON vào Excel cho mỗi item trong dataList
  for (var item in dataList) {
    sheet.appendRow([
      item['sort'],
      item['id'],
      item['title'],
      item['status'],
      item['cccd'],
      item['gender'],
      item['phone'],
      item['dob'],
      item['user_id']['role'],
      item['user_id']['id'],
      item['user_id']['email'],
      item['user_id']['first_name'],
      item['user_id']['last_name'],
      item['user_id']['status'],
      item['user_id']['avatar'],
      item['organization_id']['id'],
      item['organization_id']['name'],
      item['branch_id']['id'],
      item['branch_id']['name'],
      item['department_id']['id'],
      item['department_id']['name'],
    ]);
  }

  // Lưu file Excel
  final fileBytes = excel.encode();
  final fileName = 'du_lieu_xuat_excel.xlsx';
  final dir = await getExternalStorageDirectory();
  final filePath = '${dir?.path}/$fileName';
  final file = File(filePath);
  await file.writeAsBytes(fileBytes!);

  // Mở cửa sổ để người dùng tải xuống hoặc chia sẻ file Excel
  await OpenFile.open(filePath);
}
