import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'tests_dropdown_widget.dart' show TestsDropdownWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestsDropdownModel extends FlutterFlowModel<TestsDropdownWidget> {
  ///  Local state fields for this component.

  List<TestListStruct> dataListTest = [];
  void addToDataListTest(TestListStruct item) => dataListTest.add(item);
  void removeFromDataListTest(TestListStruct item) => dataListTest.remove(item);
  void removeAtIndexFromDataListTest(int index) => dataListTest.removeAt(index);
  void insertAtIndexInDataListTest(int index, TestListStruct item) =>
      dataListTest.insert(index, item);
  void updateDataListTestAtIndex(
          int index, Function(TestListStruct) updateFn) =>
      dataListTest[index] = updateFn(dataListTest[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in TestsDropdown widget.
  bool? tokenReloadTestsDropdown;
  // Stores action output result for [Backend Call - API (TestList)] action in TestsDropdown widget.
  ApiCallResponse? apiResultTestList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
