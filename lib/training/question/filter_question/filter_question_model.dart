import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_question_widget.dart' show FilterQuestionWidget;
import 'package:flutter/material.dart';

class FilterQuestionModel extends FlutterFlowModel<FilterQuestionWidget> {
  ///  Local state fields for this component.

  String? nameSearch;

  String? statusSearch;

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for dropStatus widget.
  String? dropStatusValue;
  FormFieldController<String>? dropStatusValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
