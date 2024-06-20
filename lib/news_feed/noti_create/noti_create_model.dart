import '/flutter_flow/flutter_flow_util.dart';
import 'noti_create_widget.dart' show NotiCreateWidget;
import 'package:flutter/material.dart';

class NotiCreateModel extends FlutterFlowModel<NotiCreateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
