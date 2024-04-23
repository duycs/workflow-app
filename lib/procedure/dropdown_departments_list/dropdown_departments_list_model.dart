import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import 'dropdown_departments_list_widget.dart'
    show DropdownDepartmentsListWidget;
import 'package:flutter/material.dart';

class DropdownDepartmentsListModel
    extends FlutterFlowModel<DropdownDepartmentsListWidget> {
  ///  Local state fields for this component.

  List<DepartmentListStruct> data = [];
  void addToData(DepartmentListStruct item) => data.add(item);
  void removeFromData(DepartmentListStruct item) => data.remove(item);
  void removeAtIndexFromData(int index) => data.removeAt(index);
  void insertAtIndexInData(int index, DepartmentListStruct item) =>
      data.insert(index, item);
  void updateDataAtIndex(int index, Function(DepartmentListStruct) updateFn) =>
      data[index] = updateFn(data[index]);

  int loop = 0;

  List<DepartmentsIdStruct> callBackData = [];
  void addToCallBackData(DepartmentsIdStruct item) => callBackData.add(item);
  void removeFromCallBackData(DepartmentsIdStruct item) =>
      callBackData.remove(item);
  void removeAtIndexFromCallBackData(int index) => callBackData.removeAt(index);
  void insertAtIndexInCallBackData(int index, DepartmentsIdStruct item) =>
      callBackData.insert(index, item);
  void updateCallBackDataAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      callBackData[index] = updateFn(callBackData[index]);

  int loop2 = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in DropdownDepartmentsList widget.
  bool? tokenReloadDropdownDepartmentsList;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in DropdownDepartmentsList widget.
  ApiCallResponse? apiResultDatade;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in DropdownDepartmentsList widget.
  ApiCallResponse? apiResulfilter;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels;

  @override
  void initState(BuildContext context) {
    checkBoxToggleModels =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
  }

  @override
  void dispose() {
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    checkBoxToggleModels.dispose();
  }
}
