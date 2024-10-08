import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'question_update_widget.dart' show QuestionUpdateWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionUpdateModel extends FlutterFlowModel<QuestionUpdateWidget> {
  ///  Local state fields for this component.

  RequestQuestionsStruct? dataList;
  void updateDataListStruct(Function(RequestQuestionsStruct) updateFn) {
    updateFn(dataList ??= RequestQuestionsStruct());
  }

  int? loop = 0;

  bool isLoad = false;

  List<QuestionAnswersIdStruct> answerAdd = [];
  void addToAnswerAdd(QuestionAnswersIdStruct item) => answerAdd.add(item);
  void removeFromAnswerAdd(QuestionAnswersIdStruct item) =>
      answerAdd.remove(item);
  void removeAtIndexFromAnswerAdd(int index) => answerAdd.removeAt(index);
  void insertAtIndexInAnswerAdd(int index, QuestionAnswersIdStruct item) =>
      answerAdd.insert(index, item);
  void updateAnswerAddAtIndex(
          int index, Function(QuestionAnswersIdStruct) updateFn) =>
      answerAdd[index] = updateFn(answerAdd[index]);

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
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
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
