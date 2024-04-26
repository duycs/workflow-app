import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import 'dropdown_user_list_widget.dart' show DropdownUserListWidget;
import 'package:flutter/material.dart';

class DropdownUserListModel extends FlutterFlowModel<DropdownUserListWidget> {
  ///  Local state fields for this component.

  List<StaffListStruct> staffList = [];
  void addToStaffList(StaffListStruct item) => staffList.add(item);
  void removeFromStaffList(StaffListStruct item) => staffList.remove(item);
  void removeAtIndexFromStaffList(int index) => staffList.removeAt(index);
  void insertAtIndexInStaffList(int index, StaffListStruct item) =>
      staffList.insert(index, item);
  void updateStaffListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      staffList[index] = updateFn(staffList[index]);

  List<StaffsStepStruct> checkId = [];
  void addToCheckId(StaffsStepStruct item) => checkId.add(item);
  void removeFromCheckId(StaffsStepStruct item) => checkId.remove(item);
  void removeAtIndexFromCheckId(int index) => checkId.removeAt(index);
  void insertAtIndexInCheckId(int index, StaffsStepStruct item) =>
      checkId.insert(index, item);
  void updateCheckIdAtIndex(int index, Function(StaffsStepStruct) updateFn) =>
      checkId[index] = updateFn(checkId[index]);

  int loop = 0;

  List<StaffListStruct> callBackData = [];
  void addToCallBackData(StaffListStruct item) => callBackData.add(item);
  void removeFromCallBackData(StaffListStruct item) =>
      callBackData.remove(item);
  void removeAtIndexFromCallBackData(int index) => callBackData.removeAt(index);
  void insertAtIndexInCallBackData(int index, StaffListStruct item) =>
      callBackData.insert(index, item);
  void updateCallBackDataAtIndex(
          int index, Function(StaffListStruct) updateFn) =>
      callBackData[index] = updateFn(callBackData[index]);

  int loop2 = 0;

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in DropdownUserList widget.
  bool? tokenReloadDropdownUserList;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in DropdownUserList widget.
  ApiCallResponse? apiResultList;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in DropdownUserList widget.
  ApiCallResponse? apiResultListData;
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
