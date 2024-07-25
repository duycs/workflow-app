import '/flutter_flow/flutter_flow_util.dart';
import 'test_long_text_add_widget.dart' show TestLongTextAddWidget;
import 'package:flutter/material.dart';

class TestLongTextAddModel extends FlutterFlowModel<TestLongTextAddWidget> {
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
