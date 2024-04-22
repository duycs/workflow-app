import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_detail_widget.dart' show TaskDetailWidget;
import 'package:flutter/material.dart';

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
  void updateResponseDataStruct(Function(UpdateTaskDataTypeStruct) updateFn) =>
      updateFn(responseData ??= UpdateTaskDataTypeStruct());

  String submitText = '';

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskDetail widget.
  ApiCallResponse? apiResultGetTaskList;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in detail_action_type_to_do_list widget.
  ApiCallResponse? apiResultCheckList;
  // Stores action output result for [Backend Call - API (ConfirmOperation)] action in detail_action_type_approve widget.
  ApiCallResponse? apiResuonfirm;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in Button widget.
  ApiCallResponse? apiResultx5l;
  // Stores action output result for [Backend Call - API (UpdateOperation)] action in detail_action_type_upload_file widget.
  ApiCallResponse? apiResultl2e;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
