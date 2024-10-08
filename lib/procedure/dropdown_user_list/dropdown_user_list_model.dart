import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dropdown_user_list_widget.dart' show DropdownUserListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool checkLoading = false;

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
  // State field(s) for Switch1 widget.
  bool? switch1Value;
  // State field(s) for Switch2 widget.
  bool? switch2Value;
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
