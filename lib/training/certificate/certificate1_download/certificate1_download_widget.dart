import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'certificate1_download_model.dart';
export 'certificate1_download_model.dart';

class Certificate1DownloadWidget extends StatefulWidget {
  const Certificate1DownloadWidget({
    super.key,
    required this.program,
    this.dateStart,
    this.dateEnd,
    this.checkShow,
  });

  final String? program;
  final String? dateStart;
  final String? dateEnd;
  final dynamic checkShow;

  @override
  State<Certificate1DownloadWidget> createState() =>
      _Certificate1DownloadWidgetState();
}

class _Certificate1DownloadWidgetState
    extends State<Certificate1DownloadWidget> {
  late Certificate1DownloadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Certificate1DownloadModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (getJsonField(
              widget.checkShow,
              r'''$.code''',
            ).toString() !=
            'certificate2')
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        children: [
                          Stack(
                            children: [
                              Opacity(
                                opacity: 0.3,
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.medal,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 60.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Độc lập - Tự do - Hạnh phúc',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 6.0),
                                      child: Text(
                                        'Chứng nhận',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Text(
                                        FFAppState().user.firstName,
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Text(
                                        'Chức vụ: \"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.title''',
                                        ).toString()}\"',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Đã hoàn thành: \"${widget.program}\"',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      'Từ ngày ${dateTimeFormat(
                                        'dd-MM-yyyy',
                                        functions
                                            .stringToDateTime(widget.dateStart),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} đến ngày ${dateTimeFormat(
                                        'dd-MM-yyyy',
                                        functions
                                            .stringToDateTime(widget.dateEnd),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                    if ('1' == '2')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.medal,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        FFAppState()
                                                            .staffOrganization,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Giám đốc',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 12.0,
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
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().staffOrganization,
                                              r'''$.name''',
                                            ).toString(),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
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
                                            widget.program!,
                                            dateTimeFormat(
                                              'dd-MM-yyyy',
                                              functions.stringToDateTime(
                                                  widget.dateStart),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            dateTimeFormat(
                                              'dd-MM-yyyy',
                                              functions.stringToDateTime(
                                                  widget.dateEnd),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
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
                                              r'''$.tilte''',
                                            ).toString(),
                                          );
                                        },
                                        text: 'Ảnh',
                                        icon: const FaIcon(
                                          FontAwesomeIcons.fileExport,
                                          size: 12.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 20.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: Colors.white,
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
        if (getJsonField(
              widget.checkShow,
              r'''$.code''',
            ).toString() ==
            'certificate2')
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(
                            '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                              FFAppState().staffOrganization,
                              r'''$.logo''',
                            ).toString()}?access_token=${FFAppState().accessToken}',
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        decoration: const BoxDecoration(),
                        child: Text(
                          'Công ty TNHH A fgrfgfdg fgdfsgfds gfdgdfg gvsdfg sdfgsdg fdgsfds ',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 5.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Text(
                            'Độc lập - Tự do - Hạnh phúc',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 6.0),
                            child: Text(
                              'Chứng nhận',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Text(
                              FFAppState().user.firstName,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Text(
                              'Chức vụ: \"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.title''',
                              ).toString()}\"',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Đã hoàn thành \"${widget.program}\"',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            'Từ ngày ${dateTimeFormat(
                              'dd-MM-yyyy',
                              functions.stringToDateTime(widget.dateStart),
                              locale: FFLocalizations.of(context).languageCode,
                            )} đến ngày ${dateTimeFormat(
                              'dd-MM-yyyy',
                              functions.stringToDateTime(widget.dateEnd),
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await actions.screenCertificate1(
                              context,
                              'Stack',
                              widget.program!,
                              dateTimeFormat(
                                'dd-MM-yyyy',
                                functions.stringToDateTime(widget.dateStart),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              dateTimeFormat(
                                'dd-MM-yyyy',
                                functions.stringToDateTime(widget.dateEnd),
                                locale:
                                    FFLocalizations.of(context).languageCode,
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
                                r'''$.tilte''',
                              ).toString(),
                            );
                          },
                          text: 'Ảnh',
                          icon: const FaIcon(
                            FontAwesomeIcons.fileExport,
                            size: 12.0,
                          ),
                          options: FFButtonOptions(
                            height: 20.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
