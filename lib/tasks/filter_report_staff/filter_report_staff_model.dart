import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_report_staff_widget.dart' show FilterReportStaffWidget;
import 'package:flutter/material.dart';

class FilterReportStaffModel extends FlutterFlowModel<FilterReportStaffWidget> {
  ///  Local state fields for this component.

  List<StaffListStruct> list = [];
  void addToList(StaffListStruct item) => list.add(item);
  void removeFromList(StaffListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  List<BranchListStruct> branchList = [];
  void addToBranchList(BranchListStruct item) => branchList.add(item);
  void removeFromBranchList(BranchListStruct item) => branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, BranchListStruct item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  List<DepartmentListStruct> departmentList = [];
  void addToDepartmentList(DepartmentListStruct item) =>
      departmentList.add(item);
  void removeFromDepartmentList(DepartmentListStruct item) =>
      departmentList.remove(item);
  void removeAtIndexFromDepartmentList(int index) =>
      departmentList.removeAt(index);
  void insertAtIndexInDepartmentList(int index, DepartmentListStruct item) =>
      departmentList.insert(index, item);
  void updateDepartmentListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      departmentList[index] = updateFn(departmentList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in FilterReportStaff widget.
  bool? getListBranchToken3;
  // Stores action output result for [Backend Call - API (BranchList)] action in FilterReportStaff widget.
  ApiCallResponse? apiResultGetListBranch3;
  // Stores action output result for [Action Block - tokenReload] action in FilterReportStaff widget.
  bool? listDeparment5Token;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in FilterReportStaff widget.
  ApiCallResponse? apiResultListDeparment5;
  // State field(s) for status widget.
  FormFieldController<List<String>>? statusValueController;
  String? get statusValue => statusValueController?.value?.firstOrNull;
  set statusValue(String? val) =>
      statusValueController?.value = val != null ? [val] : [];
  // State field(s) for branch widget.
  String? branchValue;
  FormFieldController<String>? branchValueController;
  // Stores action output result for [Action Block - tokenReload] action in branch widget.
  bool? listDeparment4Token;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in branch widget.
  ApiCallResponse? apiResultListDeparment4;
  // State field(s) for department widget.
  String? departmentValue;
  FormFieldController<String>? departmentValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? clearFilterToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in Button widget.
  ApiCallResponse? apiResultClearFilter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
