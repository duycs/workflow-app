import '/flutter_flow/flutter_flow_util.dart';
import 'timekeeping_report_widget.dart' show TimekeepingReportWidget;
import 'package:flutter/material.dart';

class TimekeepingReportModel extends FlutterFlowModel<TimekeepingReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
