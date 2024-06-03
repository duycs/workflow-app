import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/procedure_step_update/procedure_step_update_widget.dart';
import 'procedure_step_menu_widget.dart' show ProcedureStepMenuWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProcedureStepMenuModel extends FlutterFlowModel<ProcedureStepMenuWidget> {
  ///  Local state fields for this component.

  bool isLoad = false;

  StepsStruct? data;
  void updateDataStruct(Function(StepsStruct) updateFn) =>
      updateFn(data ??= StepsStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
