import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'newsfeed_detail_widget.dart' show NewsfeedDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class NewsfeedDetailModel extends FlutterFlowModel<NewsfeedDetailWidget> {
  ///  Local state fields for this page.

  NewsfeedListStruct? newsfeedItem;
  void updateNewsfeedItemStruct(Function(NewsfeedListStruct) updateFn) {
    updateFn(newsfeedItem ??= NewsfeedListStruct());
  }

  bool isLoad = false;

  String uploadImage = '';

  String uploadVideo = '';

  String uploadFile = '';

  bool checkIcon = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? confirmReaded;
  // Stores action output result for [Backend Call - API (NewsfeedConfirmReaded)] action in Button widget.
  ApiCallResponse? apiResultConfirmReaded;
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
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getOneNewsfeed(BuildContext context) async {
    bool? getOneNewsfeed;
    ApiCallResponse? apiResultGetOneNewsfeed;

    getOneNewsfeed = await action_blocks.tokenReload(context);
    if (getOneNewsfeed!) {
      apiResultGetOneNewsfeed = await NewsfeedGroup.newsfeedOneCall.call(
        accessToken: FFAppState().accessToken,
        id: widget!.newsfeedId,
      );

      if ((apiResultGetOneNewsfeed.succeeded ?? true)) {
        newsfeedItem = NewsfeedListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneNewsfeed.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future reactNewsfeed(
    BuildContext context, {
    String? newsId,
  }) async {
    bool? reactNewsfeedDetail;
    ApiCallResponse? apiResultReactDetail;

    reactNewsfeedDetail = await action_blocks.tokenReload(context);
    if (reactNewsfeedDetail!) {
      apiResultReactDetail = await NewsfeedGroup.reactNewsfeedCall.call(
        accessToken: FFAppState().accessToken,
        staffId: FFAppState().staffid,
        newsId: newsId,
      );

      if (!(apiResultReactDetail.succeeded ?? true)) {
        await actions.showToast(
          context,
          'Lỗi yêu thích',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future deleteReact(
    BuildContext context, {
    int? reactId,
  }) async {
    bool? reactNewsfeedDeleteDetail;
    ApiCallResponse? apiResultReactDeleteDetail;

    reactNewsfeedDeleteDetail = await action_blocks.tokenReload(context);
    if (reactNewsfeedDeleteDetail!) {
      apiResultReactDeleteDetail =
          await NewsfeedGroup.reactNewsfeedDeleteCall.call(
        accessToken: FFAppState().accessToken,
        id: reactId,
      );

      if (!(apiResultReactDeleteDetail.succeeded ?? true)) {
        await actions.showToast(
          context,
          'Lỗi hủy yêu thích',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future postDataUploadImage(BuildContext context) async {
    bool? checkReloadTokenImagePost;
    ApiCallResponse? apiResultPostData;

    checkReloadTokenImagePost = await action_blocks.tokenReload(context);
    if (checkReloadTokenImagePost!) {
      apiResultPostData = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile1,
      );

      if ((apiResultPostData.succeeded ?? true)) {
        uploadImage = getJsonField(
          (apiResultPostData.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future postDataVideo(BuildContext context) async {
    bool? checkTokenPostVideo;
    ApiCallResponse? apiResultPostDataVideo;

    checkTokenPostVideo = await action_blocks.tokenReload(context);
    if (checkTokenPostVideo!) {
      apiResultPostDataVideo = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile2,
      );

      if ((apiResultPostDataVideo.succeeded ?? true)) {
        uploadVideo = getJsonField(
          (apiResultPostDataVideo.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future postDataFile(BuildContext context) async {
    bool? checkTokenPostVideo;
    ApiCallResponse? apiResultPostDataVideo;

    checkTokenPostVideo = await action_blocks.tokenReload(context);
    if (checkTokenPostVideo!) {
      apiResultPostDataVideo = await UploadFileGroup.uploadFileCall.call(
        accessToken: FFAppState().accessToken,
        file: uploadedLocalFile3,
      );

      if ((apiResultPostDataVideo.succeeded ?? true)) {
        uploadFile = getJsonField(
          (apiResultPostDataVideo.jsonBody ?? ''),
          r'''$.data.id''',
        ).toString().toString();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future postDataComment(BuildContext context) async {
    bool? checkTokenPostDataComment;
    ApiCallResponse? apiResultPostDataComment;

    checkTokenPostDataComment = await action_blocks.tokenReload(context);
    if (checkTokenPostDataComment!) {
      apiResultPostDataComment = await NewsfeedGroup.commentsNewFeedCall.call(
        accessToken: FFAppState().accessToken,
        requestDataJson: <String, dynamic>{
          'status': 'published',
          'content': textController.text,
          'image':
              uploadImage != '' ? uploadImage : null,
          'video':
              uploadVideo != '' ? uploadVideo : null,
          'file': uploadFile != '' ? uploadFile : null,
          'news_id': newsfeedItem?.id,
          'staff_id': getJsonField(
            FFAppState().staffLogin,
            r'''$.id''',
          ),
        },
      );

      if ((apiResultPostDataComment.succeeded ?? true)) {}
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future deleteComment(
    BuildContext context, {
    int? id,
  }) async {
    bool? checkTokenReloadDeleteComment;
    ApiCallResponse? apiResultDeleteComment;

    checkTokenReloadDeleteComment = await action_blocks.tokenReload(context);
    if (checkTokenReloadDeleteComment!) {
      apiResultDeleteComment =
          await NewsfeedGroup.commentsNewFeedDeleteCall.call(
        accessToken: FFAppState().accessToken,
        id: id,
      );

      if ((apiResultDeleteComment.succeeded ?? true)) {}
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
