import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rich_text_editor/mobile_editor_component/mobile_editor_component_widget.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/tasks/detail_action_type_approve/detail_action_type_approve_widget.dart';
import '/tasks/detail_action_type_image/detail_action_type_image_widget.dart';
import '/tasks/detail_action_type_to_do_list/detail_action_type_to_do_list_widget.dart';
import '/tasks/detail_action_type_upload_file/detail_action_type_upload_file_widget.dart';
import '/tasks/popup_task_detail_copy/popup_task_detail_copy_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_detail_widget.dart' show TaskDetailWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TaskDetailModel extends FlutterFlowModel<TaskDetailWidget> {
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

  String submitText = '';

  bool isLoad = false;

  WorkflowsStruct? stepList;
  void updateStepListStruct(Function(WorkflowsStruct) updateFn) {
    updateFn(stepList ??= WorkflowsStruct());
  }

  int loop = 0;

  bool isShowPdf = false;

  List<FileUploadStruct> listFileId = [];
  void addToListFileId(FileUploadStruct item) => listFileId.add(item);
  void removeFromListFileId(FileUploadStruct item) => listFileId.remove(item);
  void removeAtIndexFromListFileId(int index) => listFileId.removeAt(index);
  void insertAtIndexInListFileId(int index, FileUploadStruct item) =>
      listFileId.insert(index, item);
  void updateListFileIdAtIndex(
          int index, Function(FileUploadStruct) updateFn) =>
      listFileId[index] = updateFn(listFileId[index]);

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

  StepsStruct? nextSteps;
  void updateNextStepsStruct(Function(StepsStruct) updateFn) {
    updateFn(nextSteps ??= StepsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? confirmOperationDetail2Token;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in Button widget.
  ApiCallResponse? apiResultConfirmOperationDetail2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? getWorkflowDetailToken2;
  // Stores action output result for [Backend Call - API (workflowsOne)] action in Button widget.
  ApiCallResponse? apiResultGetWorkflowDetail;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? receiveTaskDetailToken;
  // Stores action output result for [Backend Call - API (ReceiveTask)] action in Button widget.
  ApiCallResponse? apiResultReceiveTaskDetail;
  // Stores action output result for [Action Block - tokenReload] action in detail_action_type_approve widget.
  bool? confirmToken;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in detail_action_type_approve widget.
  ApiCallResponse? apiResultConfirm;
  // Stores action output result for [Action Block - tokenReload] action in detail_action_type_to_do_list widget.
  bool? apiResultCheckListToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in detail_action_type_to_do_list widget.
  ApiCallResponse? apiResultCheckList;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? gettokenTaskDetailCopyCopy;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in Button widget.
  ApiCallResponse? apiResultd4mCopyCopy;
  // Stores action output result for [Action Block - tokenReload] action in detail_action_type_upload_file widget.
  bool? apiResultUpdateoperationToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in detail_action_type_upload_file widget.
  ApiCallResponse? apiResultUpdateoperation;
  // Stores action output result for [Action Block - tokenReload] action in detail_action_type_image widget.
  bool? updateImageToken;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in detail_action_type_image widget.
  ApiCallResponse? apiResultUpdateImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getDetail(BuildContext context) async {
    bool? getTaskListToken;
    ApiCallResponse? apiResultGetTaskList;

    getTaskListToken = await action_blocks.tokenReload(context);
    if (getTaskListToken!) {
      apiResultGetTaskList = await TaskGroup.getListTaskCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{\"workflow_id\":{\"_eq\":\"${widget!.workflowId}\"}},{\"published_count\":{\"_eq\":\"${widget!.publishedCount?.toString()}\"}}]}',
        sort: 'number',
        offset: 0,
        limit: 100,
      );

      if ((apiResultGetTaskList?.succeeded ?? true)) {
        list = TaskListDataStruct.maybeFromMap(
                (apiResultGetTaskList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
      } else {
        return;
      }

      isLoad = true;
    } else {
      FFAppState().update(() {});
    }
  }
}
