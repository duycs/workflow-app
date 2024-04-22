import '/flutter_flow/flutter_flow_util.dart';
import 'wait_action_type_submit_text_widget.dart'
    show WaitActionTypeSubmitTextWidget;
import 'package:flutter/material.dart';

class WaitActionTypeSubmitTextModel
    extends FlutterFlowModel<WaitActionTypeSubmitTextWidget> {
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
