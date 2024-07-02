import '/flutter_flow/flutter_flow_util.dart';
import 'tab_funtion_widget.dart' show TabFuntionWidget;
import 'package:flutter/material.dart';

class TabFuntionModel extends FlutterFlowModel<TabFuntionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
