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

import 'index.dart'; // Imports other custom actions

import 'package:local_auth/local_auth.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

Future<bool> authenticateUsingBiometricsSetting() async {
  // Add your function code here!
  final auth = LocalAuthentication();

  try {
    // Add your function code here!
    bool result = await auth.authenticate(
      options: AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ),
      localizedReason: '',
      authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Vui lòng quét vân tay để cài đặt!',
          cancelButton: 'Hủy',
          biometricHint: '',
          // fingerprintHint: ''
          // lockOut: '',
        ),
        IOSAuthMessages(
          localizedFallbackTitle: 'Vui lòng quét vân tay để cài đặt!',
          cancelButton: 'Hủy',
          lockOut: '',
        ),
      ],
    );
    return result;
  } catch (e) {
    print('Error during authentication: $e');
    return false;
  }
  return false;
}
