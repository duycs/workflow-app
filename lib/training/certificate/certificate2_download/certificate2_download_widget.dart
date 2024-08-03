import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'certificate2_download_model.dart';
export 'certificate2_download_model.dart';

class Certificate2DownloadWidget extends StatefulWidget {
  const Certificate2DownloadWidget({
    super.key,
    this.program,
    this.dateStart,
    this.dateEnd,
  });

  final String? program;
  final String? dateStart;
  final String? dateEnd;

  @override
  State<Certificate2DownloadWidget> createState() =>
      _Certificate2DownloadWidgetState();
}

class _Certificate2DownloadWidgetState
    extends State<Certificate2DownloadWidget> {
  late Certificate2DownloadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Certificate2DownloadModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 0.0),
        children: [
          Opacity(
            opacity: 0.3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    '${FFAppConstants.ApiBaseUrl}/assets/${getJsonField(
                      FFAppState().staffOrganization,
                      r'''$.logo''',
                    ).toString()}?access_token=${FFAppState().accessToken}',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 100.0,
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Công ty TNHH A fgrfgfdg fgdfsgfds gfdgdfg gvsdfg sdfgsdg fdgsfds ',
                    textAlign: TextAlign.center,
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
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                      child: Text(
                        'Chứng nhận',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        'Chức vụ:\"${getJsonField(
                          FFAppState().staffLogin,
                          r'''$.tilte''',
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
                      'Đã hoàn thành \"${widget.program}\"',
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
                        'dd-MM-yyyy',
                        functions.stringToDateTime(widget.dateStart),
                        locale: FFLocalizations.of(context).languageCode,
                      )} đến ngày ${dateTimeFormat(
                        'dd-MM-yyyy',
                        functions.stringToDateTime(widget.dateEnd),
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
                  ].divide(const SizedBox(height: 3.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await actions.screenCertificate1(
                        context,
                        'Stack',
                        widget.program!,
                        dateTimeFormat(
                          'dd-MM-yyyy',
                          functions.stringToDateTime(widget.dateStart),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        dateTimeFormat(
                          'dd-MM-yyyy',
                          functions.stringToDateTime(widget.dateEnd),
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
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
