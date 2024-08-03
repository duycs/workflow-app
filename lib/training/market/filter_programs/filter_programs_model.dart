import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_programs_widget.dart' show FilterProgramsWidget;
import 'package:flutter/material.dart';

class FilterProgramsModel extends FlutterFlowModel<FilterProgramsWidget> {
  ///  Local state fields for this component.

  String check1 = '';

  String check2 = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for domain widget.
  String? domainValue;
  FormFieldController<String>? domainValueController;
  // State field(s) for author widget.
  FocusNode? authorFocusNode;
  TextEditingController? authorTextController;
  String? Function(BuildContext, String?)? authorTextControllerValidator;
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  // State field(s) for priceMin widget.
  FocusNode? priceMinFocusNode;
  TextEditingController? priceMinTextController;
  String? Function(BuildContext, String?)? priceMinTextControllerValidator;
  // State field(s) for priceMax widget.
  FocusNode? priceMaxFocusNode;
  TextEditingController? priceMaxTextController;
  String? Function(BuildContext, String?)? priceMaxTextControllerValidator;
  // State field(s) for priceMin1 widget.
  FocusNode? priceMin1FocusNode;
  TextEditingController? priceMin1TextController;
  String? Function(BuildContext, String?)? priceMin1TextControllerValidator;
  // State field(s) for priceMax1 widget.
  FocusNode? priceMax1FocusNode;
  TextEditingController? priceMax1TextController;
  String? Function(BuildContext, String?)? priceMax1TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    authorFocusNode?.dispose();
    authorTextController?.dispose();

    categoryFocusNode?.dispose();
    categoryTextController?.dispose();

    priceMinFocusNode?.dispose();
    priceMinTextController?.dispose();

    priceMaxFocusNode?.dispose();
    priceMaxTextController?.dispose();

    priceMin1FocusNode?.dispose();
    priceMin1TextController?.dispose();

    priceMax1FocusNode?.dispose();
    priceMax1TextController?.dispose();
  }
}
