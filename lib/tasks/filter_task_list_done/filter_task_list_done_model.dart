import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_task_list_done_widget.dart' show FilterTaskListDoneWidget;
import 'package:flutter/material.dart';

class FilterTaskListDoneModel
    extends FlutterFlowModel<FilterTaskListDoneWidget> {
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
  bool? clearFilterDoneToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in Button widget.
  ApiCallResponse? apiResultClearFilterDone;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? filterDoneToken;
  // Stores action output result for [Backend Call - API (GetListTask)] action in Button widget.
  ApiCallResponse? apiResultFilterDone;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
