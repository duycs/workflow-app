import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/export_excel/export_excel_widget.dart';
import '/tasks/filter_report_staff/filter_report_staff_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'report_staff_widget.dart' show ReportStaffWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ReportStaffModel extends FlutterFlowModel<ReportStaffWidget> {
  ///  Local state fields for this page.

  String statusFilter = '';

  bool isShow = false;

  String branch = '';

  String department = '';

  String listaaaa = '';

  dynamic json;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ReportStaff widget.
  bool? getStaffList2Token;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? filterToken1;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getNoFilterToken2;
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
  Future getListStaffs(BuildContext context) async {
    ApiCallResponse? apiResultGetList;
    bool? checkRefreshTokenBlock;

    apiResultGetList = await StaffGroup.getStaffListCall.call(
      accessToken: FFAppState().accessToken,
      offset: 0,
      limit: 5000,
      filter:
          '{\"_and\":[{}${(textController.text != null && textController.text != '') && (textController.text != ' ') ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${textController.text}\"}}}' : ' '}${() {
        if (FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') {
          return ',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}}';
        } else if (FFAppState().user.role ==
            'a8d33527-375b-4599-ac70-6a3fcad1de39') {
          return ',{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.branch_id''',
          ).toString().toString()}\"}}}';
        } else if (FFAppState().user.role ==
            '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
          return ',{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.department_id''',
          ).toString().toString()}\"}}}';
        } else {
          return ' ';
        }
      }()}${() {
        if ((statusFilter != null && statusFilter != '') &&
            (statusFilter == 'Hoạt động') &&
            (statusFilter != ' ')) {
          return ',{\"status\":{\"_eq\":\"active\"}}';
        } else if ((statusFilter != null && statusFilter != '') &&
            (statusFilter == 'Không hoạt động') &&
            (statusFilter != ' ')) {
          return ',{\"status\":{\"_neq\":\"active\"}}';
        } else {
          return ' ';
        }
      }()}${(branch != '1') && (branch != ' ') && (branch != null && branch != '') ? ',{\"branch_id\":{\"id\":{\"_eq\":\"${branch}\"}}}' : ' '}${(department != '1') && (department != ' ') && (department != null && department != '') ? ',{\"department_id\":{\"id\":{\"_eq\":\"${department}\"}}}' : ' '}]}',
      sort: 'sort',
    );

    if ((apiResultGetList?.succeeded ?? true)) {
      listaaaa = (apiResultGetList?.jsonBody ?? '').toString();
      json = (apiResultGetList?.jsonBody ?? '');
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        await actions.showToast(
          context,
          FFAppConstants.ErrorLoadData,
          FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).error,
        );
      } else {
        await getListStaffs(context);
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
    return controller..addPageRequestListener(listViewGetStaffListPage);
  }

  void listViewGetStaffListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetStaffListResponse) {
        final pageItems = (StaffListDataStruct.maybeFromMap(
                        listViewGetStaffListResponse.jsonBody)!
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
                  lastResponse: listViewGetStaffListResponse,
                )
              : null,
        );
      });
}
