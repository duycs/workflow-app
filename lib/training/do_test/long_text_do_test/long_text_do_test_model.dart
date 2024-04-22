import '/flutter_flow/flutter_flow_util.dart';
import 'long_text_do_test_widget.dart' show LongTextDoTestWidget;
import 'package:flutter/material.dart';

class LongTextDoTestModel extends FlutterFlowModel<LongTextDoTestWidget> {
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
