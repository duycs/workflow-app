import '/flutter_flow/flutter_flow_util.dart';
import 'test_number_add_widget.dart' show TestNumberAddWidget;
import 'package:flutter/material.dart';

class TestNumberAddModel extends FlutterFlowModel<TestNumberAddWidget> {
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
