import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'departments_list_drop_down_widget.dart'
    show DepartmentsListDropDownWidget;
import 'package:flutter/material.dart';

class DepartmentsListDropDownModel
    extends FlutterFlowModel<DepartmentsListDropDownWidget> {
  ///  Local state fields for this component.

  List<DepartmentListStruct> data = [];
  void addToData(DepartmentListStruct item) => data.add(item);
  void removeFromData(DepartmentListStruct item) => data.remove(item);
  void removeAtIndexFromData(int index) => data.removeAt(index);
  void insertAtIndexInData(int index, DepartmentListStruct item) =>
      data.insert(index, item);
  void updateDataAtIndex(int index, Function(DepartmentListStruct) updateFn) =>
      data[index] = updateFn(data[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in DepartmentsListDropDown widget.
  bool? tokenReloadDepartmentsListDropDown;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in DepartmentsListDropDown widget.
  ApiCallResponse? apiResultList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
