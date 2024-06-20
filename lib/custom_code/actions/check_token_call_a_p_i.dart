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
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckTokenCallAPI extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    int currentTimetamp =
        (DateTime.now().microsecondsSinceEpoch / 1000).round();
    int lastTime = FFAppState().dataTimeStartToken;
    String refeshTokenApp = FFAppState().refreshToken;

    bool check = (lastTime - currentTimetamp) > 15000;

    if (!check) {
      var apiRef = await RefreshTokenCall().call(refreshToken: refeshTokenApp);
      if (apiRef.succeeded) {
        String access_tokenNew = apiRef.jsonBody['data']['access_token'] ?? '';
        String refresh_tokenNew =
            apiRef.jsonBody['data']['refresh_token'] ?? '';
        int expiresNew = apiRef.jsonBody['data']['expires'] ?? 0;
        int timeNew =
            (DateTime.now().microsecondsSinceEpoch / 1000).round() + expiresNew;

        FFAppState().update(() {
          FFAppState().accessToken = access_tokenNew;
          FFAppState().refreshToken = refresh_tokenNew;
          FFAppState().expires = expiresNew;
          FFAppState().dataTimeStartToken = timeNew;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("wf_token", "${refresh_tokenNew}");
        options.headers["Authorization"] = "Bearer ${access_tokenNew}";
        return options;
      }
      return options;
    } else {
      return options;
    }
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.
    return response;
  }
}
