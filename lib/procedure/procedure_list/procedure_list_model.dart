import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'procedure_list_widget.dart' show ProcedureListWidget;
import 'package:flutter/material.dart';

class ProcedureListModel extends FlutterFlowModel<ProcedureListWidget> {
  ///  Local state fields for this page.

  List<WorkflowsStruct> dataList = [];
  void addToDataList(WorkflowsStruct item) => dataList.add(item);
  void removeFromDataList(WorkflowsStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, WorkflowsStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(WorkflowsStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoad = false;

  String? searchName;

  String? dateStart;

  String? dateEnd;

  String? staffsId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ProcedureList widget.
  bool? checkToken;
  // Stores action output result for [Backend Call - API (workflowsList)] action in ProcedureList widget.
  ApiCallResponse? apiResultListData;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();
  }

  /// Action blocks.
  Future getListAction(BuildContext context) async {
    bool? tokenReloadSearchProcedureList;
    ApiCallResponse? apiResultListSearchData;

    tokenReloadSearchProcedureList = await action_blocks.tokenReload(context);
    if (tokenReloadSearchProcedureList!) {
      apiResultListSearchData =
          await ProcedureTemplateGroup.workflowsListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{},{\"template\":{\"_neq\":\"1\"}}${(searchName != null && searchName != '') && (searchName != ' ') ? ',{\"name\":{\"_icontains\":\"$searchName\"}}' : ' '}${(dateStart != null && dateStart != '') && (dateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"$dateStart\"}}' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
            return DateTime.parse(var1).add(const Duration(days: 1)).toString();
          }(dateEnd!)}\"}}' : ' '}${(staffsId != null && staffsId != '') && (staffsId != ' ') ? ',{\"steps\":{\"staffs\":{\"staffs_id\":{\"_eq\":\"$staffsId\"}}}}' : ' '}${FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68' ? ',{\"organization_id\":{\"_eq\":\"' : ' '}${FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68' ? getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString() : ' '}${FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68' ? '\"}}' : ' '}]}',
      );
      if ((apiResultListSearchData.succeeded ?? true)) {
        dataList = WorkflowsListDataStruct.maybeFromMap(
                (apiResultListSearchData.jsonBody ?? ''))!
            .data
            .toList()
            .cast<WorkflowsStruct>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      isLoad = true;
    }
  }
}
