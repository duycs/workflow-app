import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/training/do_test/confirm_do_test/confirm_do_test_widget.dart';
import '/training/lesson/menu_delete/menu_delete_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'staffs_programs_lesson_widget.dart' show StaffsProgramsLessonWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffsProgramsLessonModel
    extends FlutterFlowModel<StaffsProgramsLessonWidget> {
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

  List<EmployeeLessonListStruct> staffsLessionsListOne = [];
  void addToStaffsLessionsListOne(EmployeeLessonListStruct item) =>
      staffsLessionsListOne.add(item);
  void removeFromStaffsLessionsListOne(EmployeeLessonListStruct item) =>
      staffsLessionsListOne.remove(item);
  void removeAtIndexFromStaffsLessionsListOne(int index) =>
      staffsLessionsListOne.removeAt(index);
  void insertAtIndexInStaffsLessionsListOne(
          int index, EmployeeLessonListStruct item) =>
      staffsLessionsListOne.insert(index, item);
  void updateStaffsLessionsListOneAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      staffsLessionsListOne[index] = updateFn(staffsLessionsListOne[index]);

  ///  State fields for stateful widgets in this page.

  // Model for MobileEditorDisplayComponent component.
  late MobileEditorDisplayComponentModel mobileEditorDisplayComponentModel;
  // State field(s) for comments widget.
  FocusNode? commentsFocusNode;
  TextEditingController? commentsTextController;
  String? Function(BuildContext, String?)? commentsTextControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateStaffLessonStatus)] action in Button widget.
  ApiCallResponse? apiResultUpdateStatus;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlockabcd;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateStaffProgramStatus;
  // Stores action output result for [Backend Call - API (UpdateStaffProgramStatus)] action in Button widget.
  ApiCallResponse? apiResultUpdateStaffProgramStatus;

  @override
  void initState(BuildContext context) {
    mobileEditorDisplayComponentModel =
        createModel(context, () => MobileEditorDisplayComponentModel());
  }

  @override
  void dispose() {
    mobileEditorDisplayComponentModel.dispose();
    commentsFocusNode?.dispose();
    commentsTextController?.dispose();
  }

  /// Action blocks.
  Future postComment(BuildContext context) async {
    ApiCallResponse? apiResultPostComment;
    bool? checkRefreshTokenBlock3;

    apiResultPostComment = await LessonGroup.postCommentCall.call(
      accessToken: FFAppState().accessToken,
      content: commentsTextController.text,
      lessionId: staffsLessionsListOne.first.lessionId.id,
      staffId: FFAppState().staffid,
    );

    if (!(apiResultPostComment?.succeeded ?? true)) {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostComment?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock3!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
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
      filter:
          '{\"_and\":[{\"id\":{\"_eq\":\"${staffsLessionsListOne.first.lessionId.id}\"}}]}',
    );

    if ((apiResultGetCommment?.succeeded ?? true)) {
      list = getJsonField(
        (apiResultGetCommment?.jsonBody ?? ''),
        r'''$.data[0].comments''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      testId = getJsonField(
        (apiResultGetCommment?.jsonBody ?? ''),
        r'''$.data[0].test_id''',
      ).toString().toString();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetCommment?.jsonBody ?? ''),
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
      filter:
          '{\"_and\":[{\"id\":{\"_eq\":\"${staffsLessionsListOne.first.lessionId.id}\"}}]}',
    );

    if ((apiResultHeart?.succeeded ?? true)) {
      heart = getJsonField(
        (apiResultHeart?.jsonBody ?? ''),
        r'''$.data[0]''',
      );
      listStaffIdHeart = getJsonField(
        (apiResultHeart?.jsonBody ?? ''),
        r'''$.data[0].reacts''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      if (listStaffIdHeart
              .where((e) =>
                  '${getJsonField(
                    e,
                    r'''$.reacts_id.staff_id''',
                  ).toString().toString()}' ==
                  FFAppState().staffid)
              .toList()
              .length >
          0) {
        checkLove = '1';
      } else {
        checkLove = '0';
      }

      heartId = getJsonField(
        (apiResultHeart?.jsonBody ?? ''),
        r'''$.data[0].reacts''',
        true,
      )!
          .toList()
          .cast<dynamic>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultHeart?.jsonBody ?? ''),
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

  Future getOneStaffsLessions(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock2;

    apiResultList = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"lession_id\":{\"id\":{\"_eq\":\"${widget!.lessionId}\"}}},{\"lession_id\":{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"${widget!.programsId}\"}}}}}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      staffsLessionsListOne = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      status = staffsLessionsListOne.first.status;
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getOneStaffsLessions(context);
      }
    }
  }

  Future deleteHeart(BuildContext context) async {
    ApiCallResponse? apiResultDeleteHeart;
    bool? checkRefreshTokenBlock4;

    apiResultDeleteHeart = await LessonGroup.deleteHeartCall.call(
      accessToken: FFAppState().accessToken,
      idHeart: functions.stringToInt(getJsonField(
        listStaffIdHeart
            .where((e) =>
                '${getJsonField(
                  e,
                  r'''$.reacts_id.staff_id''',
                ).toString().toString()}' ==
                FFAppState().staffid)
            .toList()
            .first,
        r'''$.id''',
      ).toString().toString()),
    );

    if (!(apiResultDeleteHeart?.succeeded ?? true)) {
      checkRefreshTokenBlock4 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultDeleteHeart?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock4!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
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
    bool? checkRefreshTokenBlock5;

    apiResultPostHeart = await LessonGroup.postHeartCall.call(
      accessToken: FFAppState().accessToken,
      staffId: FFAppState().staffid,
      status: 'love',
      lessionId: staffsLessionsListOne.first.lessionId.id,
    );

    if (!(apiResultPostHeart?.succeeded ?? true)) {
      checkRefreshTokenBlock5 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultPostHeart?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock5!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await postHeart(context);
      }

      return;
    }
    await getHeart(context);
  }
}
