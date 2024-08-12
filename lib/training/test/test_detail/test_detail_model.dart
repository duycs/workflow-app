import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/test/checkbox_groups_test/checkbox_groups_test_widget.dart';
import '/training/test/radio_buton_detail/radio_buton_detail_widget.dart';
import '/training/test/test_long_text/test_long_text_widget.dart';
import '/training/test/test_number/test_number_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'test_detail_widget.dart' show TestDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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

  // Stores action output result for [Action Block - tokenReload] action in TestDetail widget.
  bool? reloadTokenTestOne1;
  // Stores action output result for [Backend Call - API (TestOne)] action in TestDetail widget.
  ApiCallResponse? apiResultlistTest1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
