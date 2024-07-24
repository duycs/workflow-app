import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure/procedure_step_detail/procedure_step_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_detail_widget.dart' show ProcedureDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureDetailModel extends FlutterFlowModel<ProcedureDetailWidget> {
  ///  Local state fields for this page.

  List<WorkflowsStepCreateStruct> stepsList = [];
  void addToStepsList(WorkflowsStepCreateStruct item) => stepsList.add(item);
  void removeFromStepsList(WorkflowsStepCreateStruct item) =>
      stepsList.remove(item);
  void removeAtIndexFromStepsList(int index) => stepsList.removeAt(index);
  void insertAtIndexInStepsList(int index, WorkflowsStepCreateStruct item) =>
      stepsList.insert(index, item);
  void updateStepsListAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      stepsList[index] = updateFn(stepsList[index]);

  bool idLoad = false;

  WorkflowsStepCreateStruct? data;
  void updateDataStruct(Function(WorkflowsStepCreateStruct) updateFn) {
    updateFn(data ??= WorkflowsStepCreateStruct());
  }

  int loop = 0;

  int loop2 = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ProcedureDetail widget.
  bool? tokenReloadProcedureDetail;
  // Stores action output result for [Backend Call - API (workflowsOne)] action in ProcedureDetail widget.
  ApiCallResponse? apiResultStepData;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
