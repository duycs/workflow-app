import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/department/selected_programs/selected_programs_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'department_detail_widget.dart' show DepartmentDetailWidget;
import 'package:flutter/material.dart';

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

  List<String> programItems = [];
  void addToProgramItems(String item) => programItems.add(item);
  void removeFromProgramItems(String item) => programItems.remove(item);
  void removeAtIndexFromProgramItems(int index) => programItems.removeAt(index);
  void insertAtIndexInProgramItems(int index, String item) =>
      programItems.insert(index, item);
  void updateProgramItemsAtIndex(int index, Function(String) updateFn) =>
      programItems[index] = updateFn(programItems[index]);

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
