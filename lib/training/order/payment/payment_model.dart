import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';

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
