import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'order_list_widget.dart' show OrderListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderListModel extends FlutterFlowModel<OrderListWidget> {
  ///  Local state fields for this page.

  List<ProgramOrderStruct> listData = [];
  void addToListData(ProgramOrderStruct item) => listData.add(item);
  void removeFromListData(ProgramOrderStruct item) => listData.remove(item);
  void removeAtIndexFromListData(int index) => listData.removeAt(index);
  void insertAtIndexInListData(int index, ProgramOrderStruct item) =>
      listData.insert(index, item);
  void updateListDataAtIndex(
          int index, Function(ProgramOrderStruct) updateFn) =>
      listData[index] = updateFn(listData[index]);

  String statusFilter = '';

  String privateFilter = '';

  String codeFilter = '';

  String nameFilter = '';

  String authorFilter = '';

  String dateStartFilter = '';

  String dateEndFilter = '';

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in OrderList widget.
  bool? tokenReloadOrderList;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListOrder(BuildContext context) async {
    bool? listOrderToken;
    ApiCallResponse? apiResultGetListOrder;

    listOrderToken = await action_blocks.tokenReload(context);
    if (listOrderToken!) {
      apiResultGetListOrder = await OrderGroup.getListOrderCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetListOrder.succeeded ?? true)) {
        listData = ProgramOrderDataStruct.maybeFromMap(
                (apiResultGetListOrder.jsonBody ?? ''))!
            .data
            .toList()
            .cast<ProgramOrderStruct>();
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
    return controller..addPageRequestListener(listViewGetListOrderPage);
  }

  void listViewGetListOrderPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetListOrderResponse) {
        final pageItems = (ProgramOrderDataStruct.maybeFromMap(
                        listViewGetListOrderResponse.jsonBody)!
                    .data
                    .where((e) => e.status == 'published')
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListOrderResponse,
                )
              : null,
        );
      });
}
