import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/action_chinh_sua/action_chinh_sua_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/study_program/certificate_list_study_program/certificate_list_study_program_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'study_program_detail_widget.dart' show StudyProgramDetailWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramDetailModel
    extends FlutterFlowModel<StudyProgramDetailWidget> {
  ///  Local state fields for this page.

  StudyProgramListStruct? studyProgramData;
  void updateStudyProgramDataStruct(Function(StudyProgramListStruct) updateFn) {
    updateFn(studyProgramData ??= StudyProgramListStruct());
  }

  bool isCheck = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }

  /// Action blocks.
  Future getOneDataStudyProgram(BuildContext context) async {
    bool? checkReloadTockenGetOneStudyprogram;
    ApiCallResponse? apiResultGetDataStudyProgram;

    checkReloadTockenGetOneStudyprogram =
        await action_blocks.tokenReload(context);
    if (checkReloadTockenGetOneStudyprogram!) {
      apiResultGetDataStudyProgram =
          await StudyProgramGroup.studyProgramGetOneCall.call(
        id: widget!.studyProgramList?.id,
        accessToken: FFAppState().accessToken,
      );

      if ((apiResultGetDataStudyProgram?.succeeded ?? true)) {
        studyProgramData = StudyProgramListStruct.maybeFromMap(getJsonField(
          (apiResultGetDataStudyProgram?.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    } else {
      FFAppState().update(() {});
      return;
    }

    isCheck = true;
  }
}
