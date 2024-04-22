import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_branch_profile_widget.dart' show ListBranchProfileWidget;
import 'package:flutter/material.dart';

class ListBranchProfileModel extends FlutterFlowModel<ListBranchProfileWidget> {
  ///  Local state fields for this page.

  List<BranchListStruct> listBranch = [];
  void addToListBranch(BranchListStruct item) => listBranch.add(item);
  void removeFromListBranch(BranchListStruct item) => listBranch.remove(item);
  void removeAtIndexFromListBranch(int index) => listBranch.removeAt(index);
  void insertAtIndexInListBranch(int index, BranchListStruct item) =>
      listBranch.insert(index, item);
  void updateListBranchAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      listBranch[index] = updateFn(listBranch[index]);

  List<DepartmentListStruct> departmentList = [];
  void addToDepartmentList(DepartmentListStruct item) =>
      departmentList.add(item);
  void removeFromDepartmentList(DepartmentListStruct item) =>
      departmentList.remove(item);
  void removeAtIndexFromDepartmentList(int index) =>
      departmentList.removeAt(index);
  void insertAtIndexInDepartmentList(int index, DepartmentListStruct item) =>
      departmentList.insert(index, item);
  void updateDepartmentListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      departmentList[index] = updateFn(departmentList[index]);

  String search = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getDepartmentList(BuildContext context) async {
    ApiCallResponse? apiResultDepartmentList;

    apiResultDepartmentList = await DepartmentGroup.getDepartmentListCall.call(
      accessToken: FFAppState().accessToken,
    );
    if ((apiResultDepartmentList.succeeded ?? true)) {
      departmentList = DepartmentListDataStruct.maybeFromMap(
              (apiResultDepartmentList.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DepartmentListStruct>();
    }
  }

  Future getLinkBranch(BuildContext context) async {
    ApiCallResponse? apiResultldh;

    apiResultldh = await BranchGroup.branchListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{}${(search != '') && (search != ' ') ? ',{\"name\":{\"_icontains\":\"$search\"}}' : ' '}${',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}}'}]}',
    );
    if ((apiResultldh.succeeded ?? true)) {
      listBranch =
          BranchListDataStruct.maybeFromMap((apiResultldh.jsonBody ?? ''))!
              .data
              .toList()
              .cast<BranchListStruct>();
    }
  }
}
