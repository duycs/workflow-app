import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/long_text_do_test/long_text_do_test_widget.dart';
import '/training/do_test/select_do_test/select_do_test_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'do_test_detail_widget.dart' show DoTestDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  Map<QuestionAnswerObjectStruct, bool> checkboxValueMap = {};
  List<QuestionAnswerObjectStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
