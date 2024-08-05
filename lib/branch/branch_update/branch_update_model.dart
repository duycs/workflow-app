import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'branch_update_widget.dart' show BranchUpdateWidget;
import 'package:flutter/material.dart';

class BranchUpdateModel extends FlutterFlowModel<BranchUpdateWidget> {
  ///  Local state fields for this component.

  String checkCode = '';

  bool checkName = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BranchName widget.
  FocusNode? branchNameFocusNode;
  TextEditingController? branchNameTextController;
  String? Function(BuildContext, String?)? branchNameTextControllerValidator;
  String? _branchNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên chi nhánh';
    }

    return null;
  }

  // State field(s) for BranchCode widget.
  FocusNode? branchCodeFocusNode;
  TextEditingController? branchCodeTextController;
  String? Function(BuildContext, String?)? branchCodeTextControllerValidator;
  String? _branchCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mã chi nhánh';
    }

    if (val.length > 50) {
      return 'Mã chi nhánh không được vượt quá 50 kí tự';
    }

    return null;
  }

  // State field(s) for descriptionBranch widget.
  FocusNode? descriptionBranchFocusNode;
  TextEditingController? descriptionBranchTextController;
  String? Function(BuildContext, String?)?
      descriptionBranchTextControllerValidator;
  String? _descriptionBranchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập nội dung';
    }

    if (val.length > 200) {
      return 'Mô tả không được vượt quá 200 kí tự';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? refreshTokenBranchUpdate;
  // Stores action output result for [Backend Call - API (BranchUpdate)] action in Button widget.
  ApiCallResponse? apiResultCreateBranch;

  @override
  void initState(BuildContext context) {
    branchNameTextControllerValidator = _branchNameTextControllerValidator;
    branchCodeTextControllerValidator = _branchCodeTextControllerValidator;
    descriptionBranchTextControllerValidator =
        _descriptionBranchTextControllerValidator;
  }

  @override
  void dispose() {
    branchNameFocusNode?.dispose();
    branchNameTextController?.dispose();

    branchCodeFocusNode?.dispose();
    branchCodeTextController?.dispose();

    descriptionBranchFocusNode?.dispose();
    descriptionBranchTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
