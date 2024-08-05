import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_keeping_shift_created_widget.dart'
    show TimeKeepingShiftCreatedWidget;
import 'package:flutter/material.dart';

class TimeKeepingShiftCreatedModel
    extends FlutterFlowModel<TimeKeepingShiftCreatedWidget> {
  ///  Local state fields for this component.

  String startTime = ' ';

  String endTime = ' ';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Vui lòng nhập tên ca làm việc!';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? shiftCreate;
  // Stores action output result for [Backend Call - API (ShiftCreate)] action in Button widget.
  ApiCallResponse? apiResultShiftCreate;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
