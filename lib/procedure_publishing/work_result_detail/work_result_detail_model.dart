import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/checkbox_work_result/checkbox_work_result_widget.dart';
import '/procedure_publishing/result_work_grid_view/result_work_grid_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'work_result_detail_widget.dart' show WorkResultDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkResultDetailModel extends FlutterFlowModel<WorkResultDetailWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getTaskToDo(BuildContext context) async {
    bool? reloadListTask;
    ApiCallResponse? apiResultGetTaskList;

    reloadListTask = await action_blocks.tokenReload(context);
    if (reloadListTask!) {
      apiResultGetTaskList = await TaskGroup.getListTaskCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{\"workflow_id\":{\"_eq\":\"${widget.workflowId}\"}},{\"published_count\":{\"_eq\":\"${widget.publishedCount?.toString()}\"}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}}]}',
        sort: '-number',
      );
      if ((apiResultGetTaskList?.succeeded ?? true)) {
        list = TaskListDataStruct.maybeFromMap(
                (apiResultGetTaskList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
      }
    } else {
      return;
    }
  }
}
