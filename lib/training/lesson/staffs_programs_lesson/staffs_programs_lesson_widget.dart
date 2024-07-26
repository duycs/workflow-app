import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/training/do_test/confirm_do_test/confirm_do_test_widget.dart';
import '/training/lesson/menu_delete/menu_delete_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'staffs_programs_lesson_model.dart';
export 'staffs_programs_lesson_model.dart';

class StaffsProgramsLessonWidget extends StatefulWidget {
  const StaffsProgramsLessonWidget({
    super.key,
    String? programsId,
    String? lessionId,
  })  : this.programsId = programsId ?? '',
        this.lessionId = lessionId ?? '';

  final String programsId;
  final String lessionId;

  @override
  State<StaffsProgramsLessonWidget> createState() =>
      _StaffsProgramsLessonWidgetState();
}

class _StaffsProgramsLessonWidgetState extends State<StaffsProgramsLessonWidget>
    with TickerProviderStateMixin {
  late StaffsProgramsLessonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffsProgramsLessonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getOneStaffsLessions(context);
      setState(() {});
      _model.status = _model.staffsLessionsListOne.first.status;
      await _model.getComments(context);
      setState(() {});
      await _model.getHeart(context);
      setState(() {});
    });

    _model.commentsTextController ??= TextEditingController();
    _model.commentsFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
              context.pop();
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
              if ((_model.status == 'draft') &&
                  (_model.status != null && _model.status != '') &&
                  (_model.staffsLessionsListOne.length != null))
                FFButtonWidget(
                  onPressed: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Bắt đầu bài học!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Đóng'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      _model.apiResultUpdateStatus =
                          await LessonGroup.updateStaffLessonStatusCall.call(
                        accessToken: FFAppState().accessToken,
                        id: _model.staffsLessionsListOne.first.id,
                        dateStart: getCurrentTimestamp.toString(),
                      );

                      if ((_model.apiResultUpdateStatus?.succeeded ?? true)) {
                        _model.status = 'inprogress';
                        setState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Đã ghim bài đang học',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      } else {
                        _model.checkRefreshTokenBlockabcd =
                            await action_blocks.checkRefreshToken(
                          context,
                          jsonErrors:
                              (_model.apiResultUpdateStatus?.jsonBody ?? ''),
                        );
                        if (!_model.checkRefreshTokenBlockabcd!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFAppConstants.ErrorLoadData,
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
                    }
                    _model.updateStaffProgramStatus =
                        await action_blocks.tokenReload(context);
                    if (_model.updateStaffProgramStatus!) {
                      _model.apiResultUpdateStaffProgramStatus =
                          await LessonGroup.updateStaffProgramStatusCall.call(
                        accessToken: FFAppState().accessToken,
                        staffId: FFAppState().staffid,
                        programId: widget!.programsId,
                      );

                      if (!(_model
                              .apiResultUpdateStaffProgramStatus?.succeeded ??
                          true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Lỗi cập nhật trạng thái chương trình đào tạo',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    }

                    setState(() {});
                  },
                  text: 'Bắt đầu học',
                  options: FFButtonOptions(
                    height: 32.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if ((_model.staffsLessionsListOne.isNotEmpty) &&
                (widget!.programsId != null && widget!.programsId != '') &&
                (widget!.lessionId != null && widget!.lessionId != '') &&
                (_model.staffsLessionsListOne.first.lessionId != null))
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 0.0, 0.0),
                            child: Text(
                              _model.staffsLessionsListOne.isNotEmpty
                                  ? _model.staffsLessionsListOne.first.lessionId
                                      .name
                                  : '',
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Visibility(
                              visible: (widget!.programsId != null &&
                                      widget!.programsId != '') &&
                                  (widget!.lessionId != null &&
                                      widget!.lessionId != '') &&
                                  (_model.staffsLessionsListOne.first
                                          .lessionId !=
                                      null),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if ((_model.status != 'draft') &&
                                      (_model.staffsLessionsListOne.first
                                                  .lessionId.video !=
                                              null &&
                                          _model.staffsLessionsListOne.first
                                                  .lessionId.video !=
                                              ''))
                                    FlutterFlowVideoPlayer(
                                      path:
                                          '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffsLessionsListOne.isNotEmpty ? _model.staffsLessionsListOne.first.lessionId.video : ''}?access_token=${FFAppState().accessToken}',
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
                                      (_model.staffsLessionsListOne.first
                                                  .lessionId.video !=
                                              null &&
                                          _model.staffsLessionsListOne.first
                                                  .lessionId.video !=
                                              ''))
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.status == 'draft') &&
                                            (_model.staffsLessionsListOne.first
                                                        .lessionId.video !=
                                                    null &&
                                                _model
                                                        .staffsLessionsListOne
                                                        .first
                                                        .lessionId
                                                        .video !=
                                                    ''))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text((_model
                                                            .staffsLessionsListOne
                                                            .first
                                                            .lessionId
                                                            .file
                                                            .toMap())
                                                        .toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 220.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              child: Visibility(
                                                visible: (_model.status ==
                                                        'draft') &&
                                                    (_model
                                                                .staffsLessionsListOne
                                                                .first
                                                                .lessionId
                                                                .video !=
                                                            null &&
                                                        _model
                                                                .staffsLessionsListOne
                                                                .first
                                                                .lessionId
                                                                .video !=
                                                            ''),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .noColor,
                                                    borderRadius: 25.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    icon: Icon(
                                                      Icons.play_arrow,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Bắt đầu học mới xem được video!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                padding: EdgeInsets.all(6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                EdgeInsetsDirectional
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
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                if ((_model.checkFile ==
                                                                        '1') &&
                                                                    (_model
                                                                            .staffsLessionsListOne
                                                                            .first
                                                                            .lessionId
                                                                            .file !=
                                                                        null) &&
                                                                    (((((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdf') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdfa') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdfx') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdft') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdfvt') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'pdfua')) ||
                                                                        ((((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'jpeg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'png') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'gif') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'jpg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'bmp') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'tiff') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'tif') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'raw') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'webp') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'svg') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'heic') ||
                                                                            (((String type) {
                                                                                  return type.split('.').last;
                                                                                }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                'heif'))) &&
                                                                    (_model.status != 'draft'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                      child:
                                                                          Text(
                                                                        '(Mở file)',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .checkFile ==
                                                                    '0')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                      child:
                                                                          Text(
                                                                        '(Đóng file)',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if ((_model
                                                                          .staffsLessionsListOne
                                                                          .first
                                                                          .lessionId
                                                                          .file !=
                                                                      null) &&
                                                                  ((((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'doc') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'docx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'rtf') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'txt') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'odt') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'docm')))
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/images.png',
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              if ((_model
                                                                          .staffsLessionsListOne
                                                                          .first
                                                                          .lessionId
                                                                          .file !=
                                                                      null) &&
                                                                  ((((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xls') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xlsx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xlsm') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xlsb') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'csv') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xltx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xltm') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'ods') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'xml')))
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/excel.png',
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              if ((_model
                                                                          .staffsLessionsListOne
                                                                          .first
                                                                          .lessionId
                                                                          .file !=
                                                                      null) &&
                                                                  ((((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'ppt') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pptx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pptm') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'potx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'potm') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'ppsx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'ppsm') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'odp')))
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/ppt.png',
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              if ((_model
                                                                          .staffsLessionsListOne
                                                                          .first
                                                                          .lessionId
                                                                          .file !=
                                                                      null) &&
                                                                  ((((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdf') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdfa') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdfx') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdft') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdfvt') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'pdfua')))
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/pdf.png',
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              if ((_model
                                                                          .staffsLessionsListOne
                                                                          .first
                                                                          .lessionId
                                                                          .file !=
                                                                      null) &&
                                                                  ((((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'jpeg') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'png') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'gif') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'jpg') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'bmp') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'tiff') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'tif') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'raw') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'webp') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model
                                                                              .staffsLessionsListOne
                                                                              .first
                                                                              .lessionId
                                                                              .file
                                                                              .filenameDownload)) ==
                                                                          'svg') ||
                                                                      (((String
                                                                              type) {
                                                                            return type.split('.').last;
                                                                          }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                          'heic') ||
                                                                      (((String type) {
                                                                            return type.split('.').last;
                                                                          }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                          'heif')))
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/1200px-Picture_icon_BLACK.svg.png',
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                      if (((((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdf') ||
                                                                              (((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdfa') ||
                                                                              (((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdfx') ||
                                                                              (((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdft') ||
                                                                              (((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdfvt') ||
                                                                              (((String type) {
                                                                                    return type.split('.').last;
                                                                                  }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                                                  'pdfua')) &&
                                                                          (_model.status != 'draft')) {
                                                                        _model.checkFile =
                                                                            '0';
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      (_model.staffsLessionsListOne.first.lessionId.file.toMap() != null) &&
                                                                              (_model.staffsLessionsListOne.first.lessionId.file.type != null && _model.staffsLessionsListOne.first.lessionId.file.type != '') &&
                                                                              (_model.staffsLessionsListOne.first.lessionId.file.filenameDownload != null && _model.staffsLessionsListOne.first.lessionId.file.filenameDownload != '')
                                                                          ? '${(String name) {
                                                                              return name.toLowerCase().replaceAll(' ', '-');
                                                                            }(_model.staffsLessionsListOne.first.lessionId.name)}.${(String type) {
                                                                              return type.split('.').last;
                                                                            }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)}'
                                                                          : 'Chưa có tài liệu',
                                                                      maxLines:
                                                                          2,
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
                                                        (_model
                                                                .staffsLessionsListOne
                                                                .first
                                                                .lessionId
                                                                .file !=
                                                            null))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          await actions
                                                              .downloadFile(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffsLessionsListOne.first.lessionId.file.id}?access_token=${FFAppState().accessToken}',
                                                            _model
                                                                .staffsLessionsListOne
                                                                .first
                                                                .lessionId
                                                                .name,
                                                            _model
                                                                .staffsLessionsListOne
                                                                .first
                                                                .lessionId
                                                                .file
                                                                .filenameDownload,
                                                          );
                                                        },
                                                        text: 'Tải',
                                                        icon: Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 18.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 25.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
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
                                                                  .circular(
                                                                      4.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (_model.checkFile == '0')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdf') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdfa') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdfx') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdft') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdfvt') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'pdfua'))
                                                        FlutterFlowPdfViewer(
                                                          networkPath:
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${(_model.staffsLessionsListOne.isNotEmpty) == true ? _model.staffsLessionsListOne.first.lessionId.file.id : ''}?access_token=${FFAppState().accessToken}',
                                                          width:
                                                              double.infinity,
                                                          height: 500.0,
                                                          horizontalScroll:
                                                              false,
                                                        ),
                                                      if ((((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'jpeg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'png') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'gif') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'jpg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'bmp') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'tiff') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'tif') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'raw') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model
                                                                  .staffsLessionsListOne
                                                                  .first
                                                                  .lessionId
                                                                  .file
                                                                  .filenameDownload)) ==
                                                              'webp') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                              'svg') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                              'heic') ||
                                                          (((String type) {
                                                                return type
                                                                    .split('.')
                                                                    .last;
                                                              }(_model.staffsLessionsListOne.first.lessionId.file.filenameDownload)) ==
                                                              'heif'))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${_model.staffsLessionsListOne.isNotEmpty ? _model.staffsLessionsListOne.first.lessionId.file.id : ''}?access_token=${FFAppState().accessToken}',
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
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                        if ((_model.staffsLessionsListOne.first != null) &&
                            (_model.status != 'draft'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                    text: '${() {
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
                                    }()}',
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
                                          return Color(0x00000000);
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
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
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
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
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
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'dd/MM/yyyy',
                                          functions.stringToDateTime(_model
                                              .staffsLessionsListOne
                                              .first
                                              .lessionId
                                              .dateCreated),
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
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ),
                        ),
                        if ((_model.testId != null && _model.testId != '') &&
                            (_model.status != 'draft'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 16.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.status == 'inprogress')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
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
                                                      AlignmentDirectional(
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
                                                      lessionId: _model
                                                          .staffsLessionsListOne
                                                          .first
                                                          .lessionId
                                                          .id,
                                                      avatar: _model
                                                          .staffsLessionsListOne
                                                          .first
                                                          .lessionId
                                                          .imageCover,
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
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
                                                          SizedBox(width: 4.0)),
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
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                              _model.staffsLessionsListOne.first
                                                  .lessionId.id,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
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
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x33000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
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
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 16.0, 0.0, 0.0),
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
                        if ((_model.staffsLessionsListOne.first != null) &&
                            (_model.staffsLessionsListOne.first.lessionId
                                        .content !=
                                    null &&
                                _model.staffsLessionsListOne.first.lessionId
                                        .content !=
                                    '') &&
                            (functions.formatHtml(_model.staffsLessionsListOne
                                        .first.lessionId.content) !=
                                    null &&
                                functions.formatHtml(_model
                                        .staffsLessionsListOne
                                        .first
                                        .lessionId
                                        .content) !=
                                    ''))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ((_model.staffsLessionsListOne.first !=
                                        null) &&
                                    (_model.staffsLessionsListOne.first
                                                .lessionId.content !=
                                            null &&
                                        _model.staffsLessionsListOne.first
                                                .lessionId.content !=
                                            '') &&
                                    (functions.formatHtml(_model
                                                .staffsLessionsListOne
                                                .first
                                                .lessionId
                                                .content) !=
                                            null &&
                                        functions.formatHtml(_model
                                                .staffsLessionsListOne
                                                .first
                                                .lessionId
                                                .content) !=
                                            ''))
                                  wrapWithModel(
                                    model: _model
                                        .mobileEditorDisplayComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: MobileEditorDisplayComponentWidget(
                                      content: _model.staffsLessionsListOne
                                          .first.lessionId.content,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                ].divide(SizedBox(width: 2.0)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: _model.list.length > 0,
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
                                      SizedBox(height: 5.0),
                                  itemBuilder: (context, listItemsIndex) {
                                    final listItemsItem =
                                        listItems[listItemsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
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
                                                  'assets/images/error_image.png',
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
                                                  padding: EdgeInsetsDirectional
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
                                                          EdgeInsetsDirectional
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
                                                              if ('${getJsonField(
                                                                    listItemsItem,
                                                                    r'''$.comments_id.staff_id.id''',
                                                                  ).toString()}' ==
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
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Container(
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
                                                                EdgeInsetsDirectional
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
                                                  padding: EdgeInsetsDirectional
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
                                                        ].divide(SizedBox(
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
                                                            Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFFFF0202),
                                                              size: 20.0,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 2.0)),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
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
            if ((_model.staffsLessionsListOne.isNotEmpty) &&
                (_model.status != 'draft'))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        '${FFAppConstants.ApiBaseUrl}/assets/${FFAppState().user.avatar}?access_token=${FFAppState().accessToken}',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.commentsTextController.text !=
                                            null &&
                                        _model.commentsTextController.text !=
                                            '') {
                                      await _model.postComment(context);
                                      setState(() {});
                                      setState(() {
                                        _model.commentsTextController?.clear();
                                      });
                                      await _model.getComments(context);
                                      setState(() {});
                                    }
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (!(_model.staffsLessionsListOne.isNotEmpty))
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.circleNotch,
                  color: Color(0xFF4A39E9),
                  size: 50.0,
                ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
              ),
          ],
        ),
      ),
    );
  }
}
