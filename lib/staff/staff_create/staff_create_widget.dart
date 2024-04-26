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
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'staff_create_model.dart';
export 'staff_create_model.dart';

class StaffCreateWidget extends StatefulWidget {
  const StaffCreateWidget({super.key});

  @override
  State<StaffCreateWidget> createState() => _StaffCreateWidgetState();
}

class _StaffCreateWidgetState extends State<StaffCreateWidget>
    with TickerProviderStateMixin {
  late StaffCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffCreateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
        setState(() {
          _model.selectRole = true;
        });
      }
      _model.listDeparmentToken = await action_blocks.tokenReload(context);
      if (_model.listDeparmentToken!) {
        _model.apiResultListDeparment =
            await DepartmentGroup.getDepartmentListCall.call(
          accessToken: FFAppState().accessToken,
          filter: '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.branch_id''',
          ).toString().toString()}\"}}}]}',
        );
        if ((_model.apiResultListDeparment?.succeeded ?? true)) {
          setState(() {
            _model.listDepartment = DepartmentListDataStruct.maybeFromMap(
                    (_model.apiResultListDeparment?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DepartmentListStruct>();
          });
        }
        _model.getListBranchToken = await action_blocks.tokenReload(context);
        if (_model.getListBranchToken!) {
          _model.apiResultGetListBranch = await BranchGroup.branchListCall.call(
            accessToken: FFAppState().accessToken,
            filter:
                '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString()}\"}}}]}',
          );
          if ((_model.apiResultGetListBranch?.succeeded ?? true)) {
            setState(() {
              _model.branchList = BranchListDataStruct.maybeFromMap(
                      (_model.apiResultGetListBranch?.jsonBody ?? ''))!
                  .data
                  .toList()
                  .cast<BranchListStruct>();
            });
          }
          _model.getListUserToken = await action_blocks.tokenReload(context);
          if (_model.getListUserToken!) {
            _model.apiResultgetListUser = await UserGroup.getListUserCall.call(
              accessToken: FFAppState().accessToken,
            );
            if ((_model.apiResultgetListUser?.succeeded ?? true)) {
              setState(() {
                _model.listEmail = ListUserStruct.maybeFromMap(
                        (_model.apiResultgetListUser?.jsonBody ?? ''))!
                    .data
                    .toList()
                    .cast<UserStruct>();
              });
            }
          } else {
            setState(() {});
          }
        } else {
          setState(() {});
        }
      } else {
        setState(() {});
      }
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();

    _model.cccdTextController ??= TextEditingController();
    _model.cccdFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
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
            context.pop();
          },
        ),
        title: Text(
          'Tạo mới nhân viên',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Nunito Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 20.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.memory(
                                              _model.uploadedLocalFile.bytes ??
                                                  Uint8List.fromList([]),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: 'circleImageTag',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'circleImageTag',
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: 90.0,
                                        height: 90.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.memory(
                                          _model.uploadedLocalFile.bytes ??
                                              Uint8List.fromList([]),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.camera_alt,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.info,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                                Text(
                                  'Thông tin',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.nameTextController,
                                    focusNode: _model.nameFocusNode,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Tên nhân viên',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Vd: Tiên Nữ Xinh Đẹp',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model
                                        .nameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 4.0),
                                        child: TextFormField(
                                          controller:
                                              _model.emailTextController,
                                          focusNode: _model.emailFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.emailTextController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              if (_model.listEmail
                                                  .map((e) => e.email)
                                                  .toList()
                                                  .contains(_model
                                                      .emailTextController
                                                      .text)) {
                                                setState(() {
                                                  _model.checkEmail = '1';
                                                });
                                              } else {
                                                setState(() {
                                                  _model.checkEmail = '0';
                                                });
                                              }
                                            },
                                          ),
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Vd: Nuta@pexnic.com',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .emailTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      if (_model.checkEmail == '1')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Email đã tồn tại!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: TextFormField(
                                    controller: _model.phoneTextController,
                                    focusNode: _model.phoneFocusNode,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Số điện thoại',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Vd: 0355736969',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .phoneTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: TextFormField(
                                    controller: _model.cccdTextController,
                                    focusNode: _model.cccdFocusNode,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Căn cước công dân',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Vd: 000120093848',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .cccdTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 20.0, 4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: getCurrentTimestamp,
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  datePickedDate.year,
                                                  datePickedDate.month,
                                                  datePickedDate.day,
                                                );
                                              });
                                            }
                                            setState(() {
                                              _model.dob = dateTimeFormat(
                                                'dd/MM/yyyy',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                _model.dob != ''
                                                    ? _model.dob
                                                    : 'Ngày sinh',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                      if (_model.checkDob)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Vui lòng nhập ngày sinh',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Giới tính',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 20.0, 20.0),
                                  child: FlutterFlowRadioButton(
                                    options: ['Nam', 'Nữ'].toList(),
                                    onChanged: (val) => setState(() {}),
                                    controller:
                                        _model.radioButtonValueController ??=
                                            FormFieldController<String>('Nam'),
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.vertical,
                                    radioButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 4.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller:
                                              _model.roleValueController ??=
                                                  FormFieldController<String>(
                                            _model.roleValue ??= '',
                                          ),
                                          options: List<String>.from([
                                            'a8d33527-375b-4599-ac70-6a3fcad1de39',
                                            '6a8bc644-cb2d-4a31-b11e-b86e19824725',
                                            '3755a98d-f064-45cd-80e4-5084ab1dd2c4'
                                          ]),
                                          optionLabels: const [
                                            'Quản lý chi nhánh',
                                            'Quản lý bộ phận',
                                            'Nhân viên'
                                          ],
                                          onChanged: (val) async {
                                            setState(
                                                () => _model.roleValue = val);
                                            setState(() {});
                                            if (('${_model.roleValue}' ==
                                                    '3755a98d-f064-45cd-80e4-5084ab1dd2c4') ||
                                                ('${_model.roleValue}' ==
                                                    '6a8bc644-cb2d-4a31-b11e-b86e19824725')) {
                                              setState(() {
                                                _model.selectRole = true;
                                              });
                                            } else {
                                              setState(() {
                                                _model.selectRole = false;
                                              });
                                            }

                                            if ((FFAppState().user.role ==
                                                    'a8d33527-375b-4599-ac70-6a3fcad1de39') &&
                                                (_model.roleValue ==
                                                    'a8d33527-375b-4599-ac70-6a3fcad1de39')) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Tài khoản không có quyền tạo role này!',
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
                                              setState(() {
                                                _model.roleValueController
                                                    ?.reset();
                                              });
                                            }
                                            if (((FFAppState().user.role ==
                                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725') &&
                                                    (_model.roleValue ==
                                                        'a8d33527-375b-4599-ac70-6a3fcad1de39')) ||
                                                ((FFAppState().user.role ==
                                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725') &&
                                                    (_model.roleValue ==
                                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725'))) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Tài khoản không có quyền tạo role này!',
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
                                              setState(() {
                                                _model.roleValueController
                                                    ?.reset();
                                              });
                                            }
                                            setState(() {});
                                          },
                                          width: double.infinity,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: 'Chọn chức vụ',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 15.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 1.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      if (_model.checkRole)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Vui lòng chọn chức vụ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if ((FFAppState().user.role ==
                                        '82073000-1ba2-43a4-a55c-459d17c23b68') ||
                                    (_model.roleValue ==
                                        'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 4.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller:
                                                _model.branchValueController ??=
                                                    FormFieldController<String>(
                                              _model.branchValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .branchList
                                                .map((e) => e.id)
                                                .toList()),
                                            optionLabels: _model.branchList
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.branchValue = val);
                                              setState(() {
                                                _model.selectBranch = _model
                                                    .branchList
                                                    .where((e) =>
                                                        e.id ==
                                                        _model.branchValue)
                                                    .toList()
                                                    .first;
                                              });
                                              _model.listDeparment2Token =
                                                  await action_blocks
                                                      .tokenReload(context);
                                              if (_model.listDeparment2Token!) {
                                                _model.apiResultListDeparment2 =
                                                    await DepartmentGroup
                                                        .getDepartmentListCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  filter:
                                                      '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${_model.branchValue}\"}}}]}',
                                                );
                                                if ((_model
                                                        .apiResultListDeparment2
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model.listDepartment =
                                                        DepartmentListDataStruct
                                                                .maybeFromMap((_model
                                                                        .apiResultListDeparment2
                                                                        ?.jsonBody ??
                                                                    ''))!
                                                            .data
                                                            .toList()
                                                            .cast<
                                                                DepartmentListStruct>();
                                                  });
                                                }
                                              }

                                              setState(() {});
                                            },
                                            width: double.infinity,
                                            height: 56.0,
                                            searchHintTextStyle: const TextStyle(),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Chọn chi nhánh',
                                            searchHintText: 'Tìm kiếm bộ phận:',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 1.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                        if (_model.checkBranch)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Vui lòng chọn chi nhánh',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (_model.selectRole == true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 4.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .departmentValueController ??=
                                                FormFieldController<String>(
                                              _model.departmentValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .listDepartment
                                                .map((e) => e.id)
                                                .toList()),
                                            optionLabels: _model.listDepartment
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.departmentValue = val);
                                              setState(() {
                                                _model.selectDepartment = _model
                                                    .listDepartment
                                                    .where((e) =>
                                                        e.id ==
                                                        _model.departmentValue)
                                                    .toList()
                                                    .first;
                                              });
                                            },
                                            width: double.infinity,
                                            height: 56.0,
                                            searchHintTextStyle: const TextStyle(),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Chọn bộ phận',
                                            searchHintText: 'Tìm kiếm bộ phận:',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 1.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                        if (_model.checkDepartment)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Vui lòng chọn bộ phận',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Thông tin đăng nhập:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                  Text(
                                    'Sử dụng email và mật khẩu mặc định để đăng nhập',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Email: ${_model.emailTextController.text}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Icon(
                                        Icons.content_copy,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Mật khẩu mặc định: Abcd@1234',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Icon(
                                        Icons.content_copy,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                Text(
                                  'Thiết lập khác',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.power_settings_new_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.switchListTileValue ??= true,
                                    onChanged: ('1' == '1')
                                        ? null
                                        : (newValue) async {
                                            setState(() =>
                                                _model.switchListTileValue =
                                                    newValue);
                                          },
                                    title: Text(
                                      'Trạng thái hoạt động',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor: ('1' == '1')
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: ('1' == '1')
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 4.0, 0.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.05),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onDoubleTap: () async {
                      var shouldSetState = false;
                      if ((FFAppState().user.role ==
                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') ||
                          (_model.roleValue ==
                              'a8d33527-375b-4599-ac70-6a3fcad1de39')) {
                        setState(() {
                          _model.checkDepartment = true;
                        });
                        if (_model.roleValue ==
                            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                          _model.apiResultCreateAdminBranch =
                              await StaffGroup.createStaffCall.call(
                            accessToken: FFAppState().accessToken,
                            requestDataJson: <String, dynamic>{
                              'email': _model.emailTextController.text,
                              'password': 'Abcd@1234',
                              'role': _model.roleValue,
                              'first_name': _model.nameTextController.text,
                              'last_name': _model.nameTextController.text,
                              'status': 'active',
                              'department_id': null,
                              'branch_id': getJsonField(
                                FFAppState().staffLogin,
                                r'''$.branch_id''',
                              ),
                              'cccd': _model.cccdTextController.text,
                              'gender': _model.radioButtonValue == 'Nam'
                                  ? 'male'
                                  : 'female',
                              'phone': _model.phoneTextController.text,
                              'dob': dateTimeFormat(
                                'yyyy-MM-dd',
                                _model.datePicked,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'avatar': _model.avatarId,
                              'title': () {
                                if (_model.roleValue ==
                                    '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                  return 'Nhân viên';
                                } else if (_model.roleValue ==
                                    '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                  return 'Quản lý bộ phận';
                                } else if (_model.roleValue ==
                                    'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                  return 'Quản lý chi nhánh';
                                } else {
                                  return null;
                                }
                              }(),
                            },
                          );
                          shouldSetState = true;
                          if ((_model.apiResultCreateAdminBranch?.succeeded ??
                              true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Tạo mới thành công!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            context.pushNamed(
                              'PersonnelList',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Tạo mới thất bại!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        } else {
                          if (shouldSetState) setState(() {});
                          return;
                        }
                      } else {
                        _model.apiResultCreate =
                            await StaffGroup.createStaffCall.call(
                          accessToken: FFAppState().accessToken,
                          requestDataJson: <String, dynamic>{
                            'email': _model.emailTextController.text,
                            'password': 'Abcd@1234',
                            'role': _model.roleValue,
                            'first_name': _model.nameTextController.text,
                            'last_name': _model.nameTextController.text,
                            'status': 'active',
                            'department_id': _model.selectDepartment != null
                                ? _model.selectDepartment?.id
                                : ' ',
                            'branch_id': getJsonField(
                              FFAppState().staffLogin,
                              r'''$.branch_id''',
                            ),
                            'cccd': _model.cccdTextController.text,
                            'gender': _model.radioButtonValue == 'Nam'
                                ? 'male'
                                : 'female',
                            'phone': _model.phoneTextController.text,
                            'dob': dateTimeFormat(
                              'yyyy-MM-dd',
                              _model.datePicked,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            'avatar': _model.avatarId,
                            'title': () {
                              if (_model.roleValue ==
                                  '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                return 'Nhân viên';
                              } else if (_model.roleValue ==
                                  '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                return 'Quản lý bộ phận';
                              } else if (_model.roleValue ==
                                  'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                return 'Quản lý chi nhánh';
                              } else {
                                return null;
                              }
                            }(),
                          },
                        );
                        shouldSetState = true;
                        if ((_model.apiResultCreate?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tạo mới thành công!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          context.pushNamed(
                            'PersonnelList',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tạo mới thất bại!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      }

                      if (shouldSetState) setState(() {});
                    },
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        if ((_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)) {
                          _model.uploadImageToken =
                              await action_blocks.tokenReload(context);
                          shouldSetState = true;
                          if (_model.uploadImageToken!) {
                            _model.apiResultuploadImage =
                                await UploadFileGroup.uploadFileCall.call(
                              accessToken: FFAppState().accessToken,
                              file: _model.uploadedLocalFile,
                            );
                            shouldSetState = true;
                            if ((_model.apiResultuploadImage?.succeeded ??
                                true)) {
                              setState(() {
                                _model.avatarId = getJsonField(
                                  (_model.apiResultuploadImage?.jsonBody ?? ''),
                                  r'''$.data.id''',
                                ).toString();
                              });
                            }
                          } else {
                            setState(() {});
                          }
                        } else {
                          setState(() {
                            _model.avatarId =
                                '6f2dfeb5-4df6-4b73-93c4-109f72133a25';
                          });
                        }

                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (_model.branchValue == null) {
                          return;
                        }
                        if (_model.checkEmail == '1') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email đã tồn tại',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (shouldSetState) setState(() {});
                          return;
                        } else {
                          if (_model.roleValue == null ||
                              _model.roleValue == '') {
                            setState(() {
                              _model.checkRole = true;
                            });
                            if (shouldSetState) setState(() {});
                            return;
                          } else {
                            if (_model.datePicked == null) {
                              setState(() {
                                _model.checkDob = true;
                              });
                              if (shouldSetState) setState(() {});
                              return;
                            } else {
                              if ((_model.roleValue ==
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39') ||
                                  (FFAppState().user.role ==
                                      '6a8bc644-cb2d-4a31-b11e-b86e19824725')) {
                                if (_model.branchValue == null ||
                                    _model.branchValue == '') {
                                  setState(() {
                                    _model.checkBranch = true;
                                  });
                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  if (_model.departmentValue == null ||
                                      _model.departmentValue == '') {
                                    if ((_model.roleValue ==
                                            'a8d33527-375b-4599-ac70-6a3fcad1de39') &&
                                        (FFAppState().user.role !=
                                            '6a8bc644-cb2d-4a31-b11e-b86e19824725')) {
                                      setState(() {});
                                      _model.createBToken = await action_blocks
                                          .tokenReload(context);
                                      shouldSetState = true;
                                      if (_model.createBToken!) {
                                        _model.apiResultCreateB =
                                            await StaffGroup.createStaffCall
                                                .call(
                                          accessToken: FFAppState().accessToken,
                                          requestDataJson: <String, dynamic>{
                                            'email':
                                                _model.emailTextController.text,
                                            'password': 'Abcd@1234',
                                            'role': _model.roleValue,
                                            'first_name':
                                                _model.nameTextController.text,
                                            'last_name':
                                                _model.nameTextController.text,
                                            'status': 'active',
                                            'department_id': null,
                                            'branch_id': _model.branchValue,
                                            'cccd':
                                                _model.cccdTextController.text,
                                            'gender':
                                                _model.radioButtonValue == 'Nam'
                                                    ? 'male'
                                                    : 'female',
                                            'phone':
                                                _model.phoneTextController.text,
                                            'dob': dateTimeFormat(
                                              'yyyy-MM-dd',
                                              _model.datePicked,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'avatar': _model.avatarId,
                                            'title': () {
                                              if (_model.roleValue ==
                                                  '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                                return 'Nhân viên';
                                              } else if (_model.roleValue ==
                                                  '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                                return 'Quản lý bộ phận';
                                              } else if (_model.roleValue ==
                                                  'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                                return 'Quản lý chi nhánh';
                                              } else {
                                                return null;
                                              }
                                            }(),
                                          },
                                        );
                                        shouldSetState = true;
                                        if ((_model
                                                .apiResultCreateB?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Tạo mới thành công!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );

                                          context.pushNamed(
                                            'PersonnelList',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Tạo mới thất bại!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }
                                      } else {
                                        setState(() {});
                                      }
                                    } else {
                                      setState(() {
                                        _model.checkDepartment = true;
                                      });
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    _model.createOToken = await action_blocks
                                        .tokenReload(context);
                                    shouldSetState = true;
                                    if (_model.createOToken!) {
                                      _model.apiResultCreateO =
                                          await StaffGroup.createStaffCall.call(
                                        accessToken: FFAppState().accessToken,
                                        requestDataJson: <String, dynamic>{
                                          'email':
                                              _model.emailTextController.text,
                                          'password': 'Abcd@1234',
                                          'role': _model.roleValue,
                                          'first_name':
                                              _model.nameTextController.text,
                                          'last_name':
                                              _model.nameTextController.text,
                                          'status': 'active',
                                          'department_id':
                                              _model.departmentValue,
                                          'branch_id': _model.branchValue,
                                          'cccd':
                                              _model.cccdTextController.text,
                                          'gender':
                                              _model.radioButtonValue == 'Nam'
                                                  ? 'male'
                                                  : 'female',
                                          'phone':
                                              _model.phoneTextController.text,
                                          'dob': dateTimeFormat(
                                            'yyyy-MM-dd',
                                            _model.datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          'avatar': _model.avatarId,
                                          'title': () {
                                            if (_model.roleValue ==
                                                '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                              return 'Nhân viên';
                                            } else if (_model.roleValue ==
                                                '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                              return 'Quản lý bộ phận';
                                            } else if (_model.roleValue ==
                                                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                              return 'Quản lý chi nhánh';
                                            } else {
                                              return null;
                                            }
                                          }(),
                                        },
                                      );
                                      shouldSetState = true;
                                      if ((_model.apiResultCreateO?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tạo mới thành công!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );

                                        context.pushNamed(
                                          'PersonnelList',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tạo mới thất bại!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    } else {
                                      setState(() {});
                                    }
                                  }
                                }
                              } else {
                                _model.createDSToken =
                                    await action_blocks.tokenReload(context);
                                shouldSetState = true;
                                if (_model.createDSToken!) {
                                  _model.apiResultCreateDS =
                                      await StaffGroup.createStaffCall.call(
                                    accessToken: FFAppState().accessToken,
                                    requestDataJson: <String, dynamic>{
                                      'email': _model.emailTextController.text,
                                      'password': 'Abcd@1234',
                                      'role': _model.roleValue,
                                      'first_name':
                                          _model.nameTextController.text,
                                      'last_name':
                                          _model.nameTextController.text,
                                      'status': 'active',
                                      'department_id':
                                          _model.selectDepartment != null
                                              ? _model.selectDepartment?.id
                                              : ' ',
                                      'branch_id': getJsonField(
                                        FFAppState().staffLogin,
                                        r'''$.branch_id''',
                                      ),
                                      'cccd': _model.cccdTextController.text,
                                      'gender': _model.radioButtonValue == 'Nam'
                                          ? 'male'
                                          : 'female',
                                      'phone': _model.phoneTextController.text,
                                      'dob': dateTimeFormat(
                                        'yyyy-MM-dd',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'avatar': _model.avatarId,
                                      'title': () {
                                        if (_model.roleValue ==
                                            '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                          return 'Nhân viên';
                                        } else if (_model.roleValue ==
                                            '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                          return 'Quản lý bộ phận';
                                        } else if (_model.roleValue ==
                                            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                          return 'Quản lý chi nhánh';
                                        } else {
                                          return null;
                                        }
                                      }(),
                                    },
                                  );
                                  shouldSetState = true;
                                  if ((_model.apiResultCreateDS?.succeeded ??
                                      true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tạo mới thành công!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    context.pushNamed(
                                      'PersonnelList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tạo mới thất bại!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  setState(() {});
                                }
                              }
                            }
                          }
                        }

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Lưu',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
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
