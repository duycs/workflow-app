import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_location_filter_widget.dart'
    show TimeKeepingLocationFilterWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeKeepingLocationFilterModel
    extends FlutterFlowModel<TimeKeepingLocationFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue1;
  FormFieldController<String>? dropDownStatusValueController1;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue2;
  FormFieldController<String>? dropDownStatusValueController2;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue3;
  FormFieldController<String>? dropDownStatusValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue4;
  FormFieldController<String>? dropDownStatusValueController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
