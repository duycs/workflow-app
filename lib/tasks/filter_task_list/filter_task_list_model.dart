import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filter_task_list_widget.dart' show FilterTaskListWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterTaskListModel extends FlutterFlowModel<FilterTaskListWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  String type = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  FormFieldController<List<String>>? typeValueController;
  String? get typeValue => typeValueController?.value?.firstOrNull;
  set typeValue(String? val) =>
      typeValueController?.value = val != null ? [val] : [];
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for created widget.
  FocusNode? createdFocusNode;
  TextEditingController? createdTextController;
  String? Function(BuildContext, String?)? createdTextControllerValidator;
  // State field(s) for workflowName widget.
  FocusNode? workflowNameFocusNode;
  TextEditingController? workflowNameTextController;
  String? Function(BuildContext, String?)? workflowNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    createdFocusNode?.dispose();
    createdTextController?.dispose();

    workflowNameFocusNode?.dispose();
    workflowNameTextController?.dispose();
  }
}
