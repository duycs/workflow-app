import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/tasks/done_action_type_to_do_list/done_action_type_to_do_list_widget.dart';
import '/tasks/filter_task_list_done/filter_task_list_done_widget.dart';
import '/tasks/popup_see_more/popup_see_more_widget.dart';
import '/tasks/popup_task_done/popup_task_done_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_list_done_widget.dart' show TaskListDoneWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in TaskListDone widget.
  bool? taskListDoneCaculatorTotalToken;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Stores action output result for [Action Block - tokenReload] action in IconButton widget.
  bool? downloadFileToken;
  // Stores action output result for [Action Block - tokenReload] action in IconButton widget.
  bool? downloadIamgeToken;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future getNumberTask(BuildContext context) async {
    ApiCallResponse? apiResultGetTaskDone;
    ApiCallResponse? apiResultGetTaskToDo;
    ApiCallResponse? apiResultGetTaskWait;

    apiResultGetTaskDone = await TaskGroup.getNumberTaskCall.call(
      filter:
          '{\"_and\":[{\"submit_staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"done\"}}]}',
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultGetTaskDone?.succeeded ?? true)) {
      totalDone = getJsonField(
        (apiResultGetTaskDone?.jsonBody ?? ''),
        r'''$.meta.filter_count''',
      );
    }
    apiResultGetTaskToDo = await TaskGroup.getNumberTaskCall.call(
      filter:
          '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}',
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultGetTaskToDo?.succeeded ?? true)) {
      taskToDo = getJsonField(
        (apiResultGetTaskToDo?.jsonBody ?? ''),
        r'''$.meta.filter_count''',
      );
    }
    apiResultGetTaskWait = await TaskGroup.getNumberTaskCall.call(
      filter:
          '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"0\"}}]}',
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultGetTaskWait?.succeeded ?? true)) {
      taskWait = getJsonField(
        (apiResultGetTaskWait?.jsonBody ?? ''),
        r'''$.meta.filter_count''',
      );
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
    return controller..addPageRequestListener(listViewGetListTaskPage);
  }

  void listViewGetListTaskPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListTaskResponse,
                )
              : null,
        );
      });
}
