import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_shift_update_widget.dart'
    show TimeKeepingShiftUpdateWidget;
import 'package:flutter/material.dart';

class TimeKeepingShiftUpdateModel
    extends FlutterFlowModel<TimeKeepingShiftUpdateWidget> {
  ///  Local state fields for this component.

  String startTime = ' ';

  String endTime = ' ';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? shiftUpdate;
  // Stores action output result for [Backend Call - API (ShiftUpdate)] action in Button widget.
  ApiCallResponse? apiResultShiftUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
