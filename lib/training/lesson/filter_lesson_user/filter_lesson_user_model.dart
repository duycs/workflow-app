import '/flutter_flow/flutter_flow_util.dart';
import 'filter_lesson_user_widget.dart' show FilterLessonUserWidget;
import 'package:flutter/material.dart';

class FilterLessonUserModel extends FlutterFlowModel<FilterLessonUserWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
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
