import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'procedure_step_create_widget.dart' show ProcedureStepCreateWidget;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProcedureStepCreateModel
    extends FlutterFlowModel<ProcedureStepCreateWidget> {
  ///  Local state fields for this component.

  StepsStruct? stepsEdit;
  void updateStepsEditStruct(Function(StepsStruct) updateFn) =>
      updateFn(stepsEdit ??= StepsStruct());

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
  void updateStaffAliasStruct(Function(StaffsAliasStruct) updateFn) =>
      updateFn(staffAlias ??= StaffsAliasStruct());

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
          id: (item[loop!]).id,
          userId: UserIdStruct(
            firstName: (item[loop!]).userId.firstName,
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
          return WebViewAware(
            child: AlertDialog(
              content: const Text('Hành động đã có !'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      updateStepsEditStruct(
        (e) => e
          ..updateOperations(
            (e) => e.add(OperationsStruct(
              id: item.id,
              content: item.name,
              actionType: item.actionType,
            )),
          )
          ..actionType = item.actionType,
      );
    }
  }
}
