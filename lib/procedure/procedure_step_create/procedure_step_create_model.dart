import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/alert_staff_check_departments/alert_staff_check_departments_widget.dart';
import '/procedure/dropdown_departments_list/dropdown_departments_list_widget.dart';
import '/procedure/dropdown_user_list/dropdown_user_list_widget.dart';
import '/procedure/operations_list_popup/operations_list_popup_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_step_create_widget.dart' show ProcedureStepCreateWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureStepCreateModel
    extends FlutterFlowModel<ProcedureStepCreateWidget> {
  ///  Local state fields for this component.

  StepsStruct? stepsEdit;
  void updateStepsEditStruct(Function(StepsStruct) updateFn) {
    updateFn(stepsEdit ??= StepsStruct());
  }

  List<DepartmentsIdStruct> stafStepDepartments = [];
  void addToStafStepDepartments(DepartmentsIdStruct item) =>
      stafStepDepartments.add(item);
  void removeFromStafStepDepartments(DepartmentsIdStruct item) =>
      stafStepDepartments.remove(item);
  void removeAtIndexFromStafStepDepartments(int index) =>
      stafStepDepartments.removeAt(index);
  void insertAtIndexInStafStepDepartments(
          int index, DepartmentsIdStruct item) =>
      stafStepDepartments.insert(index, item);
  void updateStafStepDepartmentsAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      stafStepDepartments[index] = updateFn(stafStepDepartments[index]);

  List<StaffsStepStruct> staffsStepNv = [];
  void addToStaffsStepNv(StaffsStepStruct item) => staffsStepNv.add(item);
  void removeFromStaffsStepNv(StaffsStepStruct item) =>
      staffsStepNv.remove(item);
  void removeAtIndexFromStaffsStepNv(int index) => staffsStepNv.removeAt(index);
  void insertAtIndexInStaffsStepNv(int index, StaffsStepStruct item) =>
      staffsStepNv.insert(index, item);
  void updateStaffsStepNvAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      staffsStepNv[index] = updateFn(staffsStepNv[index]);

  int? loop = 0;

  int loop2 = 0;

  List<CheckUpdateStepStruct> checkStaff = [];
  void addToCheckStaff(CheckUpdateStepStruct item) => checkStaff.add(item);
  void removeFromCheckStaff(CheckUpdateStepStruct item) =>
      checkStaff.remove(item);
  void removeAtIndexFromCheckStaff(int index) => checkStaff.removeAt(index);
  void insertAtIndexInCheckStaff(int index, CheckUpdateStepStruct item) =>
      checkStaff.insert(index, item);
  void updateCheckStaffAtIndex(
          int index, Function(CheckUpdateStepStruct) updateFn) =>
      checkStaff[index] = updateFn(checkStaff[index]);

  StaffsAliasStruct? staffAlias;
  void updateStaffAliasStruct(Function(StaffsAliasStruct) updateFn) {
    updateFn(staffAlias ??= StaffsAliasStruct());
  }

  List<DepartmentsStruct> departmentList = [];
  void addToDepartmentList(DepartmentsStruct item) => departmentList.add(item);
  void removeFromDepartmentList(DepartmentsStruct item) =>
      departmentList.remove(item);
  void removeAtIndexFromDepartmentList(int index) =>
      departmentList.removeAt(index);
  void insertAtIndexInDepartmentList(int index, DepartmentsStruct item) =>
      departmentList.insert(index, item);
  void updateDepartmentListAtIndex(
          int index, Function(DepartmentsStruct) updateFn) =>
      departmentList[index] = updateFn(departmentList[index]);

  List<StaffsStepStruct> staffsList = [];
  void addToStaffsList(StaffsStepStruct item) => staffsList.add(item);
  void removeFromStaffsList(StaffsStepStruct item) => staffsList.remove(item);
  void removeAtIndexFromStaffsList(int index) => staffsList.removeAt(index);
  void insertAtIndexInStaffsList(int index, StaffsStepStruct item) =>
      staffsList.insert(index, item);
  void updateStaffsListAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      staffsList[index] = updateFn(staffsList[index]);

  List<StaffsStepStruct> checkStaffList = [];
  void addToCheckStaffList(StaffsStepStruct item) => checkStaffList.add(item);
  void removeFromCheckStaffList(StaffsStepStruct item) =>
      checkStaffList.remove(item);
  void removeAtIndexFromCheckStaffList(int index) =>
      checkStaffList.removeAt(index);
  void insertAtIndexInCheckStaffList(int index, StaffsStepStruct item) =>
      checkStaffList.insert(index, item);
  void updateCheckStaffListAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      checkStaffList[index] = updateFn(checkStaffList[index]);

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

  List<StaffIdStruct> staffListId = [];
  void addToStaffListId(StaffIdStruct item) => staffListId.add(item);
  void removeFromStaffListId(StaffIdStruct item) => staffListId.remove(item);
  void removeAtIndexFromStaffListId(int index) => staffListId.removeAt(index);
  void insertAtIndexInStaffListId(int index, StaffIdStruct item) =>
      staffListId.insert(index, item);
  void updateStaffListIdAtIndex(int index, Function(StaffIdStruct) updateFn) =>
      staffListId[index] = updateFn(staffListId[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  String? _textNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên bước!';
    }

    return null;
  }

  // State field(s) for TextDscription widget.
  FocusNode? textDscriptionFocusNode;
  TextEditingController? textDscriptionTextController;
  String? Function(BuildContext, String?)?
      textDscriptionTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for estimateDay widget.
  FocusNode? estimateDayFocusNode;
  TextEditingController? estimateDayTextController;
  String? Function(BuildContext, String?)? estimateDayTextControllerValidator;
  // State field(s) for estimateHour widget.
  FocusNode? estimateHourFocusNode;
  TextEditingController? estimateHourTextController;
  String? Function(BuildContext, String?)? estimateHourTextControllerValidator;
  // State field(s) for estimateMinute widget.
  FocusNode? estimateMinuteFocusNode;
  TextEditingController? estimateMinuteTextController;
  String? Function(BuildContext, String?)?
      estimateMinuteTextControllerValidator;
  // State field(s) for actionType widget.
  String? actionTypeValue;
  FormFieldController<String>? actionTypeValueController;
  // State field(s) for OperationsText widget.
  FocusNode? operationsTextFocusNode;
  TextEditingController? operationsTextTextController;
  String? Function(BuildContext, String?)?
      operationsTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textNameTextControllerValidator = _textNameTextControllerValidator;
  }

  @override
  void dispose() {
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    textDscriptionFocusNode?.dispose();
    textDscriptionTextController?.dispose();

    estimateDayFocusNode?.dispose();
    estimateDayTextController?.dispose();

    estimateHourFocusNode?.dispose();
    estimateHourTextController?.dispose();

    estimateMinuteFocusNode?.dispose();
    estimateMinuteTextController?.dispose();

    operationsTextFocusNode?.dispose();
    operationsTextTextController?.dispose();
  }

  /// Action blocks.
  Future addStaff(
    BuildContext context, {
    List<StaffListStruct>? item,
  }) async {
    staffsStepNv = [];
    while (loop! < item!.length) {
      addToStaffsStepNv(StaffsStepStruct(
        staffsId: StaffIdStruct(
          id: (item?[loop!])?.id,
          userId: UserIdStruct(
            firstName: (item?[loop!])?.userId?.firstName,
          ),
        ),
      ));
      loop = loop! + 1;
    }
    loop = 0;
  }

  Future addOperations(
    BuildContext context, {
    required OperationsStruct? item,
  }) async {
    if (stepsEdit!.operations
        .map((e) => e.id)
        .toList()
        .toList()
        .contains(item!.id)) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            content: Text('Hành động đã có !'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } else {
      updateStepsEditStruct(
        (e) => e
          ..updateOperations(
            (e) => e.add(OperationsStruct(
              id: item?.id,
              content: item?.name,
              actionType: item?.actionType,
            )),
          )
          ..actionType = item?.actionType,
      );
    }
  }
}
