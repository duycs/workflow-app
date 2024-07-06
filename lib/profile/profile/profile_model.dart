import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  StaffListStruct? staffDetail;
  void updateStaffDetailStruct(Function(StaffListStruct) updateFn) {
    updateFn(staffDetail ??= StaffListStruct());
  }

  bool checkLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    navBarModel.dispose();
  }
}
