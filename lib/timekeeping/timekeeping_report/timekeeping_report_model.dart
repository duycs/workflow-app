import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/timekeeping/report_popup/report_popup_widget.dart';
import '/timekeeping/timekeeping_management_list/timekeeping_management_list_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'timekeeping_report_widget.dart' show TimekeepingReportWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
