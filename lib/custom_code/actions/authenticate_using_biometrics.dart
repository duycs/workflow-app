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

import 'package:local_auth/local_auth.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

Future<void> authenticateUsingBiometrics() async {
  // Add your function code here!
  final auth = LocalAuthentication();
  try {
    // Add your function code here!
    bool result = await auth.authenticate(
        localizedReason: 'Xác nhận vân tay cho ComOS',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle:
                'Quý khách vui lòng quét vân tay để đăng nhập ứng dụng. (Lưu ý: Quý khác có thể sử dụng các vân tay đã cài đặt thành công trên thiết bị)',
            cancelButton: 'Hủy',
          ),
          IOSAuthMessages(
            cancelButton: 'Hủy',
          ),
        ],
        options: AuthenticationOptions(biometricOnly: true));
  } catch (e) {
    print('Error during authentication: $e');
  }
}
