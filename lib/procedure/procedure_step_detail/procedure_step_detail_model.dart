import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_step_detail_widget.dart' show ProcedureStepDetailWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcedureStepDetailModel
    extends FlutterFlowModel<ProcedureStepDetailWidget> {
  ///  Local state fields for this component.

  String? checkShow;

  ///  State fields for stateful widgets in this component.

  // State field(s) for actionType widget.
  String? actionTypeValue;
  FormFieldController<String>? actionTypeValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
