import '/flutter_flow/flutter_flow_util.dart';
import 'training_progress_widget.dart' show TrainingProgressWidget;
import 'package:flutter/material.dart';

class TrainingProgressModel extends FlutterFlowModel<TrainingProgressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
