import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_branch_widget.dart' show FilterBranchWidget;
import 'package:flutter/material.dart';

class FilterBranchModel extends FlutterFlowModel<FilterBranchWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
