import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filter_study_program_user_copy_widget.dart'
    show FilterStudyProgramUserCopyWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterStudyProgramUserCopyModel
    extends FlutterFlowModel<FilterStudyProgramUserCopyWidget> {
  ///  Local state fields for this component.

  DateTime? dateStart;

  DateTime? dateEnd;

  DateTime? dateStartCPN;

  DateTime? dateEndCPN;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for lessionName widget.
  FocusNode? lessionNameFocusNode;
  TextEditingController? lessionNameTextController;
  String? Function(BuildContext, String?)? lessionNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lessionNameFocusNode?.dispose();
    lessionNameTextController?.dispose();
  }
}
