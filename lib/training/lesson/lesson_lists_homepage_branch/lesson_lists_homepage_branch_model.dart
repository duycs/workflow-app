import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'lesson_lists_homepage_branch_widget.dart'
    show LessonListsHomepageBranchWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LessonListsHomepageBranchModel
    extends FlutterFlowModel<LessonListsHomepageBranchWidget> {
  ///  Local state fields for this page.

  List<LessonsStruct> listLesson = [];
  void addToListLesson(LessonsStruct item) => listLesson.add(item);
  void removeFromListLesson(LessonsStruct item) => listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, LessonsStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(int index, Function(LessonsStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  List<EmployeeLessonListStruct> listLessonRow = [];
  void addToListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.add(item);
  void removeFromListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.remove(item);
  void removeAtIndexFromListLessonRow(int index) =>
      listLessonRow.removeAt(index);
  void insertAtIndexInListLessonRow(int index, EmployeeLessonListStruct item) =>
      listLessonRow.insert(index, item);
  void updateListLessonRowAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow[index] = updateFn(listLessonRow[index]);

  String status = '';

  String dateStartList = '';

  String dateEndList = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  String programsAllId = '';

  bool isLoad = false;

  String checkColor = '';

  bool checkLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonLists_Homepage_Branch widget.
  bool? tokenReloadLessonListsHomepageList;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();

    listViewPagingController?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;

    apiResultList = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"id\":{\"_neq\":\"${getJsonField(
        FFAppState().staffDepartment,
        r'''$.id''',
      ).toString().toString()}\"}}}}}},{\"status\":{\"_icontains\":\"published\"}}'}${nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}' : ' '}${(status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"$status\"}}' : ' '}${(dateStartList != '') && (dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"$dateStartList\"}}' : ' '}${(dateEndList != '') && (dateEndList != 'noData') ? ',{\"date_created\":{\"_lt\":\"${(String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateEndList)}\"}}' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"${FFAppState().staffid}\"}}}}' : ' '}${programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"$programsAllId\"}}}}' : ' '}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      listLesson =
          LessonsListDataStruct.maybeFromMap((apiResultList.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
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
    return controller..addPageRequestListener(listViewGetLessonListPage);
  }

  void listViewGetLessonListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetLessonListResponse) {
        final pageItems = (LessonsListDataStruct.maybeFromMap(
                        listViewGetLessonListResponse.jsonBody)!
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
                  lastResponse: listViewGetLessonListResponse,
                )
              : null,
        );
      });
}
