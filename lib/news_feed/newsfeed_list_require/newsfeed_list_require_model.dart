import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/news_feed/action_newsfeed/action_newsfeed_widget.dart';
import '/news_feed/comment_newsfeed/comment_newsfeed_widget.dart';
import '/news_feed/d_n_f_newsfeed/d_n_f_newsfeed_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'newsfeed_list_require_widget.dart' show NewsfeedListRequireWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class NewsfeedListRequireModel
    extends FlutterFlowModel<NewsfeedListRequireWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future reactCreated(
    BuildContext context, {
    String? newsId,
  }) async {
    bool? reactNewsfeedRequire;
    ApiCallResponse? apiResultReact;

    reactNewsfeedRequire = await action_blocks.tokenReload(context);
    if (reactNewsfeedRequire!) {
      apiResultReact = await NewsfeedGroup.reactNewsfeedCall.call(
        accessToken: FFAppState().accessToken,
        staffId: FFAppState().staffid,
        newsId: newsId,
      );

      if (!(apiResultReact?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi yêu thích',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future reactDelete(
    BuildContext context, {
    int? reactId,
  }) async {
    bool? reactNewsfeedDeleteRequire;
    ApiCallResponse? apiResultReactDeleteRequire;

    reactNewsfeedDeleteRequire = await action_blocks.tokenReload(context);
    if (reactNewsfeedDeleteRequire!) {
      apiResultReactDeleteRequire =
          await NewsfeedGroup.reactNewsfeedDeleteCall.call(
        accessToken: FFAppState().accessToken,
        id: reactId,
      );

      if (!(apiResultReactDeleteRequire?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi yêu thích',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  /// Additional helper methods.
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
    return controller..addPageRequestListener(listViewNewsfeedListPage);
  }

  void listViewNewsfeedListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewNewsfeedListResponse) {
        final pageItems = ((getJsonField(
                  listViewNewsfeedListResponse.jsonBody,
                  r'''$.data''',
                  true,
                )!
                        .toList()
                        .map<NewsfeedListStruct?>(
                            NewsfeedListStruct.maybeFromMap)
                        .toList() as Iterable<NewsfeedListStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewNewsfeedListResponse,
                )
              : null,
        );
      });

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
}
