import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_widget.dart' show TimeKeepingWidget;
import 'package:flutter/material.dart';

class TimeKeepingModel extends FlutterFlowModel<TimeKeepingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Button widget.
  bool? authenticateBiometicsTimeKeeping;
  // Stores action output result for [Custom Action - timeKeepingLocation] action in Button widget.
  String? timeKeepingLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
