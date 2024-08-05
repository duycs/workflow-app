import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/procedure/dropdown_departments_list/dropdown_departments_list_widget.dart';
import '/procedure/dropdown_user_list/dropdown_user_list_widget.dart';
import '/procedure/procedure_step_create/procedure_step_create_widget.dart';
import '/procedure/procedure_step_menu/procedure_step_menu_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_create_widget.dart' show ProcedureCreateWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureCreateModel extends FlutterFlowModel<ProcedureCreateWidget> {
  ///  Local state fields for this page.

  RequestWorkflowsCreateStruct? requestData;
  void updateRequestDataStruct(
      Function(RequestWorkflowsCreateStruct) updateFn) {
    updateFn(requestData ??= RequestWorkflowsCreateStruct());
  }

  String? checkDrag;

  List<WorkflowsStepCreateStruct> stepsList = [];
  void addToStepsList(WorkflowsStepCreateStruct item) => stepsList.add(item);
  void removeFromStepsList(WorkflowsStepCreateStruct item) =>
      stepsList.remove(item);
  void removeAtIndexFromStepsList(int index) => stepsList.removeAt(index);
  void insertAtIndexInStepsList(int index, WorkflowsStepCreateStruct item) =>
      stepsList.insert(index, item);
  void updateStepsListAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      stepsList[index] = updateFn(stepsList[index]);

  int loop = 0;

  WorkflowsStepCreateStruct? dataRequest;
  void updateDataRequestStruct(Function(WorkflowsStepCreateStruct) updateFn) {
    updateFn(dataRequest ??= WorkflowsStepCreateStruct());
  }

  int loop2 = 0;

  List<StaffsStepStruct> staffList = [];
  void addToStaffList(StaffsStepStruct item) => staffList.add(item);
  void removeFromStaffList(StaffsStepStruct item) => staffList.remove(item);
  void removeAtIndexFromStaffList(int index) => staffList.removeAt(index);
  void insertAtIndexInStaffList(int index, StaffsStepStruct item) =>
      staffList.insert(index, item);
  void updateStaffListAtIndex(int index, Function(StaffsStepStruct) updateFn) =>
      staffList[index] = updateFn(staffList[index]);

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

  String? checkType;

  List<String> checkCron = [];
  void addToCheckCron(String item) => checkCron.add(item);
  void removeFromCheckCron(String item) => checkCron.remove(item);
  void removeAtIndexFromCheckCron(int index) => checkCron.removeAt(index);
  void insertAtIndexInCheckCron(int index, String item) =>
      checkCron.insert(index, item);
  void updateCheckCronAtIndex(int index, Function(String) updateFn) =>
      checkCron[index] = updateFn(checkCron[index]);

  List<DepartmentsIdStruct> departmentsList = [];
  void addToDepartmentsList(DepartmentsIdStruct item) =>
      departmentsList.add(item);
  void removeFromDepartmentsList(DepartmentsIdStruct item) =>
      departmentsList.remove(item);
  void removeAtIndexFromDepartmentsList(int index) =>
      departmentsList.removeAt(index);
  void insertAtIndexInDepartmentsList(int index, DepartmentsIdStruct item) =>
      departmentsList.insert(index, item);
  void updateDepartmentsListAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      departmentsList[index] = updateFn(departmentsList[index]);

  WorkflowsStepCreateStruct? stepsListRequest;
  void updateStepsListRequestStruct(
      Function(WorkflowsStepCreateStruct) updateFn) {
    updateFn(stepsListRequest ??= WorkflowsStepCreateStruct());
  }

  String checkUpdate = ' ';

  List<StaffsStepStruct> staffsList = [];
  void addToStaffsList(StaffsStepStruct item) => staffsList.add(item);
  void removeFromStaffsList(StaffsStepStruct item) => staffsList.remove(item);
  void removeAtIndexFromStaffsList(int index) => staffsList.removeAt(index);
  void insertAtIndexInStaffsList(int index, StaffsStepStruct item) =>
      staffsList.insert(index, item);
  void updateStaffsListAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      staffsList[index] = updateFn(staffsList[index]);

  List<OperationsStruct> operationsList = [];
  void addToOperationsList(OperationsStruct item) => operationsList.add(item);
  void removeFromOperationsList(OperationsStruct item) =>
      operationsList.remove(item);
  void removeAtIndexFromOperationsList(int index) =>
      operationsList.removeAt(index);
  void insertAtIndexInOperationsList(int index, OperationsStruct item) =>
      operationsList.insert(index, item);
  void updateOperationsListAtIndex(
          int index, Function(OperationsStruct) updateFn) =>
      operationsList[index] = updateFn(operationsList[index]);

  List<DepartmentListStruct> departmentListStep = [];
  void addToDepartmentListStep(DepartmentListStruct item) =>
      departmentListStep.add(item);
  void removeFromDepartmentListStep(DepartmentListStruct item) =>
      departmentListStep.remove(item);
  void removeAtIndexFromDepartmentListStep(int index) =>
      departmentListStep.removeAt(index);
  void insertAtIndexInDepartmentListStep(
          int index, DepartmentListStruct item) =>
      departmentListStep.insert(index, item);
  void updateDepartmentListStepAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      departmentListStep[index] = updateFn(departmentListStep[index]);

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

  List<WorkflowsStepCreateStruct> listAddStep = [];
  void addToListAddStep(WorkflowsStepCreateStruct item) =>
      listAddStep.add(item);
  void removeFromListAddStep(WorkflowsStepCreateStruct item) =>
      listAddStep.remove(item);
  void removeAtIndexFromListAddStep(int index) => listAddStep.removeAt(index);
  void insertAtIndexInListAddStep(int index, WorkflowsStepCreateStruct item) =>
      listAddStep.insert(index, item);
  void updateListAddStepAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      listAddStep[index] = updateFn(listAddStep[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadProcedureCreate;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in Button widget.
  ApiCallResponse? apiResult4dr;
  // Stores action output result for [Backend Call - API (CreateWorkflowsAll)] action in Button widget.
  ApiCallResponse? apiResultWorkflowCreate;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  String? _textNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên quy trình!';
    }

    return null;
  }

  // State field(s) for TextDescription widget.
  FocusNode? textDescriptionFocusNode;
  TextEditingController? textDescriptionTextController;
  String? Function(BuildContext, String?)?
      textDescriptionTextControllerValidator;
  // State field(s) for DropDownRun widget.
  String? dropDownRunValue;
  FormFieldController<String>? dropDownRunValueController;
  // State field(s) for DropDownCron widget.
  String? dropDownCronValue;
  FormFieldController<String>? dropDownCronValueController;
  // State field(s) for groupWeek widget.
  FormFieldController<List<String>>? groupWeekValueController;
  List<String>? get groupWeekValues => groupWeekValueController?.value;
  set groupWeekValues(List<String>? v) => groupWeekValueController?.value = v;

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
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<WorkflowsStepCreateStruct>? updateListView;

  @override
  void initState(BuildContext context) {
    textNameTextControllerValidator = _textNameTextControllerValidator;
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
    unfocusNode.dispose();
    tabBarController?.dispose();
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    textDescriptionFocusNode?.dispose();
    textDescriptionTextController?.dispose();

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

  /// Action blocks.
  Future checkCallBack(
    BuildContext context, {
    required StepsStruct? item,
  }) async {
    if (('${item?.dateStart}' != null && '${item?.dateStart}' != '') &&
        ('${item?.dateEnd}' == null || '${item?.dateEnd}' == '')) {
      addToStepsList(WorkflowsStepCreateStruct(
        name: item?.name,
        description: item?.description,
        staffs: item?.staffs,
        executeType: item?.executeType,
        dateStart: item?.dateStart,
        actionType: item?.actionType,
        operations: item?.operations,
        status: 'published',
        staffsAlias: item?.staffsAlias,
      ));
    } else if (('${item?.dateStart}' == null || '${item?.dateStart}' == '') &&
        ('${item?.dateEnd}' != null && '${item?.dateEnd}' != '')) {
      addToStepsList(WorkflowsStepCreateStruct(
        name: item?.name,
        description: item?.description,
        staffs: item?.staffs,
        executeType: item?.executeType,
        dateEnd: item?.dateEnd,
        actionType: item?.actionType,
        operations: item?.operations,
        status: 'published',
        staffsAlias: item?.staffsAlias,
      ));
    } else if (('${item?.dateStart}' != null && '${item?.dateStart}' != '') &&
        ('${item?.dateEnd}' != null && '${item?.dateEnd}' != '')) {
      addToStepsList(WorkflowsStepCreateStruct(
        name: item?.name,
        description: item?.description,
        staffs: item?.staffs,
        executeType: item?.executeType,
        dateStart: item?.dateStart,
        dateEnd: item?.dateEnd,
        actionType: item?.actionType,
        operations: item?.operations,
        status: 'published',
        staffsAlias: item?.staffsAlias,
      ));
    } else {
      addToStepsList(WorkflowsStepCreateStruct(
        name: item?.name,
        description: item?.description,
        staffs: item?.staffs,
        executeType: item?.executeType,
        actionType: item?.actionType,
        operations: item?.operations,
        status: 'published',
        staffsAlias: item?.staffsAlias,
      ));
    }
  }

  Future updateStep(
    BuildContext context, {
    StepsStruct? item,
    int? index,
  }) async {
    updateStepsListAtIndex(
      index!,
      (_) => WorkflowsStepCreateStruct(
        name: item?.name,
        description: item?.description,
        staffs: item?.staffs,
        executeType: item?.executeType,
        actionType: item?.actionType,
        operations: item?.operations,
        status: 'published',
        staffsAlias: item?.staffsAlias,
        estimateInSecond:
            item?.estimateInSecond != null ? item?.estimateInSecond : 0,
        timeOperate: item?.timeOperate != null && item?.timeOperate != ''
            ? item?.timeOperate
            : '',
        departments: item?.departments,
      ),
    );
  }

  Future addStaff(
    BuildContext context, {
    List<StaffListStruct>? item,
  }) async {
    staffList = [];
    while (loop < item!.length) {
      addToStaffList(StaffsStepStruct(
        staffsId: StaffIdStruct(
          id: (item?[loop])?.id,
          userId: UserIdStruct(
            firstName: (item?[loop])?.userId?.firstName,
          ),
        ),
      ));
      loop = loop + 1;
    }
    loop = 0;
  }

  Future addDepartments(
    BuildContext context, {
    String? item,
  }) async {}
}
