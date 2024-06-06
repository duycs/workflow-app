import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'edit_password_widget.dart' show EditPasswordWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPasswordModel extends FlutterFlowModel<EditPasswordWidget> {
  ///  Local state fields for this page.

  bool checkPass = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Yêu cầu nhập mật khẩu hiện tại';
    }

    return null;
  }

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Yêu cầu nhập mật khẩu mới';
    }

    return null;
  }

  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;
  String? _confirmPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Yêu cầu xác nhận mật khẩu mới';
    }

    return null;
  }

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenUpdatePassword;
  // Stores action output result for [Backend Call - API (UpdatePassword)] action in Button widget.
  ApiCallResponse? apiResultUpdate;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    confirmPassVisibility = false;
    confirmPassTextControllerValidator = _confirmPassTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();
  }
}
