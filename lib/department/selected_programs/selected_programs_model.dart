import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selected_programs_widget.dart' show SelectedProgramsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedProgramsModel extends FlutterFlowModel<SelectedProgramsWidget> {
  ///  Local state fields for this component.

  ProgramStruct? selectedPrograms;
  void updateSelectedProgramsStruct(Function(ProgramStruct) updateFn) =>
      updateFn(selectedPrograms ??= ProgramStruct());

  bool check = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
