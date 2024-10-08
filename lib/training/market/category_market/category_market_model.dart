import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'category_market_widget.dart' show CategoryMarketWidget;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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
          '{\"_and\":[${searchDomainsTextController.text != null && searchDomainsTextController.text != '' ? '{\"name\":{\"_icontains\":\"${searchDomainsTextController.text}\"}}' : ' '}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      listDataDomains = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
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
      await Future.delayed(Duration(milliseconds: 50));
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
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: gridViewGetDomainsResponse,
                )
              : null,
        );
      });
}
