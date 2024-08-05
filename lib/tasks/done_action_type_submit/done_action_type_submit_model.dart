import '/flutter_flow/flutter_flow_util.dart';
import 'done_action_type_submit_widget.dart' show DoneActionTypeSubmitWidget;
import 'package:flutter/material.dart';

class DoneActionTypeSubmitModel
    extends FlutterFlowModel<DoneActionTypeSubmitWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
