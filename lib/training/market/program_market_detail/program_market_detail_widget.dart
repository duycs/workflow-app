import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/payment_succes_exception_component/payment_succes_exception_component_widget.dart';
import '/payment/payment_success_component/payment_success_component_widget.dart';
import '/payment/waiting_process_component/waiting_process_component_widget.dart';
import '/training/order/order_create/order_create_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'program_market_detail_model.dart';
export 'program_market_detail_model.dart';

class ProgramMarketDetailWidget extends StatefulWidget {
  const ProgramMarketDetailWidget({
    super.key,
    String? idProgram,
    this.price,
  }) : this.idProgram = idProgram ?? '';

  final String idProgram;
  final String? price;

  @override
  State<ProgramMarketDetailWidget> createState() =>
      _ProgramMarketDetailWidgetState();
}

class _ProgramMarketDetailWidgetState extends State<ProgramMarketDetailWidget>
    with TickerProviderStateMixin {
  late ProgramMarketDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramMarketDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getOneProgram(context);
      setState(() {});
    });

    animationsMap.addAll({
      'blurOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chi tiết khóa học',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Icon(
                Icons.turned_in_outlined,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 30.0,
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: _model.dataGetOne != null,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.dataGetOne != null)
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Color(0x28000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 250.0,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 250.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
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
                                                      '${FFAppConstants.ApiBaseUrl}/assets/${_model.dataGetOne?.imageCover}?access_token=${FFAppState().accessToken}',
                                                      fit: BoxFit.contain,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    allowRotation: true,
                                                    tag:
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${_model.dataGetOne?.imageCover}?access_token=${FFAppState().accessToken}',
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag:
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${_model.dataGetOne?.imageCover}?access_token=${FFAppState().accessToken}',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${_model.dataGetOne?.imageCover}?access_token=${FFAppState().accessToken}',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 12.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 4.0,
                                                sigmaY: 4.0,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5.0,
                                                      color: Color(0x28000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .monetization_on,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                                if ((_model.dataGetOne !=
                                                                        null) &&
                                                                    (_model.dataGetOne?.price !=
                                                                            null &&
                                                                        _model.dataGetOne?.price !=
                                                                            '') &&
                                                                    (_model.dataGetOne
                                                                            ?.price !=
                                                                        '0'))
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text: (_model.dataGetOne != null) && (_model.dataGetOne?.price != null && _model.dataGetOne?.price != '')
                                                                                ? formatNumber(
                                                                                    functions.stringToInt(_model.dataGetOne!.price),
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  )
                                                                                : '',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                'đ',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              fontStyle: FontStyle.normal,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '   ',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 12.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((_model.dataGetOne !=
                                                                        null) &&
                                                                    (_model.dataGetOne?.price !=
                                                                            null &&
                                                                        _model.dataGetOne?.price !=
                                                                            '') &&
                                                                    (_model.dataGetOne
                                                                            ?.price ==
                                                                        '0'))
                                                                  Text(
                                                                    'Miễn phí',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${formatNumber(
                                                                      functions.stringToInt(_model
                                                                          .dataGetOne!
                                                                          .orderCount
                                                                          .toString()),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                    )} đã bán',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .dataGetOne!
                                                                    .reacts
                                                                    .length >
                                                                0)
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (_model
                                                                            .dataGetOne!
                                                                            .reacts
                                                                            .length >
                                                                        0)
                                                                      Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    if (_model
                                                                            .dataGetOne!
                                                                            .reacts
                                                                            .length >
                                                                        0)
                                                                      Text(
                                                                        _model.dataGetOne!.reacts.length >
                                                                                0
                                                                            ? formatNumber(
                                                                                (List<String> listItem) {
                                                                                  return listItem.map(int.parse).reduce((value, element) => value + element) / listItem.length;
                                                                                }(_model.dataGetOne!.reacts.map((e) => e.reactsId.status).toList()),
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                              )
                                                                            : '0',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 65.0,
                                                        height: 28.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'HOT',
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'blurOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          '${FFAppConstants.ApiBaseUrl}/assets/${_model.dataGetOne?.authorId?.avatar}?access_token=${FFAppState().accessToken}',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            'assets/images/error_image.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Tác giả:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          _model.dataGetOne!.authorId.alias,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    _model.dataGetOne!.name,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.domain,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'Lĩnh vực:',
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        _model.dataGetOne!.domainId.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 6.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.category,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'Danh mục:',
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        _model.dataGetOne!.categoryId.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 6.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.description_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            _model.dataGetOne!.description,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
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
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Danh sách bài học',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.videocam_outlined,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  '${_model.dataGetOne?.lessions?.length?.toString()} bài học',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Builder(
                            builder: (context) {
                              final listLessons =
                                  _model.dataGetOne?.lessions?.toList() ?? [];

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listLessons.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 8.0),
                                itemBuilder: (context, listLessonsIndex) {
                                  final listLessonsItem =
                                      listLessons[listLessonsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${listLessonsItem.lessionsId.imageCover}?access_token=${FFAppState().accessToken}',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  listLessonsItem
                                                      .lessionsId.name,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                listLessonsItem
                                                    .lessionsId.description,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (listLessonsItem
                                                          .lessionsId.status ==
                                                      'trial')
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'LessonDetail',
                                                          queryParameters: {
                                                            'idLesson':
                                                                serializeParam(
                                                              listLessonsItem
                                                                  .lessionsId
                                                                  .id,
                                                              ParamType.String,
                                                            ),
                                                            'checkPage':
                                                                serializeParam(
                                                              'lessonMarket',
                                                              ParamType.String,
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
                                                      child: Text(
                                                        'Xem trước',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  if ((listLessonsItem
                                                              .lessionsId
                                                              .status !=
                                                          'trial') &&
                                                      (widget!.price == '0'))
                                                    Text(
                                                      'Áp dụng để xem',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  if ((listLessonsItem
                                                              .lessionsId
                                                              .status !=
                                                          'trial') &&
                                                      ((listLessonsItem
                                                                  .lessionsId
                                                                  .status !=
                                                              'trial') &&
                                                          (widget!.price !=
                                                              '0')))
                                                    Text(
                                                      'Mua để xem',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((_model.dataGetOne?.price == '0') &&
                  (_model.dataGetOne?.authorId?.organizationId !=
                      getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.id''',
                      ).toString()))
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (functions.isRoleStaff(FFAppState().user))
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Thông báo!'),
                                            content: Text(
                                                'Áp dụng khoá học cho cá nhân'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Huỷ'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Xác nhận'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await _model.postStaffsProgramsFree(context);
                                setState(() {});
                              } else {
                                return;
                              }
                            },
                            text: 'Áp dụng cho cá nhân',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
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
                      if (functions.isRoleAdminGroup(FFAppState().user))
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Thông báo!'),
                                            content: Text(
                                                'Áp dụng khoá học cho tổ chức'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Huỷ'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Xác nhận'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await _model.postCopyStaffPrograms(context);
                                setState(() {});
                              } else {
                                return;
                              }
                            },
                            text: 'Áp dụng cho tổ chức',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
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
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              if ((_model.dataGetOne?.price != '0') &&
                  (_model.dataGetOne?.authorId?.organizationId !=
                      getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.id''',
                      ).toString()) &&
                  ((isiOS &&
                          (_model.dataGetOne?.iapAppleProductId != null &&
                              _model.dataGetOne?.iapAppleProductId != '')) ||
                      (isAndroid &&
                          (_model.dataGetOne?.iapGoogleProductId != null &&
                              _model.dataGetOne?.iapGoogleProductId != ''))))
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (functions.isRoleStaff(FFAppState().user))
                        Expanded(
                          child: Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (isAndroid) {
                                  // Mở widget thanh toán IAP
                                  _model.paymentResponseGoogle =
                                      await actions.openGoogleInAppPurchases(
                                    () {
                                      if (isiOS) {
                                        return _model
                                            .dataGetOne!.iapAppleProductId;
                                      } else if (isAndroid) {
                                        return _model
                                            .dataGetOne!.iapGoogleProductId;
                                      } else {
                                        return '';
                                      }
                                    }(),
                                    true,
                                  );
                                  _shouldSetState = true;
                                  _model.inAppPurchaseResponse =
                                      InAppPurchaseResponseStruct.maybeFromMap(
                                          functions.stringToJson(_model
                                              .paymentResponseGoogle!
                                              .toString()));
                                  setState(() {});
                                } else if (isiOS) {
                                  _model.paymentResponseApple =
                                      await actions.openAppleInAppPurchases(
                                    () {
                                      if (isiOS) {
                                        return _model
                                            .dataGetOne!.iapAppleProductId;
                                      } else if (isAndroid) {
                                        return _model
                                            .dataGetOne!.iapGoogleProductId;
                                      } else {
                                        return '';
                                      }
                                    }(),
                                    true,
                                  );
                                  _shouldSetState = true;
                                  _model.inAppPurchaseResponse =
                                      InAppPurchaseResponseStruct.maybeFromMap(
                                          functions.stringToJson(_model
                                              .paymentResponseApple!
                                              .toString()));
                                  setState(() {});
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Phương thức thanh toán không khả dụng.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_model.inAppPurchaseResponse?.error?.code ==
                                    '01') {
                                  // Lỗi IAP không khả dụng
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(_model
                                            .inAppPurchaseResponse!
                                            .error
                                            .message),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (_model
                                        .inAppPurchaseResponse?.error?.code ==
                                    '02') {
                                  // Lỗi sản phẩm không khả dụng
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(_model
                                            .inAppPurchaseResponse!
                                            .error
                                            .message),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (getJsonField(
                                      _model.iapPaymentResponse,
                                      r'''$.error''',
                                    ) ==
                                    null) {
                                  // Mở layout loading
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child:
                                                WaitingProcessComponentWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  // Tạo đơn hàng
                                  _model.apiResultOrderCreate =
                                      await _model.orderCreate(
                                    context,
                                    checkType: 'staff',
                                    quantity: _model
                                        .inAppPurchaseResponse
                                        ?.verificationData
                                        ?.localVerificationData
                                        ?.quantity,
                                  );
                                  _shouldSetState = true;
                                  if (_model.apiResultOrderCreate!) {
                                    Navigator.pop(context);
                                    // Mở dialog thanh toán thành công
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child:
                                                  PaymentSuccessComponentWidget(
                                                programId:
                                                    _model.dataGetOne!.id,
                                                checkType: '1',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    // Mở dialog tạo đơn thất bại
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child:
                                                  PaymentSuccesExceptionComponentWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error code'),
                                        content: Text(valueOrDefault<String>(
                                          _model.inAppPurchaseResponse?.error
                                              ?.code,
                                          'Null',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Thanh toán không thành công. Bạn vui lòng liên hệ Hotline để được hỗ trợ!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Mua cho cá nhân',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ),
                      if (false)
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: OrderCreateWidget(
                                      image: _model.dataGetOne?.imageCover,
                                      price: _model.dataGetOne?.price,
                                      name: _model.dataGetOne?.name,
                                      numOfListLessions:
                                          _model.dataGetOne?.lessions?.length,
                                      author:
                                          _model.dataGetOne?.authorId?.alias,
                                      programId: widget!.idProgram,
                                      checkType: 'staff',
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Mua cho cá nhân',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      if (functions.isRoleAdminGroup(FFAppState().user))
                        Expanded(
                          child: Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (isAndroid) {
                                  // Mở widget thanh toán IAP
                                  _model.paymentResponseGoogleOrg =
                                      await actions.openGoogleInAppPurchases(
                                    () {
                                      if (isiOS) {
                                        return _model
                                            .dataGetOne!.iapAppleProductId;
                                      } else if (isAndroid) {
                                        return _model
                                            .dataGetOne!.iapGoogleProductId;
                                      } else {
                                        return '';
                                      }
                                    }(),
                                    true,
                                  );
                                  _shouldSetState = true;
                                  _model.inAppPurchaseResponse =
                                      InAppPurchaseResponseStruct.maybeFromMap(
                                          functions.stringToJson(_model
                                              .paymentResponseGoogleOrg!
                                              .toString()));
                                  setState(() {});
                                } else if (isiOS) {
                                  _model.paymentResponseAppleOrg =
                                      await actions.openAppleInAppPurchases(
                                    () {
                                      if (isiOS) {
                                        return _model
                                            .dataGetOne!.iapAppleProductId;
                                      } else if (isAndroid) {
                                        return _model
                                            .dataGetOne!.iapGoogleProductId;
                                      } else {
                                        return '';
                                      }
                                    }(),
                                    true,
                                  );
                                  _shouldSetState = true;
                                  _model.inAppPurchaseResponse =
                                      InAppPurchaseResponseStruct.maybeFromMap(
                                          functions.stringToJson(_model
                                              .paymentResponseAppleOrg!
                                              .toString()));
                                  setState(() {});
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Phương thức thanh toán không khả dụng.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_model.inAppPurchaseResponse?.error?.code ==
                                    '01') {
                                  // Lỗi IAP không khả dụng
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(_model
                                            .inAppPurchaseResponse!
                                            .error
                                            .message),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (_model
                                        .inAppPurchaseResponse?.error?.code ==
                                    '02') {
                                  // Lỗi sản phẩm không khả dụng
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(_model
                                            .inAppPurchaseResponse!
                                            .error
                                            .message),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (getJsonField(
                                      _model.iapPaymentResponse,
                                      r'''$.error''',
                                    ) ==
                                    null) {
                                  // Mở layout loading
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child:
                                                WaitingProcessComponentWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  // Tạo đơn hàng
                                  _model.apiResultOrderCreateOrg =
                                      await _model.orderCreate(
                                    context,
                                    checkType: 'organization',
                                    quantity: _model
                                        .inAppPurchaseResponse
                                        ?.verificationData
                                        ?.localVerificationData
                                        ?.quantity,
                                  );
                                  _shouldSetState = true;
                                  if (_model.apiResultOrderCreateOrg!) {
                                    Navigator.pop(context);
                                    // Mở dialog thanh toán thành công
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child:
                                                  PaymentSuccessComponentWidget(
                                                programId:
                                                    _model.dataGetOne!.id,
                                                checkType: '0',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    // Mở dialog tạo đơn thất bại
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child:
                                                  PaymentSuccesExceptionComponentWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Thanh toán không thành công. Bạn vui lòng liên hệ Hotline để được hỗ trợ!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Mua cho tổ chức',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
