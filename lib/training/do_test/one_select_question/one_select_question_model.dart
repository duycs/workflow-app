import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'one_select_question_widget.dart' show OneSelectQuestionWidget;
import 'package:flutter/material.dart';

class OneSelectQuestionModel extends FlutterFlowModel<OneSelectQuestionWidget> {
  ///  Local state fields for this component.

  List<AnswersListStruct> detail = [];
  void addToDetail(AnswersListStruct item) => detail.add(item);
  void removeFromDetail(AnswersListStruct item) => detail.remove(item);
  void removeAtIndexFromDetail(int index) => detail.removeAt(index);
  void insertAtIndexInDetail(int index, AnswersListStruct item) =>
      detail.insert(index, item);
  void updateDetailAtIndex(int index, Function(AnswersListStruct) updateFn) =>
      detail[index] = updateFn(detail[index]);

  String? answerId = '';

  int? correct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
