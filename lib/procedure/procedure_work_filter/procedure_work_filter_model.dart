import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/staffs_list_dropdown/staffs_list_dropdown_widget.dart';
import 'procedure_work_filter_widget.dart' show ProcedureWorkFilterWidget;
import 'package:flutter/material.dart';

class ProcedureWorkFilterModel
    extends FlutterFlowModel<ProcedureWorkFilterWidget> {
  ///  Local state fields for this component.

  String? dateStartFilter;

  String? dateEndFilter;

  String? staff;

  bool isLoad = false;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for StaffsListDropdown component.
  late StaffsListDropdownModel staffsListDropdownModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    staffsListDropdownModel =
        createModel(context, () => StaffsListDropdownModel());
  }

  @override
  void dispose() {
    staffsListDropdownModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
