import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dropdown_departments_list_widget.dart'
    show DropdownDepartmentsListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool isLoad = false;

  List<StaffsStepStruct> checkDepar = [];
  void addToCheckDepar(StaffsStepStruct item) => checkDepar.add(item);
  void removeFromCheckDepar(StaffsStepStruct item) => checkDepar.remove(item);
  void removeAtIndexFromCheckDepar(int index) => checkDepar.removeAt(index);
  void insertAtIndexInCheckDepar(int index, StaffsStepStruct item) =>
      checkDepar.insert(index, item);
  void updateCheckDeparAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      checkDepar[index] = updateFn(checkDepar[index]);

  bool checkLoading = false;

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
