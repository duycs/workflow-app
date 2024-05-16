import '/flutter_flow/flutter_flow_util.dart';
import 'market_place_draft_widget.dart' show MarketPlaceDraftWidget;
import 'package:flutter/material.dart';

class MarketPlaceDraftModel extends FlutterFlowModel<MarketPlaceDraftWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for RatingBar widget.
  double? ratingBarValue6;
  // State field(s) for RatingBar widget.
  double? ratingBarValue7;
  // State field(s) for RatingBar widget.
  double? ratingBarValue8;
  // State field(s) for RatingBar widget.
  double? ratingBarValue9;
  // State field(s) for RatingBar widget.
  double? ratingBarValue10;
  // State field(s) for RatingBar widget.
  double? ratingBarValue11;
  // State field(s) for RatingBar widget.
  double? ratingBarValue12;
  // State field(s) for RatingBar widget.
  double? ratingBarValue13;
  // State field(s) for RatingBar widget.
  double? ratingBarValue14;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    tabBarController?.dispose();
  }
}
