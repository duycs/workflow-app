import '/flutter_flow/flutter_flow_util.dart';
import 'noti_widget.dart' show NotiWidget;
import 'package:flutter/material.dart';

class NotiModel extends FlutterFlowModel<NotiWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
