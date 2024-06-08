import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'procedure_list_widget.dart' show ProcedureListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  bool? checkTokenProcedureList;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    listViewPagingController?.dispose();
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
          }(dateEnd!)}\"}}' : ' '}${(staffsId != null && staffsId != '') && (staffsId != ' ') ? ',{\"steps\":{\"staffs\":{\"staffs_id\":{\"_eq\":\"$staffsId\"}}}}' : ' '},{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}]}',
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

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewWorkflowsListPage);
  }

  void listViewWorkflowsListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewWorkflowsListResponse) {
        final pageItems = (WorkflowsListDataStruct.maybeFromMap(
                        listViewWorkflowsListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewWorkflowsListResponse,
                )
              : null,
        );
      });
}
