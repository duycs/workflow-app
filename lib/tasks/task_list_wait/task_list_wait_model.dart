import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/filter_task_list_wait/filter_task_list_wait_widget.dart';
import '/tasks/wait_action_type_approve/wait_action_type_approve_widget.dart';
import '/tasks/wait_action_type_image/wait_action_type_image_widget.dart';
import '/tasks/wait_action_type_submit_text/wait_action_type_submit_text_widget.dart';
import '/tasks/wait_action_type_to_do_list/wait_action_type_to_do_list_widget.dart';
import '/tasks/wait_action_type_upload_file/wait_action_type_upload_file_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_list_wait_widget.dart' show TaskListWaitWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskListWaitModel extends FlutterFlowModel<TaskListWaitWidget> {
  ///  Local state fields for this page.

  List<TaskListStruct> list = [];
  void addToList(TaskListStruct item) => list.add(item);
  void removeFromList(TaskListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, TaskListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(TaskListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  List<TaskListStruct> taskToDo = [];
  void addToTaskToDo(TaskListStruct item) => taskToDo.add(item);
  void removeFromTaskToDo(TaskListStruct item) => taskToDo.remove(item);
  void removeAtIndexFromTaskToDo(int index) => taskToDo.removeAt(index);
  void insertAtIndexInTaskToDo(int index, TaskListStruct item) =>
      taskToDo.insert(index, item);
  void updateTaskToDoAtIndex(int index, Function(TaskListStruct) updateFn) =>
      taskToDo[index] = updateFn(taskToDo[index]);

  List<TaskListStruct> taskDone = [];
  void addToTaskDone(TaskListStruct item) => taskDone.add(item);
  void removeFromTaskDone(TaskListStruct item) => taskDone.remove(item);
  void removeAtIndexFromTaskDone(int index) => taskDone.removeAt(index);
  void insertAtIndexInTaskDone(int index, TaskListStruct item) =>
      taskDone.insert(index, item);
  void updateTaskDoneAtIndex(int index, Function(TaskListStruct) updateFn) =>
      taskDone[index] = updateFn(taskDone[index]);

  String? dateStartFilter = '';

  String? dateEndFilter = '';

  String? typeFilter = '';

  String? isShow;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskListWait widget.
  ApiCallResponse? apiResultGetTaskFail;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskListWait widget.
  ApiCallResponse? apiResultGetTask;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getTaWaitFilterToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TextField widget.
  ApiCallResponse? apiResultGetTaWaitFilter;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getTaWaitToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TextField widget.
  ApiCallResponse? apiResultGetTaWait;
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

    navBarModel.dispose();
  }
}
