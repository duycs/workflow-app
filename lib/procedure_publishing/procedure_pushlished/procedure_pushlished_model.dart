import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'procedure_pushlished_widget.dart' show ProcedurePushlishedWidget;
import 'package:flutter/material.dart';

class ProcedurePushlishedModel
    extends FlutterFlowModel<ProcedurePushlishedWidget> {
  ///  Local state fields for this component.

  List<WorkflowsStruct> workflowList = [];
  void addToWorkflowList(WorkflowsStruct item) => workflowList.add(item);
  void removeFromWorkflowList(WorkflowsStruct item) =>
      workflowList.remove(item);
  void removeAtIndexFromWorkflowList(int index) => workflowList.removeAt(index);
  void insertAtIndexInWorkflowList(int index, WorkflowsStruct item) =>
      workflowList.insert(index, item);
  void updateWorkflowListAtIndex(
          int index, Function(WorkflowsStruct) updateFn) =>
      workflowList[index] = updateFn(workflowList[index]);

  WorkflowsStruct? workflowSelected;
  void updateWorkflowSelectedStruct(Function(WorkflowsStruct) updateFn) =>
      updateFn(workflowSelected ??= WorkflowsStruct());

  int? limitPublished = 0;

  int loop = 0;

  List<StaffStepOneStruct> staffIdStepOne = [];
  void addToStaffIdStepOne(StaffStepOneStruct item) => staffIdStepOne.add(item);
  void removeFromStaffIdStepOne(StaffStepOneStruct item) =>
      staffIdStepOne.remove(item);
  void removeAtIndexFromStaffIdStepOne(int index) =>
      staffIdStepOne.removeAt(index);
  void insertAtIndexInStaffIdStepOne(int index, StaffStepOneStruct item) =>
      staffIdStepOne.insert(index, item);
  void updateStaffIdStepOneAtIndex(
          int index, Function(StaffStepOneStruct) updateFn) =>
      staffIdStepOne[index] = updateFn(staffIdStepOne[index]);

  List<ProcedurePublishedStepStruct> staffOne = [];
  void addToStaffOne(ProcedurePublishedStepStruct item) => staffOne.add(item);
  void removeFromStaffOne(ProcedurePublishedStepStruct item) =>
      staffOne.remove(item);
  void removeAtIndexFromStaffOne(int index) => staffOne.removeAt(index);
  void insertAtIndexInStaffOne(int index, ProcedurePublishedStepStruct item) =>
      staffOne.insert(index, item);
  void updateStaffOneAtIndex(
          int index, Function(ProcedurePublishedStepStruct) updateFn) =>
      staffOne[index] = updateFn(staffOne[index]);

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (workflowsList)] action in ProcedurePushlished widget.
  ApiCallResponse? apiResultProcedureList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenProcedrue1;
  // Stores action output result for [Backend Call - API (ProcedureTemplateUpdateLimitPublished)] action in Button widget.
  ApiCallResponse? apiResultUpdateLimit;
  // Stores action output result for [Backend Call - API (ProcedurePublished)] action in Button widget.
  ApiCallResponse? apiResultProcedurePublished;
  // Stores action output result for [Backend Call - API (ReceiveTask)] action in Button widget.
  ApiCallResponse? apiResultReciveTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
