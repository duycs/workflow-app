import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'lessons_list_user_widget.dart' show LessonsListUserWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LessonsListUserModel extends FlutterFlowModel<LessonsListUserWidget> {
  ///  Local state fields for this page.

  List<EmployeeLessonListStruct> listLessonStaff = [];
  void addToListLessonStaff(EmployeeLessonListStruct item) =>
      listLessonStaff.add(item);
  void removeFromListLessonStaff(EmployeeLessonListStruct item) =>
      listLessonStaff.remove(item);
  void removeAtIndexFromListLessonStaff(int index) =>
      listLessonStaff.removeAt(index);
  void insertAtIndexInListLessonStaff(
          int index, EmployeeLessonListStruct item) =>
      listLessonStaff.insert(index, item);
  void updateListLessonStaffAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonStaff[index] = updateFn(listLessonStaff[index]);

  String dateStartSearch = '';

  String dateEndStartSearch = '';

  String checkAPI = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonsListUser widget.
  bool? tokenReloadLessonsListUser;
  // Stores action output result for [Action Block - tokenReload] action in LessonsListUser widget.
  bool? tokenReloadLessonsListUserCheck;
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
  Future getLessons(BuildContext context) async {
    ApiCallResponse? apiResultLinkLessonStaff;
    bool? checkRefreshTokenBlock;

    apiResultLinkLessonStaff = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"done\"}}'}${nameSearchTextController.text != '' ? ', {\"lession_id\":{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}}' : ' '}${(dateStartSearch != '') && (dateStartSearch != ' ') ? ',{\"lession_id\":{\"date_created\":{\"_gte\":\"$dateStartSearch\"}}}' : '  '}${(dateEndStartSearch != '') && (dateEndStartSearch != ' ') ? ',{\"lession_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateEndStartSearch)}\"}}}' : ' '}]}',
    );
    if ((apiResultLinkLessonStaff.succeeded ?? true)) {
      listLessonStaff = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultLinkLessonStaff.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      checkAPI = '1';
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultLinkLessonStaff.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getLessons(context);
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
