import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_task_list_widget.dart' show FilterTaskListWidget;
import 'package:flutter/material.dart';

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
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? clearFilterToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in Button widget.
  ApiCallResponse? apiResultClearFilter;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? filterToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in Button widget.
  ApiCallResponse? apiResultFilter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
