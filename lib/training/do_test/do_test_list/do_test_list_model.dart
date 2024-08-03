import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'do_test_list_widget.dart' show DoTestListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  bool isShow = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
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

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
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
    return controller..addPageRequestListener(listViewStaffsTestsListPage);
  }

  void listViewStaffsTestsListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewStaffsTestsListResponse) {
        final pageItems = (StaffsTestsListDataStruct.maybeFromMap(
                        listViewStaffsTestsListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewStaffsTestsListResponse,
                )
              : null,
        );
      });
}
