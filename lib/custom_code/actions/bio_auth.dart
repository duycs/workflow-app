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

Future<bool> bioAuth() async {
  // Add your function code here!

  final LocalAuthentication auth = LocalAuthentication();

  final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
  final bool canAuthenticate =
      canAuthenticateWithBiometrics || await auth.isDeviceSupported();

  final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();

  if (availableBiometrics.contains(BiometricType.face) ||
      availableBiometrics.contains(BiometricType.fingerprint)) {
    // Specific types of biometrics are available.
    // Use checks like this with caution!

    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Vui lòng xác thực',
          options: const AuthenticationOptions(biometricOnly: true));

      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }

  return false;
}
