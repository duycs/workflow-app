import '/flutter_flow/flutter_flow_util.dart';
import 'home09_dashboard_widget.dart' show Home09DashboardWidget;
import 'package:flutter/material.dart';

class Home09DashboardModel extends FlutterFlowModel<Home09DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
