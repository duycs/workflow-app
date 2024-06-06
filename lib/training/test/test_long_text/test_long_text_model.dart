import '/flutter_flow/flutter_flow_util.dart';
import 'test_long_text_widget.dart' show TestLongTextWidget;
import 'package:flutter/material.dart';

class TestLongTextModel extends FlutterFlowModel<TestLongTextWidget> {
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
