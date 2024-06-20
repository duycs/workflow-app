import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_report_staff_detail_widget.dart'
    show FilterReportStaffDetailWidget;
import 'package:flutter/material.dart';

class FilterReportStaffDetailModel
    extends FlutterFlowModel<FilterReportStaffDetailWidget> {
  ///  Local state fields for this component.

  String dateStart1 = '';

  String dateStart2 = '';

  String type = '';

  String status = '';

  String dateEnd1 = '';

  String dateEnd2 = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  FormFieldController<List<String>>? typeValueController;
  String? get typeValue => typeValueController?.value?.firstOrNull;
  set typeValue(String? val) =>
      typeValueController?.value = val != null ? [val] : [];
  // State field(s) for status widget.
  FormFieldController<List<String>>? statusValueController;
  String? get statusValue => statusValueController?.value?.firstOrNull;
  set statusValue(String? val) =>
      statusValueController?.value = val != null ? [val] : [];
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
