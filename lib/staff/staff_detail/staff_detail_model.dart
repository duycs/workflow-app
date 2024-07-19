import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'staff_detail_widget.dart' show StaffDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class StaffDetailModel extends FlutterFlowModel<StaffDetailWidget> {
  ///  Local state fields for this page.

  dynamic staffData;

  dynamic department;

  dynamic branch;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in StaffDetail widget.
  bool? getStaffInfoToken;
  // Stores action output result for [Backend Call - API (GetStaffId)] action in StaffDetail widget.
  ApiCallResponse? apiResultGetStaffInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
