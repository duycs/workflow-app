import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content:
                    Text(FFAppState().user.enableBiometric.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: const Text('Confirm'),
                  ),
                ],
              );
            },
          ) ??
          false;
    });

    _model.switchValue =
        FFAppState().user.enableBiometric.toString() == '1';
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          Switch.adaptive(
                                            value: _model.switchValue!,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .switchValue = newValue);
                                              if (newValue) {
                                                var shouldSetState = false;
                                                _model.tokenReloadProfileUserSetting =
                                                    await action_blocks
                                                        .tokenReload(context);
                                                shouldSetState = true;
                                                if (_model
                                                    .tokenReloadProfileUserSetting!) {
                                                  _model.dataSetting = null;
                                                  setState(() {});
                                                  _model.sshkeyPublicKeySettingOn =
                                                      actions.sshkey(
                                                    getJsonField(
                                                      FFAppState().staffLogin,
                                                      r'''$.email''',
                                                    ).toString(),
                                                    '',
                                                    true,
                                                  );
                                                  shouldSetState = true;
                                                  _model
                                                      .updateDataSettingStruct(
                                                    (e) => e
                                                      ..enableBiometric = 1
                                                      ..publicKey = _model
                                                          .sshkeyPublicKeySettingOn,
                                                  );
                                                  setState(() {});
                                                } else {
                                                  setState(() {});
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                _model.apiResultz8c =
                                                    await SettingAcountGroup
                                                        .updateBiometricVerificationCopyCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  dataJson: _model.dataSetting
                                                      ?.toMap(),
                                                );

                                                shouldSetState = true;
                                                if ((_model.apiResultz8c
                                                        ?.succeeded ??
                                                    true)) {
                                                  await actions.saveInfoUser(
                                                    'bv',
                                                    DateTime.now().toString(),
                                                  );
                                                }
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                              } else {
                                                var shouldSetState = false;
                                                _model.tokenReloadProfileUserSettingCopy =
                                                    await action_blocks
                                                        .tokenReload(context);
                                                shouldSetState = true;
                                                if (_model
                                                    .tokenReloadProfileUserSettingCopy!) {
                                                  _model.dataSetting = null;
                                                  setState(() {});
                                                  _model.sshkeyPublicKeySetting =
                                                      actions.sshkey(
                                                    getJsonField(
                                                      FFAppState().staffLogin,
                                                      r'''$.email''',
                                                    ).toString(),
                                                    '',
                                                    true,
                                                  );
                                                  shouldSetState = true;
                                                  _model
                                                      .updateDataSettingStruct(
                                                    (e) => e
                                                      ..enableBiometric = 0
                                                      ..publicKey = '',
                                                  );
                                                  setState(() {});
                                                } else {
                                                  setState(() {});
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                _model.apiResultz8cCopy =
                                                    await SettingAcountGroup
                                                        .updateBiometricVerificationCopyCall
                                                        .call(
                                                  dataJson: _model.dataSetting
                                                      ?.toMap(),
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                );

                                                shouldSetState = true;
                                                if ((_model.apiResultz8cCopy
                                                        ?.succeeded ??
                                                    true)) {
                                                  await actions.clearInfoUser(
                                                    'bv',
                                                  );
                                                }
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
