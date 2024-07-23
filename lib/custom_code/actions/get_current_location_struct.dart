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

import 'package:path/path.dart';

import 'package:geolocator/geolocator.dart';

Future<List<double>?> getCurrentLocationStruct(BuildContext context) async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationDialog(context, 'Dịch vụ định vị bị vô hiệu hóa');
      return null;
    }

    // Kiểm tra và yêu cầu quyền truy cập vị trí
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationDialog(context, 'Quyền vị trí bị từ chối');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showLocationDialog(context, 'Vui lòng bật định vị để tiếp tục');
      return null;
    }

    // Lấy vị trí hiện tại với độ chính xác cao
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Trả về danh sách tọa độ vĩ độ và kinh độ
    return [position.latitude, position.longitude];
  } catch (e) {
    _showLocationDialog(context, 'Không thể lấy được vị trí: $e');
    return null;
  }
  // Add your function code here!
}

void _showLocationDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Lỗi vị trí'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
