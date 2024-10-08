import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'add_department_widget.dart' show AddDepartmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDepartmentModel extends FlutterFlowModel<AddDepartmentWidget> {
  ///  Local state fields for this component.

  List<DepartmentListStruct> dataList = [];
  void addToDataList(DepartmentListStruct item) => dataList.add(item);
  void removeFromDataList(DepartmentListStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, DepartmentListStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoad = false;

  List<DepartmentListStruct> listAdd = [];
  void addToListAdd(DepartmentListStruct item) => listAdd.add(item);
  void removeFromListAdd(DepartmentListStruct item) => listAdd.remove(item);
  void removeAtIndexFromListAdd(int index) => listAdd.removeAt(index);
  void insertAtIndexInListAdd(int index, DepartmentListStruct item) =>
      listAdd.insert(index, item);
  void updateListAddAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      listAdd[index] = updateFn(listAdd[index]);

  RequestAddDerStruct? request;
  void updateRequestStruct(Function(RequestAddDerStruct) updateFn) {
    updateFn(request ??= RequestAddDerStruct());
  }

  int loop = 0;

  List<DepartmentListStruct> requestDepartmentList = [];
  void addToRequestDepartmentList(DepartmentListStruct item) =>
      requestDepartmentList.add(item);
  void removeFromRequestDepartmentList(DepartmentListStruct item) =>
      requestDepartmentList.remove(item);
  void removeAtIndexFromRequestDepartmentList(int index) =>
      requestDepartmentList.removeAt(index);
  void insertAtIndexInRequestDepartmentList(
          int index, DepartmentListStruct item) =>
      requestDepartmentList.insert(index, item);
  void updateRequestDepartmentListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      requestDepartmentList[index] = updateFn(requestDepartmentList[index]);

  List<DepartmentListStruct> checkDepartmentList = [];
  void addToCheckDepartmentList(DepartmentListStruct item) =>
      checkDepartmentList.add(item);
  void removeFromCheckDepartmentList(DepartmentListStruct item) =>
      checkDepartmentList.remove(item);
  void removeAtIndexFromCheckDepartmentList(int index) =>
      checkDepartmentList.removeAt(index);
  void insertAtIndexInCheckDepartmentList(
          int index, DepartmentListStruct item) =>
      checkDepartmentList.insert(index, item);
  void updateCheckDepartmentListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      checkDepartmentList[index] = updateFn(checkDepartmentList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in AddDepartment widget.
  bool? tokenReloadAddDepartmentListList;
  // Stores action output result for [Backend Call - API (GetDepartmentList)] action in AddDepartment widget.
  ApiCallResponse? addDepartmentListcall;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? tokenReloadAddDepartmentListListCallApi;
  // Stores action output result for [Backend Call - API (UpdateDepartmentSynchronized)] action in Button widget.
  ApiCallResponse? studyProgramAddDepartment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
