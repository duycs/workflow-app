import '/flutter_flow/flutter_flow_util.dart';
import 'time_keeping_shift_created_widget.dart'
    show TimeKeepingShiftCreatedWidget;
import 'package:flutter/material.dart';

class TimeKeepingShiftCreatedModel
    extends FlutterFlowModel<TimeKeepingShiftCreatedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
