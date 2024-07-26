import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'confirm_password_widget.dart' show ConfirmPasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordModel extends FlutterFlowModel<ConfirmPasswordWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }

    return null;
  }

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? checkReloadTokenLogin;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? apiResultLoginSetting;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
