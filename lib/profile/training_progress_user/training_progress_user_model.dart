import '/flutter_flow/flutter_flow_util.dart';
import 'training_progress_user_widget.dart' show TrainingProgressUserWidget;
import 'package:flutter/material.dart';

class TrainingProgressUserModel
    extends FlutterFlowModel<TrainingProgressUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
