import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'lesson_detail_model.dart';
export 'lesson_detail_model.dart';

class LessonDetailWidget extends StatefulWidget {
  const LessonDetailWidget({
    super.key,
    required this.idLesson,
    String? checkSrcoll,
    this.checkPage,
  }) : checkSrcoll = checkSrcoll ?? '0';

  final String? idLesson;
  final String checkSrcoll;
  final String? checkPage;

  @override
  State<LessonDetailWidget> createState() => _LessonDetailWidgetState();
}

class _LessonDetailWidgetState extends State<LessonDetailWidget> {
  late LessonDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getDetail(context);
      setState(() {});
      await _model.getHeart(context);
      setState(() {});
      await _model.getComments(context);
      setState(() {});
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
              _model.checkFile = '1';
              setState(() {});
            },
          ),
          title: Text(
            'Nội dung bài học',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Nunito Sans',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_model.listDetail != null)
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
                                _model.listDetail,
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
                          padding: const EdgeInsets.all(12.0),
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
                                if (getJsonField(
                                      _model.listDetail,
                                      r'''$.video''',
                                    ) !=
                                    null)
                                  FlutterFlowVideoPlayer(
                                    path:
                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                      _model.listDetail,
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
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      if (_model.listDetail != null)
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
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                                        _model
                                                                            .listDetail,
                                                                        r'''$.file''',
                                                                      ) !=
                                                                      null) &&
                                                                  (((((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdf') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfa') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfx') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdft') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfvt') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'pdfua')) ||
                                                                      ((((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'jpeg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'png') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'jpg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'gif') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'bmp') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'tiff') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'tif') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'raw') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'webp') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'svg') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'heic') ||
                                                                          (((String type) {
                                                                                return type.split('.').last;
                                                                              }(getJsonField(
                                                                                _model.listDetail,
                                                                                r'''$.file.filename_download''',
                                                                              ).toString())) ==
                                                                              'heif'))))
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
                                                              MainAxisSize.min,
                                                          children: [
                                                            if ((getJsonField(
                                                                      _model
                                                                          .listDetail,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'doc') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'docx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'rtf') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'txt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'odt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
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
                                                                      _model
                                                                          .listDetail,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xls') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'csv') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xltx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xltm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ods') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xml') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'xlsb')))
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
                                                                      _model
                                                                          .listDetail,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pptm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'potx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'potm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppsx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'ppsm') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'odp') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pptx')))
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
                                                                      _model
                                                                          .listDetail,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdf') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfa') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfx') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdft') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'pdfvt') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
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
                                                                      _model
                                                                          .listDetail,
                                                                      r'''$.file''',
                                                                    ) !=
                                                                    null) &&
                                                                ((((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'jpeg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'png') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'jpg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'gif') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'bmp') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'tiff') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'tif') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'raw') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'webp') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'svg') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
                                                                          r'''$.file.filename_download''',
                                                                        ).toString())) ==
                                                                        'heic') ||
                                                                    (((String type) {
                                                                          return type
                                                                              .split('.')
                                                                              .last;
                                                                        }(getJsonField(
                                                                          _model
                                                                              .listDetail,
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
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdf') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfa') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfx') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdft') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfvt') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'pdfua')) ||
                                                                        ((((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'jpeg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'png') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'jpg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'gif') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'bmp') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'tiff') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'tif') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'raw') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'webp') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'svg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'heic') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(getJsonField(
                                                                                  _model.listDetail,
                                                                                  r'''$.file.filename_download''',
                                                                                ).toString())) ==
                                                                                'heif'))) {
                                                                      _model.checkFile =
                                                                          '0';
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    getJsonField(
                                                                              _model.listDetail,
                                                                              r'''$.file''',
                                                                            ) !=
                                                                            null
                                                                        ? '${(String name) {
                                                                            return name.toLowerCase().replaceAll(' ',
                                                                                '-');
                                                                          }(getJsonField(
                                                                            _model.listDetail,
                                                                            r'''$.name''',
                                                                          ).toString())}.${(String type) {
                                                                            return type.split('.').last;
                                                                          }(getJsonField(
                                                                            _model.listDetail,
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
                                                                              13.0,
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
                                                  if (getJsonField(
                                                        _model.listDetail,
                                                        r'''$.file''',
                                                      ) !=
                                                      null)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await actions
                                                            .downloadFile(
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.id''',
                                                          ).toString()}?access_token=${FFAppState().accessToken}',
                                                          getJsonField(
                                                            _model.listDetail,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          getJsonField(
                                                            _model.listDetail,
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
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
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
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdf') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdfa') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdfx') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdft') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdfvt') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'pdfua'))
                                                    FlutterFlowPdfViewer(
                                                      networkPath:
                                                          '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                        _model.listDetail,
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
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'jpeg') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'png') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'jpg') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'gif') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'bmp') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'tiff') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'tif') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'raw') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'webp') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'svg') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'heic') ||
                                                      (((String type) {
                                                            return type
                                                                .split('.')
                                                                .last;
                                                          }(getJsonField(
                                                            _model.listDetail,
                                                            r'''$.file.filename_download''',
                                                          ).toString())) ==
                                                          'heif'))
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                                                          _model.listDetail,
                                                          r'''$.file.id''',
                                                        ).toString()}?access_token=${FFAppState().accessToken}',
                                                        width: double.infinity,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (widget.checkPage == 'lessonMarket')
                                Text(
                                  '',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              if (widget.checkPage != 'lessonMarket')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      _model.listStaffIdHeart.length.toString(),
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
                              if (widget.checkPage != 'lessonMarket')
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'dd/MM/yyyy',
                                          functions
                                              .stringToDateTime(getJsonField(
                                            _model.listDetail,
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
                              ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 16.0, 0.0, 0.0),
                          child: Text(
                            'Nội dung bài học',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        if ((_model.listDetail != null) &&
                            (getJsonField(
                                  _model.listDetail,
                                  r'''$.content''',
                                ) !=
                                null))
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 5.0, 12.0, 0.0),
                                child: custom_widgets.HtmlToDoc(
                                  width: double.infinity,
                                  height: 150.0,
                                  html: functions.formatHtml(getJsonField(
                                    _model.listDetail,
                                    r'''$.content''',
                                  ).toString()),
                                ),
                              ),
                            ],
                          ),
                        if (widget.checkPage != 'lessonMarket')
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                        if (widget.checkPage != 'lessonMarket')
                          Container(
                            decoration: const BoxDecoration(),
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
                                      const SizedBox(height: 8.0),
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
                                          ClipRRect(
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                                  fontSize:
                                                                      12.0,
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
                      ],
                    ),
                  ),
                ),
              ),
            if ((getJsonField(
                      _model.listDetail,
                      r'''$.user_created.id''',
                    ).toString() ==
                    FFAppState().user.id) &&
                (_model.listDetail != null))
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'LessonUpdate',
                      queryParameters: {
                        'items': serializeParam(
                          _model.listDetail,
                          ParamType.JSON,
                        ),
                        'checkPage': serializeParam(
                          widget.checkPage,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Chỉnh sửa',
                  icon: const Icon(
                    Icons.edit,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            if (_model.listDetail == null)
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
