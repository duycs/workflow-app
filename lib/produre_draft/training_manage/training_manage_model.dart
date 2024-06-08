import '/flutter_flow/flutter_flow_util.dart';
import 'training_manage_widget.dart' show TrainingManageWidget;
import 'package:flutter/material.dart';

class TrainingManageModel extends FlutterFlowModel<TrainingManageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
