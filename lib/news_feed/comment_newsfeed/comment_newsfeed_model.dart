import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'comment_newsfeed_widget.dart' show CommentNewsfeedWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommentNewsfeedModel extends FlutterFlowModel<CommentNewsfeedWidget> {
  ///  Local state fields for this component.

  String uploadImage = '';

  String uploadVideo = '';

  String uploadFile = '';

  NewsfeedListStruct? dataNewFeed;
  void updateDataNewFeedStruct(Function(NewsfeedListStruct) updateFn) {
    updateFn(dataNewFeed ??= NewsfeedListStruct());
  }

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future uploadImageComment(BuildContext context) async {
    bool? checkReloadTokenImageComment;
    ApiCallResponse? apiResultojw;

    checkReloadTokenImageComment = await action_blocks.tokenReload(context);
    if (checkReloadTokenImageComment!) {
      apiResultojw = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile1,
      );

      if ((apiResultojw.succeeded ?? true)) {
        uploadImage = getJsonField(
          (apiResultojw.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future uploadVideoComment(BuildContext context) async {
    bool? checkReloadTokenVideoComment;
    ApiCallResponse? apiResultUploadVideo;

    checkReloadTokenVideoComment = await action_blocks.tokenReload(context);
    if (checkReloadTokenVideoComment!) {
      apiResultUploadVideo = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile2,
      );

      if ((apiResultUploadVideo.succeeded ?? true)) {
        uploadVideo = getJsonField(
          (apiResultUploadVideo.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future uploadFileComment(BuildContext context) async {
    bool? checkReloadTokenFileComment;
    ApiCallResponse? apiResultDataFile;

    checkReloadTokenFileComment = await action_blocks.tokenReload(context);
    if (checkReloadTokenFileComment!) {
      apiResultDataFile = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile3,
      );

      if ((apiResultDataFile.succeeded ?? true)) {
        uploadFile = getJsonField(
          (apiResultDataFile.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future postDataComment(BuildContext context) async {
    bool? checkTokenPostComment;
    ApiCallResponse? apiResultPostComment;

    checkTokenPostComment = await action_blocks.tokenReload(context);
    if (checkTokenPostComment!) {
      apiResultPostComment = await NewsfeedGroup.commentsNewFeedCall.call(
        accessToken: FFAppState().accessToken,
        requestDataJson: <String, dynamic>{
          'status': 'published',
          'content': textController.text,
          'image':
              uploadImage != '' ? uploadImage : null,
          'file': uploadFile != ''
              ? uploadedLocalFile1
              : null,
          'video':
              uploadVideo != '' ? uploadVideo : null,
          'staff_id': getJsonField(
            FFAppState().staffLogin,
            r'''$.id''',
          ),
          'news_id': widget.id,
        },
      );

      if ((apiResultPostComment.succeeded ?? true)) {}
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future newsFeedGetOne(BuildContext context) async {
    bool? checkTokenGetOneData;
    ApiCallResponse? apiResulNewFeddGetOne;

    checkTokenGetOneData = await action_blocks.tokenReload(context);
    if (!checkTokenGetOneData!) {
      FFAppState().update(() {});
      return;
    }
    apiResulNewFeddGetOne = await NewsfeedGroup.newsfeedOneCall.call(
      accessToken: FFAppState().accessToken,
      id: widget.id,
    );

    if ((apiResulNewFeddGetOne.succeeded ?? true)) {
      dataNewFeed = NewsfeedListStruct.maybeFromMap(getJsonField(
        (apiResulNewFeddGetOne.jsonBody ?? ''),
        r'''$.data''',
      ));
    }
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
