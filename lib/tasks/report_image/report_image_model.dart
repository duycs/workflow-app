import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'report_image_widget.dart' show ReportImageWidget;
import 'package:flutter/material.dart';

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
  Future getReportImages(BuildContext context) async {
    bool? reloadTokenTasks;
    ApiCallResponse? apiResultGetReportImage;

    reloadTokenTasks = await action_blocks.tokenReload(context);
    if (reloadTokenTasks!) {
      apiResultGetReportImage = await TaskGroup.getListTaskCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{},{\"status\":{\"_eq\":\"done\"}}, {\"action_type\":{\"_eq\":\"image\"}}${(nameProcedure != '') && (nameProcedure != ' ') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"$nameProcedure\"}}}' : ' '}${(nameSearch != '') && (nameSearch != ' ') ? ',{\"submit_staff_id\":{\"user_id\":{\"first_name\":{\"_icontains\":\"$nameSearch\"}}}}' : ' '}${(startDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_gte\":\"$startDate\"}}}}' : ' '}${(endDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_lte\":\"${(String var1) {
                return DateTime.parse(var1).add(const Duration(days: 1)).toString();
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
      if ((apiResultGetReportImage.succeeded ?? true)) {
        reportImage = TaskListDataStruct.maybeFromMap(
                (apiResultGetReportImage.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
        checkData = '1';
      }
    } else {
      return;
    }
  }
}
