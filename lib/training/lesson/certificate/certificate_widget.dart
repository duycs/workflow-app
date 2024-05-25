import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'certificate_model.dart';
export 'certificate_model.dart';

class CertificateWidget extends StatefulWidget {
  const CertificateWidget({
    super.key,
    String? program,
  }) : program = program ?? '';

  final String program;

  @override
  State<CertificateWidget> createState() => _CertificateWidgetState();
}

class _CertificateWidgetState extends State<CertificateWidget>
    with TickerProviderStateMixin {
  late CertificateModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CertificateModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Icon(
                Icons.menu_book_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 40.0,
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Chứng chỉ hoàn thành',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              width: 200.0,
              child: Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 18.0),
              child: Text(
                'CHỨNG NHẬN',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Text(
              'Họ và tên: ${FFAppState().user.firstName}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 36.0),
              child: Text(
                'Chương trình đào tạo: ${widget.program}',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Text(
                            'Admin bộ phận: ${getJsonField(
                              FFAppState().staffDepartment,
                              r'''$.name''',
                            ).toString()}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Text(
                            'Admin tổ chức:${getJsonField(
                              FFAppState().staffOrganization,
                              r'''$.name''',
                            ).toString()}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(width: 15.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
