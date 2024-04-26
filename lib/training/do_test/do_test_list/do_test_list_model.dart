import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'do_test_list_widget.dart' show DoTestListWidget;
import 'package:flutter/material.dart';

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
      if ((apiResultGetListStaffTest.succeeded ?? true)) {
        list = StaffsTestsListDataStruct.maybeFromMap(
                (apiResultGetListStaffTest.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StaffsTestsListStruct>();
      }
    } else {
      FFAppState().update(() {});
    }
  }
}
