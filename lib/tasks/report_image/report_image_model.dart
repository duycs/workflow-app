import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/filter_reprot_image/filter_reprot_image_widget.dart';
import '/tasks/gridview_report_image/gridview_report_image_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'report_image_widget.dart' show ReportImageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ReportImageModel extends FlutterFlowModel<ReportImageWidget> {
  ///  Local state fields for this page.

  List<TaskListStruct> reportImage = [];
  void addToReportImage(TaskListStruct item) => reportImage.add(item);
  void removeFromReportImage(TaskListStruct item) => reportImage.remove(item);
  void removeAtIndexFromReportImage(int index) => reportImage.removeAt(index);
  void insertAtIndexInReportImage(int index, TaskListStruct item) =>
      reportImage.insert(index, item);
  void updateReportImageAtIndex(int index, Function(TaskListStruct) updateFn) =>
      reportImage[index] = updateFn(reportImage[index]);

  String nameSearch = '';

  String nameProcedure = '';

  String startDate = '';

  String endDate = '';

  String checkData = '';

  String nameTask = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in ReportImage widget.
  bool? reloadTokenTasksCheck;
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
  Future getReportImages(BuildContext context) async {
    bool? reloadTokenTasks;
    ApiCallResponse? apiResultGetReportImage;

    reloadTokenTasks = await action_blocks.tokenReload(context);
    if (reloadTokenTasks!) {
      apiResultGetReportImage = await TaskGroup.getListTaskCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{},{\"status\":{\"_eq\":\"done\"}}, {\"action_type\":{\"_eq\":\"image\"}}${(nameProcedure != null && nameProcedure != '') && (nameProcedure != ' ') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"${nameProcedure}\"}}}' : ' '}${(nameSearch != null && nameSearch != '') && (nameSearch != ' ') ? ',{\"submit_staff_id\":{\"user_id\":{\"first_name\":{\"_icontains\":\"${nameSearch}\"}}}}' : ' '}${(startDate != null && startDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_gte\":\"${startDate}\"}}}}' : ' '}${(endDate != null && endDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_lte\":\"${(String var1) {
                return DateTime.parse(var1).add(Duration(days: 1)).toString();
              }(endDate)}\"}}}}' : ' '}${() {
          if (FFAppState().user.role ==
              '82073000-1ba2-43a4-a55c-459d17c23b68') {
            return ',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString()}\"}}}';
          } else if (FFAppState().user.role ==
              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
            return ',{\"submit_staff_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.branch_id''',
            ).toString().toString()}\"}}}';
          } else if (FFAppState().user.role ==
              '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
            return ',{\"submit_staff_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.department_id''',
            ).toString().toString()}\"}}}';
          } else {
            return ',{\"submit_staff_id\":{\"user_id\":{\"id\":{\"_eq\":\"${FFAppState().user.id}\"}}}}';
          }
        }()}]}',
      );

      if ((apiResultGetReportImage?.succeeded ?? true)) {
        reportImage = TaskListDataStruct.maybeFromMap(
                (apiResultGetReportImage?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
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
    return controller..addPageRequestListener(listViewGetListTaskPage);
  }

  void listViewGetListTaskPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
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
                  lastResponse: listViewGetListTaskResponse,
                )
              : null,
        );
      });
}
