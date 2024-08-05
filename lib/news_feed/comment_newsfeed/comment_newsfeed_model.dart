import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found_comment/data_not_found_comment_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import '/tasks/popup_see_more/popup_see_more_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'comment_newsfeed_widget.dart' show CommentNewsfeedWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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

      if ((apiResultojw?.succeeded ?? true)) {
        uploadImage = getJsonField(
          (apiResultojw?.jsonBody ?? ''),
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

      if ((apiResultUploadVideo?.succeeded ?? true)) {
        uploadVideo = getJsonField(
          (apiResultUploadVideo?.jsonBody ?? ''),
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

      if ((apiResultDataFile?.succeeded ?? true)) {
        uploadFile = getJsonField(
          (apiResultDataFile?.jsonBody ?? ''),
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
              uploadImage != null && uploadImage != '' ? uploadImage : null,
          'file': uploadFile != null && uploadFile != ''
              ? uploadedLocalFile1
              : null,
          'video':
              uploadVideo != null && uploadVideo != '' ? uploadVideo : null,
          'staff_id': getJsonField(
            FFAppState().staffLogin,
            r'''$.id''',
          ),
          'news_id': widget!.id,
        },
      );

      if ((apiResultPostComment?.succeeded ?? true)) {}
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

    if ((apiResulNewFeddGetOne?.succeeded ?? true)) {
      dataNewFeed = NewsfeedListStruct.maybeFromMap(getJsonField(
        (apiResulNewFeddGetOne?.jsonBody ?? ''),
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
                title: Text('Xác nhận'),
                content: Text('Bạn chắc chắn muốn xóa'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: Text('Xác nhận'),
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

        if ((apiResult4jt?.succeeded ?? true)) {
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
