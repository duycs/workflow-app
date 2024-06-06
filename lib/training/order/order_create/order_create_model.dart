import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/training/order/payment/payment_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_create_widget.dart' show OrderCreateWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderCreateModel extends FlutterFlowModel<OrderCreateWidget> {
  ///  Local state fields for this component.

  List<ProgramOrderItemsCreateStruct> programItems = [];
  void addToProgramItems(ProgramOrderItemsCreateStruct item) =>
      programItems.add(item);
  void removeFromProgramItems(ProgramOrderItemsCreateStruct item) =>
      programItems.remove(item);
  void removeAtIndexFromProgramItems(int index) => programItems.removeAt(index);
  void insertAtIndexInProgramItems(
          int index, ProgramOrderItemsCreateStruct item) =>
      programItems.insert(index, item);
  void updateProgramItemsAtIndex(
          int index, Function(ProgramOrderItemsCreateStruct) updateFn) =>
      programItems[index] = updateFn(programItems[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  String? _quantityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập số lượng!';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Action Block - OrderCreate] action in Button widget.
  String? orderCreateDraft;
  // Stores action output result for [Action Block - OrderCreate] action in Button widget.
  String? orderCreateDraft2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? orderUpdateStatusDone;
  // Stores action output result for [Backend Call - API (QrCode)] action in Button widget.
  ApiCallResponse? apiResultQrCodeCreate;

  @override
  void initState(BuildContext context) {
    quantityTextControllerValidator = _quantityTextControllerValidator;
  }

  @override
  void dispose() {
    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future<String?> orderCreate(BuildContext context) async {
    bool? reloadOrderCreate;
    ApiCallResponse? apiResultOrderCreate;

    addToProgramItems(ProgramOrderItemsCreateStruct(
      id: widget.programId,
      totalItem: functions.stringToInt(quantityTextController.text),
      private: widget.checkType == 'organization' ? 0 : 1,
    ));
    reloadOrderCreate = await action_blocks.tokenReload(context);
    if (reloadOrderCreate!) {
      apiResultOrderCreate = await OrderGroup.createOrderCall.call(
        accessToken: FFAppState().accessToken,
        requestDataJson: <String, dynamic>{
          'customer_id': FFAppState().staffid,
          'programs': getJsonField(
            <String, List<dynamic>>{
              'map': programItems.map((e) => e.toMap()).toList(),
            },
            r'''$.map''',
          ),
          'private': getJsonField(
            <String, int?>{
              'map': widget.checkType == 'organization' ? 0 : 1,
            },
            r'''$.map''',
          ),
        },
      );
      if ((apiResultOrderCreate?.succeeded ?? true)) {
        return getJsonField(
          (apiResultOrderCreate?.jsonBody ?? ''),
          r'''$[0]''',
        ).toString().toString();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Lỗi tạo đơn hàng!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return null;
    } else {
      return null;
    }
  }
}
