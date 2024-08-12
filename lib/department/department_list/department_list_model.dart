import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/department/filter_status_department/filter_status_department_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'department_list_widget.dart' show DepartmentListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in DepartmentList widget.
  bool? tokenReloadDepartmentListList;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getDepartmentList(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlocktt;

    apiResultList = await DepartmentGroup.getDepartmentListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${() {
        if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
          return '{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}';
        } else if (FFAppState().user.role ==
            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
          return '{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffBranch,
            r'''$.id''',
          ).toString().toString()}\"}}}';
        } else {
          return ' ';
        }
      }()}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}' : ' '}${(status != null && status != '') && (status != 'noData') ? ',{\"status\":{\"_eq\":\"${status}\"}}' : ' '}${(branchId != null && branchId != '') && (branchId != 'noData') ? ',{\"branch_id\":{\"id\":{\"_eq\":\"${branchId}\"}}}' : ' '}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      list = DepartmentListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DepartmentListStruct>();
      checkAPI = '1';
    } else {
      checkRefreshTokenBlocktt = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlocktt!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getDepartmentList(context);
      }
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
    return controller..addPageRequestListener(listViewGetDepartmentListPage);
  }

  void listViewGetDepartmentListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewGetDepartmentListResponse) {
        final pageItems = (DepartmentListDataStruct.maybeFromMap(
                        listViewGetDepartmentListResponse.jsonBody)!
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
                  lastResponse: listViewGetDepartmentListResponse,
                )
              : null,
        );
      });
}
