import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'market_place_widget.dart' show MarketPlaceWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MarketPlaceModel extends FlutterFlowModel<MarketPlaceWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listDataProgramsFree = [];
  void addToListDataProgramsFree(MarketLessonListStruct item) =>
      listDataProgramsFree.add(item);
  void removeFromListDataProgramsFree(MarketLessonListStruct item) =>
      listDataProgramsFree.remove(item);
  void removeAtIndexFromListDataProgramsFree(int index) =>
      listDataProgramsFree.removeAt(index);
  void insertAtIndexInListDataProgramsFree(
          int index, MarketLessonListStruct item) =>
      listDataProgramsFree.insert(index, item);
  void updateListDataProgramsFreeAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsFree[index] = updateFn(listDataProgramsFree[index]);

  List<MarketLessonListStruct> listDataProgramsNoFree = [];
  void addToListDataProgramsNoFree(MarketLessonListStruct item) =>
      listDataProgramsNoFree.add(item);
  void removeFromListDataProgramsNoFree(MarketLessonListStruct item) =>
      listDataProgramsNoFree.remove(item);
  void removeAtIndexFromListDataProgramsNoFree(int index) =>
      listDataProgramsNoFree.removeAt(index);
  void insertAtIndexInListDataProgramsNoFree(
          int index, MarketLessonListStruct item) =>
      listDataProgramsNoFree.insert(index, item);
  void updateListDataProgramsNoFreeAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsNoFree[index] = updateFn(listDataProgramsNoFree[index]);

  List<MarketLessonListStruct> listDataProgramsAll = [];
  void addToListDataProgramsAll(MarketLessonListStruct item) =>
      listDataProgramsAll.add(item);
  void removeFromListDataProgramsAll(MarketLessonListStruct item) =>
      listDataProgramsAll.remove(item);
  void removeAtIndexFromListDataProgramsAll(int index) =>
      listDataProgramsAll.removeAt(index);
  void insertAtIndexInListDataProgramsAll(
          int index, MarketLessonListStruct item) =>
      listDataProgramsAll.insert(index, item);
  void updateListDataProgramsAllAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsAll[index] = updateFn(listDataProgramsAll[index]);

  List<AuthorsListStruct> listDataAuthors = [];
  void addToListDataAuthors(AuthorsListStruct item) =>
      listDataAuthors.add(item);
  void removeFromListDataAuthors(AuthorsListStruct item) =>
      listDataAuthors.remove(item);
  void removeAtIndexFromListDataAuthors(int index) =>
      listDataAuthors.removeAt(index);
  void insertAtIndexInListDataAuthors(int index, AuthorsListStruct item) =>
      listDataAuthors.insert(index, item);
  void updateListDataAuthorsAtIndex(
          int index, Function(AuthorsListStruct) updateFn) =>
      listDataAuthors[index] = updateFn(listDataAuthors[index]);

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

  String domain = '';

  String author = '';

  String category = '';

  String priceMin = '';

  String priceMax = '';

  bool checkLoad = false;

  String checkColor = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in MarketPlace widget.
  bool? reloadTokenProgramLession;
  // State field(s) for searchMarket widget.
  FocusNode? searchMarketFocusNode;
  TextEditingController? searchMarketTextController;
  String? Function(BuildContext, String?)? searchMarketTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchMarketFocusNode?.dispose();
    searchMarketTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getProgramsMarketFree(BuildContext context) async {
    ApiCallResponse? apiResultGetList;
    bool? checkRefreshTokenBlock;

    apiResultGetList =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"price\":{\"_eq\":\"0\"}}${searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${searchMarketTextController.text}\"}}' : ' '}]}',
      offset: 0,
      limit: 11,
    );

    if ((apiResultGetList.succeeded ?? true)) {
      listDataProgramsFree = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getProgramsMarketFree(context);
      }
    }
  }

  Future getProgramsMarketNoFree(BuildContext context) async {
    ApiCallResponse? apiResultGetListNoFree;
    bool? checkRefreshTokenBlock1;

    apiResultGetListNoFree =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"price\":{\"_gt\":\"0\"}}${searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${searchMarketTextController.text}\"}}' : ' '}]}',
      offset: 0,
      limit: 11,
    );

    if ((apiResultGetListNoFree.succeeded ?? true)) {
      listDataProgramsNoFree = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetListNoFree.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListNoFree.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getProgramsMarketNoFree(context);
      }
    }
  }

  Future getProgramsMarketAll(BuildContext context) async {
    ApiCallResponse? apiResultGetListAll;
    bool? checkRefreshTokenBlock2;

    apiResultGetListAll =
        await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${searchMarketTextController.text}\"}}' : ' '}${(domain != '') && (domain != 'noData') ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"$domain\"}}}' : ' '}${(author != '') && (author != 'noData') ? ',{\"author_id\":{\"alias\":{\"_icontains\":\"$author\"}}}' : ' '}${(category != '') && (category != 'noData') ? ',{\"category_id\":{\"name\":{\"_icontains\":\"$category\"}}}' : ' '}${(priceMin != '') && (priceMin != 'noData') ? ',{\"price\":{\"_gte\":\"$priceMin\"}}' : ' '}${(priceMax != '') && (priceMax != 'noData') ? ',{\"price\":{\"_lte\":\"$priceMax\"}}' : ' '}]}',
    );

    if ((apiResultGetListAll.succeeded ?? true)) {
      listDataProgramsAll = MarketLessonListDataStruct.maybeFromMap(
              (apiResultGetListAll.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListAll.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getProgramsMarketAll(context);
      }
    }
  }

  Future getListAuthors(BuildContext context) async {
    ApiCallResponse? apiResultGetListAuthors;
    bool? checkRefreshTokenBlock3;

    apiResultGetListAuthors = await GroupAuthorsGroup.listAthorsSortCall.call(
      accessToken: FFAppState().accessToken,
      limit: 11,
      offset: 0,
    );

    if ((apiResultGetListAuthors.succeeded ?? true)) {
      listDataAuthors = AuthorsListDataStruct.maybeFromMap(
              (apiResultGetListAuthors.jsonBody ?? ''))!
          .data
          .toList()
          .cast<AuthorsListStruct>();
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListAuthors.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock3!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getListAuthors(context);
      }
    }
  }

  Future getDomains(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock4;

    apiResultList = await GetDomainsGroup.getDomainsCall.call(
      accessToken: FFAppState().accessToken,
      offset: 0,
      limit: 8,
    );

    if ((apiResultList.succeeded ?? true)) {
      listDataDomains = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
    } else {
      checkRefreshTokenBlock4 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock4!) {
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
    return controller..addPageRequestListener(listViewGetListMarketLessonPage);
  }

  void listViewGetListMarketLessonPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewGetListMarketLessonResponse) {
        final pageItems = (MarketLessonListDataStruct.maybeFromMap(
                        listViewGetListMarketLessonResponse.jsonBody)!
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
                  lastResponse: listViewGetListMarketLessonResponse,
                )
              : null,
        );
      });
}
