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

import 'package:geolocator/geolocator.dart';

Future<String> timeKeepingLocation(
  double setupLatitude,
  double setupLongitude,
  double meters,
) async {
  try {
    Position position = await _getCurrentLocation();
    double distanceInMeters = Geolocator.distanceBetween(
      setupLatitude,
      setupLongitude,
      position.latitude,
      position.longitude,
    );
    if (distanceInMeters <= meters) {
      return "Chấm công thành công!";
    } else {
      return "Vị trí của bạn không nằm trong phạm vi chấm công";
    }
  } catch (e) {
    return "Chấm công không thành công: $e";
  }
}

Future<Position> _getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings(); // Yêu cầu mở cài đặt định vị
    throw Exception(
        "Dịch vụ định vị đã bị tắt. Vui lòng bật định vị và thử lại.");
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      throw Exception("Quyền truy cập bị từ chối");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception(
        "Quyền truy cập bị từ chối vĩnh viễn. Vui lòng vào cài đặt và cấp quyền truy cập.");
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
