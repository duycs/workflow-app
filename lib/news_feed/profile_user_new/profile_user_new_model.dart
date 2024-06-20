import '/flutter_flow/flutter_flow_util.dart';
import 'profile_user_new_widget.dart' show ProfileUserNewWidget;
import 'package:flutter/material.dart';

class ProfileUserNewModel extends FlutterFlowModel<ProfileUserNewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
