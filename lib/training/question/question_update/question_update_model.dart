import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'question_update_widget.dart' show QuestionUpdateWidget;
import 'package:flutter/material.dart';

class QuestionUpdateModel extends FlutterFlowModel<QuestionUpdateWidget> {
  ///  Local state fields for this component.

  RequestQuestionsStruct? dataList;
  void updateDataListStruct(Function(RequestQuestionsStruct) updateFn) =>
      updateFn(dataList ??= RequestQuestionsStruct());

  int? loop = 0;

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextQuestion widget.
  FocusNode? textQuestionFocusNode;
  TextEditingController? textQuestionTextController;
  String? Function(BuildContext, String?)? textQuestionTextControllerValidator;
  String? _textQuestionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập câu hỏi!';
    }

    return null;
  }

  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextAdd widget.
  FocusNode? textAddFocusNode;
  TextEditingController? textAddTextController;
  String? Function(BuildContext, String?)? textAddTextControllerValidator;
  // State field(s) for TextAnswerNumber widget.
  FocusNode? textAnswerNumberFocusNode;
  TextEditingController? textAnswerNumberTextController;
  String? Function(BuildContext, String?)?
      textAnswerNumberTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadQuestionUpdate;
  // Stores action output result for [Backend Call - API (questionUpdate)] action in Button widget.
  ApiCallResponse? apiResultUpdate;

  @override
  void initState(BuildContext context) {
    textQuestionTextControllerValidator = _textQuestionTextControllerValidator;
  }

  @override
  void dispose() {
    textQuestionFocusNode?.dispose();
    textQuestionTextController?.dispose();

    textAddFocusNode?.dispose();
    textAddTextController?.dispose();

    textAnswerNumberFocusNode?.dispose();
    textAnswerNumberTextController?.dispose();
  }
}
