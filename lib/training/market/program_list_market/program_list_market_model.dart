import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/market/filter_programs/filter_programs_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'program_list_market_widget.dart' show ProgramListMarketWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ProgramListMarketModel extends FlutterFlowModel<ProgramListMarketWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listPrograms = [];
  void addToListPrograms(MarketLessonListStruct item) => listPrograms.add(item);
  void removeFromListPrograms(MarketLessonListStruct item) =>
      listPrograms.remove(item);
  void removeAtIndexFromListPrograms(int index) => listPrograms.removeAt(index);
  void insertAtIndexInListPrograms(int index, MarketLessonListStruct item) =>
      listPrograms.insert(index, item);
  void updateListProgramsAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listPrograms[index] = updateFn(listPrograms[index]);

  String domain = '';

  String author = '';

  String category = '';

  String priceMin = '';

  String priceMax = '';

  List<DomainsListListStruct> listDataDomain = [];
  void addToListDataDomain(DomainsListListStruct item) =>
      listDataDomain.add(item);
  void removeFromListDataDomain(DomainsListListStruct item) =>
      listDataDomain.remove(item);
  void removeAtIndexFromListDataDomain(int index) =>
      listDataDomain.removeAt(index);
  void insertAtIndexInListDataDomain(int index, DomainsListListStruct item) =>
      listDataDomain.insert(index, item);
  void updateListDataDomainAtIndex(
          int index, Function(DomainsListListStruct) updateFn) =>
      listDataDomain[index] = updateFn(listDataDomain[index]);

  String priceMinDomain = '';

  String priceMaxDomain = '';

  bool checkLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ProgramListMarket widget.
  bool? reloadTokenProgramsList;
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
  Future getProgramsList(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${() {
        if (widget!.price == 'free') {
          return ',{\"price\":{\"_eq\":\"0\"}}';
        } else if (((widget!.price == 'NoFree') &&
                (priceMin == null || priceMin == '')) ||
            ((widget!.price == 'NoFree') && (priceMin == 'noData'))) {
          return ',{\"price\":{\"_gt\":\"0\"}}';
        } else {
          return ' ';
        }
      }()}${searchMarketTextController.text != null && searchMarketTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${searchMarketTextController.text}\"}}' : ' '}${widget!.domainToProgramListMarket != null && widget!.domainToProgramListMarket != '' ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"${widget!.domainToProgramListMarket}${widget!.domainToProgramListMarket}' : ' '}${(domain != null && domain != '') && (domain != 'noData') ? ',{\"domain_id\":{\"name\":{\"_icontains\":\"${domain}\"}}}' : ' '}${(author != null && author != '') && (author != 'noData') ? ',{\"author_id\":{\"alias\":{\"_icontains\":\"${author}\"}}}' : ' '}${(category != null && category != '') && (category != 'noData') ? ',{\"category_id\":{\"name\":{\"_icontains\":\"${category}\"}}}' : ' '}${(priceMinDomain != null && priceMinDomain != '') && (priceMinDomain != 'noData') && (widget!.price == 'free1') ? ',{\"price\":{\"_gte\":\"${priceMinDomain}\"}}' : ' '}${(priceMaxDomain != null && priceMaxDomain != '') && (priceMaxDomain != 'noData') && (widget!.price == 'free1') ? ',{\"price\":{\"_lte\":\"${priceMaxDomain}\"}}' : ' '}${(priceMin != null && priceMin != '') && (priceMin != 'noData') && (widget!.price != 'free1') ? ',{\"price\":{\"_gte\":\"${priceMin}\"}}' : ' '}${(priceMax != null && priceMax != '') && (priceMax != 'noData') && (widget!.price != 'free1') ? ',{\"price\":{\"_lte\":\"${priceMax}\"}}' : ' '}${(priceMax != null && priceMax != '') && (priceMax != 'noData') && (widget!.price != 'free1') ? priceMax : ' '}${(widget!.idAuthor != null && widget!.idAuthor != '') && (widget!.idDomain != null && widget!.idDomain != '') ? ',{\"author_id\":{\"id\":{\"_eq\":\"${widget!.idAuthor}\"}}},{\"domain_id\":{\"id\":{\"_eq\":\"${widget!.idDomain}\"}}}' : ' '}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      listPrograms = MarketLessonListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<MarketLessonListStruct>();
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
        await getProgramsList(context);
      }
    }
  }

  Future getListDomains(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock1;

    apiResultList = await GetDomainsGroup.getDomainsCall.call(
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultList?.succeeded ?? true)) {
      listDataDomain = DomainsListDataDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DomainsListListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getListDomains(context);
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
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListMarketLessonResponse,
                )
              : null,
        );
      });
}
