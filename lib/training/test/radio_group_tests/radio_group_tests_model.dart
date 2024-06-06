import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'radio_group_tests_widget.dart' show RadioGroupTestsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RadioGroupTestsModel extends FlutterFlowModel<RadioGroupTestsWidget> {
  ///  Local state fields for this component.

  List<AnswersListStruct> detail = [];
  void addToDetail(AnswersListStruct item) => detail.add(item);
  void removeFromDetail(AnswersListStruct item) => detail.remove(item);
  void removeAtIndexFromDetail(int index) => detail.removeAt(index);
  void insertAtIndexInDetail(int index, AnswersListStruct item) =>
      detail.insert(index, item);
  void updateDetailAtIndex(int index, Function(AnswersListStruct) updateFn) =>
      detail[index] = updateFn(detail[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
