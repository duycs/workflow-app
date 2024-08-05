import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'process_template_detail_widget.dart' show ProcessTemplateDetailWidget;
import 'package:flutter/material.dart';

class ProcessTemplateDetailModel
    extends FlutterFlowModel<ProcessTemplateDetailWidget> {
  ///  Local state fields for this page.

  List<WorkflowsStepCreateStruct> stepList = [];
  void addToStepList(WorkflowsStepCreateStruct item) => stepList.add(item);
  void removeFromStepList(WorkflowsStepCreateStruct item) =>
      stepList.remove(item);
  void removeAtIndexFromStepList(int index) => stepList.removeAt(index);
  void insertAtIndexInStepList(int index, WorkflowsStepCreateStruct item) =>
      stepList.insert(index, item);
  void updateStepListAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      stepList[index] = updateFn(stepList[index]);

  bool isLoad = false;

  WorkflowsStepCreateStruct? data;
  void updateDataStruct(Function(WorkflowsStepCreateStruct) updateFn) {
    updateFn(data ??= WorkflowsStepCreateStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ProcessTemplateDetail widget.
  bool? tokenReloadProcessTemplateDetail;
  // Stores action output result for [Backend Call - API (workflowsOne)] action in ProcessTemplateDetail widget.
  ApiCallResponse? apiResultm7u;
  // Stores action output result for [Backend Call - API (workflowCopy)] action in Button widget.
  ApiCallResponse? apiResulthxs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
