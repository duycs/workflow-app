import '/flutter_flow/flutter_flow_util.dart';
import 'question_long_text_widget.dart' show QuestionLongTextWidget;
import 'package:flutter/material.dart';

class QuestionLongTextModel extends FlutterFlowModel<QuestionLongTextWidget> {
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
