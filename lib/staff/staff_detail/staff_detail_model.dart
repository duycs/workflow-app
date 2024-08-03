import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'staff_detail_widget.dart' show StaffDetailWidget;
import 'package:flutter/material.dart';

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
