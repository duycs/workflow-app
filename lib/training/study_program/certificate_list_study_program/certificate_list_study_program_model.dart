import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/certificate/certificate1_zoom/certificate1_zoom_widget.dart';
import '/training/certificate/certificate2_zoom/certificate2_zoom_widget.dart';
import 'certificate_list_study_program_widget.dart'
    show CertificateListStudyProgramWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CertificateListStudyProgramModel
    extends FlutterFlowModel<CertificateListStudyProgramWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Certificate1Zoom component.
  late Certificate1ZoomModel certificate1ZoomModel;
  // Model for Certificate2Zoom component.
  late Certificate2ZoomModel certificate2ZoomModel;

  @override
  void initState(BuildContext context) {
    certificate1ZoomModel = createModel(context, () => Certificate1ZoomModel());
    certificate2ZoomModel = createModel(context, () => Certificate2ZoomModel());
  }

  @override
  void dispose() {
    certificate1ZoomModel.dispose();
    certificate2ZoomModel.dispose();
  }
}
