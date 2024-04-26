import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/done_action_type_to_do_list/done_action_type_to_do_list_widget.dart';
import '/tasks/filter_task_list_done/filter_task_list_done_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_list_done_widget.dart' show TaskListDoneWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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

  List<TaskListStruct> taskToDo = [];
  void addToTaskToDo(TaskListStruct item) => taskToDo.add(item);
  void removeFromTaskToDo(TaskListStruct item) => taskToDo.remove(item);
  void removeAtIndexFromTaskToDo(int index) => taskToDo.removeAt(index);
  void insertAtIndexInTaskToDo(int index, TaskListStruct item) =>
      taskToDo.insert(index, item);
  void updateTaskToDoAtIndex(int index, Function(TaskListStruct) updateFn) =>
      taskToDo[index] = updateFn(taskToDo[index]);

  List<TaskListStruct> taskWait = [];
  void addToTaskWait(TaskListStruct item) => taskWait.add(item);
  void removeFromTaskWait(TaskListStruct item) => taskWait.remove(item);
  void removeAtIndexFromTaskWait(int index) => taskWait.removeAt(index);
  void insertAtIndexInTaskWait(int index, TaskListStruct item) =>
      taskWait.insert(index, item);
  void updateTaskWaitAtIndex(int index, Function(TaskListStruct) updateFn) =>
      taskWait[index] = updateFn(taskWait[index]);

  String? dateStartFilter = '';

  String? dateEndFilter = '';

  String? typeFilter = '';

  String? isShow;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskListDone widget.
  ApiCallResponse? apiResultGetTaskDone;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TaskListDone widget.
  ApiCallResponse? apiResultGetTask;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getTaskDoneFilterToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TextField widget.
  ApiCallResponse? apiResultGetTaskDoneFilter;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getListTaskDoneToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in TextField widget.
  ApiCallResponse? apiResultGetListTaskDone;
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

    navBarModel.dispose();
  }
}
