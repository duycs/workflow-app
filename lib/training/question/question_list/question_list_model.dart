import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/question/filter_question/filter_question_widget.dart';
import '/training/question/question_create/question_create_widget.dart';
import '/training/question/question_menu/question_menu_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'question_list_widget.dart' show QuestionListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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
            '{\"_and\":[{}${(nameSearch != null && nameSearch != '') && (nameSearch != ' ') ? ',{\"content\":{\"_icontains\":\"${nameSearch}\"}}' : ' '}${(status != null && status != '') && (status != ' ') ? ',{\"status\":{\"_eq\":\"${status}\"}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}]}',
      );

      if ((apiResultQuestionListSearch?.succeeded ?? true)) {
        dataList = (getJsonField(
          (apiResultQuestionListSearch?.jsonBody ?? ''),
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
        await actions.showToast(
          context,
          'Lỗi tải dữ liệu!',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
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
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewQuestionListResponse,
                )
              : null,
        );
      });
}
