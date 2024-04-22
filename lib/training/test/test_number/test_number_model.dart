import '/flutter_flow/flutter_flow_util.dart';
import 'test_number_widget.dart' show TestNumberWidget;
import 'package:flutter/material.dart';

class TestNumberModel extends FlutterFlowModel<TestNumberWidget> {
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
