import '/flutter_flow/flutter_flow_util.dart';
import 'question_number_widget.dart' show QuestionNumberWidget;
import 'package:flutter/material.dart';

class QuestionNumberModel extends FlutterFlowModel<QuestionNumberWidget> {
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
