import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_action_type_to_do_list_widget.dart'
    show DetailActionTypeToDoListWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailActionTypeToDoListModel
    extends FlutterFlowModel<DetailActionTypeToDoListWidget> {
  ///  Local state fields for this component.

  String operationId = '';

  String status = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
