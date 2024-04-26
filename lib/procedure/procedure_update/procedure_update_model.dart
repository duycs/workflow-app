import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import 'procedure_update_widget.dart' show ProcedureUpdateWidget;
import 'package:flutter/material.dart';

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
  void updateDataUpdateStruct(
          Function(RequestWorkflowsCreateStruct) updateFn) =>
      updateFn(dataUpdate ??= RequestWorkflowsCreateStruct());

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
          Function(RequestWorkflowsCreateStruct) updateFn) =>
      updateFn(requestUpdate ??= RequestWorkflowsCreateStruct());

  int loop3 = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadProcedurUpdate;
  // Stores action output result for [Backend Call - API (workflowUpdate)] action in Button widget.
  ApiCallResponse? apiResultUpdate;
  // Stores action output result for [Backend Call - API (DeleteWorkflowsStep)] action in Button widget.
  ApiCallResponse? apiResultDeleteStep;
  // Stores action output result for [Backend Call - API (stepCreateWorkflows)] action in Button widget.
  ApiCallResponse? apiResultj7m;
  // Stores action output result for [Backend Call - API (stepUpdate)] action in Button widget.
  ApiCallResponse? apiResult2eo;
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
          item?.estimateInSecond ?? 0,
    ));
  }

  Future updateStep(
    BuildContext context, {
    StepsStruct? item,
    int? index,
    String? idItem,
  }) async {
    if ('$idItem' != 'null') {
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
              item?.estimateInSecond ?? 0,
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
          estimateInSecond: widget.itemData?.estimateInSecond != null
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
                id: (item[loop]).id,
                userId: UserIdStruct(
                  firstName: (item[loop]).userId.firstName,
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
