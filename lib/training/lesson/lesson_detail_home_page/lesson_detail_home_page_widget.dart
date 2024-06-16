import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/confirm_do_test/confirm_do_test_widget.dart';
import '/training/lesson/menu_delete/menu_delete_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'lesson_detail_home_page_model.dart';
export 'lesson_detail_home_page_model.dart';

class LessonDetailHomePageWidget extends StatefulWidget {
  const LessonDetailHomePageWidget({
    super.key,
    required this.listItems,
    required this.status,
    String? id,
    String? checkScroll,
    this.programId,
    String? checkLesson,
    this.checkReload,
  })  : id = id ?? '',
        checkScroll = checkScroll ?? '0',
        checkLesson = checkLesson ?? '';

  final dynamic listItems;
  final String? status;
  final String id;
  final String checkScroll;
  final String? programId;
  final String checkLesson;
  final String? checkReload;

  @override
  State<LessonDetailHomePageWidget> createState() =>
      _LessonDetailHomePageWidgetState();
}

class _LessonDetailHomePageWidgetState extends State<LessonDetailHomePageWidget>
    with TickerProviderStateMixin {
  late LessonDetailHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonDetailHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.listItems != null) {
        _model.status = widget.status!;
        await _model.getComments(context);
        setState(() {});
        await _model.getHeart(context);
        setState(() {});
      }
    });

    _model.commentsTextController ??= TextEditingController();
    _model.commentsFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 550.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(0, 0.349),
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

              setState(() {});
              if (widget.checkReload == 'Home') {
                context.pushNamed(
                  'LessonLists_Homepage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else {
                context.safePop();
              }
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Nội dung bài học',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              if ((_model.status != '') &&
                  (_model.status == 'draft') &&
                  (widget.id != ''))
                FFButtonWidget(
                  onPressed: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: const Text('Bắt đầu bài học!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: const Text('Đóng'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      await _model.startLesson(context);
                      setState(() {});
                    }
                  },
                  text: 'Bắt đầu học',
                  options: FFButtonOptions(
                    height: 32.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if ((widget.listItems != null) &&
                (_model.status != '') &&
                (widget.id != ''))
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                widget.listItems,
                                r'''$.name''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if ((_model.status != 'draft') &&
                                    (getJsonField(
                                          widget.listItems,
                                          r'''$.video''',
                                        ) !=
                                        null))
                                  FlutterFlowVideoPlayer(
                                    path:
                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                      widget.listItems,
                                      r'''$.video''',
                                    ).toString()}?access_token=${FFAppState().accessToken}',
                                    videoType: VideoType.network,
                                    width: double.infinity,
                                    height: 220.0,
                                    autoPlay: false,
                                    looping: true,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                    lazyLoad: false,
                                  ),
                                if ((_model.status == 'draft') &&
                                    (getJsonField(
                                          widget.listItems,
                                          r'''$.video''',
                                        ) !=
                                        null))
                                  Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      if ((_model.status == 'draft') &&
                                          (getJsonField(
                                                widget.listItems,
                                                r'''$.video''',
                                              ) !=
                                              null))
                                        Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                      if ((_model.status == 'draft') &&
                                          (getJsonField(
                                                widget.listItems,
                                                r'''$.video''',
                                              ) !=
                                              null))
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .noColor,
                                            borderRadius: 25.0,
                                            borderWidth: 1.0,
                                            buttonSize: 50.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            icon: Icon(
                                              Icons.play_arrow,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Bắt đầu học mới xem được video!',
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
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      3.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .attach_file_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
                                                              ),
                                                              Text(
                                                                'Tài liệu khác:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              if ((_model.checkFile ==
                                                                      '1') &&
                                                                  (getJsonField(
                                                                        widget
                                                                            .listItems,
                                                                        r'''$.file''',
                                                                      ) !=
                                                                      null) &&
                                                                  (((((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdf') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfa') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfx') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdft') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfvt') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfua')) ||
                                                                      ((((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'jpeg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'png') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'gif') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'jpg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'bmp') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'tiff') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'tif') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'raw') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'webp') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'svg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'heic') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                widget.listItems,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'heif'))) &&
                                                                  (_model.status != 'draft'))
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
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
                                                                      _model.checkFile =
                                                                          '0';
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      '(Mở file)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .checkFile ==
                                                                  '0')
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
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
                                                                      _model.checkFile =
                                                                          '1';
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      '(Đóng file)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if ((getJsonField(
                                                                      widget
                                                                          .listItems,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'doc') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'docx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'rtf') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'txt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'odt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'docm')))
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/images.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            if ((getJsonField(
                                                                      widget
                                                                          .listItems,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xls') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsb') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'csv') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xltx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xltm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ods') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xml')))
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/excel.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            if ((getJsonField(
                                                                      widget
                                                                          .listItems,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pptx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pptm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'potx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'potm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppsx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppsm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'odp')))
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/ppt.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            if ((getJsonField(
                                                                      widget
                                                                          .listItems,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdf') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfa') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdft') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfvt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfua')))
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/pdf.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            if ((getJsonField(
                                                                      widget
                                                                          .listItems,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'jpeg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'png') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'gif') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'jpg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'bmp') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'tiff') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'tif') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'raw') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'webp') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'svg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'heic') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          widget
                                                                              .listItems,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'heif')))
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/1200px-Picture_icon_BLACK.svg.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    if (((((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdf') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfa') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfx') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdft') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfvt') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  widget.listItems,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfua') ||
                                                                            ((((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'jpeg') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'png') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'gif') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'jpg') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'bmp') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'tiff') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'tif') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'raw') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'webp') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'svg') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'heic') ||
                                                                                (((String type) {
                                                                                      return type.split('.').last;
                                                                                    }(getJsonField(
                                                                                      widget.listItems,
                                                                                      r'''$.file.filename_download''',
                                                                                    ).toString())) ==
                                                                                    'heif'))) &&
                                                                        (_model.status != 'draft')) {
                                                                      _model.checkFile =
                                                                          '0';
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    getJsonField(
                                                                              widget.listItems,
                                                                              r'''$.file''',
                                                                            ) !=
                                                                            null
                                                                        ? '${(String name) {
                                                                            return name.toLowerCase().replaceAll(' ',
                                                                                '-');
                                                                          }(getJsonField(
                                                                            widget.listItems,
                                                                            r'''$.name''',
                                                                          ).toString())}.${(String type) {
                                                                            return type.split('.').last;
                                                                          }(getJsonField(
                                                                            widget.listItems,
                                                                            r'''$.file.filename_download''',
                                                                          ).toString())}'
                                                                        : 'Chưa có tài liệu',
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if ((_model.status !=
                                                          'draft') &&
                                                      (getJsonField(
                                                            widget.listItems,
                                                            r'''$.file''',
                                                          ) !=
                                                          null))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await actions
                                                            .downloadFile(
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                            widget.listItems,
                                                            r'''$.file.id''',
                                                          ).toString()}?access_token=${FFAppState().accessToken}',
                                                          getJsonField(
                                                            widget.listItems,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          getJsonField(
                                                            widget.listItems,
                                                            r'''$.file.filename_download''',
                                                          ).toString(),
                                                        );
                                                      },
                                                      text: 'Tải',
                                                      icon: Icon(
                                                        Icons
                                                            .file_download_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 18.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 25.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (_model.checkFile == '0')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdf') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdfa') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdfx') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdft') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdfvt') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'pdfua'))
                                                      FlutterFlowPdfViewer(
                                                        networkPath:
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                          widget.listItems,
                                                          r'''$.file.id''',
                                                        ).toString()}?access_token=${FFAppState().accessToken}',
                                                        width: double.infinity,
                                                        height: 500.0,
                                                        horizontalScroll: false,
                                                      ),
                                                    if ((((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'jpeg') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'png') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'gif') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'jpg') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'bmp') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'tiff') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'tif') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'raw') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'webp') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'svg') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'heic') ||
                                                        (((String type) {
                                                              return type
                                                                  .split('.')
                                                                  .last;
                                                            }(getJsonField(
                                                              widget.listItems,
                                                              r'''$.file.filename_download''',
                                                            ).toString())) ==
                                                            'heif'))
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                            widget.listItems,
                                                            r'''$.file.id''',
                                                          ).toString()}?access_token=${FFAppState().accessToken}',
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.contain,
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
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                        if ((widget.status != null && widget.status != '') &&
                            (_model.status != 'draft'))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 4.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Trạng thái: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  TextSpan(
                                    text: () {
                                      if (_model.status == 'draft') {
                                        return 'Chưa học';
                                      } else if (_model.status ==
                                          'inprogress') {
                                        return 'Đang học';
                                      } else if (_model.status == 'done') {
                                        return 'Hoàn thành';
                                      } else {
                                        return ' ';
                                      }
                                    }(),
                                    style: TextStyle(
                                      color: () {
                                        if (_model.status == 'draft') {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryText;
                                        } else if (_model.status ==
                                            'inprogress') {
                                          return FlutterFlowTheme.of(context)
                                              .primary;
                                        } else if (_model.status == 'done') {
                                          return FlutterFlowTheme.of(context)
                                              .secondary;
                                        } else {
                                          return const Color(0x00000000);
                                        }
                                      }(),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          height: 35.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.checkLove == '1')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.checkLove = '0';
                                              setState(() {});
                                              await _model.deleteHeart(context);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                          ),
                                        if (_model.checkLove == '0')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.checkLove = '1';
                                              setState(() {});
                                              await _model.postHeart(context);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.favorite_border_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          _model.listStaffIdHeart.length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Lượt thích',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 2.0)),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.mode_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          _model.list.length.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Bình luận',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 2.0)),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'dd/MM/yyyy',
                                          functions
                                              .stringToDateTime(getJsonField(
                                            widget.listItems,
                                            r'''$.date_created''',
                                          ).toString()),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ].divide(const SizedBox(width: 24.0)),
                            ),
                          ),
                        ),
                        if ((_model.testId != '') &&
                            (_model.status != 'draft'))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if ((_model.status == 'inprogress') &&
                                    (widget.checkLesson != 'closeTest'))
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
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
                                                    child: ConfirmDoTestWidget(
                                                      testId: _model.testId,
                                                      lessionId: getJsonField(
                                                        widget.listItems,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      avatar: getJsonField(
                                                        widget.listItems,
                                                        r'''$.image_cover''',
                                                      ).toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .question_mark_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          'Làm kiểm tra',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
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
                                if (widget.checkLesson != 'closeTest')
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'DoTestList',
                                            queryParameters: {
                                              'lessionId': serializeParam(
                                                getJsonField(
                                                  widget.listItems,
                                                  r'''$.id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
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
                                        },
                                        child: Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x33000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .question_answer_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        'Bài đã thi',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 24.0)),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Nội dung bài học',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        if ((widget.listItems != null) &&
                            (getJsonField(
                                  widget.listItems,
                                  r'''$.content''',
                                ) !=
                                null))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 5.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ((widget.listItems != null) &&
                                    (getJsonField(
                                          widget.listItems,
                                          r'''$.content''',
                                        ) !=
                                        null) &&
                                    (functions.formatHtml(getJsonField(
                                              widget.listItems,
                                              r'''$.content''',
                                            ).toString()) !=
                                            ''))
                                  custom_widgets.HtmlToDoc(
                                    width: double.infinity,
                                    height: 180.0,
                                    html: functions.formatHtml(getJsonField(
                                      widget.listItems,
                                      r'''$.content''',
                                    ).toString()),
                                  ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bình luận:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '(',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    _model.list.length.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'Bình luận',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    ')',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 2.0)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Visibility(
                            visible: _model.list.isNotEmpty,
                            child: Builder(
                              builder: (context) {
                                final listItems = _model.list.toList();
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listItems.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 5.0),
                                  itemBuilder: (context, listItemsIndex) {
                                    final listItemsItem =
                                        listItems[listItemsIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                  listItemsItem,
                                                  r'''$.comments_id.staff_id.user_id.avatar''',
                                                ).toString()}?access_token=${FFAppState().accessToken}',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 2.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  listItemsItem,
                                                                  r'''$.comments_id.staff_id.user_id.first_name''',
                                                                ).toString(),
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
                                                              if (getJsonField(
                                                                    listItemsItem,
                                                                    r'''$.comments_id.staff_id.id''',
                                                                  ).toString() ==
                                                                  FFAppState()
                                                                      .staffid)
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
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
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            true,
                                                                        targetAnchor:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: 100.0,
                                                                                width: 200.0,
                                                                                child: MenuDeleteWidget(
                                                                                  id: getJsonField(
                                                                                    listItemsItem,
                                                                                    r'''$.id''',
                                                                                  ),
                                                                                  afterDeleteAction: () async {
                                                                                    await _model.getComments(context);

                                                                                    setState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .more_vert,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                listItemsItem,
                                                                r'''$.comments_id.content''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                              'HH:mm dd/MM/yyyy',
                                                              functions
                                                                  .stringToDateTime(
                                                                      getJsonField(
                                                                listItemsItem,
                                                                r'''$.comments_id.date_created''',
                                                              ).toString()),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                      if ('1' == '2')
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Thích',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            const Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFFFF0202),
                                                              size: 20.0,
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 2.0)),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
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
                      ],
                    ),
                  ),
                ),
              ),
            if ((_model.status != '') &&
                (widget.listItems != null) &&
                (_model.status != 'draft'))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if ((_model.status != '') &&
                        (widget.listItems != null) &&
                        (_model.status != 'draft') &&
                        (widget.id != ''))
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          '${FFAppConstants.ApiBaseUrl}/assets/${FFAppState().user.avatar}?access_token=${FFAppState().accessToken}',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.jpg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if ((_model.status != '') &&
                        (widget.listItems != null) &&
                        (_model.status != 'draft') &&
                        (widget.id != ''))
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.commentsTextController,
                                      focusNode: _model.commentsFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.send,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Viết bình luận...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .commentsTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 3.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).noColor,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).noColor,
                                    icon: Icon(
                                      Icons.send,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.commentsTextController.text !=
                                              '') {
                                        await _model.postComment(context);
                                        setState(() {});
                                        setState(() {
                                          _model.commentsTextController
                                              ?.clear();
                                        });
                                        await _model.getComments(context);
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              ].divide(const SizedBox(width: 6.0)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if (_model.status == '')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Đang tải dữ liệu...',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
