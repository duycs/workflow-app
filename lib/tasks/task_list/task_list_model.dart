import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tasks/do_action_type_upload_file/do_action_type_upload_file_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'task_list_widget.dart' show TaskListWidget;
import 'package:flutter/material.dart';

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
  void updateResponseDataStruct(Function(UpdateTaskDataTypeStruct) updateFn) =>
      updateFn(responseData ??= UpdateTaskDataTypeStruct());

  WorkflowsStruct? stepList;
  void updateStepListStruct(Function(WorkflowsStruct) updateFn) =>
      updateFn(stepList ??= WorkflowsStruct());

  String staffId = '';

  int loop = 0;

  int loop2 = 0;

  List<TaskListStruct> totalDone = [];
  void addToTotalDone(TaskListStruct item) => totalDone.add(item);
  void removeFromTotalDone(TaskListStruct item) => totalDone.remove(item);
  void removeAtIndexFromTotalDone(int index) => totalDone.removeAt(index);
  void insertAtIndexInTotalDone(int index, TaskListStruct item) =>
      totalDone.insert(index, item);
  void updateTotalDoneAtIndex(int index, Function(TaskListStruct) updateFn) =>
      totalDone[index] = updateFn(totalDone[index]);

  List<TaskListStruct> totalWait = [];
  void addToTotalWait(TaskListStruct item) => totalWait.add(item);
  void removeFromTotalWait(TaskListStruct item) => totalWait.remove(item);
  void removeAtIndexFromTotalWait(int index) => totalWait.removeAt(index);
  void insertAtIndexInTotalWait(int index, TaskListStruct item) =>
      totalWait.insert(index, item);
  void updateTotalWaitAtIndex(int index, Function(TaskListStruct) updateFn) =>
      totalWait[index] = updateFn(totalWait[index]);

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in TaskList widget.
  bool? caculatorTotalToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskList widget.
  ApiCallResponse? apiResultCaculatorTotal;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // Stores action output result for [Action Block - tokenReload] action in Icon widget.
  bool? updateoperation22Token;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in Icon widget.
  ApiCallResponse? apiResultUpdateoperation22;
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
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_upload_file widget.
  ApiCallResponse? apiResultUpdateoperation;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_image widget.
  ApiCallResponse? apiResultUpdateoperationCopyCopy;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_approve widget.
  bool? confirmOperationCopyToken;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in do_action_type_approve widget.
  ApiCallResponse? apiResultConfirmOperationCopy;
  // Stores action output result for [Action Block - tokenReload] action in do_action_type_to_do_list widget.
  bool? updateoperationCopyCopyCopyCopyToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in do_action_type_to_do_list widget.
  ApiCallResponse? apiResultUpdateoperationCopyCopyCopyCopy;
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
    unfocusNode.dispose();
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

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
      if ((apiResultGetTaskList.succeeded ?? true)) {
        list = TaskListDataStruct.maybeFromMap(
                (apiResultGetTaskList.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
      }
    } else {
      FFAppState().update(() {});
    }
  }
}
