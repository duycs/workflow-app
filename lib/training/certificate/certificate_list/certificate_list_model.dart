import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/certificate/certificate1_zoom/certificate1_zoom_widget.dart';
import '/training/certificate/certificate2_zoom/certificate2_zoom_widget.dart';
import '/training/certificate/program_certificate/program_certificate_widget.dart';
import 'certificate_list_widget.dart' show CertificateListWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CertificateListModel extends FlutterFlowModel<CertificateListWidget> {
  ///  Local state fields for this page.

  List<StudyProgramListStruct> programs = [];
  void addToPrograms(StudyProgramListStruct item) => programs.add(item);
  void removeFromPrograms(StudyProgramListStruct item) => programs.remove(item);
  void removeAtIndexFromPrograms(int index) => programs.removeAt(index);
  void insertAtIndexInPrograms(int index, StudyProgramListStruct item) =>
      programs.insert(index, item);
  void updateProgramsAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      programs[index] = updateFn(programs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
