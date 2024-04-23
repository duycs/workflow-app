import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'question_test_widget.dart' show QuestionTestWidget;
import 'package:flutter/material.dart';

class QuestionTestModel extends FlutterFlowModel<QuestionTestWidget> {
  ///  Local state fields for this component.

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

  // Stores action output result for [Action Block - tokenReload] action in questionTest widget.
  bool? reloadTokenQuestion;
  // Stores action output result for [Backend Call - API (questionList)] action in questionTest widget.
  ApiCallResponse? apiResultQuestionList;
  // State field(s) for question widget.
  String? questionValue;
  FormFieldController<String>? questionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
