import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'test_list_widget.dart' show TestListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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

  String checkData = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in TestList widget.
  bool? reloadTokenTestlistPage;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
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
        checkData = '1';
      }
    } else {
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewTestListPage);
  }

  void listViewTestListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewTestListResponse) {
        final pageItems =
            (TestListDataStruct.maybeFromMap(listViewTestListResponse.jsonBody)!
                        .data ??
                    [])
                .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewTestListResponse,
                )
              : null,
        );
      });
}
