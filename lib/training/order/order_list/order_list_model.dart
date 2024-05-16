import '/flutter_flow/flutter_flow_util.dart';
import 'order_list_widget.dart' show OrderListWidget;
import 'package:flutter/material.dart';

class OrderListModel extends FlutterFlowModel<OrderListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
