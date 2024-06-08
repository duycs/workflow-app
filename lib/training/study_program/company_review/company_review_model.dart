import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_review_widget.dart' show CompanyReviewWidget;
import 'package:flutter/material.dart';

class CompanyReviewModel extends FlutterFlowModel<CompanyReviewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenReviewProgram;
  // Stores action output result for [Backend Call - API (ReviewProgram)] action in Button widget.
  ApiCallResponse? apiResultReviewProgram;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
