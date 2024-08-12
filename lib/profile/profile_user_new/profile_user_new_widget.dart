import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/profile_staff_new/profile_staff_new_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_user_new_model.dart';
export 'profile_user_new_model.dart';

class ProfileUserNewWidget extends StatefulWidget {
  const ProfileUserNewWidget({
    super.key,
    this.staffId,
  });

  final String? staffId;

  @override
  State<ProfileUserNewWidget> createState() => _ProfileUserNewWidgetState();
}

class _ProfileUserNewWidgetState extends State<ProfileUserNewWidget>
    with TickerProviderStateMixin {
  late ProfileUserNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileUserNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getDataStaffOne(context);
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
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
            widget!.staffId == FFAppState().staffid
                ? 'Thông tin cá nhân'
                : 'Thông tin nhân sự',
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
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((_model.checkLoad == true) && (_model.staffDetail != null))
                  Expanded(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 400.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
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
                                            image: Image.network(
                                              '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffDetail?.userId?.avatar}?access_token=${FFAppState().accessToken}',
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            allowRotation: false,
                                            tag:
                                                '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffDetail?.userId?.avatar}?access_token=${FFAppState().accessToken}',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffDetail?.userId?.avatar}?access_token=${FFAppState().accessToken}',
                                      transitionOnUserGestures: true,
                                      child: Image.network(
                                        '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffDetail?.userId?.avatar}?access_token=${FFAppState().accessToken}',
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 2.0,
                                        sigmaY: 4.0,
                                      ),
                                      child: Opacity(
                                        opacity: 0.7,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x801D2429),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.staffDetail!.userId
                                                          .firstName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .email_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 22.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          _model.staffDetail!
                                                              .userId.email,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 12.0),
                                                    child: Text(
                                                      _model
                                                          .staffDetail!.slogan,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if ('1' == '2')
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(-1.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 12.0, 0.0),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle: TextStyle(),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: EdgeInsets.all(4.0),
                                        tabs: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.info_outline,
                                                ),
                                              ),
                                              Tab(
                                                text: 'Chi tiết',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.medal,
                                                ),
                                              ),
                                              Tab(
                                                text: 'Chứng chỉ',
                                              ),
                                            ],
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 0.0, 8.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (_model.staffDetail?.userId
                                                          ?.role !=
                                                      '82073000-1ba2-43a4-a55c-459d17c23b68')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.location_city,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            'Chi nhánh: ${_model.staffDetail?.branchId?.name}',
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
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  if ((_model.staffDetail
                                                              ?.userId?.role !=
                                                          '82073000-1ba2-43a4-a55c-459d17c23b68') &&
                                                      (_model.staffDetail
                                                              ?.userId?.role ==
                                                          'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .home_work_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            'Bộ phận: ${_model.staffDetail?.departmentId?.name}',
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
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 6.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Xác nhận'),
                                                                      content: Text(
                                                                          'Bạn có muốn gọi số ${_model.staffDetail?.phone} không?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Hủy'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Xác nhận'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          await actions
                                                              .callScreen(
                                                            _model.staffDetail!
                                                                .phone,
                                                          );
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .phonelink_ring,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Số điện thoại: ${_model.staffDetail?.phone != null && _model.staffDetail?.phone != '' ? _model.staffDetail?.phone : 'Chưa có số điện thoại'}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                if (_model.staffDetail
                                                                            ?.phone !=
                                                                        null &&
                                                                    _model.staffDetail
                                                                            ?.phone !=
                                                                        '')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .phone_in_talk,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            26.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('Bạn có muốn gọi số ${_model.staffDetail?.phone} không?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Hủy'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Xác nhận'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await launchUrl(
                                                                              Uri(
                                                                            scheme:
                                                                                'tel',
                                                                            path:
                                                                                _model.staffDetail!.phone,
                                                                          ));
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
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
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () =>
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus(),
                                                                    child:
                                                                        ProfileStaffNewWidget(
                                                                      name: _model
                                                                          .staffDetail
                                                                          ?.userId
                                                                          ?.firstName,
                                                                      gender: _model
                                                                          .staffDetail
                                                                          ?.gender,
                                                                      phone: _model
                                                                          .staffDetail
                                                                          ?.phone,
                                                                      role: _model
                                                                          .staffDetail
                                                                          ?.title,
                                                                      image: _model
                                                                          .staffDetail
                                                                          ?.userId
                                                                          ?.avatar,
                                                                      email: _model
                                                                          .staffDetail
                                                                          ?.userId
                                                                          ?.email,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .keyboard_control,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              Text(
                                                                'Xem thêm thông tin',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (_model
                                                                  .staffDetail
                                                                  ?.userId
                                                                  ?.id ==
                                                              FFAppState()
                                                                  .user
                                                                  .id)
                                                            Expanded(
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'UpdateProfileUser',
                                                                    queryParameters:
                                                                        {
                                                                      'data':
                                                                          serializeParam(
                                                                        _model
                                                                            .dataStaff,
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                text:
                                                                    'Chỉnh sửa thông tin cá nhân',
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 48.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 0.0,
                                                                  ),
                                                                  hoverColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  hoverTextColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Thông tin giới thiệu',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        24.0),
                                                            child: Text(
                                                              _model.staffDetail
                                                                              ?.description !=
                                                                          null &&
                                                                      _model.staffDetail
                                                                              ?.description !=
                                                                          ''
                                                                  ? _model
                                                                      .staffDetail!
                                                                      .description
                                                                  : 'Chưa có thông tin giới thiệu',
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
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final listPrograms = _model
                                                      .staffDetail
                                                      ?.staffPrograms
                                                      ?.toList() ??
                                                  [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    listPrograms.length,
                                                    (listProgramsIndex) {
                                                  final listProgramsItem =
                                                      listPrograms[
                                                          listProgramsIndex];
                                                  return Visibility(
                                                    visible: listProgramsItem
                                                            .status !=
                                                        'done',
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  0.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (listProgramsItem
                                                                  .programId
                                                                  .certificateId
                                                                  .code !=
                                                              'certificate22')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 200.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Opacity(
                                                                                  opacity: 0.3,
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.emoji_events_rounded,
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Độc lập - Tự do - Hạnh phúc',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Nunito Sans',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                          child: Text(
                                                                                            'Chứng nhận',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                          child: Text(
                                                                                            FFAppState().user.firstName,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                          child: Text(
                                                                                            'Chức vụ: \"${getJsonField(
                                                                                              FFAppState().staffLogin,
                                                                                              r'''$.title''',
                                                                                            ).toString()}\"',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Đã hoàn thành: \"${listProgramsItem.programId.name}\"',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Nunito Sans',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Từ ngày ${dateTimeFormat(
                                                                                            "dd-MM-yyyy",
                                                                                            functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          )} đến ngày ${dateTimeFormat(
                                                                                            "dd-MM-yyyy",
                                                                                            functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          )}',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Nunito Sans',
                                                                                                fontSize: 8.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FontStyle.italic,
                                                                                              ),
                                                                                        ),
                                                                                        if ('1' == '2')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                    child: FaIcon(
                                                                                                      FontAwesomeIcons.medal,
                                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                                      size: 30.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            FFAppState().staffOrganization,
                                                                                                            r'''$.name''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Nunito Sans',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            'Giám đốc',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
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
                                                                                      ].divide(SizedBox(height: 3.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                          child: Image.network(
                                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                                              FFAppState().staffOrganization,
                                                                                              r'''$.logo''',
                                                                                            ).toString()}?access_token=${FFAppState().accessToken}',
                                                                                            width: 30.0,
                                                                                            height: 30.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 50.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                FFAppState().staffOrganization,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Nunito Sans',
                                                                                                    fontSize: 8.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await actions.screenCertificate(
                                                                                              context,
                                                                                              'Stack',
                                                                                              listProgramsItem.programId.name,
                                                                                              dateTimeFormat(
                                                                                                "dd-MM-yyyy",
                                                                                                functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              dateTimeFormat(
                                                                                                "dd-MM-yyyy",
                                                                                                functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                                                FFAppState().staffOrganization,
                                                                                                r'''$.logo''',
                                                                                              ).toString()}?access_token=${FFAppState().accessToken}',
                                                                                              getJsonField(
                                                                                                FFAppState().staffOrganization,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              FFAppState().user.firstName,
                                                                                              getJsonField(
                                                                                                FFAppState().staffLogin,
                                                                                                r'''$.title''',
                                                                                              ).toString(),
                                                                                            );
                                                                                          },
                                                                                          text: 'Ảnh',
                                                                                          icon: FaIcon(
                                                                                            FontAwesomeIcons.fileExport,
                                                                                            size: 12.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 25.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (listProgramsItem
                                                                  .programId
                                                                  .certificateId
                                                                  .code !=
                                                              'certificate22')
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Opacity(
                                                                    opacity:
                                                                        0.3,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                              FFAppState().staffOrganization,
                                                                              r'''$.logo''',
                                                                            ).toString()}?access_token=${FFAppState().accessToken}',
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            'Công ty TNHH A fgrfgfdg fgdfsgfds gfdgdfg gvsdfg sdfgsdg fdgsfds ',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Độc lập - Tự do - Hạnh phúc',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                              child: Text(
                                                                                'Chứng nhận',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                              child: Text(
                                                                                FFAppState().user.firstName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                              child: Text(
                                                                                'Chức vụ: \"${getJsonField(
                                                                                  FFAppState().staffLogin,
                                                                                  r'''$.title''',
                                                                                ).toString()}\"',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Đã hoàn thành \"${listProgramsItem.programId.name}\"',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Từ ngày ${dateTimeFormat(
                                                                                "dd-MM-yyyy",
                                                                                functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )} đến ngày ${dateTimeFormat(
                                                                                "dd-MM-yyyy",
                                                                                functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )}',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 8.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 3.0)),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              10.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await actions.screenCertificate1(
                                                                                context,
                                                                                'Stack',
                                                                                listProgramsItem.programId.name,
                                                                                dateTimeFormat(
                                                                                  "dd-MM-yyyy",
                                                                                  functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                dateTimeFormat(
                                                                                  "dd-MM-yyyy",
                                                                                  functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                                  FFAppState().staffOrganization,
                                                                                  r'''$.logo''',
                                                                                ).toString()}?access_token=${FFAppState().accessToken}',
                                                                                getJsonField(
                                                                                  FFAppState().staffOrganization,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                FFAppState().user.firstName,
                                                                                getJsonField(
                                                                                  FFAppState().staffLogin,
                                                                                  r'''$.title''',
                                                                                ).toString(),
                                                                              );
                                                                            },
                                                                            text:
                                                                                'Ảnh',
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.fileExport,
                                                                              size: 12.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 25.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Colors.white,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                              elevation: 3.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).divide(
                                                  SizedBox(height: 5.0),
                                                  filterFn:
                                                      (listProgramsIndex) {
                                                    final listProgramsItem =
                                                        listPrograms[
                                                            listProgramsIndex];
                                                    return listProgramsItem
                                                            .status !=
                                                        'done';
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.checkShow = '1';
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.info_outlined,
                                                  color: _model.checkShow == '1'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  size: 24.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Chi tiết',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              color: _model
                                                                          .checkShow ==
                                                                      '1'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 2.0,
                                          thickness: 1.0,
                                          color: _model.checkShow == '1'
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .noColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.checkShow = '2';
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.medal,
                                                  color: _model.checkShow == '2'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  size: 20.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Chứng chỉ',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              color: _model
                                                                          .checkShow ==
                                                                      '2'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 2.0,
                                          thickness: 1.0,
                                          color: _model.checkShow == '2'
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .noColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.checkShow == '1')
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (_model
                                                  .staffDetail?.userId?.role !=
                                              '82073000-1ba2-43a4-a55c-459d17c23b68')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.location_city,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    'Chi nhánh: ${_model.staffDetail?.branchId?.name}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          if ((_model.staffDetail?.userId
                                                      ?.role !=
                                                  '82073000-1ba2-43a4-a55c-459d17c23b68') &&
                                              (_model.staffDetail?.userId
                                                      ?.role ==
                                                  'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 6.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.home_work_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    'Bộ phận: ${_model.staffDetail?.departmentId?.name}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 6.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Xác nhận'),
                                                              content: Text(
                                                                  'Bạn có muốn gọi số ${_model.staffDetail?.phone} không?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Hủy'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Xác nhận'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await actions.callScreen(
                                                    _model.staffDetail!.phone,
                                                  );
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.phonelink_ring,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Số điện thoại: ${(_model.staffDetail?.phone != null && _model.staffDetail?.phone != '') && (_model.staffDetail?.phone != 'undefined') ? _model.staffDetail?.phone : 'Chưa có số điện thoại'}',
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
                                                        if ((_model.staffDetail
                                                                        ?.phone !=
                                                                    null &&
                                                                _model.staffDetail
                                                                        ?.phone !=
                                                                    '') &&
                                                            (_model.staffDetail
                                                                    ?.phone !=
                                                                'undefined'))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .phone_in_talk,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 26.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('Bạn có muốn gọi số ${_model.staffDetail?.phone} không?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Hủy'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Xác nhận'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  await launchUrl(
                                                                      Uri(
                                                                    scheme:
                                                                        'tel',
                                                                    path: _model
                                                                        .staffDetail!
                                                                        .phone,
                                                                  ));
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              child:
                                                                  ProfileStaffNewWidget(
                                                                name: _model
                                                                    .staffDetail
                                                                    ?.userId
                                                                    ?.firstName,
                                                                gender: _model
                                                                    .staffDetail
                                                                    ?.gender,
                                                                phone: _model
                                                                    .staffDetail
                                                                    ?.phone,
                                                                role: _model
                                                                    .staffDetail
                                                                    ?.title,
                                                                image: _model
                                                                    .staffDetail
                                                                    ?.userId
                                                                    ?.avatar,
                                                                email: _model
                                                                    .staffDetail
                                                                    ?.userId
                                                                    ?.email,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        'Xem thêm thông tin',
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
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (_model.staffDetail?.userId
                                                          ?.id ==
                                                      FFAppState().user.id)
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'UpdateProfileUser',
                                                            queryParameters: {
                                                              'data':
                                                                  serializeParam(
                                                                _model
                                                                    .dataStaff,
                                                                ParamType.JSON,
                                                              ),
                                                            }.withoutNulls,
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
                                                        text:
                                                            'Chỉnh sửa thông tin cá nhân',
                                                        icon: Icon(
                                                          Icons.edit_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 48.0,
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
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 0.0,
                                                          ),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'Thông tin giới thiệu',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                24.0),
                                                    child: Text(
                                                      _model.staffDetail
                                                                      ?.description !=
                                                                  null &&
                                                              _model.staffDetail
                                                                      ?.description !=
                                                                  ''
                                                          ? _model.staffDetail!
                                                              .description
                                                          : 'Chưa có thông tin giới thiệu',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ),
                                if (_model.checkShow == '2')
                                  Builder(
                                    builder: (context) {
                                      final listPrograms = _model
                                              .staffDetail?.staffPrograms
                                              ?.toList() ??
                                          [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(listPrograms.length,
                                                (listProgramsIndex) {
                                          final listProgramsItem =
                                              listPrograms[listProgramsIndex];
                                          return Visibility(
                                            visible: listProgramsItem.status ==
                                                'done',
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  if (listProgramsItem.programId
                                                          .certificateId.code !=
                                                      'certificate2')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        Opacity(
                                                                          opacity:
                                                                              0.3,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.emoji_events_rounded,
                                                                              color: FlutterFlowTheme.of(context).warning,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'Độc lập - Tự do - Hạnh phúc',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                  child: Text(
                                                                                    'Chứng nhận',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                  child: Text(
                                                                                    FFAppState().user.firstName,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                  child: Text(
                                                                                    'Chức vụ: \"${getJsonField(
                                                                                      FFAppState().staffLogin,
                                                                                      r'''$.title''',
                                                                                    ).toString()}\"',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Đã hoàn thành: \"${listProgramsItem.programId.name}\"',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'Từ ngày ${dateTimeFormat(
                                                                                    "dd-MM-yyyy",
                                                                                    functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )} đến ngày ${dateTimeFormat(
                                                                                    "dd-MM-yyyy",
                                                                                    functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                ),
                                                                                if ('1' == '2')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, -1.0),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.medal,
                                                                                              color: FlutterFlowTheme.of(context).warning,
                                                                                              size: 30.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    FFAppState().staffOrganization,
                                                                                                    r'''$.name''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Nunito Sans',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    'Giám đốc',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Nunito Sans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
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
                                                                              ].divide(SizedBox(height: 3.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                  child: Image.network(
                                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                                      FFAppState().staffOrganization,
                                                                                      r'''$.logo''',
                                                                                    ).toString()}?access_token=${FFAppState().accessToken}',
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    fit: BoxFit.cover,
                                                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                      'assets/images/error_image.png',
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        FFAppState().staffOrganization,
                                                                                        r'''$.name''',
                                                                                      ).toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 8.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await actions.screenCertificate(
                                                                                      context,
                                                                                      'Stack',
                                                                                      listProgramsItem.programId.name,
                                                                                      dateTimeFormat(
                                                                                        "dd-MM-yyyy",
                                                                                        functions.stringToDateTime(listProgramsItem.dateCreated),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      dateTimeFormat(
                                                                                        "dd-MM-yyyy",
                                                                                        functions.stringToDateTime(listProgramsItem.dateUpdated),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                                        FFAppState().staffOrganization,
                                                                                        r'''$.logo''',
                                                                                      ).toString()}?access_token=${FFAppState().accessToken}',
                                                                                      getJsonField(
                                                                                        FFAppState().staffOrganization,
                                                                                        r'''$.name''',
                                                                                      ).toString(),
                                                                                      FFAppState().user.firstName,
                                                                                      getJsonField(
                                                                                        FFAppState().staffLogin,
                                                                                        r'''$.title''',
                                                                                      ).toString(),
                                                                                    );
                                                                                  },
                                                                                  text: 'Ảnh',
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.fileExport,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 25.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          color: Colors.white,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (listProgramsItem.programId
                                                          .certificateId.code ==
                                                      'certificate2')
                                                    Container(
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Opacity(
                                                            opacity: 0.3,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                      FFAppState()
                                                                          .staffOrganization,
                                                                      r'''$.logo''',
                                                                    ).toString()}?access_token=${FFAppState().accessToken}',
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    'Công ty TNHH A fgrfgfdg fgdfsgfds gfdgdfg gvsdfg sdfgsdg fdgsfds ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              8.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Độc lập - Tự do - Hạnh phúc',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        'Chứng nhận',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        FFAppState()
                                                                            .user
                                                                            .firstName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Chức vụ: \"${getJsonField(
                                                                          FFAppState()
                                                                              .staffLogin,
                                                                          r'''$.title''',
                                                                        ).toString()}\"',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Đã hoàn thành \"${listProgramsItem.programId.name}\"',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'Từ ngày ${dateTimeFormat(
                                                                        "dd-MM-yyyy",
                                                                        functions
                                                                            .stringToDateTime(listProgramsItem.dateCreated),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} đến ngày ${dateTimeFormat(
                                                                        "dd-MM-yyyy",
                                                                        functions
                                                                            .stringToDateTime(listProgramsItem.dateUpdated),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          3.0)),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await actions
                                                                          .screenCertificate1(
                                                                        context,
                                                                        'Stack',
                                                                        listProgramsItem
                                                                            .programId
                                                                            .name,
                                                                        dateTimeFormat(
                                                                          "dd-MM-yyyy",
                                                                          functions
                                                                              .stringToDateTime(listProgramsItem.dateCreated),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        dateTimeFormat(
                                                                          "dd-MM-yyyy",
                                                                          functions
                                                                              .stringToDateTime(listProgramsItem.dateUpdated),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                                          FFAppState()
                                                                              .staffOrganization,
                                                                          r'''$.logo''',
                                                                        ).toString()}?access_token=${FFAppState().accessToken}',
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .staffOrganization,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        FFAppState()
                                                                            .user
                                                                            .firstName,
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .staffLogin,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                      );
                                                                    },
                                                                    text: 'Ảnh',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .fileExport,
                                                                      size:
                                                                          12.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          25.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).divide(
                                          SizedBox(height: 8.0),
                                          filterFn: (listProgramsIndex) {
                                            final listProgramsItem =
                                                listPrograms[listProgramsIndex];
                                            return listProgramsItem.status ==
                                                'done';
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                if ((_model.checkLoad == true) &&
                                    (_model.checkShow == '2') &&
                                    !(_model.staffDetail!.staffPrograms
                                        .where((e) => e.status == 'done')
                                        .toList()
                                        .isNotEmpty))
                                  Container(
                                    width: double.infinity,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.medal,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            size: 50.0,
                                          ),
                                        ),
                                        Text(
                                          'Bạn chưa có chứng chỉ nào!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_model.checkLoad == false)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.LoadingPageWidget(
                        width: double.infinity,
                        height: double.infinity,
                        size: 50.0,
                        color: FlutterFlowTheme.of(context).primary,
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
