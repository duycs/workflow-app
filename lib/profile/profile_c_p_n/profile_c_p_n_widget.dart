import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'profile_c_p_n_model.dart';
export 'profile_c_p_n_model.dart';

class ProfileCPNWidget extends StatefulWidget {
  const ProfileCPNWidget({super.key});

  @override
  State<ProfileCPNWidget> createState() => _ProfileCPNWidgetState();
}

class _ProfileCPNWidgetState extends State<ProfileCPNWidget> {
  late ProfileCPNModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCPNModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getLinkOrganization(context);
      setState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (_model.isLoad == true)
                              SizedBox(
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    InkWell(
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
                                                '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.avatar}?access_token=${FFAppState().accessToken}',
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag:
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.avatar}?access_token=${FFAppState().accessToken}',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag:
                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.avatar}?access_token=${FFAppState().accessToken}',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.avatar}?access_token=${FFAppState().accessToken}',
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 200.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 7.0,
                                              sigmaY: 2.0,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 800.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          1.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _model.organizationDetail !=
                                                                  null
                                                              ? _model
                                                                  .organizationDetail!
                                                                  .name
                                                              : '',
                                                          maxLines: 3,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    const TextSpan(
                                                                      text: '',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    const TextSpan(
                                                                      text:
                                                                          'Hotline: ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: (_model.organizationDetail?.hotline != null && _model.organizationDetail?.hotline != '') &&
                                                                              (_model.organizationDetail?.hotline !=
                                                                                  'undefined') &&
                                                                              (_model.organizationDetail?.hotline !=
                                                                                  'null')
                                                                          ? _model
                                                                              .organizationDetail!
                                                                              .hotline
                                                                          : 'Chưa có Hotline',
                                                                      style:
                                                                          const TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Liên hệ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Divider(
                                                          height: 16.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .home_work_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                                Text(
                                                                  (_model.organizationDetail?.branchs != null &&
                                                                              (_model.organizationDetail?.branchs)!.isNotEmpty) ==
                                                                          true
                                                                      ? '${_model.organizationDetail?.branchs.where((e) => (_model.organizationDetail!.branchs.isNotEmpty) && (e.status == 'published')).toList().length.toString()} Chi nhánh'
                                                                      : '0 Chi nhánh',
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
                                                              ].divide(const SizedBox(
                                                                  width: 2.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .groups_2_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                                Text(
                                                                  (_model.organizationDetail!.branchs.isNotEmpty) &&
                                                                          ((_model.organizationDetail?.branchs.where((e) => e.departments.where((e) => e.status == 'published').toList().isNotEmpty).toList() != null && (_model.organizationDetail?.branchs.where((e) => e.departments.where((e) => e.status == 'published').toList().isNotEmpty).toList())!.isNotEmpty) ==
                                                                              true)
                                                                      ? '${((List<int> var1) {
                                                                          return var1.reduce((a, b) =>
                                                                              a +
                                                                              b);
                                                                        }(_model.organizationDetail!.branchs.map((e) => e.departments.where((e) => e.status == 'published').toList().length).toList())).toString()} Bộ phận'
                                                                      : '0 Bộ phận',
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
                                                              ].divide(const SizedBox(
                                                                  width: 2.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .face_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                Text(
                                                                  _model.organizationDetail!.staffs.isNotEmpty
                                                                      ? '${valueOrDefault<String>(
                                                                          _model
                                                                              .organizationDetail
                                                                              ?.staffs
                                                                              .where((e) => e.status == 'active')
                                                                              .toList()
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        )} Nhân viên'
                                                                      : '0Nhân viên',
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
                                                              ].divide(const SizedBox(
                                                                  width: 2.0)),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ListBranchProfile',
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          const TransitionInfo(
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
                                                                child:
                                                                    Container(
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .groups_2_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Xem thông tin nhân sự',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Text(
                                                            'Ban lãnh đạo',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 44.0,
                                                                  height: 44.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            90.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              90.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.staffs.where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68').toList().first.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          _model
                                                                              .organizationDetail!
                                                                              .staffs
                                                                              .where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68')
                                                                              .toList()
                                                                              .first
                                                                              .userId
                                                                              .firstName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        _model
                                                                            .organizationDetail!
                                                                            .staffs
                                                                            .where((e) =>
                                                                                e.userId.role ==
                                                                                '82073000-1ba2-43a4-a55c-459d17c23b68')
                                                                            .toList()
                                                                            .first
                                                                            .userId
                                                                            .email,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      if ((_model.organizationDetail?.staffs.where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68').toList().first.title != null &&
                                                                              _model.organizationDetail?.staffs.where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68').toList().first.title !=
                                                                                  '') &&
                                                                          (_model.organizationDetail?.staffs.where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68').toList().first.title !=
                                                                              'null'))
                                                                        Text(
                                                                          _model
                                                                              .organizationDetail!
                                                                              .staffs
                                                                              .where((e) => e.userId.role == '82073000-1ba2-43a4-a55c-459d17c23b68')
                                                                              .toList()
                                                                              .first
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            1.0)),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        if (((_model.organizationDetail
                                                                            ?.staffs !=
                                                                        null &&
                                                                    (_model
                                                                            .organizationDetail
                                                                            ?.staffs)!
                                                                        .isNotEmpty) ==
                                                                true) &&
                                                            ((_model.organizationDetail?.staffs.where((e) => e.userId.role == 'a8d33527-375b-4599-ac70-6a3fcad1de39').toList() !=
                                                                        null &&
                                                                    (_model.organizationDetail?.staffs.where((e) => e.userId.role == 'a8d33527-375b-4599-ac70-6a3fcad1de39').toList())!
                                                                        .isNotEmpty) ==
                                                                true) &&
                                                            (_model.organizationDetail!
                                                                    .staffs
                                                                    .where((e) =>
                                                                        e.userId
                                                                            .role ==
                                                                        'a8d33527-375b-4599-ac70-6a3fcad1de39')
                                                                    .toList().isNotEmpty))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              height: 140.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final adminBranch = _model
                                                                            .organizationDetail
                                                                            ?.staffs
                                                                            .where((e) =>
                                                                                (e.userId.role == 'a8d33527-375b-4599-ac70-6a3fcad1de39') &&
                                                                                (e.status == 'active'))
                                                                            .toList()
                                                                            .toList() ??
                                                                        [];
                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          adminBranch
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          const SizedBox(
                                                                              width: 8.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              adminBranchIndex) {
                                                                        final adminBranchItem =
                                                                            adminBranch[adminBranchIndex];
                                                                        return Container(
                                                                          width:
                                                                              200.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: Color(0x34090F13),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(50.0),
                                                                                  child: Image.network(
                                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${adminBranchItem.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    adminBranchItem.userId.firstName,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                    child: Text(
                                                                                      adminBranchItem.userId.email,
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if ((adminBranchItem.title != '') && (adminBranchItem.title != 'null'))
                                                                                  Text(
                                                                                    adminBranchItem.title,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Nunito Sans',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Divider(
                                                          height: 16.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Thông tin giới thiệu',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        12.0,
                                                                        6.0,
                                                                        10.0),
                                                            child:
                                                                custom_widgets
                                                                    .HTMLView(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              html: (_model.organizationDetail?.description !=
                                                                              null &&
                                                                          _model
                                                                                  .organizationDetail?.description !=
                                                                              '') &&
                                                                      (_model.organizationDetail
                                                                              ?.description !=
                                                                          'undefined') &&
                                                                      (_model.organizationDetail
                                                                              ?.description !=
                                                                          'null') &&
                                                                      (_model.organizationDetail
                                                                              ?.description !=
                                                                          '<br>')
                                                                  ? functions.formatHtml(_model
                                                                      .organizationDetail!
                                                                      .description)
                                                                  : 'Chưa có thông tin giới thiệu',
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 16.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Địa chỉ',
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      6.0,
                                                                      10.0),
                                                          child: Text(
                                                            (_model.organizationDetail?.address !=
                                                                            null &&
                                                                        _model.organizationDetail?.address !=
                                                                            '') &&
                                                                    (_model.organizationDetail
                                                                            ?.address !=
                                                                        'undefined') &&
                                                                    (_model.organizationDetail
                                                                            ?.address !=
                                                                        'null')
                                                                ? _model
                                                                    .organizationDetail!
                                                                    .address
                                                                : 'Chưa có địa chỉ',
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
                                                        Divider(
                                                          height: 16.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Video giới thiệu',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                        if (_model
                                                                .organizationDetail
                                                                ?.video ==
                                                            '1fdaeaf9-74e3-42e9-94b5-acb9f3996949')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              'Chưa có video giới thiệu',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        if ((_model.organizationDetail
                                                                        ?.video !=
                                                                    null &&
                                                                _model.organizationDetail
                                                                        ?.video !=
                                                                    '') &&
                                                            (_model.organizationDetail
                                                                    ?.video !=
                                                                '1fdaeaf9-74e3-42e9-94b5-acb9f3996949'))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    FlutterFlowVideoPlayer(
                                                                  path:
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.video}?access_token=${FFAppState().accessToken}',
                                                                  videoType:
                                                                      VideoType
                                                                          .network,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 220.0,
                                                                  autoPlay:
                                                                      false,
                                                                  looping: true,
                                                                  showControls:
                                                                      true,
                                                                  allowFullScreen:
                                                                      true,
                                                                  allowPlaybackSpeedMenu:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (_model.organizationDetail
                                                                    ?.files !=
                                                                null &&
                                                            (_model.organizationDetail
                                                                    ?.files)!
                                                                .isNotEmpty)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (_model
                                                                        .organizationDetail!
                                                                        .files.isNotEmpty)
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag:
                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                            width:
                                                                                190.0,
                                                                            height:
                                                                                208.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (_model
                                                                              .organizationDetail!
                                                                              .files
                                                                              .length >=
                                                                          2)
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: FlutterFlowExpandedImageView(
                                                                                    image: Image.network(
                                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[1])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    allowRotation: false,
                                                                                    tag: '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[1])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                    useHeroAnimation: true,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Hero(
                                                                              tag: '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[1])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[1])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                  width: 160.0,
                                                                                  height: 100.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (_model
                                                                              .organizationDetail!
                                                                              .files
                                                                              .length >=
                                                                          3)
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: FlutterFlowExpandedImageView(
                                                                                    image: Image.network(
                                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[2])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    allowRotation: false,
                                                                                    tag: '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[2])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                    useHeroAnimation: true,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Hero(
                                                                              tag: '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[2])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  '${FFAppConstants.ApiBaseUrl}/assets/${(_model.organizationDetail?.files[2])?.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                                  width: 160.0,
                                                                                  height: 100.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        if ((_model
                                                                    .organizationDetail!
                                                                    .files.isNotEmpty) &&
                                                            (_model
                                                                .organizationDetail!
                                                                .files
                                                                .isNotEmpty) &&
                                                            (_model
                                                                    .organizationDetail!
                                                                    .files
                                                                    .length >
                                                                3))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Ảnh khác',
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
                                                        if ((_model
                                                                    .organizationDetail!
                                                                    .files.isNotEmpty) &&
                                                            (_model
                                                                .organizationDetail!
                                                                .files
                                                                .isNotEmpty) &&
                                                            (_model
                                                                    .organizationDetail!
                                                                    .files
                                                                    .length >
                                                                3))
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          50.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final images = _model
                                                                      .listImage
                                                                      .toList();
                                                                  return GridView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          3,
                                                                      crossAxisSpacing:
                                                                          5.0,
                                                                      mainAxisSpacing:
                                                                          5.0,
                                                                      childAspectRatio:
                                                                          1.0,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        images
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            imagesIndex) {
                                                                      final imagesItem =
                                                                          images[
                                                                              imagesIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            PageTransition(
                                                                              type: PageTransitionType.fade,
                                                                              child: FlutterFlowExpandedImageView(
                                                                                image: Image.network(
                                                                                  '${FFAppConstants.ApiBaseUrl}/assets/$imagesItem?access_token=${FFAppState().accessToken}',
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                                allowRotation: false,
                                                                                tag: '${FFAppConstants.ApiBaseUrl}/assets/$imagesItem?access_token=${FFAppState().accessToken}',
                                                                                useHeroAnimation: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Hero(
                                                                          tag:
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/$imagesItem?access_token=${FFAppState().accessToken}',
                                                                          transitionOnUserGestures:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/$imagesItem?access_token=${FFAppState().accessToken}',
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
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
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 23.0, 0.0, 0.0),
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
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.logo}?access_token=${FFAppState().accessToken}',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag:
                                                      '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.logo}?access_token=${FFAppState().accessToken}',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag:
                                                '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.logo}?access_token=${FFAppState().accessToken}',
                                            transitionOnUserGestures: true,
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${_model.organizationDetail?.logo}?access_token=${FFAppState().accessToken}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ].addToEnd(const SizedBox(height: 38.0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: const NavBarWidget(
                      selectedPageIndex: 4,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
