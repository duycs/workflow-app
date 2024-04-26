import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_personnel_list_widget.dart' show FilterPersonnelListWidget;
import 'package:flutter/material.dart';

class FilterPersonnelListModel
    extends FlutterFlowModel<FilterPersonnelListWidget> {
  ///  Local state fields for this component.

  List<StaffListStruct> list = [];
  void addToList(StaffListStruct item) => list.add(item);
  void removeFromList(StaffListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for status widget.
  FormFieldController<List<String>>? statusValueController;
  String? get statusValue => statusValueController?.value?.firstOrNull;
  set statusValue(String? val) =>
      statusValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? clearFilterToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in Button widget.
  ApiCallResponse? apiResultClearFilter;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? filterToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in Button widget.
  ApiCallResponse? apiResultFilter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
