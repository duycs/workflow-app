import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_user_widget.dart' show ProfileUserWidget;
import 'package:flutter/material.dart';

class ProfileUserModel extends FlutterFlowModel<ProfileUserWidget> {
  ///  Local state fields for this page.

  StaffListStruct? profileUser;
  void updateProfileUserStruct(Function(StaffListStruct) updateFn) =>
      updateFn(profileUser ??= StaffListStruct());

  dynamic user;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ProfileUser widget.
  bool? reloadTokenStaffOne;
  // Stores action output result for [Backend Call - API (GetStaffGetOne)] action in ProfileUser widget.
  ApiCallResponse? apiResultUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
