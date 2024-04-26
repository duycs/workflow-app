import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'test_list_widget.dart' show TestListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestListModel extends FlutterFlowModel<TestListWidget> {
  ///  Local state fields for this page.

  List<TestListStruct> listTest = [];
  void addToListTest(TestListStruct item) => listTest.add(item);
  void removeFromListTest(TestListStruct item) => listTest.remove(item);
  void removeAtIndexFromListTest(int index) => listTest.removeAt(index);
  void insertAtIndexInListTest(int index, TestListStruct item) =>
      listTest.insert(index, item);
  void updateListTestAtIndex(int index, Function(TestListStruct) updateFn) =>
      listTest[index] = updateFn(listTest[index]);

  String filter = '';

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
  Future getListTest(BuildContext context) async {
    bool? reloadTokenTestlist;
    ApiCallResponse? apiResultTestList;

    reloadTokenTestlist = await action_blocks.tokenReload(context);
    if (reloadTokenTestlist!) {
      apiResultTestList = await TestGroup.testListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${(filter != null && filter != '') && (filter != ' ') ? ',{\"name\":{\"_icontains\":\"${filter}\"}}' : ' '}${',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}}'}]}',
      );
      if ((apiResultTestList?.succeeded ?? true)) {
        listTest = TestListDataStruct.maybeFromMap(
                (apiResultTestList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TestListStruct>();
      }
    } else {
      return;
    }
  }
}
