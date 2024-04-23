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
            '{\"_and\":[{},{\"status\":{\"_eq\":\"done\"}}, {\"action_type\":{\"_eq\":\"image\"}}${(nameProcedure != '') && (nameProcedure != ' ') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"$nameProcedure\"}}}' : ' '}${(nameSearch != '') && (nameSearch != ' ') ? ',{\"staffs\":{\"staffs_id\":{\"user_id\":{\"first_name\":{\"_icontains\":\"$nameSearch\"}}}}}' : ' '}${(startDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_gte\":\"$startDate\"}}}}' : ' '}${(endDate != '') && (endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_lte\":\"$endDate\"}}}}' : ' '}${',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}}'}]}',
      );
      if ((apiResultGetReportImage.succeeded ?? true)) {
        reportImage = TaskListDataStruct.maybeFromMap(
                (apiResultGetReportImage.jsonBody ?? ''))!
            .data
            .toList()
            .cast<TaskListStruct>();
      }
    } else {
      return;
    }
  }
}
