import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'branch_detail_widget.dart' show BranchDetailWidget;
import 'package:flutter/material.dart';

class BranchDetailModel extends FlutterFlowModel<BranchDetailWidget> {
  ///  Local state fields for this page.

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in BranchDetail widget.
  ApiCallResponse? apiResultGetList;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
