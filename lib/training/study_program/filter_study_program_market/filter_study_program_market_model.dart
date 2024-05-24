import '/flutter_flow/flutter_flow_util.dart';
import 'filter_study_program_market_widget.dart'
    show FilterStudyProgramMarketWidget;
import 'package:flutter/material.dart';

class FilterStudyProgramMarketModel
    extends FlutterFlowModel<FilterStudyProgramMarketWidget> {
  ///  Local state fields for this component.

  String? dateEndFilter;

  String? dateStartFilter;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for lessions widget.
  FocusNode? lessionsFocusNode;
  TextEditingController? lessionsTextController;
  String? Function(BuildContext, String?)? lessionsTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lessionsFocusNode?.dispose();
    lessionsTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
