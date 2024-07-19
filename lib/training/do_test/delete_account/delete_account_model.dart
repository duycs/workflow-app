import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'delete_account_widget.dart' show DeleteAccountWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteAccountModel extends FlutterFlowModel<DeleteAccountWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? delateAccount;
  // Stores action output result for [Backend Call - API (DeleteAccount)] action in Button widget.
  ApiCallResponse? apiResultDeleteAccount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
