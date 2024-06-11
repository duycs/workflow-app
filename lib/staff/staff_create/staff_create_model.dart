import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'staff_create_widget.dart' show StaffCreateWidget;
import 'package:flutter/material.dart';

class StaffCreateModel extends FlutterFlowModel<StaffCreateWidget> {
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

  DepartmentListStruct? selectDepartment;
  void updateSelectDepartmentStruct(Function(DepartmentListStruct) updateFn) =>
      updateFn(selectDepartment ??= DepartmentListStruct());

  String dob = '';

  String avatarId = '';

  List<UserStruct> listEmail = [];
  void addToListEmail(UserStruct item) => listEmail.add(item);
  void removeFromListEmail(UserStruct item) => listEmail.remove(item);
  void removeAtIndexFromListEmail(int index) => listEmail.removeAt(index);
  void insertAtIndexInListEmail(int index, UserStruct item) =>
      listEmail.insert(index, item);
  void updateListEmailAtIndex(int index, Function(UserStruct) updateFn) =>
      listEmail[index] = updateFn(listEmail[index]);

  bool checkDob = false;

  bool checkDepartment = false;

  bool checkRole = false;

  String checkEmail = '';

  List<BranchListStruct> branchList = [];
  void addToBranchList(BranchListStruct item) => branchList.add(item);
  void removeFromBranchList(BranchListStruct item) => branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, BranchListStruct item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  BranchListStruct? selectBranch;
  void updateSelectBranchStruct(Function(BranchListStruct) updateFn) =>
      updateFn(selectBranch ??= BranchListStruct());

  bool checkBranch = false;

  bool selectRole = false;

  String avatar = '';

  bool checkRoleText = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in StaffCreate widget.
  bool? listDeparmentToken;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in StaffCreate widget.
  ApiCallResponse? apiResultListDeparment;
  // Stores action output result for [Action Block - tokenReload] action in StaffCreate widget.
  bool? getListBranchToken;
  // Stores action output result for [Backend Call - API (BranchList)] action in StaffCreate widget.
  ApiCallResponse? apiResultGetListBranch;
  // Stores action output result for [Action Block - tokenReload] action in StaffCreate widget.
  bool? getListUserToken;
  // Stores action output result for [Backend Call - API (GetListUser)] action in StaffCreate widget.
  ApiCallResponse? apiResultgetListUser;
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
      return 'Tên qua dài';
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
  String? _titleTextTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng chọn hoặc nhập chức vụ';
    }

    return null;
  }

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
  ApiCallResponse? apiResultuploadImage;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? createBToken;
  // Stores action output result for [Backend Call - API (CreateStaff)] action in Button widget.
  ApiCallResponse? apiResultCreateB;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? createOToken;
  // Stores action output result for [Backend Call - API (CreateStaff)] action in Button widget.
  ApiCallResponse? apiResultCreateO;
  // Stores action output result for [Backend Call - API (CreateStaff)] action in Button widget.
  ApiCallResponse? apiResultCreateAdminBranch;
  // Stores action output result for [Backend Call - API (CreateStaff)] action in Button widget.
  ApiCallResponse? apiResultCreate;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    titleTextTextControllerValidator = _titleTextTextControllerValidator;
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
