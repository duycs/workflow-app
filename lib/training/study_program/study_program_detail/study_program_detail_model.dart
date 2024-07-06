import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/certificate/certificate/certificate_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'study_program_detail_widget.dart' show StudyProgramDetailWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

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
  // Model for Certificate component.
  late CertificateModel certificateModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {
    certificateModel = createModel(context, () => CertificateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    certificateModel.dispose();
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
        id: widget.studyProgramList?.id,
        accessToken: FFAppState().accessToken,
      );

      if ((apiResultGetDataStudyProgram.succeeded ?? true)) {
        studyProgramData = StudyProgramListStruct.maybeFromMap(getJsonField(
          (apiResultGetDataStudyProgram.jsonBody ?? ''),
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
