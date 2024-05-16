import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'procedure_step_menu_widget.dart' show ProcedureStepMenuWidget;
import 'package:flutter/material.dart';

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
