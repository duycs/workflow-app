import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'category_market_widget.dart' show CategoryMarketWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryMarketModel extends FlutterFlowModel<CategoryMarketWidget> {
  ///  Local state fields for this page.

  List<DomainsListListStruct> listDataDomains = [];
  void addToListDataDomains(DomainsListListStruct item) =>
      listDataDomains.add(item);
  void removeFromListDataDomains(DomainsListListStruct item) =>
      listDataDomains.remove(item);
  void removeAtIndexFromListDataDomains(int index) =>
      listDataDomains.removeAt(index);
  void insertAtIndexInListDataDomains(int index, DomainsListListStruct item) =>
      listDataDomains.insert(index, item);
  void updateListDataDomainsAtIndex(
          int index, Function(DomainsListListStruct) updateFn) =>
      listDataDomains[index] = updateFn(listDataDomains[index]);

  bool isCheckLoad = false;

  String checkColor = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in CategoryMarket widget.
  bool? reloadListDomains;
  // State field(s) for searchDomains widget.
  FocusNode? searchDomainsFocusNode;
  TextEditingController? searchDomainsTextController;
  String? Function(BuildContext, String?)? searchDomainsTextControllerValidator;
  // State field(s) for GridView widget.

  PagingController<ApiPagingParams, dynamic>? gridViewPagingController;
  Function(ApiPagingParams nextPageMarker)? gridViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchDomainsFocusNode?.dispose();
    searchDomainsTextController?.dispose();

    gridViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getDomains(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GetDomainsGroup.getDomainsCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[${searchDomainsTextController.text != '' ? '{\"name\":{\"_icontains\":\"' : ' '}${searchDomainsTextController.text != '' ? searchDomainsTextController.text : ' '}${searchDomainsTextController.text != '' ? '\"}}' : ' '}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      listDataDomains = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getDomains(context);
      }
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForGridView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (gridViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setGridViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    gridViewApiCall = apiCall;
    return gridViewPagingController ??= _createGridViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createGridViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(gridViewGetDomainsPage);
  }

  void gridViewGetDomainsPage(ApiPagingParams nextPageMarker) =>
      gridViewApiCall!(nextPageMarker).then((gridViewGetDomainsResponse) {
        final pageItems = (DomainsListDataDataStruct.maybeFromMap(
                        gridViewGetDomainsResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        gridViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: gridViewGetDomainsResponse,
                )
              : null,
        );
      });
}
