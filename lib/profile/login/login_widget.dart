import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().idCheck = '';
      FFAppState().alertCheck = '';
      setState(() {});
      _model.checkEmailWf = await actions.checkLoginSharePreferences(
        'wf_email',
        'wf_token',
      );
      if (_model.checkEmailWf == true) {
        _model.biometricAccessToken = await actions.secureStorageGet(
          FFAppConstants.BiometricTokenKey,
        );
        if (_model.biometricAccessToken != null &&
            _model.biometricAccessToken != '') {
          FFAppState().accessToken = _model.biometricAccessToken!;
          FFAppState().refreshToken = '';
          FFAppState().expires = FFAppConstants.BiometricTokenExpires;
          FFAppState().dataTimeStartToken =
              (DateTime.now().microsecondsSinceEpoch / 1000).round() +
                  FFAppConstants.BiometricTokenExpires;
          FFAppState().update(() {});
          await _model.getUserMe(context);
          setState(() {});
          _model.apiResultGetStaffBiometric =
              await UserGroup.getStaffIdCall.call(
            accessToken: FFAppState().accessToken,
            userId: FFAppState().user.id,
          );

          if ((_model.apiResultGetStaffBiometric?.succeeded ?? true)) {
            FFAppState().staffid = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.staff.id''',
            ).toString().toString();
            FFAppState().staffLogin = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.staff''',
            );
            FFAppState().staffDepartment = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.department''',
            );
            FFAppState().staffBranch = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.branch''',
            );
            FFAppState().staffOrganization = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.organization''',
            );
            FFAppState().Author = getJsonField(
              (_model.apiResultGetStaffBiometric?.jsonBody ?? ''),
              r'''$.organization.authors[0]''',
            );
            setState(() {});

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

            await actions.checkNofiLoad(
              context,
            );
            return;
          } else {
            _model.isLoad = true;
            setState(() {});
            return;
          }
        } else {
          _model.checkWfToken = await actions.getReTokenUser(
            'wf_token',
          );
          _model.apiResultRefreshTokenLogin =
              await AuthenGroup.refreshTokenCall.call(
            refreshToken: _model.checkWfToken,
          );

          if ((_model.apiResultRefreshTokenLogin?.succeeded ?? true)) {
            FFAppState().accessToken = LoginResourceDataStruct.maybeFromMap(
                    (_model.apiResultRefreshTokenLogin?.jsonBody ?? ''))!
                .data
                .accessToken;
            FFAppState().refreshToken = LoginResourceDataStruct.maybeFromMap(
                    (_model.apiResultRefreshTokenLogin?.jsonBody ?? ''))!
                .data
                .refreshToken;
            FFAppState().expires = LoginResourceDataStruct.maybeFromMap(
                    (_model.apiResultRefreshTokenLogin?.jsonBody ?? ''))!
                .data
                .expires;
            FFAppState().dataTimeStartToken =
                (DateTime.now().microsecondsSinceEpoch / 1000).round() +
                    LoginResourceDataStruct.maybeFromMap(
                            (_model.apiResultRefreshTokenLogin?.jsonBody ??
                                ''))!
                        .data
                        .expires;
            FFAppState().update(() {});
            await actions.saveInfoUser(
              'wf_token',
              getJsonField(
                (_model.apiResultRefreshTokenLogin?.jsonBody ?? ''),
                r'''$.data.refresh_token''',
              ).toString().toString(),
            );
            await _model.getUserMe(context);
            setState(() {});
            _model.apiResultGetStaffIdReWfLogin =
                await UserGroup.getStaffIdCall.call(
              accessToken: FFAppState().accessToken,
              userId: FFAppState().user.id,
            );

            if ((_model.apiResultGetStaffIdReWfLogin?.succeeded ?? true)) {
              FFAppState().staffid = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.staff.id''',
              ).toString().toString();
              FFAppState().staffLogin = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.staff''',
              );
              FFAppState().staffDepartment = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.department''',
              );
              FFAppState().staffBranch = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.branch''',
              );
              FFAppState().staffOrganization = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.organization''',
              );
              FFAppState().Author = getJsonField(
                (_model.apiResultGetStaffIdReWfLogin?.jsonBody ?? ''),
                r'''$.organization.authors[0]''',
              );
              setState(() {});

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

              await actions.checkNofiLoad(
                context,
              );
              return;
            } else {
              return;
            }
          } else {
            _model.isLoad = true;
            setState(() {});
            return;
          }
        }
      } else {
        _model.checkWfEmail = await actions.getReTokenUser(
          'wf_email',
        );
        if (_model.checkWfEmail != null && _model.checkWfEmail != '') {
          _model.showSTH = true;
          setState(() {});
        }
        _model.isLoad = true;
        setState(() {});
        return;
      }
    });

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.isLoad == true,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                      child: Text(
                        'ComOS',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 170.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).width >= 768.0
                                  ? 530.0
                                  : 630.0,
                              constraints: BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          'Đăng nhập',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 32.0, 24.0, 0.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Welcome Back,',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 24.0),
                                              child: Text(
                                                'Chúc ngày mới tốt lành! Chào mừng bạn quay trở lại với ComOS.',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .emailAddressTextController,
                                                        focusNode: _model
                                                            .emailAddressFocusNode,
                                                        autofocus: false,
                                                        autofillHints: [
                                                          AutofillHints.email
                                                        ],
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Email',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      24.0,
                                                                      0.0,
                                                                      24.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        validator: _model
                                                            .emailAddressTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordTextController,
                                                        focusNode: _model
                                                            .passwordFocusNode,
                                                        autofocus: false,
                                                        autofillHints: [
                                                          AutofillHints.password
                                                        ],
                                                        obscureText: !_model
                                                            .passwordVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Mật khẩu',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      24.0,
                                                                      0.0,
                                                                      24.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .passwordVisibility =
                                                                  !_model
                                                                      .passwordVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .passwordTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Text(
                                                          ' Đăng ký tài khoản tổ chức',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'SignUp',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            'Tại đây',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          await _model
                                                              .login(context);
                                                          setState(() {});
                                                        },
                                                        text: 'Đăng nhập',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 55.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if ((_model.showSTH ==
                                                          true) &&
                                                      (FFAppState()
                                                              .biometricLogin ==
                                                          true))
                                                    Expanded(
                                                      flex: 1,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .noColor,
                                                            borderRadius: 52.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 52.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            icon: Icon(
                                                              Icons.fingerprint,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              _model.loginauthencateUssingBV =
                                                                  await actions
                                                                      .authenticateUsingBiometrics();
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .loginauthencateUssingBV ==
                                                                  true) {
                                                                FFAppState()
                                                                    .idCheck = '';
                                                                FFAppState()
                                                                    .alertCheck = '';
                                                                setState(() {});
                                                                _model.checkWfEmailBV =
                                                                    await actions
                                                                        .getReTokenUser(
                                                                  'wf_email',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if (_model.checkWfEmailBV !=
                                                                        null &&
                                                                    _model.checkWfEmailBV !=
                                                                        '') {
                                                                  _model.signature =
                                                                      await actions
                                                                          .biometricCreateSignature();
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.apiResultLoginBiometric =
                                                                      await STHLoginAcountsGroup
                                                                          .loginBiometricVerificationCall
                                                                          .call(
                                                                    dataJson: _model
                                                                        .signature,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .apiResultLoginBiometric
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if (getJsonField(
                                                                          (_model.apiResultLoginBiometric?.jsonBody ??
                                                                              ''),
                                                                          r'''$.errors''',
                                                                        ) !=
                                                                        null) {
                                                                      await actions
                                                                          .showToast(
                                                                        context,
                                                                        'Đăng nhập bằng vân tay thất bại!',
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                      );
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    } else {
                                                                      await actions
                                                                          .saveInfoUser(
                                                                        'wf_token',
                                                                        getJsonField(
                                                                          (_model.apiResultLoginBiometric?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.refresh_token''',
                                                                        ).toString(),
                                                                      );
                                                                      await actions
                                                                          .secureStorageSet(
                                                                        FFAppConstants
                                                                            .BiometricTokenKey,
                                                                        LoginResourceDataStruct.maybeFromMap((_model.apiResultLoginBiometric?.jsonBody ??
                                                                                ''))!
                                                                            .data
                                                                            .accessToken,
                                                                      );
                                                                      _model
                                                                          .loginData = LoginResourceDataStruct.maybeFromMap((_model
                                                                              .apiResultLoginBiometric
                                                                              ?.jsonBody ??
                                                                          ''));
                                                                      setState(
                                                                          () {});
                                                                      FFAppState().accessToken = _model
                                                                          .loginData!
                                                                          .data
                                                                          .accessToken;
                                                                      FFAppState().refreshToken = _model
                                                                          .loginData!
                                                                          .data
                                                                          .refreshToken;
                                                                      FFAppState().expires = _model
                                                                          .loginData!
                                                                          .data
                                                                          .expires;
                                                                      FFAppState()
                                                                          .dataTimeStartToken = (DateTime.now().microsecondsSinceEpoch / 1000)
                                                                              .round() +
                                                                          _model
                                                                              .loginData!
                                                                              .data
                                                                              .expires;
                                                                      setState(
                                                                          () {});
                                                                      await _model
                                                                          .getUserMe(
                                                                              context);
                                                                      setState(
                                                                          () {});
                                                                      _model.apiResultGetStaffIdSTH = await UserGroup
                                                                          .getStaffIdCall
                                                                          .call(
                                                                        accessToken:
                                                                            FFAppState().accessToken,
                                                                        userId: FFAppState()
                                                                            .user
                                                                            .id,
                                                                      );

                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model
                                                                              .apiResultGetStaffIdSTH
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        FFAppState().staffid =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.staff.id''',
                                                                        ).toString();
                                                                        FFAppState().staffLogin =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.staff''',
                                                                        );
                                                                        FFAppState().staffDepartment =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.department''',
                                                                        );
                                                                        FFAppState().staffBranch =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.branch''',
                                                                        );
                                                                        FFAppState().staffOrganization =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.organization''',
                                                                        );
                                                                        FFAppState().Author =
                                                                            getJsonField(
                                                                          (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                              ''),
                                                                          r'''$.organization.authors[0]''',
                                                                        );
                                                                        setState(
                                                                            () {});

                                                                        context
                                                                            .goNamed(
                                                                          'Home',
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 0),
                                                                            ),
                                                                          },
                                                                        );

                                                                        await actions
                                                                            .notifiAddServer(
                                                                          getJsonField(
                                                                            (_model.apiResultGetStaffIdSTH?.jsonBody ??
                                                                                ''),
                                                                            r'''$.staff.id''',
                                                                          ).toString(),
                                                                        );
                                                                      } else {
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    await actions
                                                                        .showToast(
                                                                      context,
                                                                      'Đăng nhập bằng vân tay thất bại!',
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                    );
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Thông báo'),
                                                                      content: Text(
                                                                          'Bạn vui lòng đăng nhập vào ứng dụng và kích hoạt tính năng đăng nhập bằng Sinh trắc học để thực hiện thao tác này.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
