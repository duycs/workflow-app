import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'staff_update_widget.dart' show StaffUpdateWidget;
import 'package:flutter/material.dart';

class StaffUpdateModel extends FlutterFlowModel<StaffUpdateWidget> {
  ///  Local state fields for this page.

  List<DepartmentListStruct> listDepartment = [];
  void addToListDepartment(DepartmentListStruct item) =>
      listDepartment.add(item);
  void removeFromListDepartment(DepartmentListStruct item) =>
      listDepartment.remove(item);
  void removeAtIndexFromListDepartment(int index) =>
      listDepartment.removeAt(index);
  void insertAtIndexInListDepartment(int index, DepartmentListStruct item) =>
      listDepartment.insert(index, item);
  void updateListDepartmentAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      listDepartment[index] = updateFn(listDepartment[index]);

  String dob = '';

  DepartmentListStruct? selectDepartment;
  void updateSelectDepartmentStruct(Function(DepartmentListStruct) updateFn) =>
      updateFn(selectDepartment ??= DepartmentListStruct());

  String avatarid = '';

  List<BranchListStruct> branchList = [];
  void addToBranchList(BranchListStruct item) => branchList.add(item);
  void removeFromBranchList(BranchListStruct item) => branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, BranchListStruct item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  bool selectRole = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in StaffUpdate widget.
  bool? listDeparmentToken;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in StaffUpdate widget.
  ApiCallResponse? apiResultListDeparment;
  // Stores action output result for [Action Block - tokenReload] action in StaffUpdate widget.
  bool? getListBranchToken;
  // Stores action output result for [Backend Call - API (BranchList)] action in StaffUpdate widget.
  ApiCallResponse? apiResultGetListBranch;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên';
    }

    if (val.length < 2) {
      return 'Tên không hợp lệ';
    }
    if (val.length > 50) {
      return 'Tên không hợp lệ!';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập email';
    }

    if (!RegExp(
            '^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&\'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\\.[a-zA-Z]+')
        .hasMatch(val)) {
      return 'Email không hợp lệ!';
    }
    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }

    if (val.length < 10) {
      return 'Số điện thoại không hợp lệ';
    }
    if (val.length > 10) {
      return 'Số điện thoại không hợp lệ';
    }
    if (!RegExp('(03|05|07|08|09)+([0-9]{8})\\b').hasMatch(val)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  // State field(s) for cccd widget.
  FocusNode? cccdFocusNode;
  TextEditingController? cccdTextController;
  String? Function(BuildContext, String?)? cccdTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for title widget.
  String? titleValue;
  FormFieldController<String>? titleValueController;
  // State field(s) for titleText widget.
  FocusNode? titleTextFocusNode;
  TextEditingController? titleTextTextController;
  String? Function(BuildContext, String?)? titleTextTextControllerValidator;
  // State field(s) for branch widget.
  String? branchValue;
  FormFieldController<String>? branchValueController;
  // Stores action output result for [Action Block - tokenReload] action in branch widget.
  bool? listDeparment2Token;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in branch widget.
  ApiCallResponse? apiResultListDeparment2;
  // State field(s) for department widget.
  String? departmentValue;
  FormFieldController<String>? departmentValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? uploadImageToken;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadImage;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateStaffToken;
  // Stores action output result for [Backend Call - API (UpdateStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateStaff;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateUserStaff2Token;
  // Stores action output result for [Backend Call - API (UpdateUserStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateUserStaff2;
  // Stores action output result for [Backend Call - API (CreateProgramStaff)] action in Button widget.
  ApiCallResponse? apiCreateProgramStaff;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateNoImageToken;
  // Stores action output result for [Backend Call - API (UpdateStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateNoImage;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? updateUserStaffToken;
  // Stores action output result for [Backend Call - API (UpdateUserStaff)] action in Button widget.
  ApiCallResponse? apiResultUpdateUserStaff;
  // Stores action output result for [Backend Call - API (CreateProgramStaff)] action in Button widget.
  ApiCallResponse? apiCreateProgramStaff1;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    cccdFocusNode?.dispose();
    cccdTextController?.dispose();

    titleTextFocusNode?.dispose();
    titleTextTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
