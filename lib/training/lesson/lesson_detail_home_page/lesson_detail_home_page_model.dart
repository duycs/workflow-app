import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
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

  String status = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MobileEditorDisplayComponent component.
  late MobileEditorDisplayComponentModel mobileEditorDisplayComponentModel;
  // State field(s) for comments widget.
  FocusNode? commentsFocusNode;
  TextEditingController? commentsTextController;
  String? Function(BuildContext, String?)? commentsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    mobileEditorDisplayComponentModel =
        createModel(context, () => MobileEditorDisplayComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mobileEditorDisplayComponentModel.dispose();
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
        widget!.listItems,
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await postComment(context);
      }
    }
  }

  Future getComments(BuildContext context) async {
    ApiCallResponse? apiResultGetCommment;
    bool? checkRefreshTokenBlock;

    apiResultGetCommment = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"id\":{\"_eq\":\"${getJsonField(
        widget!.listItems,
        r'''$.id''',
      ).toString().toString()}\"}}'}]}',
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
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getComments(context);
      }
    }
  }

  Future getHeart(BuildContext context) async {
    ApiCallResponse? apiResultHeart;
    bool? checkRefreshTokenBlock1;

    apiResultHeart = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"id\":{\"_eq\":\"${getJsonField(
        widget!.listItems,
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
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getHeart(context);
      }
    }
  }

  Future deleteHeart(BuildContext context) async {
    ApiCallResponse? apiResultDeleteHeart;
    bool? checkRefreshTokenBlock55;

    apiResultDeleteHeart = await LessonGroup.deleteHeartCall.call(
      accessToken: FFAppState().accessToken,
      idHeart: functions.stringToInt(getJsonField(
        listStaffIdHeart
            .where((e) =>
                getJsonField(
                  e,
                  r'''$.reacts_id.staff_id''',
                ).toString().toString() ==
                FFAppState().staffid)
            .toList()
            .first,
        r'''$.id''',
      ).toString().toString()),
    );

    if (!(apiResultDeleteHeart.succeeded ?? true)) {
      checkRefreshTokenBlock55 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultDeleteHeart.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock55!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await deleteHeart(context);
      }

      return;
    }
    await getHeart(context);
  }

  Future postHeart(BuildContext context) async {
    ApiCallResponse? apiResultPostHeart;
    bool? checkRefreshTokenBlock66;

    apiResultPostHeart = await LessonGroup.postHeartCall.call(
      accessToken: FFAppState().accessToken,
      staffId: FFAppState().staffid,
      status: 'love',
      lessionId: getJsonField(
        widget!.listItems,
        r'''$.id''',
      ).toString().toString(),
    );

    if (!(apiResultPostHeart.succeeded ?? true)) {
      checkRefreshTokenBlock66 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostHeart.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock66!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await postHeart(context);
      }

      return;
    }
    await getHeart(context);
  }

  Future startLesson(BuildContext context) async {
    ApiCallResponse? apiResultStartLesson;
    bool? checkRefreshTokenBlockStartLesson;

    apiResultStartLesson = await LessonGroup.updateStaffLessonStatusCall.call(
      accessToken: FFAppState().accessToken,
      id: widget!.id,
      dateStart: getCurrentTimestamp.toString(),
    );

    if ((apiResultStartLesson.succeeded ?? true)) {
      status = 'inprogress';
      await actions.showToast(
        context,
        'Đã ghim bài đang học',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondary,
      );
    } else {
      checkRefreshTokenBlockStartLesson = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultStartLesson.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockStartLesson!) {
        await actions.showToast(
          context,
          'Lỗi cập nhật trạng thái đang học của chương trình',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await startLesson(context);
      }
    }
  }

  Future updatePrograms(BuildContext context) async {
    ApiCallResponse? apiResultUpdateProgram;
    bool? checkRefreshTokenBlock66abcd;

    apiResultUpdateProgram =
        await LessonGroup.updateStaffProgramStatusCall.call(
      accessToken: FFAppState().accessToken,
      staffId: FFAppState().staffid,
      programId: widget!.programId,
    );

    if (!(apiResultUpdateProgram.succeeded ?? true)) {
      checkRefreshTokenBlock66abcd = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultUpdateProgram.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock66abcd!) {
        await actions.showToast(
          context,
          'Lỗi cập nhật trạng thái đang học của Chương trình',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await updatePrograms(context);
      }

      return;
    }
  }
}
