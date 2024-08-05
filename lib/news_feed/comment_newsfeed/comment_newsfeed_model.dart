import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'comment_newsfeed_widget.dart' show CommentNewsfeedWidget;
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

  bool checkLoading = false;

  bool checkButton = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in IconButton widget.
  bool? checkTokenDeleteComment1;
  // Stores action output result for [Backend Call - API (CommentsNewFeedDelete)] action in IconButton widget.
  ApiCallResponse? apiResultDeleteComment;
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
          'news_id': widget!.id,
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
      id: widget!.id,
    );

    if ((apiResulNewFeddGetOne.succeeded ?? true)) {
      dataNewFeed = NewsfeedListStruct.maybeFromMap(getJsonField(
        (apiResulNewFeddGetOne.jsonBody ?? ''),
        r'''$.data''',
      ));
      checkLoading = true;
    }
  }

  Future deleteComment(
    BuildContext context, {
    int? id,
  }) async {
    bool? checkTokenDeleteComment;
    ApiCallResponse? apiResult4jt;

    checkTokenDeleteComment = await action_blocks.tokenReload(context);
    if (checkTokenDeleteComment!) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Xác nhận'),
                content: const Text('Bạn chắc chắn muốn xóa'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: const Text('Xác nhận'),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (confirmDialogResponse) {
        apiResult4jt = await NewsfeedGroup.commentsNewFeedDeleteCall.call(
          accessToken: FFAppState().accessToken,
          id: id,
        );

        if ((apiResult4jt.succeeded ?? true)) {
          await actions.showToast(
            context,
            'Xóa bình luận thành công',
            FlutterFlowTheme.of(context).primaryText,
            FlutterFlowTheme.of(context).secondary,
          );
        }
      } else {
        return;
      }
    } else {
      return;
    }
  }
}
