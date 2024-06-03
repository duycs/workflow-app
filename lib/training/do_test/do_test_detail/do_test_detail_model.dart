import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'do_test_detail_widget.dart' show DoTestDetailWidget;
import 'package:flutter/material.dart';

class DoTestDetailModel extends FlutterFlowModel<DoTestDetailWidget> {
  ///  Local state fields for this page.

  List<StaffAnswerListStruct> list = [];
  void addToList(StaffAnswerListStruct item) => list.add(item);
  void removeFromList(StaffAnswerListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffAnswerListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffAnswerListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  List<AnswersListStruct> listNull = [];
  void addToListNull(AnswersListStruct item) => listNull.add(item);
  void removeFromListNull(AnswersListStruct item) => listNull.remove(item);
  void removeAtIndexFromListNull(int index) => listNull.removeAt(index);
  void insertAtIndexInListNull(int index, AnswersListStruct item) =>
      listNull.insert(index, item);
  void updateListNullAtIndex(int index, Function(AnswersListStruct) updateFn) =>
      listNull[index] = updateFn(listNull[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in DoTestDetail widget.
  bool? getStaffAnswerListToken;
  // Stores action output result for [Backend Call - API (StaffAnswerList)] action in DoTestDetail widget.
  ApiCallResponse? apiResultGetStaffAnswerList;
  // State field(s) for Checkbox widget.

  Map<QuestionAnswerObjectStruct, bool> checkboxValueMap1 = {};
  List<QuestionAnswerObjectStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<QuestionAnswerObjectStruct, bool> checkboxValueMap2 = {};
  List<QuestionAnswerObjectStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
