import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_update_widget.dart' show OrderUpdateWidget;
import 'package:flutter/material.dart';

class OrderUpdateModel extends FlutterFlowModel<OrderUpdateWidget> {
  ///  Local state fields for this component.

  List<ProgramOrderItemsCreateStruct> orderItems = [];
  void addToOrderItems(ProgramOrderItemsCreateStruct item) =>
      orderItems.add(item);
  void removeFromOrderItems(ProgramOrderItemsCreateStruct item) =>
      orderItems.remove(item);
  void removeAtIndexFromOrderItems(int index) => orderItems.removeAt(index);
  void insertAtIndexInOrderItems(
          int index, ProgramOrderItemsCreateStruct item) =>
      orderItems.insert(index, item);
  void updateOrderItemsAtIndex(
          int index, Function(ProgramOrderItemsCreateStruct) updateFn) =>
      orderItems[index] = updateFn(orderItems[index]);

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? orderUpdateStatus;
  // Stores action output result for [Backend Call - API (QrCode)] action in Button widget.
  ApiCallResponse? apiResultQrCodeCreate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future updateOrder(BuildContext context) async {
    bool? reloadOrderUpdate;
    ApiCallResponse? apiResultOrderUpdate;

    addToOrderItems(ProgramOrderItemsCreateStruct(
      id: widget.programId,
      totalItem: functions.stringToInt(textController1.text),
      private: functions.stringToInt(dropDownValue!),
    ));
    reloadOrderUpdate = await action_blocks.tokenReload(context);
    if (reloadOrderUpdate!) {
      apiResultOrderUpdate = await OrderGroup.updateOrderCall.call(
        accessToken: FFAppState().accessToken,
        requestDataJson: <String, dynamic>{
          'program_order_id': widget.orderId,
          'customer_id': FFAppState().staffid,
          'private': functions.stringToInt(dropDownValue!),
          'programs': getJsonField(
            <String, List<dynamic>>{
              'map': orderItems.map((e) => e.toMap()).toList(),
            },
            r'''$.map''',
          ),
        },
      );

      if (!(apiResultOrderUpdate.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi cập nhật đơn hàng!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return;
      }
    } else {
      return;
    }
  }
}
