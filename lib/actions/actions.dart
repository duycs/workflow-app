import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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
