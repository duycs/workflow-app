import '/flutter_flow/flutter_flow_util.dart';
import 'procedure_published_detail_widget.dart'
    show ProcedurePublishedDetailWidget;
import 'package:flutter/material.dart';

class ProcedurePublishedDetailModel
    extends FlutterFlowModel<ProcedurePublishedDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
