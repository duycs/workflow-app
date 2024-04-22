import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'personnel_list_widget.dart' show PersonnelListWidget;
import 'package:flutter/material.dart';

class PersonnelListModel extends FlutterFlowModel<PersonnelListWidget> {
  ///  Local state fields for this page.

  List<StaffListStruct> list = [];
  void addToList(StaffListStruct item) => list.add(item);
  void removeFromList(StaffListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  dynamic staffData;

  dynamic departmentData;

  dynamic branchData;

  String statusFilter = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetStaffList)] action in PersonnelList widget.
  ApiCallResponse? apiResultGetStaffList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in TextField widget.
  ApiCallResponse? apiResultFilter;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in TextField widget.
  ApiCallResponse? apiResultGetNoFilter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
