import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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

  /// Action blocks.
  Future getListOrder(BuildContext context) async {
    bool? listOrderToken;
    ApiCallResponse? apiResultGetListOrder;

    listOrderToken = await action_blocks.tokenReload(context);
    if (listOrderToken!) {
      apiResultGetListOrder = await OrderGroup.getListOrderCall.call(
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetListOrder.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'apiResultGetListOrder',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    } else {
      FFAppState().update(() {});
    }
  }
}
