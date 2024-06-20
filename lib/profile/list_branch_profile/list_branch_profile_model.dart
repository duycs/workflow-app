import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'list_branch_profile_widget.dart' show ListBranchProfileWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  String search = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ListBranchProfile widget.
  bool? checkTokenListBranchProfile;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController1?.dispose();
  }

  /// Action blocks.
  Future getDepartmentList(BuildContext context) async {
    bool? reloadTokenDepartmentList;
    ApiCallResponse? apiResultDepartmentList;

    reloadTokenDepartmentList = await action_blocks.tokenReload(context);
    if (reloadTokenDepartmentList!) {
      apiResultDepartmentList =
          await DepartmentGroup.getDepartmentListCall.call(
        accessToken: FFAppState().accessToken,
      );

      if ((apiResultDepartmentList.succeeded ?? true)) {}
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getLinkBranch(BuildContext context) async {
    bool? reloadTokenBaranchList1;
    ApiCallResponse? apiResultldh;

    reloadTokenBaranchList1 = await action_blocks.tokenReload(context);
    if (reloadTokenBaranchList1!) {
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
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController1?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewBranchListPage1);
  }

  void listViewBranchListPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewBranchListResponse) {
        final pageItems = (BranchListDataStruct.maybeFromMap(
                        listViewBranchListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewBranchListResponse,
                )
              : null,
        );
      });
}
