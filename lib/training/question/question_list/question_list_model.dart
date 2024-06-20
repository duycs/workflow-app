import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'question_list_widget.dart' show QuestionListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QuestionListModel extends FlutterFlowModel<QuestionListWidget> {
  ///  Local state fields for this page.

  List<QuestionObjectStruct> dataList = [];
  void addToDataList(QuestionObjectStruct item) => dataList.add(item);
  void removeFromDataList(QuestionObjectStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, QuestionObjectStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(QuestionObjectStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoad = false;

  String nameSearch = ' ';

  String status = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in QuestionList widget.
  bool? tokenReloadQuestionList;
  // State field(s) for questionName widget.
  FocusNode? questionNameFocusNode;
  TextEditingController? questionNameTextController;
  String? Function(BuildContext, String?)? questionNameTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    questionNameFocusNode?.dispose();
    questionNameTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListQuestion(BuildContext context) async {
    bool? tokenReloadGetlistQuestion;
    ApiCallResponse? apiResultQuestionListSearch;

    tokenReloadGetlistQuestion = await action_blocks.tokenReload(context);
    if (tokenReloadGetlistQuestion!) {
      apiResultQuestionListSearch = await QuestionGroup.questionListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${(nameSearch != '') && (nameSearch != ' ') ? ',{\"content\":{\"_icontains\":\"$nameSearch\"}}' : ' '}${(status != '') && (status != ' ') ? ',{\"status\":{\"_eq\":\"$status\"}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}]}',
      );

      if ((apiResultQuestionListSearch.succeeded ?? true)) {
        dataList = (getJsonField(
          (apiResultQuestionListSearch.jsonBody ?? ''),
          r'''$.data''',
          true,
        )!
                .toList()
                .map<QuestionObjectStruct?>(QuestionObjectStruct.maybeFromMap)
                .toList() as Iterable<QuestionObjectStruct?>)
            .withoutNulls
            .toList()
            .cast<QuestionObjectStruct>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
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
    return controller..addPageRequestListener(listViewQuestionListPage);
  }

  void listViewQuestionListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewQuestionListResponse) {
        final pageItems = ((getJsonField(
                  listViewQuestionListResponse.jsonBody,
                  r'''$.data''',
                  true,
                )!
                        .toList()
                        .map<QuestionObjectStruct?>(
                            QuestionObjectStruct.maybeFromMap)
                        .toList() as Iterable<QuestionObjectStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewQuestionListResponse,
                )
              : null,
        );
      });
}
