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
import 'procedure_update_widget.dart' show ProcedureUpdateWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureUpdateModel extends FlutterFlowModel<ProcedureUpdateWidget> {
  ///  Local state fields for this page.

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

  RequestWorkflowsCreateStruct? dataUpdate;
  void updateDataUpdateStruct(Function(RequestWorkflowsCreateStruct) updateFn) {
    updateFn(dataUpdate ??= RequestWorkflowsCreateStruct());
  }

  List<String> stepDelete = [];
  void addToStepDelete(String item) => stepDelete.add(item);
  void removeFromStepDelete(String item) => stepDelete.remove(item);
  void removeAtIndexFromStepDelete(int index) => stepDelete.removeAt(index);
  void insertAtIndexInStepDelete(int index, String item) =>
      stepDelete.insert(index, item);
  void updateStepDeleteAtIndex(int index, Function(String) updateFn) =>
      stepDelete[index] = updateFn(stepDelete[index]);

  int loop = 0;

  List<WorkflowsStepCreateStruct> createStep = [];
  void addToCreateStep(WorkflowsStepCreateStruct item) => createStep.add(item);
  void removeFromCreateStep(WorkflowsStepCreateStruct item) =>
      createStep.remove(item);
  void removeAtIndexFromCreateStep(int index) => createStep.removeAt(index);
  void insertAtIndexInCreateStep(int index, WorkflowsStepCreateStruct item) =>
      createStep.insert(index, item);
  void updateCreateStepAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      createStep[index] = updateFn(createStep[index]);

  List<WorkflowsStepCreateStruct> createUpdate = [];
  void addToCreateUpdate(WorkflowsStepCreateStruct item) =>
      createUpdate.add(item);
  void removeFromCreateUpdate(WorkflowsStepCreateStruct item) =>
      createUpdate.remove(item);
  void removeAtIndexFromCreateUpdate(int index) => createUpdate.removeAt(index);
  void insertAtIndexInCreateUpdate(int index, WorkflowsStepCreateStruct item) =>
      createUpdate.insert(index, item);
  void updateCreateUpdateAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      createUpdate[index] = updateFn(createUpdate[index]);

  int loop2 = 0;

  bool isLoad = false;

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

  RequestWorkflowsCreateStruct? requestUpdate;
  void updateRequestUpdateStruct(
      Function(RequestWorkflowsCreateStruct) updateFn) {
    updateFn(requestUpdate ??= RequestWorkflowsCreateStruct());
  }

  int loop3 = 0;

  List<DepartmentsIdStruct> pageDepartments = [];
  void addToPageDepartments(DepartmentsIdStruct item) =>
      pageDepartments.add(item);
  void removeFromPageDepartments(DepartmentsIdStruct item) =>
      pageDepartments.remove(item);
  void removeAtIndexFromPageDepartments(int index) =>
      pageDepartments.removeAt(index);
  void insertAtIndexInPageDepartments(int index, DepartmentsIdStruct item) =>
      pageDepartments.insert(index, item);
  void updatePageDepartmentsAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      pageDepartments[index] = updateFn(pageDepartments[index]);

  List<StaffsStepStruct> pageStaffs = [];
  void addToPageStaffs(StaffsStepStruct item) => pageStaffs.add(item);
  void removeFromPageStaffs(StaffsStepStruct item) => pageStaffs.remove(item);
  void removeAtIndexFromPageStaffs(int index) => pageStaffs.removeAt(index);
  void insertAtIndexInPageStaffs(int index, StaffsStepStruct item) =>
      pageStaffs.insert(index, item);
  void updatePageStaffsAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      pageStaffs[index] = updateFn(pageStaffs[index]);

  List<OperationsStruct> pageOperations = [];
  void addToPageOperations(OperationsStruct item) => pageOperations.add(item);
  void removeFromPageOperations(OperationsStruct item) =>
      pageOperations.remove(item);
  void removeAtIndexFromPageOperations(int index) =>
      pageOperations.removeAt(index);
  void insertAtIndexInPageOperations(int index, OperationsStruct item) =>
      pageOperations.insert(index, item);
  void updatePageOperationsAtIndex(
          int index, Function(OperationsStruct) updateFn) =>
      pageOperations[index] = updateFn(pageOperations[index]);

  List<DepartmentListStruct> pageDepartmentsStep = [];
  void addToPageDepartmentsStep(DepartmentListStruct item) =>
      pageDepartmentsStep.add(item);
  void removeFromPageDepartmentsStep(DepartmentListStruct item) =>
      pageDepartmentsStep.remove(item);
  void removeAtIndexFromPageDepartmentsStep(int index) =>
      pageDepartmentsStep.removeAt(index);
  void insertAtIndexInPageDepartmentsStep(
          int index, DepartmentListStruct item) =>
      pageDepartmentsStep.insert(index, item);
  void updatePageDepartmentsStepAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      pageDepartmentsStep[index] = updateFn(pageDepartmentsStep[index]);

  List<DepartmentsIdStruct> dataUpdateDepartment = [];
  void addToDataUpdateDepartment(DepartmentsIdStruct item) =>
      dataUpdateDepartment.add(item);
  void removeFromDataUpdateDepartment(DepartmentsIdStruct item) =>
      dataUpdateDepartment.remove(item);
  void removeAtIndexFromDataUpdateDepartment(int index) =>
      dataUpdateDepartment.removeAt(index);
  void insertAtIndexInDataUpdateDepartment(
          int index, DepartmentsIdStruct item) =>
      dataUpdateDepartment.insert(index, item);
  void updateDataUpdateDepartmentAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      dataUpdateDepartment[index] = updateFn(dataUpdateDepartment[index]);

  List<StaffsStepStruct> dataUpdateStaffs = [];
  void addToDataUpdateStaffs(StaffsStepStruct item) =>
      dataUpdateStaffs.add(item);
  void removeFromDataUpdateStaffs(StaffsStepStruct item) =>
      dataUpdateStaffs.remove(item);
  void removeAtIndexFromDataUpdateStaffs(int index) =>
      dataUpdateStaffs.removeAt(index);
  void insertAtIndexInDataUpdateStaffs(int index, StaffsStepStruct item) =>
      dataUpdateStaffs.insert(index, item);
  void updateDataUpdateStaffsAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      dataUpdateStaffs[index] = updateFn(dataUpdateStaffs[index]);

  List<DepartmentsIdStruct> updateDepartments = [];
  void addToUpdateDepartments(DepartmentsIdStruct item) =>
      updateDepartments.add(item);
  void removeFromUpdateDepartments(DepartmentsIdStruct item) =>
      updateDepartments.remove(item);
  void removeAtIndexFromUpdateDepartments(int index) =>
      updateDepartments.removeAt(index);
  void insertAtIndexInUpdateDepartments(int index, DepartmentsIdStruct item) =>
      updateDepartments.insert(index, item);
  void updateUpdateDepartmentsAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      updateDepartments[index] = updateFn(updateDepartments[index]);

  List<WorkflowsStepCreateStruct> stepsUpdate = [];
  void addToStepsUpdate(WorkflowsStepCreateStruct item) =>
      stepsUpdate.add(item);
  void removeFromStepsUpdate(WorkflowsStepCreateStruct item) =>
      stepsUpdate.remove(item);
  void removeAtIndexFromStepsUpdate(int index) => stepsUpdate.removeAt(index);
  void insertAtIndexInStepsUpdate(int index, WorkflowsStepCreateStruct item) =>
      stepsUpdate.insert(index, item);
  void updateStepsUpdateAtIndex(
          int index, Function(WorkflowsStepCreateStruct) updateFn) =>
      stepsUpdate[index] = updateFn(stepsUpdate[index]);

  List<DepartmentListStruct> updateStepDeparments = [];
  void addToUpdateStepDeparments(DepartmentListStruct item) =>
      updateStepDeparments.add(item);
  void removeFromUpdateStepDeparments(DepartmentListStruct item) =>
      updateStepDeparments.remove(item);
  void removeAtIndexFromUpdateStepDeparments(int index) =>
      updateStepDeparments.removeAt(index);
  void insertAtIndexInUpdateStepDeparments(
          int index, DepartmentListStruct item) =>
      updateStepDeparments.insert(index, item);
  void updateUpdateStepDeparmentsAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      updateStepDeparments[index] = updateFn(updateStepDeparments[index]);

  List<StaffsStepStruct> stepUpdateStaffs = [];
  void addToStepUpdateStaffs(StaffsStepStruct item) =>
      stepUpdateStaffs.add(item);
  void removeFromStepUpdateStaffs(StaffsStepStruct item) =>
      stepUpdateStaffs.remove(item);
  void removeAtIndexFromStepUpdateStaffs(int index) =>
      stepUpdateStaffs.removeAt(index);
  void insertAtIndexInStepUpdateStaffs(int index, StaffsStepStruct item) =>
      stepUpdateStaffs.insert(index, item);
  void updateStepUpdateStaffsAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      stepUpdateStaffs[index] = updateFn(stepUpdateStaffs[index]);

  List<OperationsStruct> stepOperationsUpdate = [];
  void addToStepOperationsUpdate(OperationsStruct item) =>
      stepOperationsUpdate.add(item);
  void removeFromStepOperationsUpdate(OperationsStruct item) =>
      stepOperationsUpdate.remove(item);
  void removeAtIndexFromStepOperationsUpdate(int index) =>
      stepOperationsUpdate.removeAt(index);
  void insertAtIndexInStepOperationsUpdate(int index, OperationsStruct item) =>
      stepOperationsUpdate.insert(index, item);
  void updateStepOperationsUpdateAtIndex(
          int index, Function(OperationsStruct) updateFn) =>
      stepOperationsUpdate[index] = updateFn(stepOperationsUpdate[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadProcedurUpdate;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in Button widget.
  ApiCallResponse? apiResult4dr;
  // Stores action output result for [Backend Call - API (UpdateWorkflowsAll)] action in Button widget.
  ApiCallResponse? postProcedureUpdateAll;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
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
    StepsStruct? item,
  }) async {
    addToStepList(WorkflowsStepCreateStruct(
      name: item?.name,
      description: item?.description,
      staffs: item?.staffs,
      executeType: item?.executeType,
      actionType: item?.actionType,
      operations: item?.operations,
      status: 'published',
      staffsAlias: item?.staffsAlias,
      timeOperate: item?.timeOperate != null && item?.timeOperate != ''
          ? item?.timeOperate
          : '',
      estimateInSecond:
          item?.estimateInSecond != null ? item?.estimateInSecond : 0,
    ));
  }

  Future updateStep(
    BuildContext context, {
    StepsStruct? item,
    int? index,
    String? idItem,
  }) async {
    if ('${idItem}' != 'null') {
      updateStepListAtIndex(
        index!,
        (_) => WorkflowsStepCreateStruct(
          id: idItem,
          name: item?.name,
          description: item?.description,
          staffs: item?.staffs,
          executeType: item?.executeType,
          actionType: item?.actionType,
          operations: item?.operations,
          status: 'published',
          staffsAlias: item?.staffsAlias,
          timeOperate: item?.timeOperate != null && item?.timeOperate != ''
              ? item?.timeOperate
              : '',
          estimateInSecond:
              item?.estimateInSecond != null ? item?.estimateInSecond : 0,
          departments: item?.departments,
        ),
      );
    } else {
      updateStepListAtIndex(
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
          estimateInSecond: widget!.itemData?.estimateInSecond != null
              ? item?.estimateInSecond
              : 0,
          timeOperate: item?.timeOperate != null && item?.timeOperate != ''
              ? item?.timeOperate
              : '',
          departments: item?.departments,
        ),
      );
    }
  }

  Future addStaff(
    BuildContext context, {
    List<StaffListStruct>? item,
  }) async {
    updateDataUpdateStruct(
      (e) => e..staffs = [],
    );
    while (loop < item!.length) {
      updateDataUpdateStruct(
        (e) => e
          ..updateStaffs(
            (e) => e.add(StaffsStepStruct(
              staffsId: StaffIdStruct(
                id: (item?[loop])?.id,
                userId: UserIdStruct(
                  firstName: (item?[loop])?.userId?.firstName,
                ),
              ),
            )),
          ),
      );
      loop = loop + 1;
    }
    loop = 0;
  }
}
