import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/rating_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'author_market_profile_widget.dart' show AuthorMarketProfileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthorMarketProfileModel
    extends FlutterFlowModel<AuthorMarketProfileWidget> {
  ///  Local state fields for this page.

  List<MarketLessonListStruct> listDataProgramsMarket = [];
  void addToListDataProgramsMarket(MarketLessonListStruct item) =>
      listDataProgramsMarket.add(item);
  void removeFromListDataProgramsMarket(MarketLessonListStruct item) =>
      listDataProgramsMarket.remove(item);
  void removeAtIndexFromListDataProgramsMarket(int index) =>
      listDataProgramsMarket.removeAt(index);
  void insertAtIndexInListDataProgramsMarket(
          int index, MarketLessonListStruct item) =>
      listDataProgramsMarket.insert(index, item);
  void updateListDataProgramsMarketAtIndex(
          int index, Function(MarketLessonListStruct) updateFn) =>
      listDataProgramsMarket[index] = updateFn(listDataProgramsMarket[index]);

  bool checkLoad = false;

  String checkClick = '1';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in AuthorMarketProfile widget.
  bool? tokenReloadProgramsMarket;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    listViewPagingController1?.dispose();
    listViewPagingController2?.dispose();
  }

  /// Action blocks.
  Future getProgramsMarket(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await GroupMarketLessonGroup.getListMarketLessonCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"template\":{\"_eq\":\"1\"}},{\"author_id\":{\"id\":{\"_eq\":\"${widget!.itemAuthors?.id}\"}}}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      listDataProgramsMarket = MarketLessonListDataStruct.maybeFromMap(
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getProgramsMarket(context);
      }
    }
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetListMarketLessonPage1);
  }

  void listViewGetListMarketLessonPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewGetListMarketLessonResponse) {
        final pageItems = (MarketLessonListDataStruct.maybeFromMap(
                        listViewGetListMarketLessonResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
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

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetListMarketLessonPage2);
  }

  void listViewGetListMarketLessonPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewGetListMarketLessonResponse) {
        final pageItems = (MarketLessonListDataStruct.maybeFromMap(
                        listViewGetListMarketLessonResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
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
