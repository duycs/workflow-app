import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/procedure_published/procedure_published_widget.dart';
import '/rich_text_editor/mobile_editor_component/mobile_editor_component_widget.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/tasks/do_action_type_approve/do_action_type_approve_widget.dart';
import '/tasks/do_action_type_image/do_action_type_image_widget.dart';
import '/tasks/do_action_type_to_do_list/do_action_type_to_do_list_widget.dart';
import '/tasks/do_action_type_upload_file/do_action_type_upload_file_widget.dart';
import '/tasks/filter_task_list/filter_task_list_widget.dart';
import '/tasks/popup_task_list/popup_task_list_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_list_widget.dart' show TaskListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class TaskListModel extends FlutterFlowModel<TaskListWidget> {
  ///  Local state fields for this page.

  List<TaskListStruct> list = [];
  void addToList(TaskListStruct item) => list.add(item);
  void removeFromList(TaskListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, TaskListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(TaskListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  UpdateTaskDataTypeStruct? responseData;
  void updateResponseDataStruct(Function(UpdateTaskDataTypeStruct) updateFn) {
    updateFn(responseData ??= UpdateTaskDataTypeStruct());
  }

  WorkflowsStruct? workflowGetOne;
  void updateWorkflowGetOneStruct(Function(WorkflowsStruct) updateFn) {
    updateFn(workflowGetOne ??= WorkflowsStruct());
  }

  String staffId = '';

  int loop = 0;

  int loop2 = 0;

  int? totalDone = 0;

  int totalWait = 0;

  String submitText = '';

  String filter = '';

  String? dateStartFilter = '';

  String? dateEndFilter = '';

  String? typeFilter = '';

  String? isShow = '';

  List<dynamic> submitTextJson = [];
  void addToSubmitTextJson(dynamic item) => submitTextJson.add(item);
  void removeFromSubmitTextJson(dynamic item) => submitTextJson.remove(item);
  void removeAtIndexFromSubmitTextJson(int index) =>
      submitTextJson.removeAt(index);
  void insertAtIndexInSubmitTextJson(int index, dynamic item) =>
      submitTextJson.insert(index, item);
  void updateSubmitTextJsonAtIndex(int index, Function(dynamic) updateFn) =>
      submitTextJson[index] = updateFn(submitTextJson[index]);

  bool isShows = false;

  int totalTodo = 0;

  String createdFilter = '';

  String workflowNameFilter = '';

  bool isLoad = false;

  List<FileDataTypeStruct> listFileDataType = [];
  void addToListFileDataType(FileDataTypeStruct item) =>
      listFileDataType.add(item);
  void removeFromListFileDataType(FileDataTypeStruct item) =>
      listFileDataType.remove(item);
  void removeAtIndexFromListFileDataType(int index) =>
      listFileDataType.removeAt(index);
  void insertAtIndexInListFileDataType(int index, FileDataTypeStruct item) =>
      listFileDataType.insert(index, item);
  void updateListFileDataTypeAtIndex(
          int index, Function(FileDataTypeStruct) updateFn) =>
      listFileDataType[index] = updateFn(listFileDataType[index]);

  StepsStruct? nextStep;
  void updateNextStepStruct(Function(StepsStruct) updateFn) {
    updateFn(nextStep ??= StepsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in TaskList widget.
  bool? caculatorTotalToken;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? confirmOperationCopy2Token;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in Button widget.
  ApiCallResponse? apiResultConfirmOperationCopy2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? getWorkflowCopyToken;
  // Stores action output result for [Backend Call - API (workflowsOne)] action in Button widget.
  ApiCallResponse? apiResultGetWorkflowCopy;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? apiResultqt8CopyToken;
  // Stores action output result for [Backend Call - API (ReceiveTask)] action in Button widget.
  ApiCallResponse? apiResultqt8Copy;
  // Models for do_action_type_upload_file dynamic component.
  late FlutterFlowDynamicModels<DoActionTypeUploadFileModel>
      doActionTypeUploadFileModels;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_upload_file widget.
  bool? apiResultUpdateoperationToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_upload_file widget.
  ApiCallResponse? apiResultUpdateoperation;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_image widget.
  bool? updateoperationToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_image widget.
  ApiCallResponse? apiResultUpdateoperation2;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_approve widget.
  bool? confirmOperationCopyToken;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in do_action_type_approve widget.
  ApiCallResponse? apiResultConfirmOperationCopy;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_to_do_list widget.
  bool? updateoperationCopyCopyCopyCopyToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_to_do_list widget.
  ApiCallResponse? apiResultUpdateoperationCopyCopyCopyCopy;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateoperation22Token;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in Button widget.
  ApiCallResponse? apiResultUpdateoperation22CopyCopy;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    doActionTypeUploadFileModels =
        FlutterFlowDynamicModels(() => DoActionTypeUploadFileModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    listViewPagingController1?.dispose();
    doActionTypeUploadFileModels.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future getTaskToDo(BuildContext context) async {
    bool? getTaskListToken;
    ApiCallResponse? apiResultGetTaskList;

    getTaskListToken = await action_blocks.tokenReload(context);
    if (getTaskListToken!) {
      apiResultGetTaskList = await TaskGroup.getListTaskCall.call(
        accessToken: FFAppState().accessToken,
        filter: filter,
      );

      if ((apiResultGetTaskList?.succeeded ?? true)) {
        list = TaskListDataStruct.maybeFromMap(
                (apiResultGetTaskList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
      }
    } else {
      FFAppState().update(() {});
    }
  }

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
      totalTodo = getJsonField(
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
      totalWait = getJsonField(
        (apiResultGetTaskWait?.jsonBody ?? ''),
        r'''$.meta.filter_count''',
      );
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
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
