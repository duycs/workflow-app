import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/author/author_sign_up/author_sign_up_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  StaffListStruct? staffDetail;
  void updateStaffDetailStruct(Function(StaffListStruct) updateFn) {
    updateFn(staffDetail ??= StaffListStruct());
  }

  bool checkLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in Profile widget.
  bool? reloadTokenStaffGetOne;
  // Stores action output result for [Backend Call - API (StaffGetOne)] action in Profile widget.
  ApiCallResponse? apiResultGetDetail;
  // Stores action output result for [Custom Action - getReTokenUser] action in Button widget.
  String? checkWfBV;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
