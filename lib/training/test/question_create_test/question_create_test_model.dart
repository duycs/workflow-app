import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'question_create_test_widget.dart' show QuestionCreateTestWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionCreateTestModel
    extends FlutterFlowModel<QuestionCreateTestWidget> {
  ///  Local state fields for this component.

  RequestQuestionsStruct? requestData;
  void updateRequestDataStruct(Function(RequestQuestionsStruct) updateFn) =>
      updateFn(requestData ??= RequestQuestionsStruct());

  List<QuestionObjectStruct> questionList = [];
  void addToQuestionList(QuestionObjectStruct item) => questionList.add(item);
  void removeFromQuestionList(QuestionObjectStruct item) =>
      questionList.remove(item);
  void removeAtIndexFromQuestionList(int index) => questionList.removeAt(index);
  void insertAtIndexInQuestionList(int index, QuestionObjectStruct item) =>
      questionList.insert(index, item);
  void updateQuestionListAtIndex(
          int index, Function(QuestionObjectStruct) updateFn) =>
      questionList[index] = updateFn(questionList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for QuestionConten widget.
  FocusNode? questionContenFocusNode;
  TextEditingController? questionContenTextController;
  String? Function(BuildContext, String?)?
      questionContenTextControllerValidator;
  String? _questionContenTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập câu hỏi !';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextAnswer widget.
  FocusNode? textAnswerFocusNode;
  TextEditingController? textAnswerTextController;
  String? Function(BuildContext, String?)? textAnswerTextControllerValidator;
  // State field(s) for TextAnswerNumber widget.
  FocusNode? textAnswerNumberFocusNode;
  TextEditingController? textAnswerNumberTextController;
  String? Function(BuildContext, String?)?
      textAnswerNumberTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (questionCreate)] action in Button widget.
  ApiCallResponse? apiResultCreate;

  @override
  void initState(BuildContext context) {
    questionContenTextControllerValidator =
        _questionContenTextControllerValidator;
  }

  @override
  void dispose() {
    questionContenFocusNode?.dispose();
    questionContenTextController?.dispose();

    textAnswerFocusNode?.dispose();
    textAnswerTextController?.dispose();

    textAnswerNumberFocusNode?.dispose();
    textAnswerNumberTextController?.dispose();
  }
}
