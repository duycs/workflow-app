import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'staffs_list_dropdown_widget.dart' show StaffsListDropdownWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffsListDropdownModel
    extends FlutterFlowModel<StaffsListDropdownWidget> {
  ///  Local state fields for this component.

  List<StaffListStruct> staffList = [];
  void addToStaffList(StaffListStruct item) => staffList.add(item);
  void removeFromStaffList(StaffListStruct item) => staffList.remove(item);
  void removeAtIndexFromStaffList(int index) => staffList.removeAt(index);
  void insertAtIndexInStaffList(int index, StaffListStruct item) =>
      staffList.insert(index, item);
  void updateStaffListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      staffList[index] = updateFn(staffList[index]);

  int loop = 0;

  int loop2 = 0;

  StaffListStruct? checkStaffList;
  void updateCheckStaffListStruct(Function(StaffListStruct) updateFn) =>
      updateFn(checkStaffList ??= StaffListStruct());

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetStaffList)] action in StaffsListDropdown widget.
  ApiCallResponse? apiResultList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
