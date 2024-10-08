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
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
        _model.selectRole = true;
        setState(() {});
      }
      _model.listDeparmentToken = await action_blocks.tokenReload(context);
      if (_model.listDeparmentToken!) {
        _model.apiResultListDeparment =
            await DepartmentGroup.getDepartmentListCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.branch_id''',
          ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}',
        );

        if ((_model.apiResultListDeparment?.succeeded ?? true)) {
          _model.listDepartment = DepartmentListDataStruct.maybeFromMap(
                  (_model.apiResultListDeparment?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<DepartmentListStruct>();
          setState(() {});
        }
        _model.getListBranchToken = await action_blocks.tokenReload(context);
        if (_model.getListBranchToken!) {
          _model.apiResultGetListBranch = await BranchGroup.branchListCall.call(
            accessToken: FFAppState().accessToken,
            filter:
                '{\"_and\":[{},{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}',
          );

          if ((_model.apiResultGetListBranch?.succeeded ?? true)) {
            _model.branchList = BranchListDataStruct.maybeFromMap(
                    (_model.apiResultGetListBranch?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<BranchListStruct>();
            setState(() {});
          }
          _model.getListUserToken = await action_blocks.tokenReload(context);
          if (_model.getListUserToken!) {
            _model.apiResultgetListUser = await UserGroup.getListUserCall.call(
              accessToken: FFAppState().accessToken,
            );

            if ((_model.apiResultgetListUser?.succeeded ?? true)) {
              _model.listEmail = ListUserStruct.maybeFromMap(
                      (_model.apiResultgetListUser?.jsonBody ?? ''))!
                  .data
                  .toList()
                  .cast<UserStruct>();
              _model.checkDob = false;
              setState(() {});
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

    _model.titleTextTextController ??= TextEditingController();
    _model.titleTextFocusNode ??= FocusNode();

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
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
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
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 1.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
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
                                        decoration: BoxDecoration(
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _model.formKey2,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 20.0, 0.0),
                              child: TextFormField(
                                controller: _model.nameTextController,
                                focusNode: _model.nameFocusNode,
                                textCapitalization: TextCapitalization.words,
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
                                  hintText: 'Vd: Mai Hồng Ngọc',
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model.nameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 4.0),
                                    child: TextFormField(
                                      controller: _model.emailTextController,
                                      focusNode: _model.emailFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.emailTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          if (_model.listEmail
                                                  .where((e) =>
                                                      _model.emailTextController
                                                          .text ==
                                                      e.email)
                                                  .toList()
                                                  .length >
                                              0) {
                                            _model.checkEmail = '1';
                                            setState(() {});
                                          } else {
                                            _model.checkEmail = '0';
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Vd: Nuta@pexnic.com',
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
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (_model.checkEmail == '1')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Email đã tồn tại!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 20.0),
                              child: TextFormField(
                                controller: _model.phoneTextController,
                                focusNode: _model.phoneFocusNode,
                                textCapitalization: TextCapitalization.words,
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
                                  hintText: 'Vd: 0355739999',
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                keyboardType: TextInputType.phone,
                                validator: _model.phoneTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: TextFormField(
                          controller: _model.cccdTextController,
                          focusNode: _model.cccdFocusNode,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Căn cước công dân (Tùy chọn)',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          keyboardType: TextInputType.phone,
                          validator: _model.cccdTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Form(
                        key: _model.formKey1,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      'Ngày sinh',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 20.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePickedDate =
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        }
                                        _model.dob = dateTimeFormat(
                                          "dd/MM/yyyy",
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        );
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            _model.dob != null &&
                                                    _model.dob != ''
                                                ? _model.dob
                                                : 'Ngày sinh',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkDob)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Vui lòng nhập ngày sinh',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Giới tính',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                                textPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 32.0, 0.0),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Quyền',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 4.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model.roleValueController ??=
                                          FormFieldController<String>(
                                        _model.roleValue ??= FFAppState()
                                                    .user
                                                    .role ==
                                                '6a8bc644-cb2d-4a31-b11e-b86e19824725'
                                            ? '3755a98d-f064-45cd-80e4-5084ab1dd2c4'
                                            : '',
                                      ),
                                      options: List<String>.from([
                                        'a8d33527-375b-4599-ac70-6a3fcad1de39',
                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725',
                                        '3755a98d-f064-45cd-80e4-5084ab1dd2c4'
                                      ]),
                                      optionLabels: [
                                        'Quản lý chi nhánh',
                                        'Quản lý bộ phận',
                                        'Nhân viên'
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model.roleValue = val);
                                        setState(() {});
                                        if (('${_model.roleValue}' ==
                                                '3755a98d-f064-45cd-80e4-5084ab1dd2c4') ||
                                            ('${_model.roleValue}' ==
                                                '6a8bc644-cb2d-4a31-b11e-b86e19824725')) {
                                          _model.selectRole = true;
                                          setState(() {});
                                        } else {
                                          _model.selectRole = false;
                                          setState(() {});
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          setState(() {
                                            _model.roleValueController?.reset();
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          setState(() {
                                            _model.roleValueController?.reset();
                                          });
                                        }

                                        setState(() {});
                                        setState(() {
                                          _model.branchValueController?.reset();
                                          _model.departmentValueController
                                              ?.reset();
                                        });
                                      },
                                      width: double.infinity,
                                      height: 56.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Chọn quyền',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 1.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      disabled: FFAppState().user.role ==
                                          '6a8bc644-cb2d-4a31-b11e-b86e19824725',
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  if (_model.checkRole)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Vui lòng chọn quyền',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                'Chức vụ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                '(Có thể chọn chức vụ gợi ý)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 4.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .titleValueController ??=
                                                  FormFieldController<String>(
                                                _model.titleValue ??= '',
                                              ),
                                              options: List<String>.from(
                                                  ['1', '2', '3', '4', '5']),
                                              optionLabels: [
                                                'Trưởng chi nhánh',
                                                'Phó chi nhánh',
                                                'Trưởng bộ phận',
                                                'Phó bộ phận',
                                                'Nhân viên'
                                              ],
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.titleValue = val);
                                                setState(() {
                                                  _model.titleTextTextController
                                                      ?.text = () {
                                                    if (_model.titleValue ==
                                                        '5') {
                                                      return 'Nhân viên';
                                                    } else if (_model
                                                            .titleValue ==
                                                        '4') {
                                                      return 'Phó bộ phận';
                                                    } else if (_model
                                                            .titleValue ==
                                                        '3') {
                                                      return 'Trưởng bộ phận';
                                                    } else if (_model
                                                            .titleValue ==
                                                        '2') {
                                                      return 'Phó chi nhánh';
                                                    } else if (_model
                                                            .titleValue ==
                                                        '1') {
                                                      return 'Trưởng chi nhánh';
                                                    } else {
                                                      return ' ';
                                                    }
                                                  }();
                                                  _model.titleTextTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .titleTextTextController!
                                                              .text
                                                              .length);
                                                });

                                                setState(() {});
                                              },
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              hintText: 'Chức vụ gợi ý',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 15.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 1.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 4.0, 8.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 20.0, 4.0),
                                    child: TextFormField(
                                      controller:
                                          _model.titleTextTextController,
                                      focusNode: _model.titleTextFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.titleTextTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          if (_model.listEmail
                                                  .where((e) =>
                                                      _model
                                                          .titleTextTextController
                                                          .text ==
                                                      e.email)
                                                  .toList()
                                                  .length >
                                              0) {
                                            _model.checkEmail = '1';
                                            setState(() {});
                                          } else {
                                            _model.checkEmail = '0';
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Vd: Nhân viên',
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
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .titleTextTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Chi nhánh',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 4.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.branchValueController ??=
                                              FormFieldController<String>(
                                        _model.branchValue ??= (FFAppState()
                                                        .user
                                                        .role ==
                                                    'a8d33527-375b-4599-ac70-6a3fcad1de39') ||
                                                (FFAppState().user.role ==
                                                    '6a8bc644-cb2d-4a31-b11e-b86e19824725')
                                            ? getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.branch_id''',
                                              ).toString()
                                            : '',
                                      ),
                                      options: List<String>.from(_model
                                          .branchList
                                          .map((e) => e.id)
                                          .toList()),
                                      optionLabels: _model.branchList
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.branchValue = val);
                                        _model.selectBranch = _model.branchList
                                            .where((e) =>
                                                e.id == _model.branchValue)
                                            .toList()
                                            .first;
                                        setState(() {});
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

                                          if ((_model.apiResultListDeparment2
                                                  ?.succeeded ??
                                              true)) {
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
                                            setState(() {});
                                          }
                                        }

                                        setState(() {});
                                      },
                                      width: double.infinity,
                                      height: 56.0,
                                      searchHintTextStyle: GoogleFonts.getFont(
                                        'Nunito Sans',
                                      ),
                                      searchTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Chọn chi nhánh',
                                      searchHintText: 'Tìm kiếm bộ phận:',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 1.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      disabled: (FFAppState().user.role ==
                                              'a8d33527-375b-4599-ac70-6a3fcad1de39') ||
                                          (FFAppState().user.role ==
                                              '6a8bc644-cb2d-4a31-b11e-b86e19824725'),
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  if (_model.checkBranch)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Vui lòng chọn chi nhánh',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if ((_model.selectRole == true) ||
                                (FFAppState().user.role ==
                                    '6a8bc644-cb2d-4a31-b11e-b86e19824725'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Bộ phận',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 4.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.departmentValueController ??=
                                                FormFieldController<String>(
                                          _model
                                              .departmentValue ??= FFAppState()
                                                      .user
                                                      .role ==
                                                  '6a8bc644-cb2d-4a31-b11e-b86e19824725'
                                              ? getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.department_id''',
                                                ).toString()
                                              : '',
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
                                          _model.selectDepartment = _model
                                              .listDepartment
                                              .where((e) =>
                                                  e.id ==
                                                  _model.departmentValue)
                                              .toList()
                                              .first;
                                          setState(() {});
                                        },
                                        width: double.infinity,
                                        height: 56.0,
                                        searchHintTextStyle: TextStyle(),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Chọn bộ phận',
                                        searchHintText: 'Tìm kiếm bộ phận:',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 1.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        disabled: FFAppState().user.role ==
                                            '6a8bc644-cb2d-4a31-b11e-b86e19824725',
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    if (_model.checkDepartment)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Vui lòng chọn bộ phận',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                            padding: EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
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
                                                    newValue!);
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 4.0, 0.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: _model.emailTextController.text));
                                  },
                                  child: Icon(
                                    Icons.content_copy,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Clipboard.setData(
                                        ClipboardData(text: 'Abcd@1234'));
                                  },
                                  child: Icon(
                                    Icons.content_copy,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.05),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onDoubleTap: () async {
                      var _shouldSetState = false;
                      if ((FFAppState().user.role ==
                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') ||
                          (_model.roleValue ==
                              'a8d33527-375b-4599-ac70-6a3fcad1de39')) {
                        _model.checkDepartment = true;
                        setState(() {});
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
                              'dob': '${dateTimeFormat(
                                "yyyy-MM-dd",
                                _model.datePicked,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
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

                          _shouldSetState = true;
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
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

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
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        } else {
                          if (_shouldSetState) setState(() {});
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
                            'dob': '${dateTimeFormat(
                              "yyyy-MM-dd",
                              _model.datePicked,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
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

                        _shouldSetState = true;
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
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

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
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (_model.uploadedLocalFile != null &&
                            (_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)) {
                          _model.uploadImageToken =
                              await action_blocks.tokenReload(context);
                          _shouldSetState = true;
                          if (_model.uploadImageToken!) {
                            _model.apiResultuploadImage =
                                await UploadFileGroup.uploadFileCall.call(
                              accessToken: FFAppState().accessToken,
                              file: _model.uploadedLocalFile,
                            );

                            _shouldSetState = true;
                            if ((_model.apiResultuploadImage?.succeeded ??
                                true)) {
                              _model.avatarId = getJsonField(
                                (_model.apiResultuploadImage?.jsonBody ?? ''),
                                r'''$.data.id''',
                              ).toString();
                              setState(() {});
                            }
                          } else {
                            setState(() {});
                          }
                        } else {
                          _model.avatarId =
                              '6f2dfeb5-4df6-4b73-93c4-109f72133a25';
                          setState(() {});
                        }

                        if (_model.formKey2.currentState == null ||
                            !_model.formKey2.currentState!.validate()) {
                          return;
                        }
                        if (_model.formKey1.currentState == null ||
                            !_model.formKey1.currentState!.validate()) {
                          return;
                        }
                        if (_model.checkEmail == '1') {
                          await actions.showToast(
                            context,
                            'Email đã tồn tại',
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).error,
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          if (_model.datePicked == null) {
                            _model.checkDob = true;
                            setState(() {});
                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            _model.checkDob = false;
                            setState(() {});
                            if ((_model.roleValue == null ||
                                    _model.roleValue == '') &&
                                (FFAppState().user.role !=
                                    '6a8bc644-cb2d-4a31-b11e-b86e19824725')) {
                              _model.checkRole = true;
                              setState(() {});
                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              _model.checkRole = false;
                              setState(() {});
                              if ((_model.branchValue == null ||
                                      _model.branchValue == '') &&
                                  (FFAppState().user.role !=
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39')) {
                                _model.checkBranch = true;
                                setState(() {});
                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                _model.checkBranch = false;
                                setState(() {});
                                if (_model.departmentValue == null ||
                                    _model.departmentValue == '') {
                                  if ((FFAppState().user.role ==
                                          '6a8bc644-cb2d-4a31-b11e-b86e19824725') ||
                                      (_model.roleValue ==
                                          'a8d33527-375b-4599-ac70-6a3fcad1de39')) {
                                    setState(() {});
                                    _model.checkDepartment = false;
                                    setState(() {});
                                    _model.createBToken = await action_blocks
                                        .tokenReload(context);
                                    _shouldSetState = true;
                                    if (_model.createBToken!) {
                                      _model.apiResultCreateB =
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
                                          'dob': '${dateTimeFormat(
                                            "yyyy-MM-dd",
                                            _model.datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
                                          'avatar': _model.avatarId,
                                          'title': _model
                                              .titleTextTextController.text,
                                          'sort': () {
                                            if (_model.roleValue ==
                                                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                              return '1';
                                            } else if (_model.roleValue ==
                                                '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                              return '2';
                                            } else {
                                              return '3';
                                            }
                                          }(),
                                        },
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultCreateB?.succeeded ??
                                          true)) {
                                        if ('${getJsonField(
                                              (_model.apiResultCreateB
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString()}' ==
                                            'Đã tồn tại email user') {
                                          await actions.showToast(
                                            context,
                                            'Tạo mới thất bại!',
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            FlutterFlowTheme.of(context).error,
                                          );
                                        } else {
                                          await actions.showToast(
                                            context,
                                            'Tạo mới thành công!',
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          );
                                        }
                                      } else {
                                        await actions.showToast(
                                          context,
                                          'Tạo mới thất bại!',
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          FlutterFlowTheme.of(context).error,
                                        );
                                      }
                                    } else {
                                      setState(() {});
                                    }

                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'PersonnelList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    _model.checkDepartment = true;
                                    setState(() {});
                                  }
                                } else {
                                  _model.createOToken =
                                      await action_blocks.tokenReload(context);
                                  _shouldSetState = true;
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
                                        'department_id': _model.departmentValue,
                                        'branch_id': _model.branchValue,
                                        'cccd': _model.cccdTextController.text,
                                        'gender':
                                            _model.radioButtonValue == 'Nam'
                                                ? 'male'
                                                : 'female',
                                        'phone':
                                            _model.phoneTextController.text,
                                        'dob': '${dateTimeFormat(
                                          "yyyy-MM-dd",
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        'avatar': _model.avatarId,
                                        'title':
                                            _model.titleTextTextController.text,
                                        'sort': () {
                                          if (_model.roleValue ==
                                              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                            return '1';
                                          } else if (_model.roleValue ==
                                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                            return '2';
                                          } else {
                                            return '3';
                                          }
                                        }(),
                                      },
                                    );

                                    _shouldSetState = true;
                                    if ((_model.apiResultCreateO?.succeeded ??
                                        true)) {
                                      if ((_model.apiResultCreateO?.succeeded ??
                                          true)) {
                                        if ('${getJsonField(
                                              (_model.apiResultCreateO
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString()}' ==
                                            'Đã tồn tại email user') {
                                          await actions.showToast(
                                            context,
                                            'Tạo mới thất bại!',
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            FlutterFlowTheme.of(context).error,
                                          );
                                        } else {
                                          await actions.showToast(
                                            context,
                                            'Tạo mới thành công!',
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          );
                                        }
                                      } else {
                                        await actions.showToast(
                                          context,
                                          'Tạo mới thất bại!',
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          FlutterFlowTheme.of(context).error,
                                        );
                                      }
                                    } else {
                                      await actions.showToast(
                                        context,
                                        'Tạo mới thất bại!',
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        FlutterFlowTheme.of(context).error,
                                      );
                                    }

                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'PersonnelList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    setState(() {});
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              }
                            }
                          }
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Lưu',
                      icon: Icon(
                        Icons.save_outlined,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
