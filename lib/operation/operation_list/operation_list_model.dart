import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'operation_list_widget.dart' show OperationListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OperationListModel extends FlutterFlowModel<OperationListWidget> {
  ///  Local state fields for this page.

  List<OperationsStruct> operationList = [];
  void addToOperationList(OperationsStruct item) => operationList.add(item);
  void removeFromOperationList(OperationsStruct item) =>
      operationList.remove(item);
  void removeAtIndexFromOperationList(int index) =>
      operationList.removeAt(index);
  void insertAtIndexInOperationList(int index, OperationsStruct item) =>
      operationList.insert(index, item);
  void updateOperationListAtIndex(
          int index, Function(OperationsStruct) updateFn) =>
      operationList[index] = updateFn(operationList[index]);

  String seachName = '';

  String seachUserCreate = '';

  String searchAction = '';

  String searchDateStart = '';

  String searchDateEnd = '';

  String searchStatus = '';

  String executeId = '';

  String checkData = '';

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in OperationList widget.
  bool? tokenReloadOperationListList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListViewOne widget.

  PagingController<ApiPagingParams, dynamic>? listViewOnePagingController;
  Function(ApiPagingParams nextPageMarker)? listViewOneApiCall;

  // State field(s) for ListViewTwo widget.

  PagingController<ApiPagingParams, dynamic>? listViewTwoPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewTwoApiCall;

  // State field(s) for ListViewThree widget.

  PagingController<ApiPagingParams, dynamic>? listViewThreePagingController;
  Function(ApiPagingParams nextPageMarker)? listViewThreeApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    listViewOnePagingController?.dispose();
    listViewTwoPagingController?.dispose();
    listViewThreePagingController?.dispose();
  }

  /// Action blocks.
  Future getLinkOperations(BuildContext context) async {
    bool? apiResutfRefreshTokenOperations;
    ApiCallResponse? apiResultOperations;

    apiResutfRefreshTokenOperations = await action_blocks.tokenReload(context);
    if (apiResutfRefreshTokenOperations!) {
      apiResultOperations = await OperationGroup.operationListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}${(seachName != '') && (seachName != ' ') ? ',{\"name\":{\"_icontains\":\"$seachName\"}}' : ' '}${(searchStatus != '') && (searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"$searchStatus\"}}' : ' '}${(searchAction != '') && (searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"$searchAction\"}}' : ' '}${(searchDateStart != '') && (searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"$searchDateStart\"}}' : ''}${(searchDateEnd != '') && (searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                return DateTime.parse(var1).add(const Duration(days: 1)).toString();
              }(searchDateEnd)}\"}}' : ' '}]}',
      );

      if ((apiResultOperations.succeeded ?? true)) {
        operationList = OperationsListDataStruct.maybeFromMap(
                (apiResultOperations.jsonBody ?? ''))!
            .data
            .toList()
            .cast<OperationsStruct>();
        checkData = '1';
      }
    } else {
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListViewOne({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewOnePagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListViewTwo({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewTwoPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListViewThree({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewThreePagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewOneController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewOneApiCall = apiCall;
    return listViewOnePagingController ??=
        _createListViewOneController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewOneController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewOneOperationListPage);
  }

  void listViewOneOperationListPage(ApiPagingParams nextPageMarker) =>
      listViewOneApiCall!(nextPageMarker)
          .then((listViewOneOperationListResponse) {
        final pageItems = (OperationsListDataStruct.maybeFromMap(
                        listViewOneOperationListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewOnePagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewOneOperationListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewTwoController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewTwoApiCall = apiCall;
    return listViewTwoPagingController ??=
        _createListViewTwoController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewTwoController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewTwoOperationListPage);
  }

  void listViewTwoOperationListPage(ApiPagingParams nextPageMarker) =>
      listViewTwoApiCall!(nextPageMarker)
          .then((listViewTwoOperationListResponse) {
        final pageItems = (OperationsListDataStruct.maybeFromMap(
                        listViewTwoOperationListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewTwoPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewTwoOperationListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewThreeController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewThreeApiCall = apiCall;
    return listViewThreePagingController ??=
        _createListViewThreeController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewThreeController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewThreeOperationListPage);
  }

  void listViewThreeOperationListPage(ApiPagingParams nextPageMarker) =>
      listViewThreeApiCall!(nextPageMarker)
          .then((listViewThreeOperationListResponse) {
        final pageItems = (OperationsListDataStruct.maybeFromMap(
                        listViewThreeOperationListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewThreePagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewThreeOperationListResponse,
                )
              : null,
        );
      });
}
