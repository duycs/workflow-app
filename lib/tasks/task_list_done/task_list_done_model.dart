import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'task_list_done_widget.dart' show TaskListDoneWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TaskListDoneModel extends FlutterFlowModel<TaskListDoneWidget> {
  ///  Local state fields for this page.

  List<TaskListStruct> list = [];
  void addToList(TaskListStruct item) => list.add(item);
  void removeFromList(TaskListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, TaskListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(TaskListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  int taskToDo = 0;

  int taskWait = 0;

  String? dateStartFilter = '';

  String? dateEndFilter = '';

  String? typeFilter = '';

  String? isShow;

  bool ishows = false;

  bool isShowPdf = false;

  int totalDone = 0;

  String createdFilter = '';

  String workflowNameFilter = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in TaskListDone widget.
  bool? taskListDoneCaculatorTotalToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskListDone widget.
  ApiCallResponse? apiResultGetTask;
  // Stores action output result for [Action Block - tokenReload] action in TaskListDone widget.
  bool? tokenReloadTaskListDoneCheck;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? downloadfileToken;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController1?.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController1?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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
    return controller..addPageRequestListener(listViewGetListTaskPage1);
  }

  void listViewGetListTaskPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListTaskResponse,
                )
              : null,
        );
      });
}
