import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'study_program_widget.dart' show StudyProgramWidget;
import 'package:flutter/material.dart';

class StudyProgramModel extends FlutterFlowModel<StudyProgramWidget> {
  ///  Local state fields for this component.

  StudyProgramListStruct? requestData;
  void updateRequestDataStruct(Function(StudyProgramListStruct) updateFn) =>
      updateFn(requestData ??= StudyProgramListStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for ProgramName widget.
  FocusNode? programNameFocusNode;
  TextEditingController? programNameTextController;
  String? Function(BuildContext, String?)? programNameTextControllerValidator;
  // State field(s) for ProgramDescription widget.
  FocusNode? programDescriptionFocusNode;
  TextEditingController? programDescriptionTextController;
  String? Function(BuildContext, String?)?
      programDescriptionTextControllerValidator;
  // Model for TestsDropdown component.
  late TestsDropdownModel testsDropdownModel;
  // Model for LessionsDropdown component.
  late LessionsDropdownModel lessionsDropdownModel;

  @override
  void initState(BuildContext context) {
    testsDropdownModel = createModel(context, () => TestsDropdownModel());
    lessionsDropdownModel = createModel(context, () => LessionsDropdownModel());
  }

  @override
  void dispose() {
    programNameFocusNode?.dispose();
    programNameTextController?.dispose();

    programDescriptionFocusNode?.dispose();
    programDescriptionTextController?.dispose();

    testsDropdownModel.dispose();
    lessionsDropdownModel.dispose();
  }
}
