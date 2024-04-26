import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_setting_widget.dart' show ProcedureSettingWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureSettingModel extends FlutterFlowModel<ProcedureSettingWidget> {
  ///  Local state fields for this component.

  String addTime = '0';

  RequestWorkflowsCreateStruct? settingAdd;
  void updateSettingAddStruct(
          Function(RequestWorkflowsCreateStruct) updateFn) =>
      updateFn(settingAdd ??= RequestWorkflowsCreateStruct());

  List<String> checkCron = [];
  void addToCheckCron(String item) => checkCron.add(item);
  void removeFromCheckCron(String item) => checkCron.remove(item);
  void removeAtIndexFromCheckCron(int index) => checkCron.removeAt(index);
  void insertAtIndexInCheckCron(int index, String item) =>
      checkCron.insert(index, item);
  void updateCheckCronAtIndex(int index, Function(String) updateFn) =>
      checkCron[index] = updateFn(checkCron[index]);

  int? loop = 0;

  String? checkType;

  List<CheckBoxGroupStruct> checkOne = [];
  void addToCheckOne(CheckBoxGroupStruct item) => checkOne.add(item);
  void removeFromCheckOne(CheckBoxGroupStruct item) => checkOne.remove(item);
  void removeAtIndexFromCheckOne(int index) => checkOne.removeAt(index);
  void insertAtIndexInCheckOne(int index, CheckBoxGroupStruct item) =>
      checkOne.insert(index, item);
  void updateCheckOneAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkOne[index] = updateFn(checkOne[index]);

  List<CheckBoxGroupStruct> checkTwo = [];
  void addToCheckTwo(CheckBoxGroupStruct item) => checkTwo.add(item);
  void removeFromCheckTwo(CheckBoxGroupStruct item) => checkTwo.remove(item);
  void removeAtIndexFromCheckTwo(int index) => checkTwo.removeAt(index);
  void insertAtIndexInCheckTwo(int index, CheckBoxGroupStruct item) =>
      checkTwo.insert(index, item);
  void updateCheckTwoAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkTwo[index] = updateFn(checkTwo[index]);

  List<CheckBoxGroupStruct> checkThrees = [];
  void addToCheckThrees(CheckBoxGroupStruct item) => checkThrees.add(item);
  void removeFromCheckThrees(CheckBoxGroupStruct item) =>
      checkThrees.remove(item);
  void removeAtIndexFromCheckThrees(int index) => checkThrees.removeAt(index);
  void insertAtIndexInCheckThrees(int index, CheckBoxGroupStruct item) =>
      checkThrees.insert(index, item);
  void updateCheckThreesAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkThrees[index] = updateFn(checkThrees[index]);

  List<CheckBoxGroupStruct> checkBoxFour = [];
  void addToCheckBoxFour(CheckBoxGroupStruct item) => checkBoxFour.add(item);
  void removeFromCheckBoxFour(CheckBoxGroupStruct item) =>
      checkBoxFour.remove(item);
  void removeAtIndexFromCheckBoxFour(int index) => checkBoxFour.removeAt(index);
  void insertAtIndexInCheckBoxFour(int index, CheckBoxGroupStruct item) =>
      checkBoxFour.insert(index, item);
  void updateCheckBoxFourAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkBoxFour[index] = updateFn(checkBoxFour[index]);

  List<CheckBoxGroupStruct> checkBoxFive = [];
  void addToCheckBoxFive(CheckBoxGroupStruct item) => checkBoxFive.add(item);
  void removeFromCheckBoxFive(CheckBoxGroupStruct item) =>
      checkBoxFive.remove(item);
  void removeAtIndexFromCheckBoxFive(int index) => checkBoxFive.removeAt(index);
  void insertAtIndexInCheckBoxFive(int index, CheckBoxGroupStruct item) =>
      checkBoxFive.insert(index, item);
  void updateCheckBoxFiveAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkBoxFive[index] = updateFn(checkBoxFive[index]);

  List<CheckBoxGroupStruct> checkBoxSix = [];
  void addToCheckBoxSix(CheckBoxGroupStruct item) => checkBoxSix.add(item);
  void removeFromCheckBoxSix(CheckBoxGroupStruct item) =>
      checkBoxSix.remove(item);
  void removeAtIndexFromCheckBoxSix(int index) => checkBoxSix.removeAt(index);
  void insertAtIndexInCheckBoxSix(int index, CheckBoxGroupStruct item) =>
      checkBoxSix.insert(index, item);
  void updateCheckBoxSixAtIndex(
          int index, Function(CheckBoxGroupStruct) updateFn) =>
      checkBoxSix[index] = updateFn(checkBoxSix[index]);

  bool isLoad = false;

  int loop2 = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownCron widget.
  String? dropDownCronValue;
  FormFieldController<String>? dropDownCronValueController;
  // State field(s) for groupWeek widget.
  List<String>? groupWeekValues;
  FormFieldController<List<String>>? groupWeekValueController;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels1;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels2;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels3;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels4;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels5;
  // Models for checkBoxToggle dynamic component.
  late FlutterFlowDynamicModels<CheckBoxToggleModel> checkBoxToggleModels6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for timeHour widget.
  FocusNode? timeHourFocusNode;
  TextEditingController? timeHourTextController;
  String? Function(BuildContext, String?)? timeHourTextControllerValidator;
  // State field(s) for timeMinute widget.
  FocusNode? timeMinuteFocusNode;
  TextEditingController? timeMinuteTextController;
  String? Function(BuildContext, String?)? timeMinuteTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    checkBoxToggleModels1 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
    checkBoxToggleModels2 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
    checkBoxToggleModels3 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
    checkBoxToggleModels4 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
    checkBoxToggleModels5 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
    checkBoxToggleModels6 =
        FlutterFlowDynamicModels(() => CheckBoxToggleModel());
  }

  @override
  void dispose() {
    checkBoxToggleModels1.dispose();
    checkBoxToggleModels2.dispose();
    checkBoxToggleModels3.dispose();
    checkBoxToggleModels4.dispose();
    checkBoxToggleModels5.dispose();
    checkBoxToggleModels6.dispose();
    timeHourFocusNode?.dispose();
    timeHourTextController?.dispose();

    timeMinuteFocusNode?.dispose();
    timeMinuteTextController?.dispose();
  }
}
