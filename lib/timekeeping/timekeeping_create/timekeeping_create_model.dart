import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'timekeeping_create_widget.dart' show TimekeepingCreateWidget;
import 'package:flutter/material.dart';

class TimekeepingCreateModel extends FlutterFlowModel<TimekeepingCreateWidget> {
  ///  Local state fields for this page.

  List<DepartmentsIdStruct> departmentSelectList = [];
  void addToDepartmentSelectList(DepartmentsIdStruct item) =>
      departmentSelectList.add(item);
  void removeFromDepartmentSelectList(DepartmentsIdStruct item) =>
      departmentSelectList.remove(item);
  void removeAtIndexFromDepartmentSelectList(int index) =>
      departmentSelectList.removeAt(index);
  void insertAtIndexInDepartmentSelectList(
          int index, DepartmentsIdStruct item) =>
      departmentSelectList.insert(index, item);
  void updateDepartmentSelectListAtIndex(
          int index, Function(DepartmentsIdStruct) updateFn) =>
      departmentSelectList[index] = updateFn(departmentSelectList[index]);

  List<StaffsStepStruct> staffSelectList = [];
  void addToStaffSelectList(StaffsStepStruct item) => staffSelectList.add(item);
  void removeFromStaffSelectList(StaffsStepStruct item) =>
      staffSelectList.remove(item);
  void removeAtIndexFromStaffSelectList(int index) =>
      staffSelectList.removeAt(index);
  void insertAtIndexInStaffSelectList(int index, StaffsStepStruct item) =>
      staffSelectList.insert(index, item);
  void updateStaffSelectListAtIndex(
          int index, Function(StaffsStepStruct) updateFn) =>
      staffSelectList[index] = updateFn(staffSelectList[index]);

  int loop = 0;

  ShiftConfigsRequestStruct? request;
  void updateRequestStruct(Function(ShiftConfigsRequestStruct) updateFn) {
    updateFn(request ??= ShiftConfigsRequestStruct());
  }

  List<CheckUpdateStepStruct> checkStaffs = [];
  void addToCheckStaffs(CheckUpdateStepStruct item) => checkStaffs.add(item);
  void removeFromCheckStaffs(CheckUpdateStepStruct item) =>
      checkStaffs.remove(item);
  void removeAtIndexFromCheckStaffs(int index) => checkStaffs.removeAt(index);
  void insertAtIndexInCheckStaffs(int index, CheckUpdateStepStruct item) =>
      checkStaffs.insert(index, item);
  void updateCheckStaffsAtIndex(
          int index, Function(CheckUpdateStepStruct) updateFn) =>
      checkStaffs[index] = updateFn(checkStaffs[index]);

  List<StaffListStruct> staffsDepartment = [];
  void addToStaffsDepartment(StaffListStruct item) =>
      staffsDepartment.add(item);
  void removeFromStaffsDepartment(StaffListStruct item) =>
      staffsDepartment.remove(item);
  void removeAtIndexFromStaffsDepartment(int index) =>
      staffsDepartment.removeAt(index);
  void insertAtIndexInStaffsDepartment(int index, StaffListStruct item) =>
      staffsDepartment.insert(index, item);
  void updateStaffsDepartmentAtIndex(
          int index, Function(StaffListStruct) updateFn) =>
      staffsDepartment[index] = updateFn(staffsDepartment[index]);

  int? loop2 = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên cấu hình';
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue4;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue5;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue6;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue7;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Action blocks.
  Future addStaffs(
    BuildContext context, {
    List<StaffListStruct>? item,
  }) async {
    staffSelectList = [];
    while (loop < item!.length) {
      addToStaffSelectList(StaffsStepStruct(
        staffsId: StaffIdStruct(
          id: (item[loop]).id,
          userId: UserIdStruct(
            firstName: (item[loop]).userId.firstName,
          ),
        ),
      ));
      loop = loop + 1;
    }
    loop = 0;
  }

  Future shiftConfigsCreate(BuildContext context) async {
    bool? shiftConfigsCreate;
    ApiCallResponse? apiResultShiftConfigs;

    shiftConfigsCreate = await action_blocks.tokenReload(context);
    if (shiftConfigsCreate!) {
      apiResultShiftConfigs =
          await TimekeepingShiftGroup.shiftConfigsCreateCall.call(
        accessToken: FFAppState().accessToken,
        requestJson: request?.toMap(),
      );

      if ((apiResultShiftConfigs.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Tạo cấu hình chấm công thành công',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tạo cấu hình chấm công',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
