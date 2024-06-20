import '/flutter_flow/flutter_flow_util.dart';
import 'profile17_other_user_widget.dart' show Profile17OtherUserWidget;
import 'package:flutter/material.dart';

class Profile17OtherUserModel
    extends FlutterFlowModel<Profile17OtherUserWidget> {
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
