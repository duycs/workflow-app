import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'study_program_edit_widget.dart' show StudyProgramEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramEditModel extends FlutterFlowModel<StudyProgramEditWidget> {
  ///  Local state fields for this component.

  StudyProgramListStruct? requestData;
  void updateRequestDataStruct(Function(StudyProgramListStruct) updateFn) =>
      updateFn(requestData ??= StudyProgramListStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ProgramName widget.
  FocusNode? programNameFocusNode;
  TextEditingController? programNameTextController;
  String? Function(BuildContext, String?)? programNameTextControllerValidator;
  String? _programNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên chương trình!';
    }

    return null;
  }

  // State field(s) for ProgramDescription widget.
  FocusNode? programDescriptionFocusNode;
  TextEditingController? programDescriptionTextController;
  String? Function(BuildContext, String?)?
      programDescriptionTextControllerValidator;
  // Model for TestsDropdown component.
  late TestsDropdownModel testsDropdownModel;
  // Model for LessionsDropdown component.
  late LessionsDropdownModel lessionsDropdownModel;
  // Stores action output result for [Action Block - addList] action in LessionsDropdown widget.
  bool? updateLessionItem;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenStudyProgramEdit;
  // Stores action output result for [Backend Call - API (StudyProgramLessionsUpdate)] action in Button widget.
  ApiCallResponse? apiResultuus;
  // Stores action output result for [Backend Call - API (SynchronizedStaffLesson)] action in Button widget.
  ApiCallResponse? apiResultSynchronizedStaffLesson;

  @override
  void initState(BuildContext context) {
    programNameTextControllerValidator = _programNameTextControllerValidator;
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

  /// Action blocks.
  Future<bool?> addList(
    BuildContext context, {
    LessonsStruct? lessionsItem,
  }) async {
    if (!requestData!.lessions
        .map((e) => e.lessionsId.id)
        .toList()
        .toList()
        .contains(lessionsItem!.id)) {
      updateRequestDataStruct(
        (e) => e
          ..updateLessions(
            (e) => e.add(StudyProgramListLessionsIdStruct(
              lessionsId: LessonsStruct(
                id: lessionsItem?.id,
                name: lessionsItem?.name,
              ),
            )),
          ),
      );
      return true;
    } else {
      return false;
    }
  }
}
