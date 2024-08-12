import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/data_not_found_row_new/data_not_found_row_new_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'list_staff_profile_company_widget.dart'
    show ListStaffProfileCompanyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ListStaffProfileCompanyModel
    extends FlutterFlowModel<ListStaffProfileCompanyWidget> {
  ///  Local state fields for this page.

  List<StaffListStruct> listStaff = [];
  void addToListStaff(StaffListStruct item) => listStaff.add(item);
  void removeFromListStaff(StaffListStruct item) => listStaff.remove(item);
  void removeAtIndexFromListStaff(int index) => listStaff.removeAt(index);
  void insertAtIndexInListStaff(int index, StaffListStruct item) =>
      listStaff.insert(index, item);
  void updateListStaffAtIndex(int index, Function(StaffListStruct) updateFn) =>
      listStaff[index] = updateFn(listStaff[index]);

  String filter = '';

  String checkStaff = '';

  bool isSShow = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in ListStaffProfileCompany widget.
  bool? reloadTokenListStaffProfileCompanyApp;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController1?.dispose();
    listViewPagingController2?.dispose();
  }

  /// Action blocks.
  Future getLinkStaff(BuildContext context) async {
    bool? reloadTokenGetStaffList;
    ApiCallResponse? apiResultGetListStaff;

    reloadTokenGetStaffList = await action_blocks.tokenReload(context);
    if (reloadTokenGetStaffList!) {
      apiResultGetListStaff = await StaffGroup.getStaffListCall.call(
        accessToken: FFAppState().accessToken,
        filter: filter,
      );

      if ((apiResultGetListStaff?.succeeded ?? true)) {
        listStaff = StaffListDataStruct.maybeFromMap(
                (apiResultGetListStaff?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StaffListStruct>();
        checkStaff = '1';
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController1?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListView2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController2?.nextPageKey?.nextPageNumber ?? 0) > 0;
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
    return controller..addPageRequestListener(listViewGetStaffListPage1);
  }

  void listViewGetStaffListPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewGetStaffListResponse) {
        final pageItems = (StaffListDataStruct.maybeFromMap(
                        listViewGetStaffListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetStaffListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetStaffListPage2);
  }

  void listViewGetStaffListPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker).then((listViewGetStaffListResponse) {
        final pageItems = (StaffListDataStruct.maybeFromMap(
                        listViewGetStaffListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetStaffListResponse,
                )
              : null,
        );
      });
}
