import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_study_widget.dart' show UpdateStudyWidget;
import 'package:flutter/material.dart';

class UpdateStudyModel extends FlutterFlowModel<UpdateStudyWidget> {
  ///  Local state fields for this component.

  List<ProgramStruct> programsDerpartmen = [];
  void addToProgramsDerpartmen(ProgramStruct item) =>
      programsDerpartmen.add(item);
  void removeFromProgramsDerpartmen(ProgramStruct item) =>
      programsDerpartmen.remove(item);
  void removeAtIndexFromProgramsDerpartmen(int index) =>
      programsDerpartmen.removeAt(index);
  void insertAtIndexInProgramsDerpartmen(int index, ProgramStruct item) =>
      programsDerpartmen.insert(index, item);
  void updateProgramsDerpartmenAtIndex(
          int index, Function(ProgramStruct) updateFn) =>
      programsDerpartmen[index] = updateFn(programsDerpartmen[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
