import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'company_review_widget.dart' show CompanyReviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
