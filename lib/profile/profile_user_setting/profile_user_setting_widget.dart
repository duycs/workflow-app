import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/confirm_password/confirm_password_widget.dart';
import '/training/do_test/delete_account/delete_account_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_user_setting_model.dart';
export 'profile_user_setting_model.dart';

class ProfileUserSettingWidget extends StatefulWidget {
  const ProfileUserSettingWidget({super.key});

  @override
  State<ProfileUserSettingWidget> createState() =>
      _ProfileUserSettingWidgetState();
}

class _ProfileUserSettingWidgetState extends State<ProfileUserSettingWidget> {
  late ProfileUserSettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileUserSettingModel());

    _model.switchValue =
        FFAppState().user.enableBiometric.toString() == '1';
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Cài đặt chung',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Nunito Sans',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (FFAppState().biometricLogin)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Dấu vân tay',
                                                          textAlign:
                                                              TextAlign.start,
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
                                                      Icon(
                                                        Icons.fingerprint,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) =>
                                                  Switch.adaptive(
                                                value: _model.switchValue!,
                                                onChanged: (_model.load == true)
                                                    ? null
                                                    : (newValue) async {
                                                        setState(() =>
                                                            _model.switchValue =
                                                                newValue);
                                                        if (newValue) {
                                                          var shouldSetState =
                                                              false;
                                                          _model.authenticateUsingBiometricsSettingLoad =
                                                              await actions
                                                                  .authenticateUsingBiometricsSetting();
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                              .authenticateUsingBiometricsSettingLoad!) {
                                                            _model.load = true;
                                                            setState(() {});
                                                          } else {
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      ConfirmPasswordWidget(
                                                                    callBack:
                                                                        (check) async {},
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          _model.tokenReloadProfileUserSetting =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                              .tokenReloadProfileUserSetting!) {
                                                            _model.dataSetting =
                                                                null;
                                                            setState(() {});
                                                            _model.sshkeyPublicKeySettingOn =
                                                                await actions
                                                                    .sshkey(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .staffLogin,
                                                                r'''$.email''',
                                                              ).toString(),
                                                              '',
                                                              true,
                                                            );
                                                            shouldSetState =
                                                                true;
                                                            _model
                                                                .updateDataSettingStruct(
                                                              (e) => e
                                                                ..enableBiometric =
                                                                    1
                                                                ..publicKey = _model
                                                                    .sshkeyPublicKeySettingOn,
                                                            );
                                                            setState(() {});
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(_model
                                                                      .dataSetting!
                                                                      .publicKey),
                                                                  content: Text(
                                                                      _model
                                                                          .sshkeyPublicKeySettingOn!),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            setState(() {});
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

                                                          _model.apiResultz8c =
                                                              await SettingAcountGroup
                                                                  .updateBiometricVerificationWorkCall
                                                                  .call(
                                                            accessToken:
                                                                FFAppState()
                                                                    .accessToken,
                                                            dataJson: <String,
                                                                dynamic>{
                                                              'enable_biometric':
                                                                  _model
                                                                      .dataSetting
                                                                      ?.enableBiometric,
                                                              'public_key': _model
                                                                  .dataSetting
                                                                  ?.publicKey,
                                                            },
                                                          );

                                                          shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultz8c
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await actions
                                                                .saveInfoUser(
                                                              'bv',
                                                              DateTime.now()
                                                                  .toString(),
                                                            );
                                                            _model.getUserSetting =
                                                                await UserGroup
                                                                    .userMeCall
                                                                    .call(
                                                              accessToken:
                                                                  FFAppState()
                                                                      .accessToken,
                                                            );

                                                            shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .getUserSetting
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState()
                                                                  .user = UserResourceDataStruct
                                                                      .maybeFromMap((_model
                                                                              .getUserSetting
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .data;
                                                              setState(() {});
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Lỗi cài đặt!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                          }

                                                          _model.load = false;
                                                          setState(() {});
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        } else {
                                                          var shouldSetState =
                                                              false;
                                                          _model.authenticateUsingBiometricsSettingOff =
                                                              await actions
                                                                  .authenticateUsingBiometricsSetting();
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                                  .authenticateUsingBiometricsSettingOff ==
                                                              true) {
                                                            _model.load = true;
                                                            setState(() {});
                                                          } else {
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

                                                          _model.tokenReloadProfileUserSetting1 =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                              .tokenReloadProfileUserSetting1!) {
                                                            _model.dataSetting =
                                                                null;
                                                            setState(() {});
                                                            _model.sshkeyPublicKeySetting =
                                                                await actions
                                                                    .sshkey(
                                                              FFAppState().user.email,
                                                              '',
                                                              true,
                                                            );
                                                            shouldSetState =
                                                                true;
                                                            _model
                                                                .updateDataSettingStruct(
                                                              (e) => e
                                                                ..enableBiometric =
                                                                    0
                                                                ..publicKey =
                                                                    '',
                                                            );
                                                            setState(() {});
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(_model
                                                                      .dataSetting!
                                                                      .publicKey),
                                                                  content: Text(_model
                                                                      .dataSetting!
                                                                      .enableBiometric
                                                                      .toString()),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            setState(() {});
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

                                                          _model.apiResultz8cCopy =
                                                              await SettingAcountGroup
                                                                  .updateBiometricVerificationWorkCall
                                                                  .call(
                                                            dataJson: <String,
                                                                dynamic>{
                                                              'public_key': _model
                                                                  .dataSetting
                                                                  ?.publicKey,
                                                              'enable_biometric':
                                                                  _model
                                                                      .dataSetting
                                                                      ?.enableBiometric,
                                                            },
                                                            accessToken:
                                                                FFAppState()
                                                                    .accessToken,
                                                          );

                                                          shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultz8cCopy
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await actions
                                                                .clearInfoUser(
                                                              'bv',
                                                            );
                                                            _model.getUserSettingOff =
                                                                await UserGroup
                                                                    .userMeCall
                                                                    .call(
                                                              accessToken:
                                                                  FFAppState()
                                                                      .accessToken,
                                                            );

                                                            shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .getUserSettingOff
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState()
                                                                  .user = UserResourceDataStruct
                                                                      .maybeFromMap((_model
                                                                              .getUserSettingOff
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                  .data;
                                                              setState(() {});
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Lỗi cài đặt!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                          }

                                                          _model.load = false;
                                                          setState(() {});
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        }
                                                      },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().biometricLogin)
                              Builder(
                                builder: (context) => SwitchListTile.adaptive(
                                  value: _model.switchListTileValue ??=
                                      FFAppState().user.enableBiometric.toString() ==
                                          '1',
                                  onChanged: (_model.load == true)
                                      ? null
                                      : (newValue) async {
                                          setState(() => _model
                                              .switchListTileValue = newValue);
                                          if (newValue) {
                                            var shouldSetState = false;
                                            _model.authenticateUsingBiometriceSetting1 =
                                                await actions
                                                    .authenticateUsingBiometricsSetting();
                                            shouldSetState = true;
                                            if (_model
                                                    .authenticateUsingBiometriceSetting1 ==
                                                true) {
                                              _model.load = true;
                                              setState(() {});
                                            } else {
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }

                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child:
                                                        ConfirmPasswordWidget(
                                                      callBack: (check) async {
                                                        _model.checkLogin =
                                                            true;
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            if (_model.checkLogin == true) {
                                              _model.checktokenReloadBiometricsSetting =
                                                  await action_blocks
                                                      .tokenReload(context);
                                              shouldSetState = true;
                                              if (_model
                                                  .checktokenReloadBiometricsSetting!) {
                                                _model.dataSetting = null;
                                                setState(() {});
                                              } else {
                                                setState(() {});
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }

                                              _model.publicKey = await actions
                                                  .biometricCreatePublicKey();
                                              shouldSetState = true;
                                              _model.updateDataSettingStruct(
                                                (e) => e
                                                  ..enableBiometric = 1
                                                  ..publicKey =
                                                      _model.publicKey,
                                              );
                                              setState(() {});
                                              _model.apiResultUpdateBiometric =
                                                  await SettingAcountGroup
                                                      .updateBiometricVerificationWorkCall
                                                      .call(
                                                dataJson: <String, dynamic>{
                                                  'enable_biometric': _model
                                                      .dataSetting
                                                      ?.enableBiometric,
                                                  'public_key': _model
                                                      .dataSetting?.publicKey,
                                                },
                                                accessToken:
                                                    FFAppState().accessToken,
                                              );

                                              shouldSetState = true;
                                              if ((_model
                                                      .apiResultUpdateBiometric
                                                      ?.succeeded ??
                                                  true)) {
                                                await actions.saveInfoUser(
                                                  'bv',
                                                  DateTime.now().toString(),
                                                );
                                                _model.apiResultUpdateUser =
                                                    await UserGroup.userMeCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                );

                                                shouldSetState = true;
                                                if ((_model.apiResultUpdateUser
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState()
                                                      .user = UserResourceDataStruct
                                                          .maybeFromMap((_model
                                                                  .apiResultUpdateUser
                                                                  ?.jsonBody ??
                                                              ''))!
                                                      .data;
                                                  setState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title:
                                                            const Text('Thông báo'),
                                                        content: const Text(
                                                            'Bạn đã kích hoạt đăng nhập bằng sinh trắc học thành công!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Cài đặt không thành công',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }

                                              _model.load = false;
                                              setState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Mật khẩu không đúng',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                          } else {
                                            var shouldSetState = false;
                                            _model.authenticateUsingBiometriceSettingLoadOff1 =
                                                await actions
                                                    .authenticateUsingBiometricsSetting();
                                            shouldSetState = true;
                                            if (_model
                                                    .authenticateUsingBiometriceSettingLoadOff1 ==
                                                true) {
                                              _model.load = true;
                                              setState(() {});
                                            } else {
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }

                                            _model.checktokenReloadBiometricsSetting3 =
                                                await action_blocks
                                                    .tokenReload(context);
                                            shouldSetState = true;
                                            if (_model
                                                .checktokenReloadBiometricsSetting3!) {
                                              _model.dataSetting = null;
                                              setState(() {});
                                              _model.deleteBiometricKeyPair =
                                                  await actions
                                                      .biometricDeleteKeyPair();
                                              shouldSetState = true;
                                            } else {
                                              setState(() {});
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }

                                            _model.updateDataSettingStruct(
                                              (e) => e
                                                ..enableBiometric = 0
                                                ..publicKey = '',
                                            );
                                            setState(() {});
                                            _model.apiResultUpdateBiometric1 =
                                                await SettingAcountGroup
                                                    .updateBiometricVerificationWorkCall
                                                    .call(
                                              dataJson: <String, dynamic>{
                                                'public_key': _model
                                                    .dataSetting?.publicKey,
                                                'enable_biometric': _model
                                                    .dataSetting
                                                    ?.enableBiometric,
                                              },
                                              accessToken:
                                                  FFAppState().accessToken,
                                            );

                                            shouldSetState = true;
                                            if ((_model
                                                    .apiResultUpdateBiometric1
                                                    ?.succeeded ??
                                                true)) {
                                              await actions.clearInfoUser(
                                                'bv',
                                              );
                                              _model.apiResultUpdateUserCopy =
                                                  await UserGroup.userMeCall
                                                      .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                              );

                                              shouldSetState = true;
                                              if ((_model
                                                      .apiResultUpdateUserCopy
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState()
                                                    .user = UserResourceDataStruct
                                                        .maybeFromMap((_model
                                                                .apiResultUpdateUserCopy
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .data;
                                                setState(() {});
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Cài đặt không thành công',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }

                                            _model.load = false;
                                            setState(() {});
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                          }
                                        },
                                  title: Text(
                                    'Đăng nhập bằng vân tay',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  subtitle: Text(
                                    'Kích hoạt đăng nhập sử dụng vân tay',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            36.0, 18.0, 36.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const DeleteAccountWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Xóa tài khoản',
                            icon: const Icon(
                              Icons.remove_circle,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).noColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context).orange,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).orange,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
