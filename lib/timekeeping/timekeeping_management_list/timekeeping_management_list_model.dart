import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/timekeeping/timekeeping_management_list_filter/timekeeping_management_list_filter_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'timekeeping_management_list_widget.dart'
    show TimekeepingManagementListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class TimekeepingManagementListModel
    extends FlutterFlowModel<TimekeepingManagementListWidget> {
  ///  Local state fields for this component.

  String? checkShow = '';

  String dateStart = '';

  String dateEnd = '';

  String idBranch = '';

  String idDepartment = '';

  String idStaff = '';

  String idShifts = '';

  String idStatus = '';

  dynamic json;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListShiftdays(BuildContext context) async {
    ApiCallResponse? apiResultGetList;
    bool? checkRefreshTokenBlock;

    apiResultGetList = await GroupTimekeepingsGroup.getShiftDaysCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffOrganization,
        r'''$.id''',
      ).toString().toString()}\"}}}'}${(widget!.checkShowParams == 'check') && ((dateStart == null || dateStart == '') && (dateEnd == null || dateEnd == '')) ? ',{\"date_created\":{\"_gte\":\"${DateTime(DateTime.parse(getCurrentTimestamp.toString()).year, DateTime.parse(getCurrentTimestamp.toString()).month, 1).toString()}\"}},{\"date_created\":{\"_lt\":\"${DateTime(DateTime.parse(getCurrentTimestamp.toString()).year, DateTime.parse(getCurrentTimestamp.toString()).month + 1, 1).toString()}\"}}' : ' '}${(widget!.checkShowParams == 'check') && ((dateStart != null && dateStart != '') && (dateEnd != null && dateEnd != '')) ? ',{\"date_created\":{\"_gte\":\"${DateTime(DateTime.parse(dateStart).year, DateTime.parse(dateStart).month, 1).toString()}\"}},{\"date_created\":{\"_lt\":\"${DateTime(DateTime.parse(dateEnd).year, DateTime.parse(dateEnd).month + 1, 1).toString()}\"}}' : ' '}${functions.isRoleBranchAdmin(FFAppState().user) ? ',{\"staff_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffBranch,
          r'''$.id''',
        ).toString().toString()}\"}}}' : ' '}${functions.isRoleDepartmentAdmin(FFAppState().user) ? ',{\"staff_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffDepartment,
          r'''$.id''',
        ).toString().toString()}\"}}}' : ' '}${widget!.dateFilter != null && widget!.dateFilter != '' ? ',{\"date_created\":{\"_gte\":\"${widget!.dateFilter}\"}},{\"date_created\":{\"_lt\":\"${(String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(widget!.dateFilter!)}\"}}' : ' '}${(idStaff != null && idStaff != '') && (idStaff != 'noData') ? ',{\"staff_id\":{\"user_id\":{\"id\":{\"_eq\":\"${idStaff}\"}}}}' : ' '}${(idBranch != null && idBranch != '') && (idBranch != 'noData') ? ',{\"staff_id\":{\"branch_id\":{\"_eq\":\"${idBranch}\"}}}' : ' '}${(idDepartment != null && idDepartment != '') && (idDepartment != 'noData') ? ',{\"staff_id\":{\"department_id\":{\"_eq\":\"${idDepartment}\"}}}' : ' '}${(idShifts != null && idShifts != '') && (idShifts != 'noData') ? ',{\"shift_id\":{\"id\":{\"_eq\":\"${idShifts}\"}}}' : ' '}${(idStatus != null && idStatus != '') && (idStatus != 'noData') ? ',{\"status\":{\"_eq\":\"${idStatus}\"}}' : ' '}]}',
    );

    if ((apiResultGetList?.succeeded ?? true)) {
      json = getJsonField(
        (apiResultGetList?.jsonBody ?? ''),
        r'''$.data''',
      );
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListShiftdays(context);
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
    return controller..addPageRequestListener(listViewGetShiftDaysPage);
  }

  void listViewGetShiftDaysPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetShiftDaysResponse) {
        final pageItems = ((getJsonField(
                  listViewGetShiftDaysResponse.jsonBody,
                  r'''$.data''',
                  true,
                )!
                        .toList()
                        .map<ShiftdaysStruct?>(ShiftdaysStruct.maybeFromMap)
                        .toList() as Iterable<ShiftdaysStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetShiftDaysResponse,
                )
              : null,
        );
      });
}
