import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/filter_do_test/filter_do_test_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'do_test_list_widget.dart' show DoTestListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoTestListModel extends FlutterFlowModel<DoTestListWidget> {
  ///  Local state fields for this page.

  List<StaffsTestsListStruct> list = [];
  void addToList(StaffsTestsListStruct item) => list.add(item);
  void removeFromList(StaffsTestsListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffsTestsListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffsTestsListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String filter = '';

  String dateStartFilter = '';

  String dateEndFilter = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getListStaffTest(BuildContext context) async {
    bool? getListStaffTestToken;
    ApiCallResponse? apiResultGetListStaffTest;

    getListStaffTestToken = await action_blocks.tokenReload(context);
    if (getListStaffTestToken!) {
      apiResultGetListStaffTest = await DoTestGroup.staffsTestsListCall.call(
        accessToken: FFAppState().accessToken,
        filter: filter,
      );
      if ((apiResultGetListStaffTest?.succeeded ?? true)) {
        list = StaffsTestsListDataStruct.maybeFromMap(
                (apiResultGetListStaffTest?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StaffsTestsListStruct>();
      }
    } else {
      FFAppState().update(() {});
    }
  }
}
