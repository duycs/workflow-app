import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/certificate/certificate1_zoom/certificate1_zoom_widget.dart';
import '/training/certificate/certificate2_zoom/certificate2_zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'certificate_list_study_program_model.dart';
export 'certificate_list_study_program_model.dart';

class CertificateListStudyProgramWidget extends StatefulWidget {
  const CertificateListStudyProgramWidget({
    super.key,
    this.programdetail,
  });

  final StudyProgramListStruct? programdetail;

  @override
  State<CertificateListStudyProgramWidget> createState() =>
      _CertificateListStudyProgramWidgetState();
}

class _CertificateListStudyProgramWidgetState
    extends State<CertificateListStudyProgramWidget> {
  late CertificateListStudyProgramModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CertificateListStudyProgramModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thông tin chứng chỉ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: FlutterFlowIconButton(
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget!.programdetail?.certificateId?.id ==
                          '1ff8e3e4-fc53-4fe6-819a-db98d4785ef3')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 6.0, 10.0, 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 6.0),
                              child: wrapWithModel(
                                model: _model.certificate1ZoomModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: Certificate1ZoomWidget(
                                  check: 'studyProgram',
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget!.programdetail?.certificateId?.id ==
                          '22e2144b-e206-4bf6-a22e-110088325e14')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 6.0, 10.0, 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 6.0),
                              child: wrapWithModel(
                                model: _model.certificate2ZoomModel,
                                updateCallback: () => setState(() {}),
                                child: Certificate2ZoomWidget(),
                              ),
                            ),
                          ),
                        ),
                    ].divide(SizedBox(height: 5.0)),
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
