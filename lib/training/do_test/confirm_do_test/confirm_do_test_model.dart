import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'confirm_do_test_widget.dart' show ConfirmDoTestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmDoTestModel extends FlutterFlowModel<ConfirmDoTestWidget> {
  ///  Local state fields for this component.

  TestListStruct? list;
  void updateListStruct(Function(TestListStruct) updateFn) {
    updateFn(list ??= TestListStruct());
  }

  String testId = '';

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in ConfirmDoTest widget.
  bool? getTestToken;
  // Stores action output result for [Backend Call - API (TestOne)] action in ConfirmDoTest widget.
  ApiCallResponse? apiResultGetTest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
