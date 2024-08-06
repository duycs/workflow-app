import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'staff_update_widget.dart' show StaffUpdateWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
  void updateSelectDepartmentStruct(Function(DepartmentListStruct) updateFn) {
    updateFn(selectDepartment ??= DepartmentListStruct());
  }

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

  bool checkDepartment = false;

  dynamic requestStaff;

  dynamic requestUserStaff;

  bool checkDob = false;

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
  bool? uploadImageToken2;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadImage21;
  // Stores action output result for [Backend Call - API (UploadFile)] action in Button widget.
  ApiCallResponse? apiResultUploadImage2;

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

  /// Action blocks.
  Future callRequest(BuildContext context) async {
    bool? updateStaffTokenTotal;
    ApiCallResponse? apiResultUpdateStaffTotal;
    bool? updateUserStaffTotal;
    ApiCallResponse? apiResultUpdateUserStaffTotal;
    ApiCallResponse? apiCreateProgramStaffTotal;

    updateStaffTokenTotal = await action_blocks.tokenReload(context);
    if (updateStaffTokenTotal!) {
      apiResultUpdateStaffTotal = await StaffGroup.updateStaffCall.call(
        accessToken: FFAppState().accessToken,
        id: getJsonField(
          widget!.staffDetail,
          r'''$.user_id.id''',
        ).toString().toString(),
        requestDataJson: requestStaff,
      );

      if ((apiResultUpdateStaffTotal?.succeeded ?? true)) {
        updateUserStaffTotal = await action_blocks.tokenReload(context);
        if (updateUserStaffTotal!) {
          apiResultUpdateUserStaffTotal =
              await StaffGroup.updateUserStaffCall.call(
            accessToken: FFAppState().accessToken,
            staffId: getJsonField(
              widget!.staffDetail,
              r'''$.id''',
            ).toString().toString(),
            requestDataJson: requestUserStaff,
          );

          if ((apiResultUpdateUserStaffTotal?.succeeded ?? true)) {
            apiCreateProgramStaffTotal =
                await StaffGroup.createProgramStaffCall.call(
              accessToken: FFAppState().accessToken,
              staffId: getJsonField(
                widget!.staffDetail,
                r'''$.id''',
              ).toString().toString(),
            );

            if ((apiCreateProgramStaffTotal?.succeeded ?? true)) {
              await actions.showToast(
                context,
                'Cập nhật thành công',
                FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).secondary,
              );
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
              context.pushNamed(
                'PersonnelList',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          }
        } else {
          FFAppState().update(() {});
        }
      }
    } else {
      FFAppState().update(() {});
    }
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
