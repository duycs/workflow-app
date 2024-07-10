import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/form_field_controller.dart';
import '/news_feed/action_newsfeed/action_newsfeed_widget.dart';
import '/news_feed/comment_newsfeed/comment_newsfeed_widget.dart';
import '/news_feed/d_n_f_newsfeed/d_n_f_newsfeed_widget.dart';
import '/news_feed/newsfeed_create/newsfeed_create_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'newsfeed_model.dart';
export 'newsfeed_model.dart';

class NewsfeedWidget extends StatefulWidget {
  const NewsfeedWidget({super.key});

  @override
  State<NewsfeedWidget> createState() => _NewsfeedWidgetState();
}

class _NewsfeedWidgetState extends State<NewsfeedWidget>
    with TickerProviderStateMixin {
  late NewsfeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsfeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.newsfeedListRequire(context);
      setState(() {});
      _model.isLoad = true;
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
          title: Text(
            'Bảng tin',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if ('1' == '2')
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                17.0, 0.0, 17.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: const [
                                ChipData('Tổ chức'),
                                ChipData('Chi nhánh'),
                                ChipData('Bộ phận')
                              ],
                              onChanged: (val) async {
                                setState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                _model.isLoad = false;
                                setState(() {});
                                setState(() =>
                                    _model.listViewPagingController?.refresh());
                                await _model.newsfeedListRequire(context);
                                setState(() {});
                                _model.isLoad = true;
                                setState(() {});
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0x00000000),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: const Color(0x00000000),
                                iconSize: 0.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: const Color(0x00000000),
                                iconSize: 0.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 0.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.spaceAround,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['Tổ chức'],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  height: 56.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            padding: const EdgeInsets.all(4.0),
                            tabs: const [
                              Tab(
                                text: 'Tổ chức',
                              ),
                              Tab(
                                text: 'Chi nhánh',
                              ),
                              Tab(
                                text: 'Bộ phận',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {
                                  _model.isLoad = false;
                                  setState(() {});
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  await _model.newsfeedListRequire(context);
                                  setState(() {});
                                  _model.isLoad = true;
                                  setState(() {});
                                },
                                () async {
                                  _model.isLoad = false;
                                  setState(() {});
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  await _model.newsfeedListRequire(context);
                                  setState(() {});
                                  _model.isLoad = true;
                                  setState(() {});
                                },
                                () async {
                                  _model.isLoad = false;
                                  setState(() {});
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  await _model.newsfeedListRequire(context);
                                  setState(() {});
                                  _model.isLoad = true;
                                  setState(() {});
                                }
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Container(),
                              Container(),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 4.0, 0.0),
                                child: Text(
                                  'Tin tức yêu cầu đọc',
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
                              if (_model.newsfeedPublished.length > 5)
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'NewsfeedListRequire',
                                        queryParameters: {
                                          'checkScope': serializeParam(
                                            () {
                                              if (_model.tabBarCurrentIndex ==
                                                  0) {
                                                return 'Tổ chức';
                                              } else if (_model
                                                      .tabBarCurrentIndex ==
                                                  1) {
                                                return 'Chi nhánh';
                                              } else {
                                                return 'Bộ phận';
                                              }
                                            }(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Text(
                                      '(Xem thêm)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ),
                              Container(
                                width: 1.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                () {
                                  if (_model.tabBarCurrentIndex == 0) {
                                    return true;
                                  } else if ((_model.tabBarCurrentIndex == 1) &&
                                      (FFAppState().user.role !=
                                          '82073000-1ba2-43a4-a55c-459d17c23b68')) {
                                    return true;
                                  } else if ((_model.tabBarCurrentIndex == 2) &&
                                      ((FFAppState().user.role ==
                                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') ||
                                          (FFAppState().user.role ==
                                              '3755a98d-f064-45cd-80e4-5084ab1dd2c4'))) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }(),
                                false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 90.0,
                                    buttonSize: 40.0,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: NewsfeedCreateWidget(
                                                checkRequire: 'require',
                                                checkScope: () {
                                                  if (_model
                                                          .tabBarCurrentIndex ==
                                                      0) {
                                                    return 0;
                                                  } else if (_model
                                                          .tabBarCurrentIndex ==
                                                      1) {
                                                    return 1;
                                                  } else {
                                                    return 2;
                                                  }
                                                }(),
                                                callback: () async {
                                                  await _model
                                                      .newsfeedListRequire(
                                                          context);

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if ((_model.newsfeedPublished.isNotEmpty) &&
                            (_model.isLoad == true))
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if ('1' == '2')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 16.0),
                                    child: Builder(
                                      builder: (context) {
                                        final newsfeedRequire =
                                            _model.newsfeedPublished.toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                newsfeedRequire.length,
                                                (newsfeedRequireIndex) {
                                              final newsfeedRequireItem =
                                                  newsfeedRequire[
                                                      newsfeedRequireIndex];
                                              return Visibility(
                                                visible:
                                                    newsfeedRequireIndex < 5,
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
                                                    context.pushNamed(
                                                      'NewsfeedDetail',
                                                      queryParameters: {
                                                        'newsfeedId':
                                                            serializeParam(
                                                          newsfeedRequireItem
                                                              .id,
                                                          ParamType.String,
                                                        ),
                                                        'checkpage':
                                                            serializeParam(
                                                          'newsfeed',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 180.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: SizedBox(
                                                      height: 190.0,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 210.0,
                                                              height: 200.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  image: Image
                                                                      .network(
                                                                    newsfeedRequireItem.images.isNotEmpty
                                                                        ? '${FFAppConstants.ApiBaseUrl}/assets/${newsfeedRequireItem.images.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                                        : ' ',
                                                                  ).image,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .noColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                  ],
                                                                  stops: const [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      const AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  newsfeedRequireItem
                                                                      .title,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  newsfeedRequireItem
                                                                      .content,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .chat_bubble_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          newsfeedRequireItem
                                                                              .comments
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          newsfeedRequireItem
                                                                              .reacts
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          2.0)),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(
                                              const SizedBox(width: 16.0),
                                              filterFn: (newsfeedRequireIndex) {
                                                final newsfeedRequireItem =
                                                    newsfeedRequire[
                                                        newsfeedRequireIndex];
                                                return newsfeedRequireIndex < 5;
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if ((_model.newsfeedPublished.length > 5) &&
                                    ('1' == '2'))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'NewsfeedListRequire',
                                        queryParameters: {
                                          'checkScope': serializeParam(
                                            _model.choiceChipsValue,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Xem tất cả',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ),
                        if ((_model.newsfeedPublished.isNotEmpty) &&
                            (_model.isLoad == true))
                          Container(
                            height: 200.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 1.0),
                              child: Builder(
                                builder: (context) {
                                  final newsfeedRequireList =
                                      _model.newsfeedPublished.toList();

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 180.0,
                                    child: CarouselSlider.builder(
                                      itemCount: newsfeedRequireList.length,
                                      itemBuilder: (context,
                                          newsfeedRequireListIndex, _) {
                                        final newsfeedRequireListItem =
                                            newsfeedRequireList[
                                                newsfeedRequireListIndex];
                                        return Stack(
                                          children: [
                                            if (newsfeedRequireListIndex < 5)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsfeedDetail',
                                                    queryParameters: {
                                                      'newsfeedId':
                                                          serializeParam(
                                                        newsfeedRequireListItem
                                                            .id,
                                                        ParamType.String,
                                                      ),
                                                      'checkpage':
                                                          serializeParam(
                                                        'newsfeed',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        newsfeedRequireListItem
                                                                    .images.isNotEmpty
                                                            ? '${FFAppConstants.ApiBaseUrl}/assets/${newsfeedRequireListItem.images.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                            : ' ',
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: SizedBox(
                                                    height: 190.0,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/2vqf7_',
                                                                ).image,
                                                              ),
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .noColor,
                                                                  Colors.black
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                newsfeedRequireListItem
                                                                    .title,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                newsfeedRequireListItem
                                                                    .content,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .chat_bubble_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        newsfeedRequireListItem
                                                                            .comments
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        newsfeedRequireListItem
                                                                            .reacts
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        2.0)),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((_model.newsfeedPublished
                                                        .length >
                                                    5) &&
                                                (newsfeedRequireListIndex == 5))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsfeedListRequire',
                                                    queryParameters: {
                                                      'checkScope':
                                                          serializeParam(
                                                        () {
                                                          if (_model
                                                                  .tabBarCurrentIndex ==
                                                              0) {
                                                            return 'Tổ chức';
                                                          } else if (_model
                                                                  .tabBarCurrentIndex ==
                                                              1) {
                                                            return 'Chi nhánh';
                                                          } else {
                                                            return 'Bộ phận';
                                                          }
                                                        }(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Xem tất cả',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage: max(
                                            0,
                                            min(
                                                1,
                                                newsfeedRequireList.length -
                                                    1)),
                                        viewportFraction: 0.5,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.4,
                                        enableInfiniteScroll: false,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        if (_model.isLoad == false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 56.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SizedBox(
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
                          ),
                        if ((_model.newsfeedPublished.isEmpty) &&
                            (_model.isLoad == true))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: wrapWithModel(
                              model: _model.dNFNewsfeedModel,
                              updateCallback: () => setState(() {}),
                              child: const DNFNewsfeedWidget(),
                            ),
                          ),
                        if ('1' == '2')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      height: 27.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            '#liênhoan',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      height: 27.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            '#giảiđấu',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      height: 27.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            '#đàotạo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 8.0))
                                    .addToStart(const SizedBox(width: 16.0))
                                    .addToEnd(const SizedBox(width: 16.0)),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 6.0),
                                child: Text(
                                  'Tất cả',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                () {
                                  if (_model.tabBarCurrentIndex == 0) {
                                    return true;
                                  } else if ((_model.tabBarCurrentIndex == 1) &&
                                      (FFAppState().user.role !=
                                          '82073000-1ba2-43a4-a55c-459d17c23b68')) {
                                    return true;
                                  } else if ((_model.tabBarCurrentIndex == 2) &&
                                      ((FFAppState().user.role ==
                                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') ||
                                          (FFAppState().user.role ==
                                              '3755a98d-f064-45cd-80e4-5084ab1dd2c4'))) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }(),
                                false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 90.0,
                                    buttonSize: 40.0,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: NewsfeedCreateWidget(
                                                checkRequire: 'published',
                                                checkScope: () {
                                                  if (_model
                                                          .tabBarCurrentIndex ==
                                                      0) {
                                                    return 0;
                                                  } else if (_model
                                                          .tabBarCurrentIndex ==
                                                      1) {
                                                    return 1;
                                                  } else {
                                                    return 2;
                                                  }
                                                }(),
                                                callback: () async {
                                                  setState(() => _model
                                                      .listViewPagingController
                                                      ?.refresh());

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                        //
                        // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                        PagedListView<ApiPagingParams, dynamic>(
                          pagingController: _model.setListViewController(
                            (nextPageMarker) =>
                                NewsfeedGroup.newsfeedListCall.call(
                              accessToken: FFAppState().accessToken,
                              filter: () {
                                if (_model.tabBarCurrentIndex == 0) {
                                  return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                    FFAppState().staffOrganization,
                                    r'''$.id''',
                                  ).toString()}\"}}},{\"branch_id\":{\"_null\":true}},{\"department_id\":{\"_null\":true}},{\"status\":{\"_eq\":\"published\"}}]}';
                                } else if (_model.tabBarCurrentIndex == 1) {
                                  return () {
                                    if (FFAppState().user.role ==
                                        '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffBranch,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"_null\":true}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffBranch,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"_null\":true}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffBranch,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        '82073000-1ba2-43a4-a55c-459d17c23b68') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"branch_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else {
                                      return ' ';
                                    }
                                  }();
                                } else if (_model.tabBarCurrentIndex == 2) {
                                  return () {
                                    if (FFAppState().user.role ==
                                        '3755a98d-f064-45cd-80e4-5084ab1dd2c4') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffDepartment,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffDepartment,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffBranch,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else if (FFAppState().user.role ==
                                        '82073000-1ba2-43a4-a55c-459d17c23b68') {
                                      return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                        FFAppState().staffOrganization,
                                        r'''$.id''',
                                      ).toString()}\"}}},{\"department_id\":{\"_nnull\":true}},{\"status\":{\"_eq\":\"published\"}}]}';
                                    } else {
                                      return ' ';
                                    }
                                  }();
                                } else {
                                  return ' ';
                                }
                              }(),
                              limit: 20,
                              offset: nextPageMarker.nextPageNumber * 20,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            70.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) =>
                                const DNFNewsfeedWidget(),
                            itemBuilder: (context, _, newsfeedIndex) {
                              final newsfeedItem = _model
                                  .listViewPagingController!
                                  .itemList![newsfeedIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
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
                                                      'ProfileUserNew',
                                                      queryParameters: {
                                                        'staffId':
                                                            serializeParam(
                                                          newsfeedItem
                                                              .userCreated
                                                              .staffs
                                                              .first
                                                              .id,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90.0),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90.0),
                                                        child: Image.network(
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${newsfeedItem.userCreated.avatar}?access_token=${FFAppState().accessToken}',
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          newsfeedItem
                                                              .userCreated
                                                              .firstName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            'relative',
                                                            functions
                                                                .stringToDateTime(
                                                                    newsfeedItem
                                                                        .dateCreated),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (newsfeedItem
                                                        .userCreated.id ==
                                                    FFAppState().user.id)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.keyboard_control,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ActionNewsfeedWidget(
                                                                newsFeedList:
                                                                    newsfeedItem,
                                                                checkPage:
                                                                    'newsfeed',
                                                                callback:
                                                                    () async {
                                                                  setState(() => _model
                                                                      .listViewPagingController
                                                                      ?.refresh());
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (newsfeedItem.title != null &&
                                              newsfeedItem.title != '')
                                            Text(
                                              newsfeedItem.title,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          if ((_model.newsfeedPublished
                                                  .isNotEmpty) &&
                                              (newsfeedItem != null) &&
                                              (newsfeedItem.content != null &&
                                                  newsfeedItem.content != '') &&
                                              ((newsfeedItem.videos.length >
                                                      0) ||
                                                  (newsfeedItem.files.length >
                                                      0)))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'NewsfeedDetail',
                                                  queryParameters: {
                                                    'newsfeedId':
                                                        serializeParam(
                                                      newsfeedItem.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          newsfeedItem.content,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                              ),
                                            ),
                                          if ((_model.newsfeedPublished
                                                  .isNotEmpty) &&
                                              (newsfeedItem != null) &&
                                              (newsfeedItem.content != null &&
                                                  newsfeedItem.content != '') &&
                                              ((newsfeedItem.videos.length >
                                                      0) ||
                                                  (newsfeedItem.files.length >
                                                      0)))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsfeedDetail',
                                                    queryParameters: {
                                                      'newsfeedId':
                                                          serializeParam(
                                                        newsfeedItem.id,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: const [
                                                      TextSpan(
                                                        text: 'Xem thêm... ',
                                                        style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          if ((_model.newsfeedPublished
                                                  .isNotEmpty) &&
                                              (newsfeedItem != null) &&
                                              (newsfeedItem.content != null &&
                                                  newsfeedItem.content != '') &&
                                              ((newsfeedItem.videos.length ==
                                                      0) &&
                                                  (newsfeedItem.files.length ==
                                                      0)))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: custom_widgets.FormatText(
                                                width: 100.0,
                                                height: 100.0,
                                                number: 90,
                                                text: newsfeedItem.content,
                                                action: () async {
                                                  context.pushNamed(
                                                    'NewsfeedDetail',
                                                    queryParameters: {
                                                      'newsfeedId':
                                                          serializeParam(
                                                        newsfeedItem.id,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (newsfeedItem.images.length > 0)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final imageList =
                                                        newsfeedItem.images
                                                            .toList();

                                                    return MasonryGridView
                                                        .builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                      crossAxisSpacing: 6.0,
                                                      mainAxisSpacing: 6.0,
                                                      itemCount:
                                                          imageList.length,
                                                      shrinkWrap: true,
                                                      itemBuilder: (context,
                                                          imageListIndex) {
                                                        final imageListItem =
                                                            imageList[
                                                                imageListIndex];
                                                        return Visibility(
                                                          visible:
                                                              imageListIndex <
                                                                  6,
                                                          child: Stack(
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
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag:
                                                                            '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${imageListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          150.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((newsfeedItem
                                                                          .images
                                                                          .length >
                                                                      6) &&
                                                                  (imageListIndex ==
                                                                      5))
                                                                Opacity(
                                                                  opacity: 0.7,
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
                                                                      context
                                                                          .pushNamed(
                                                                        'NewsfeedDetail',
                                                                        queryParameters:
                                                                            {
                                                                          'newsfeedId':
                                                                              serializeParam(
                                                                            newsfeedItem.id,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
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
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '+${formatNumber(
                                                                          newsfeedItem.images.length -
                                                                              6,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.commaDecimal,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          if ((newsfeedItem.videos.length >
                                                  0) &&
                                              ('1' == '2'))
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Visibility(
                                                visible: (newsfeedItem
                                                            .videos.length >
                                                        0) &&
                                                    ('1' == '2'),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final videoList =
                                                          newsfeedItem.videos
                                                              .toList();

                                                      return MasonryGridView
                                                          .builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        gridDelegate:
                                                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                        ),
                                                        crossAxisSpacing: 6.0,
                                                        mainAxisSpacing: 6.0,
                                                        itemCount:
                                                            videoList.length,
                                                        shrinkWrap: true,
                                                        itemBuilder: (context,
                                                            videoListIndex) {
                                                          final videoListItem =
                                                              videoList[
                                                                  videoListIndex];
                                                          return FlutterFlowVideoPlayer(
                                                            path:
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${videoListItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                            videoType: VideoType
                                                                .network,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            autoPlay: false,
                                                            looping: true,
                                                            showControls: true,
                                                            allowFullScreen:
                                                                true,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 6.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child:
                                                              CommentNewsfeedWidget(
                                                            comment:
                                                                newsfeedItem
                                                                    .comments,
                                                            id: newsfeedItem.id,
                                                            callBack: () async {
                                                              await _model
                                                                  .newsfeedListRequire(
                                                                      context);

                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    const Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFF40A0A),
                                                      size: 18.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          newsfeedItem
                                                              .reacts.length
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.comment,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          newsfeedItem
                                                              .comments.length
                                                              .toString(),
                                                          '0',
                                                        )} bình luận',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 3.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Cập nhật yêu thích
                                              if (newsfeedItem.reacts
                                                      .where((e) =>
                                                          e.reactsId.staffId ==
                                                          FFAppState().staffid)
                                                      .toList()
                                                      .length ==
                                                  0)
                                                Semantics(
                                                  label: 'Yêu thích',
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
                                                      await _model
                                                          .reactNewsfeed(
                                                        context,
                                                        newsId: newsfeedItem.id,
                                                      );
                                                      setState(() {});
                                                      setState(() => _model
                                                          .listViewPagingController
                                                          ?.refresh());
                                                      await _model
                                                          .waitForOnePageForListView();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Thích',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (newsfeedItem.reacts
                                                      .where((e) =>
                                                          e.reactsId.staffId ==
                                                          FFAppState().staffid)
                                                      .toList()
                                                      .length >
                                                  0)
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
                                                    await _model
                                                        .reactNewsfeedDelete(
                                                      context,
                                                      reactId: newsfeedItem
                                                          .reacts
                                                          .where((e) =>
                                                              e.reactsId
                                                                  .staffId ==
                                                              FFAppState()
                                                                  .staffid)
                                                          .toList()
                                                          .first
                                                          .id,
                                                    );
                                                    setState(() {});
                                                    setState(() => _model
                                                        .listViewPagingController
                                                        ?.refresh());
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Icon(
                                                            Icons.favorite,
                                                            color: Color(
                                                                0xFFF40A0A),
                                                            size: 20.0,
                                                          ),
                                                          Text(
                                                            'Thích',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              Expanded(
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CommentNewsfeedWidget(
                                                              comment:
                                                                  newsfeedItem
                                                                      .comments,
                                                              id: newsfeedItem
                                                                  .id,
                                                              callBack:
                                                                  () async {
                                                                await _model
                                                                    .newsfeedListRequire(
                                                                        context);
                                                                setState(() => _model
                                                                    .listViewPagingController
                                                                    ?.refresh());

                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: SafeArea(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Nhập bình luận',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.tag_faces,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  selectedPageIndex: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
