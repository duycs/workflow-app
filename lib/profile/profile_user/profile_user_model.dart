import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_user_widget.dart' show ProfileUserWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileUserModel extends FlutterFlowModel<ProfileUserWidget> {
  ///  Local state fields for this page.

  StaffListStruct? profileUser;
  void updateProfileUserStruct(Function(StaffListStruct) updateFn) {
    updateFn(profileUser ??= StaffListStruct());
  }

  dynamic user;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in ProfileUser widget.
  bool? reloadTokenStaffOne;
  // Stores action output result for [Backend Call - API (StaffGetOne)] action in ProfileUser widget.
  ApiCallResponse? apiResultUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
