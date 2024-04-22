import '/flutter_flow/flutter_flow_util.dart';
import 'filter_work_result_widget.dart' show FilterWorkResultWidget;
import 'package:flutter/material.dart';

class FilterWorkResultModel extends FlutterFlowModel<FilterWorkResultWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for nameUserCreated widget.
  FocusNode? nameUserCreatedFocusNode;
  TextEditingController? nameUserCreatedTextController;
  String? Function(BuildContext, String?)?
      nameUserCreatedTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    nameUserCreatedFocusNode?.dispose();
    nameUserCreatedTextController?.dispose();
  }
}
