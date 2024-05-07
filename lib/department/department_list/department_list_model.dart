import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'department_list_widget.dart' show DepartmentListWidget;
import 'package:flutter/material.dart';

class DepartmentListModel extends FlutterFlowModel<DepartmentListWidget> {
  ///  Local state fields for this page.

  List<DepartmentListStruct> list = [];
  void addToList(DepartmentListStruct item) => list.add(item);
  void removeFromList(DepartmentListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, DepartmentListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(DepartmentListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String status = '';

  List<String> dataParam = [];
  void addToDataParam(String item) => dataParam.add(item);
  void removeFromDataParam(String item) => dataParam.remove(item);
  void removeAtIndexFromDataParam(int index) => dataParam.removeAt(index);
  void insertAtIndexInDataParam(int index, String item) =>
      dataParam.insert(index, item);
  void updateDataParamAtIndex(int index, Function(String) updateFn) =>
      dataParam[index] = updateFn(dataParam[index]);

  String checkAPI = '';

  String branchId = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();
  }

  /// Action blocks.
  Future getDepartmentList(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlocktt;

    apiResultList = await DepartmentGroup.getDepartmentListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${() {
        if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
          return '{\"organization_id\":{\"_eq\":\"';
        } else if (FFAppState().user.role ==
            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
          return '{\"branch_id\":{\"id\":{\"_eq\":\"';
        } else {
          return ' ';
        }
      }()}${() {
        if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
          return getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString();
        } else if (FFAppState().user.role ==
            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
          return getJsonField(
            FFAppState().staffBranch,
            r'''$.id''',
          ).toString().toString();
        } else {
          return ' ';
        }
      }()}${() {
        if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
          return '\"}}';
        } else if (FFAppState().user.role ==
            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
          return '\"}}}';
        } else {
          return ' ';
        }
      }()}${nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}' : ' '}${(status != '') && (status != 'noData') ? ',{\"status\":{\"_eq\":\"' : ' '}${(status != '') && (status != 'noData') ? status : ' '}${(status != '') && (status != 'noData') ? '\"}}' : ' '}${(branchId != '') && (branchId != 'noData') ? ',{\"branch_id\":{\"id\":{\"_eq\":\"' : ' '}${(branchId != '') && (branchId != 'noData') ? branchId : ' '}${(branchId != '') && (branchId != 'noData') ? '\"}}}' : ' '}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      list = DepartmentListDataStruct.maybeFromMap(
              (apiResultList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DepartmentListStruct>();
      checkAPI = '1';
    } else {
      checkRefreshTokenBlocktt = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlocktt!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getDepartmentList(context);
      }
    }
  }
}
