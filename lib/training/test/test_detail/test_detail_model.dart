import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_detail_widget.dart' show TestDetailWidget;
import 'package:flutter/material.dart';

class TestDetailModel extends FlutterFlowModel<TestDetailWidget> {
  ///  Local state fields for this page.

  TestListStruct? detail;
  void updateDetailStruct(Function(TestListStruct) updateFn) {
    updateFn(detail ??= TestListStruct());
  }

  List<dynamic> questions = [];
  void addToQuestions(dynamic item) => questions.add(item);
  void removeFromQuestions(dynamic item) => questions.remove(item);
  void removeAtIndexFromQuestions(int index) => questions.removeAt(index);
  void insertAtIndexInQuestions(int index, dynamic item) =>
      questions.insert(index, item);
  void updateQuestionsAtIndex(int index, Function(dynamic) updateFn) =>
      questions[index] = updateFn(questions[index]);

  bool check = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in TestDetail widget.
  bool? reloadTokenTestOne1;
  // Stores action output result for [Backend Call - API (TestOne)] action in TestDetail widget.
  ApiCallResponse? apiResultlistTest1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
