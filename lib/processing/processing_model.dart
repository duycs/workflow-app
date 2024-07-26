import '/flutter_flow/flutter_flow_util.dart';
import 'processing_widget.dart' show ProcessingWidget;
import 'package:flutter/material.dart';

class ProcessingModel extends FlutterFlowModel<ProcessingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
