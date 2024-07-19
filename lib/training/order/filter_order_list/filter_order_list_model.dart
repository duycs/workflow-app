import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filter_order_list_widget.dart' show FilterOrderListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterOrderListModel extends FlutterFlowModel<FilterOrderListWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for status widget.
  FormFieldController<List<String>>? statusValueController;
  String? get statusValue => statusValueController?.value?.firstOrNull;
  set statusValue(String? val) =>
      statusValueController?.value = val != null ? [val] : [];
  // State field(s) for private widget.
  FormFieldController<List<String>>? privateValueController;
  String? get privateValue => privateValueController?.value?.firstOrNull;
  set privateValue(String? val) =>
      privateValueController?.value = val != null ? [val] : [];
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for author widget.
  FocusNode? authorFocusNode;
  TextEditingController? authorTextController;
  String? Function(BuildContext, String?)? authorTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeFocusNode?.dispose();
    codeTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    authorFocusNode?.dispose();
    authorTextController?.dispose();
  }
}
