import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future postLesson(BuildContext context) async {
  ApiCallResponse? apiResulth51;

  apiResulth51 = await LessonGroup.postLessonCall.call(
    accessToken: FFAppState().accessToken,
  );
}

Future<bool?> checkRefreshToken(
  BuildContext context, {
  required dynamic jsonErrors,
}) async {
  ApiCallResponse? apiResultRefreshToken;

  if (ErorrsStruct.maybeFromMap(jsonErrors)?.errors.first.extensions.code ==
      FFAppConstants.TokenExpired) {
    apiResultRefreshToken = await AuthenGroup.refreshTokenCall.call(
      refreshToken: FFAppState().refreshToken,
    );
    if ((apiResultRefreshToken.succeeded ?? true)) {
      FFAppState().accessToken = LoginResponseDataStruct.maybeFromMap(
              (apiResultRefreshToken.jsonBody ?? ''))!
          .data
          .accessToken;
      FFAppState().refreshToken = LoginResponseDataStruct.maybeFromMap(
              (apiResultRefreshToken.jsonBody ?? ''))!
          .data
          .refreshToken;
      FFAppState().expires = LoginResponseDataStruct.maybeFromMap(
              (apiResultRefreshToken.jsonBody ?? ''))!
          .data
          .expires;
    } else {
      await action_blocks.clearSession(context);

      context.pushNamed(
        'Login',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    }

    return true;
  } else {
    return false;
  }
}

Future clearSession(BuildContext context) async {
  FFAppState().accessToken = '';
  FFAppState().refreshToken = '';
  FFAppState().user = UserStruct();
  FFAppState().expires = 0;
}

Future<bool?> tokenReload(BuildContext context) async {
  ApiCallResponse? apiResultRefreshTokenCheck;

  if (functions.isTokenExpired(FFAppState().dataTimeStartToken) == false) {
    return true;
  }

  apiResultRefreshTokenCheck = await AuthenGroup.refreshTokenCall.call(
    refreshToken: FFAppState().refreshToken,
  );
  if ((apiResultRefreshTokenCheck.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().accessToken = LoginResourceDataStruct.maybeFromMap(
              (apiResultRefreshTokenCheck?.jsonBody ?? ''))!
          .data
          .accessToken;
      FFAppState().refreshToken = LoginResourceDataStruct.maybeFromMap(
              (apiResultRefreshTokenCheck?.jsonBody ?? ''))!
          .data
          .refreshToken;
      FFAppState().expires = LoginResourceDataStruct.maybeFromMap(
              (apiResultRefreshTokenCheck?.jsonBody ?? ''))!
          .data
          .expires;
      FFAppState().dataTimeStartToken = DateTime.now().microsecondsSinceEpoch +
          LoginResourceDataStruct.maybeFromMap(
                  (apiResultRefreshTokenCheck?.jsonBody ?? ''))!
              .data
              .expires;
    });
  } else {
    await action_blocks.clearSession(context);

    context.pushNamed(
      'Login',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Phiên đăng nhập hết hạn!',
          style: TextStyle(),
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return false;
  }

  return true;
}
