import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/branch/branch_create/branch_create_widget.dart';
import '/branch/filter_branch/filter_branch_widget.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'branch_list_widget.dart' show BranchListWidget;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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

  String checkData = '';

  String searchStatus = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
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
            '{\"_and\":[{}${(filter != null && filter != '') && (filter != ' ') ? ',{\"name\":{\"_icontains\":\"${filter}\"}}' : ' '}${',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}}'}${(searchStatus != null && searchStatus != '') && (searchStatus != ' ') ? ',{\"status\":{\"_icontains\":\"${searchStatus}\"}}' : ' '}]}',
      );
      if ((apiResultListBranch?.succeeded ?? true)) {
        listBranch = BranchListDataStruct.maybeFromMap(
                (apiResultListBranch?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<BranchListStruct>();
        codeList =
            listBranch.map((e) => e.code).toList().toList().cast<String>();
        checkData = '1';
      }
    } else {
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
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
    return controller..addPageRequestListener(listViewBranchListPage);
  }

  void listViewBranchListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewBranchListResponse) {
        final pageItems = (BranchListDataStruct.maybeFromMap(
                        listViewBranchListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewBranchListResponse,
                )
              : null,
        );
      });
}
