import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/test/checkbox_groups_test/checkbox_groups_test_widget.dart';
import '/training/test/radio_group_tests/radio_group_tests_widget.dart';
import '/training/test/test_long_text/test_long_text_widget.dart';
import '/training/test/test_number/test_number_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
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
  void updateDetailStruct(Function(TestListStruct) updateFn) =>
      updateFn(detail ??= TestListStruct());

  List<dynamic> questions = [];
  void addToQuestions(dynamic item) => questions.add(item);
  void removeFromQuestions(dynamic item) => questions.remove(item);
  void removeAtIndexFromQuestions(int index) => questions.removeAt(index);
  void insertAtIndexInQuestions(int index, dynamic item) =>
      questions.insert(index, item);
  void updateQuestionsAtIndex(int index, Function(dynamic) updateFn) =>
      questions[index] = updateFn(questions[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getLinkTestList(BuildContext context) async {
    bool? reloadTokenTestOne;
    ApiCallResponse? apiResultlistTest;

    reloadTokenTestOne = await action_blocks.tokenReload(context);
    if (reloadTokenTestOne!) {
      apiResultlistTest = await TestGroup.testOneCall.call(
        testsId: widget.id,
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultlistTest?.succeeded ?? true)) {
        detail = TestListStruct.maybeFromMap(getJsonField(
          (apiResultlistTest?.jsonBody ?? ''),
          r'''$.data''',
        ));
        questions = getJsonField(
          (apiResultlistTest?.jsonBody ?? ''),
          r'''$.data.questions[:].questions_id''',
          true,
        )!
            .toList()
            .cast<dynamic>();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
