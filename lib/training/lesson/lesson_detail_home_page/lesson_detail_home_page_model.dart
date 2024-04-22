import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'lesson_detail_home_page_widget.dart' show LessonDetailHomePageWidget;
import 'package:flutter/material.dart';

class LessonDetailHomePageModel
    extends FlutterFlowModel<LessonDetailHomePageWidget> {
  ///  Local state fields for this page.

  List<dynamic> list = [];
  void addToList(dynamic item) => list.add(item);
  void removeFromList(dynamic item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, dynamic item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(dynamic) updateFn) =>
      list[index] = updateFn(list[index]);

  dynamic heart;

  String checkLove = '';

  List<dynamic> listStaffIdHeart = [];
  void addToListStaffIdHeart(dynamic item) => listStaffIdHeart.add(item);
  void removeFromListStaffIdHeart(dynamic item) =>
      listStaffIdHeart.remove(item);
  void removeAtIndexFromListStaffIdHeart(int index) =>
      listStaffIdHeart.removeAt(index);
  void insertAtIndexInListStaffIdHeart(int index, dynamic item) =>
      listStaffIdHeart.insert(index, item);
  void updateListStaffIdHeartAtIndex(int index, Function(dynamic) updateFn) =>
      listStaffIdHeart[index] = updateFn(listStaffIdHeart[index]);

  List<dynamic> heartId = [];
  void addToHeartId(dynamic item) => heartId.add(item);
  void removeFromHeartId(dynamic item) => heartId.remove(item);
  void removeAtIndexFromHeartId(int index) => heartId.removeAt(index);
  void insertAtIndexInHeartId(int index, dynamic item) =>
      heartId.insert(index, item);
  void updateHeartIdAtIndex(int index, Function(dynamic) updateFn) =>
      heartId[index] = updateFn(heartId[index]);

  String checkFile = '1';

  String testId = '';

  String status = 'inprogress';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (DeleteHeart)] action in Icon widget.
  ApiCallResponse? apiResultDeleteHeart;
  // Stores action output result for [Backend Call - API (postHeart)] action in Icon widget.
  ApiCallResponse? apiResultoan;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // State field(s) for comments widget.
  FocusNode? commentsFocusNode;
  TextEditingController? commentsTextController;
  String? Function(BuildContext, String?)? commentsTextControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateStaffLessonStatus)] action in Button widget.
  ApiCallResponse? apiResultUpdateStatus;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlockabcd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    commentFocusNode?.dispose();
    commentTextController?.dispose();

    commentsFocusNode?.dispose();
    commentsTextController?.dispose();
  }

  /// Action blocks.
  Future postComment(BuildContext context) async {
    ApiCallResponse? apiResultPostComment;
    bool? checkRefreshTokenBlock;

    apiResultPostComment = await LessonGroup.postCommentCall.call(
      accessToken: FFAppState().accessToken,
      content: commentsTextController.text,
      lessionId: getJsonField(
        widget.listItems,
        r'''$.id''',
      ).toString().toString(),
      staffId: FFAppState().staffid,
    );
    if (!(apiResultPostComment.succeeded ?? true)) {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostComment.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }
  }

  Future getComments(BuildContext context) async {
    ApiCallResponse? apiResultGetCommment;
    bool? checkRefreshTokenBlock;

    apiResultGetCommment = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${getJsonField(
        widget.listItems,
        r'''$.id''',
      ).toString().toString()}\"}}]}',
    );
    if ((apiResultGetCommment.succeeded ?? true)) {
      list = getJsonField(
        (apiResultGetCommment.jsonBody ?? ''),
        r'''$.data[0].comments''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      testId = getJsonField(
        (apiResultGetCommment.jsonBody ?? ''),
        r'''$.data[0].test_id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetCommment.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }
  }

  Future getHeart(BuildContext context) async {
    ApiCallResponse? apiResultHeart;
    bool? checkRefreshTokenBlock1;

    apiResultHeart = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${getJsonField(
        widget.listItems,
        r'''$.id''',
      ).toString().toString()}\"}}]}',
    );
    if ((apiResultHeart.succeeded ?? true)) {
      heart = getJsonField(
        (apiResultHeart.jsonBody ?? ''),
        r'''$.data[0]''',
      );
      listStaffIdHeart = getJsonField(
        (apiResultHeart.jsonBody ?? ''),
        r'''$.data[0].reacts''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      if (listStaffIdHeart
              .where((e) =>
                  getJsonField(
                    e,
                    r'''$.reacts_id.staff_id''',
                  ).toString().toString() ==
                  FFAppState().staffid)
              .toList().isNotEmpty) {
        checkLove = '1';
      } else {
        checkLove = '0';
      }

      heartId = getJsonField(
        (apiResultHeart.jsonBody ?? ''),
        r'''$.data[0].reacts''',
        true,
      )!
          .toList()
          .cast<dynamic>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultHeart.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }
  }
}
