import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  LoginResourceDataStruct? loginData;
  void updateLoginDataStruct(Function(LoginResourceDataStruct) updateFn) {
    updateFn(loginData ??= LoginResourceDataStruct());
  }

  bool isLoad = false;

  bool showSTH = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkLoginSharePreferences] action in Login widget.
  bool? checkEmailWf;
  // Stores action output result for [Custom Action - secureStorageGet] action in Login widget.
  String? biometricAccessToken;
  // Stores action output result for [Backend Call - API (GetStaffId)] action in Login widget.
  ApiCallResponse? apiResultGetStaffBiometric;
  // Stores action output result for [Custom Action - getReTokenUser] action in Login widget.
  String? checkWfToken;
  // Stores action output result for [Backend Call - API (RefreshToken)] action in Login widget.
  ApiCallResponse? apiResultRefreshTokenLogin;
  // Stores action output result for [Backend Call - API (GetStaffId)] action in Login widget.
  ApiCallResponse? apiResultGetStaffIdReWfLogin;
  // Stores action output result for [Custom Action - getReTokenUser] action in Login widget.
  String? checkWfEmail;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập email';
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

    return null;
  }

  // Stores action output result for [Custom Action - authenticateUsingBiometrics] action in IconButton widget.
  bool? loginauthencateUssingBV;
  // Stores action output result for [Custom Action - getReTokenUser] action in IconButton widget.
  String? checkWfEmailBV;
  // Stores action output result for [Custom Action - biometricCreateSignature] action in IconButton widget.
  dynamic? signature;
  // Stores action output result for [Backend Call - API (LoginBiometricVerification)] action in IconButton widget.
  ApiCallResponse? apiResultLoginBiometric;
  // Stores action output result for [Backend Call - API (GetStaffId)] action in IconButton widget.
  ApiCallResponse? apiResultGetStaffIdSTH;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks.
  Future getUserMe(BuildContext context) async {
    ApiCallResponse? apiResultUserMe;

    apiResultUserMe = await UserGroup.userMeCall.call(
      accessToken: FFAppState().accessToken,
    );

    if ((apiResultUserMe?.succeeded ?? true)) {
      FFAppState().user = UserResourceDataStruct.maybeFromMap(
              (apiResultUserMe?.jsonBody ?? ''))!
          .data;
      if ((UserResourceDataStruct.maybeFromMap(
                      (apiResultUserMe?.jsonBody ?? ''))
                  ?.data
                  ?.enableBiometric ==
              null) &&
          (UserResourceDataStruct.maybeFromMap(
                      (apiResultUserMe?.jsonBody ?? ''))
                  ?.data
                  ?.enableBiometric ==
              1)) {
        await actions.saveInfoUser(
          'bv',
          DateTime.now().toString(),
        );
      }
      return;
    } else {
      return;
    }
  }

  Future login(BuildContext context) async {
    ApiCallResponse? apiResultLogin;
    ApiCallResponse? apiResultGetStaffId;

    if (emailAddressTextController.text == null ||
        emailAddressTextController.text == '') {
      await actions.showToast(
        context,
        'Vui lòng nhập email',
        FlutterFlowTheme.of(context).secondaryBackground,
        FlutterFlowTheme.of(context).error,
      );
      return;
    } else if (passwordTextController.text == null ||
        passwordTextController.text == '') {
      await actions.showToast(
        context,
        'Vui lòng nhập mật khẩu',
        FlutterFlowTheme.of(context).secondaryBackground,
        FlutterFlowTheme.of(context).error,
      );
      return;
    } else {
      apiResultLogin = await AuthenGroup.loginCall.call(
        email: emailAddressTextController.text,
        password: passwordTextController.text,
      );

      if ((apiResultLogin?.succeeded ?? true)) {
        if (getJsonField(
              (apiResultLogin?.jsonBody ?? ''),
              r'''$.errors''',
            ) !=
            null) {
          await actions.showToast(
            context,
            'Thông tin xác thực người dùng không hợp lệ',
            FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).error,
          );
          return;
        }
        await actions.saveInfoUser(
          'wf_email',
          emailAddressTextController.text,
        );
        await actions.saveInfoUser(
          'wf_token',
          getJsonField(
            (apiResultLogin?.jsonBody ?? ''),
            r'''$.data.refresh_token''',
          ).toString().toString(),
        );
        loginData = LoginResourceDataStruct.maybeFromMap(
            (apiResultLogin?.jsonBody ?? ''));
        FFAppState().accessToken = loginData!.data.accessToken;
        FFAppState().refreshToken = loginData!.data.refreshToken;
        FFAppState().expires = loginData!.data.expires;
        FFAppState().dataTimeStartToken =
            (DateTime.now().microsecondsSinceEpoch / 1000).round() +
                loginData!.data.expires;
        await getUserMe(context);
        apiResultGetStaffId = await UserGroup.getStaffIdCall.call(
          accessToken: FFAppState().accessToken,
          userId: FFAppState().user.id,
        );

        if ((apiResultGetStaffId?.succeeded ?? true)) {
          FFAppState().staffid = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.staff.id''',
          ).toString().toString();
          FFAppState().staffLogin = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.staff''',
          );
          FFAppState().staffDepartment = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.department''',
          );
          FFAppState().staffBranch = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.branch''',
          );
          FFAppState().staffOrganization = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.organization''',
          );
          FFAppState().Author = getJsonField(
            (apiResultGetStaffId?.jsonBody ?? ''),
            r'''$.organization.authors[0]''',
          );
          FFAppState().update(() {});

          context.goNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          await actions.notifiAddServer(
            getJsonField(
              (apiResultGetStaffId?.jsonBody ?? ''),
              r'''$.staff.id''',
            ).toString().toString(),
          );
        } else {
          return;
        }

        return;
      } else {
        await actions.showToast(
          context,
          'Email hoặc mật khẩu không chính xác. Vui lòng nhập lại!',
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
        return;
      }
    }
  }
}
