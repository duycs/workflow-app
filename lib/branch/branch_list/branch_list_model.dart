import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'branch_list_widget.dart' show BranchListWidget;
import 'package:flutter/material.dart';

class BranchListModel extends FlutterFlowModel<BranchListWidget> {
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

  String filter = '';

  List<String> codeList = [];
  void addToCodeList(String item) => codeList.add(item);
  void removeFromCodeList(String item) => codeList.remove(item);
  void removeAtIndexFromCodeList(int index) => codeList.removeAt(index);
  void insertAtIndexInCodeList(int index, String item) =>
      codeList.insert(index, item);
  void updateCodeListAtIndex(int index, Function(String) updateFn) =>
      codeList[index] = updateFn(codeList[index]);

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
  Future getLinkBranch(BuildContext context) async {
    bool? reloadTokenBranchList;
    ApiCallResponse? apiResultListBranch;

    reloadTokenBranchList = await action_blocks.tokenReload(context);
    if (reloadTokenBranchList!) {
      apiResultListBranch = await BranchGroup.branchListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${(filter != '') && (filter != ' ') ? ',{\"name\":{\"_icontains\":\"$filter\"}}' : ' '}${',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}}'}]}',
      );
      if ((apiResultListBranch.succeeded ?? true)) {
        listBranch = BranchListDataStruct.maybeFromMap(
                (apiResultListBranch.jsonBody ?? ''))!
            .data
            .toList()
            .cast<BranchListStruct>();
      }
    } else {
      return;
    }
  }
}
