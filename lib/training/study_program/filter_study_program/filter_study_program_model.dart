import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_study_program_widget.dart' show FilterStudyProgramWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterStudyProgramModel
    extends FlutterFlowModel<FilterStudyProgramWidget> {
  ///  Local state fields for this component.

  String? dateEndFilter;

  String? dateStartFilter;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // State field(s) for lessions widget.
  FocusNode? lessionsFocusNode;
  TextEditingController? lessionsTextController;
  String? Function(BuildContext, String?)? lessionsTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lessionsFocusNode?.dispose();
    lessionsTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
