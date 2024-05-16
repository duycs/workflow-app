import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/department/selected_programs/selected_programs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'department_detail_widget.dart' show DepartmentDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepartmentDetailModel extends FlutterFlowModel<DepartmentDetailWidget> {
  ///  Local state fields for this page.

  List<ProgramStruct> selectedPrograms = [];
  void addToSelectedPrograms(ProgramStruct item) => selectedPrograms.add(item);
  void removeFromSelectedPrograms(ProgramStruct item) =>
      selectedPrograms.remove(item);
  void removeAtIndexFromSelectedPrograms(int index) =>
      selectedPrograms.removeAt(index);
  void insertAtIndexInSelectedPrograms(int index, ProgramStruct item) =>
      selectedPrograms.insert(index, item);
  void updateSelectedProgramsAtIndex(
          int index, Function(ProgramStruct) updateFn) =>
      selectedPrograms[index] = updateFn(selectedPrograms[index]);

  int? loop = 0;

  String checkPrograms = '0';

  int? loop1 = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? reloadTokenUpdatePrograms;
  // Stores action output result for [Backend Call - API (UpdatePrograms)] action in Button widget.
  ApiCallResponse? apiResult8ul;
  // Models for selectedPrograms dynamic component.
  late FlutterFlowDynamicModels<SelectedProgramsModel> selectedProgramsModels;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    selectedProgramsModels =
        FlutterFlowDynamicModels(() => SelectedProgramsModel());
  }

  @override
  void dispose() {
    selectedProgramsModels.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
