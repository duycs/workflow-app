import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'radio_group_tests_add_widget.dart' show RadioGroupTestsAddWidget;
import 'package:flutter/material.dart';

class RadioGroupTestsAddModel
    extends FlutterFlowModel<RadioGroupTestsAddWidget> {
  ///  Local state fields for this component.

  List<QuestionAnswerObjectStruct> detail = [];
  void addToDetail(QuestionAnswerObjectStruct item) => detail.add(item);
  void removeFromDetail(QuestionAnswerObjectStruct item) => detail.remove(item);
  void removeAtIndexFromDetail(int index) => detail.removeAt(index);
  void insertAtIndexInDetail(int index, QuestionAnswerObjectStruct item) =>
      detail.insert(index, item);
  void updateDetailAtIndex(
          int index, Function(QuestionAnswerObjectStruct) updateFn) =>
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
