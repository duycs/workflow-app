import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? checkTransfer;
  // Stores action output result for [Backend Call - API (CheckTransfer)] action in Button widget.
  ApiCallResponse? apiResultCheckTransfer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
