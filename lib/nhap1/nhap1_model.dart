import '/flutter_flow/flutter_flow_util.dart';
import 'nhap1_widget.dart' show Nhap1Widget;
import 'package:flutter/material.dart';

class Nhap1Model extends FlutterFlowModel<Nhap1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
