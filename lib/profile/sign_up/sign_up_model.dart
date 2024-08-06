import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  LoginResourceDataStruct? loginData;
  void updateLoginDataStruct(Function(LoginResourceDataStruct) updateFn) {
    updateFn(loginData ??= LoginResourceDataStruct());
  }

  bool checkPassword = false;

  bool checkDob = false;

  bool checkEmail = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập email';
    }

    if (val.length > 50) {
      return 'Email quá dài';
    }
    if (!RegExp(
            '^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&\'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\\.[a-zA-Z]+')
        .hasMatch(val)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }

    if (val.length < 6) {
      return 'Mật khẩu ít nhất 6 ký tự';
    }

    return null;
  }

  // State field(s) for rePassword widget.
  FocusNode? rePasswordFocusNode;
  TextEditingController? rePasswordTextController;
  late bool rePasswordVisibility;
  String? Function(BuildContext, String?)? rePasswordTextControllerValidator;
  // State field(s) for organization widget.
  FocusNode? organizationFocusNode;
  TextEditingController? organizationTextController;
  String? Function(BuildContext, String?)? organizationTextControllerValidator;
  String? _organizationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên tổ chức';
    }

    if (val.length > 50) {
      return 'Tên quá dài!';
    }

    return null;
  }

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập họ tên';
    }

    if (val.length < 1) {
      return 'Tên không hợp lệ';
    }
    if (val.length > 50) {
      return 'Tên quá dài';
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (CreateOrganizationUser)] action in Button widget.
  ApiCallResponse? apiResultCreateUser;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    rePasswordVisibility = false;
    organizationTextControllerValidator = _organizationTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    rePasswordFocusNode?.dispose();
    rePasswordTextController?.dispose();

    organizationFocusNode?.dispose();
    organizationTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
