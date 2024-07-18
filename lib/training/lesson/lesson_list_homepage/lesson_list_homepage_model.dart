import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'lesson_list_homepage_widget.dart' show LessonListHomepageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LessonListHomepageModel
    extends FlutterFlowModel<LessonListHomepageWidget> {
  ///  Local state fields for this page.

  List<EmployeeLessonListStruct> listLesson = [];
  void addToListLesson(EmployeeLessonListStruct item) => listLesson.add(item);
  void removeFromListLesson(EmployeeLessonListStruct item) =>
      listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, EmployeeLessonListStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  String? dateStartList = '0';

  String? dateEndList = '0';

  String statusLesson = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  String programsId = '';

  String checkAPI = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonList_Homepage widget.
  bool? tokenReloadLessonListHomepage;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: functions.filterListLessonUser(
          FFAppState().staffid,
          getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString(),
          nameSearchTextController.text,
          dateStartList,
          dateEndList,
          widget!.statusLesson,
          lessonFavoriteStatusList,
          widget!.statusLove,
          widget!.lessonNewCreate,
          widget!.lesonHistory,
          programsId),
    );

    if ((apiResultList.succeeded ?? true)) {
      listLesson = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      checkAPI = '1';
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
        await getListLesson(context);
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
    return controller..addPageRequestListener(listViewEmployeeLessonListPage);
  }

  void listViewEmployeeLessonListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewEmployeeLessonListResponse) {
        final pageItems = (EmployeeLessonListDataStruct.maybeFromMap(
                        listViewEmployeeLessonListResponse.jsonBody)!
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
                  lastResponse: listViewEmployeeLessonListResponse,
                )
              : null,
        );
      });
}
