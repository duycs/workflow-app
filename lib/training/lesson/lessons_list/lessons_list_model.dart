import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'lessons_list_widget.dart' show LessonsListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LessonsListModel extends FlutterFlowModel<LessonsListWidget> {
  ///  Local state fields for this page.

  List<LessonsStruct> list = [];
  void addToList(LessonsStruct item) => list.add(item);
  void removeFromList(LessonsStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, LessonsStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(LessonsStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String status = '';

  String dateStart = '';

  String dateEnd = '';

  String programId = '';

  String checkAPI = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonsList widget.
  bool? tokenReloadLessonsList;
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
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}'}${nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}' : ' '}${(status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"$status\"}}' : ' '}${(dateStart != '') && (dateStart != 'noDate') ? ',{\"date_created\":{\"_gte\":\"$dateStart\"}}' : ' '}${(dateEnd != '') && (dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateEnd)}\"}}' : ' '}${programId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"$programId\"}}}}' : ' '}]}',
    );

    if ((apiResultList.succeeded ?? true)) {
      list =
          LessonsListDataStruct.maybeFromMap((apiResultList.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
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
