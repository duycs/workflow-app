import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_programs_widget.dart' show FilterProgramsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterProgramsModel extends FlutterFlowModel<FilterProgramsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for domain widget.
  String? domainValue;
  FormFieldController<String>? domainValueController;
  // State field(s) for author widget.
  FocusNode? authorFocusNode;
  TextEditingController? authorTextController;
  String? Function(BuildContext, String?)? authorTextControllerValidator;
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  // State field(s) for priceMin widget.
  FocusNode? priceMinFocusNode;
  TextEditingController? priceMinTextController;
  String? Function(BuildContext, String?)? priceMinTextControllerValidator;
  // State field(s) for priceMax widget.
  FocusNode? priceMaxFocusNode;
  TextEditingController? priceMaxTextController;
  String? Function(BuildContext, String?)? priceMaxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    authorFocusNode?.dispose();
    authorTextController?.dispose();

    categoryFocusNode?.dispose();
    categoryTextController?.dispose();

    priceMinFocusNode?.dispose();
    priceMinTextController?.dispose();

    priceMaxFocusNode?.dispose();
    priceMaxTextController?.dispose();
  }
}
