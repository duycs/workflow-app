import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filter_report_staff_detail_widget.dart'
    show FilterReportStaffDetailWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
