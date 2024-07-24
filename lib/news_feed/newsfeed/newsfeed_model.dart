import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/news_feed/action_newsfeed/action_newsfeed_widget.dart';
import '/news_feed/comment_newsfeed/comment_newsfeed_widget.dart';
import '/news_feed/d_n_f_newsfeed/d_n_f_newsfeed_widget.dart';
import '/news_feed/newsfeed_create/newsfeed_create_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'newsfeed_widget.dart' show NewsfeedWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NewsfeedModel extends FlutterFlowModel<NewsfeedWidget> {
  ///  Local state fields for this page.

  List<NewsfeedListStruct> newsfeedPublished = [];
  void addToNewsfeedPublished(NewsfeedListStruct item) =>
      newsfeedPublished.add(item);
  void removeFromNewsfeedPublished(NewsfeedListStruct item) =>
      newsfeedPublished.remove(item);
  void removeAtIndexFromNewsfeedPublished(int index) =>
      newsfeedPublished.removeAt(index);
  void insertAtIndexInNewsfeedPublished(int index, NewsfeedListStruct item) =>
      newsfeedPublished.insert(index, item);
  void updateNewsfeedPublishedAtIndex(
          int index, Function(NewsfeedListStruct) updateFn) =>
      newsfeedPublished[index] = updateFn(newsfeedPublished[index]);

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for DNFNewsfeed component.
  late DNFNewsfeedModel dNFNewsfeedModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    dNFNewsfeedModel = createModel(context, () => DNFNewsfeedModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    dNFNewsfeedModel.dispose();
    listViewPagingController?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future reactNewsfeed(
    BuildContext context, {
    String? newsId,
  }) async {
    bool? reactNewsfeed;
    ApiCallResponse? apiResultReact;

    reactNewsfeed = await action_blocks.tokenReload(context);
    if (reactNewsfeed!) {
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

  Future reactNewsfeedDelete(
    BuildContext context, {
    int? reactId,
  }) async {
    bool? reactNewsfeedDelete;
    ApiCallResponse? apiResultReactDelete;

    reactNewsfeedDelete = await action_blocks.tokenReload(context);
    if (reactNewsfeedDelete!) {
      apiResultReactDelete = await NewsfeedGroup.reactNewsfeedDeleteCall.call(
        accessToken: FFAppState().accessToken,
        id: reactId,
      );

      if (!(apiResultReactDelete?.succeeded ?? true)) {
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

  Future newsfeedListRequire(BuildContext context) async {
    bool? getListNewsfeedRequire;
    ApiCallResponse? apiResultRepuireList;

    getListNewsfeedRequire = await action_blocks.tokenReload(context);
    if (!getListNewsfeedRequire!) {
      return;
    }
    apiResultRepuireList = await NewsfeedGroup.newsfeedListCall.call(
      accessToken: FFAppState().accessToken,
      filter: () {
        if (tabBarCurrentIndex == 0) {
          return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffOrganization,
            r'''$.id''',
          ).toString().toString()}\"}}},{\"branch_id\":{\"_null\":true}},{\"department_id\":{\"_null\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
        } else if (tabBarCurrentIndex == 1) {
          return () {
            if (FFAppState().user.role ==
                '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffBranch,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffBranch,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffBranch,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                '82073000-1ba2-43a4-a55c-459d17c23b68') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"branch_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else {
              return ' ';
            }
          }();
        } else if (tabBarCurrentIndex == 2) {
          return () {
            if (FFAppState().user.role ==
                '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffDepartment,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffDepartment,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"department_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffBranch,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else if (FFAppState().user.role ==
                '82073000-1ba2-43a4-a55c-459d17c23b68') {
              return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}}},{\"department_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"require\"}}]}';
            } else {
              return ' ';
            }
          }();
        } else {
          return ' ';
        }
      }(),
      offset: 0,
      limit: 6,
    );

    if ((apiResultRepuireList?.succeeded ?? true)) {
      newsfeedPublished = (getJsonField(
        (apiResultRepuireList?.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
              .toList()
              .map<NewsfeedListStruct?>(NewsfeedListStruct.maybeFromMap)
              .toList() as Iterable<NewsfeedListStruct?>)
          .withoutNulls
          .toList()
          .cast<NewsfeedListStruct>();
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
}
