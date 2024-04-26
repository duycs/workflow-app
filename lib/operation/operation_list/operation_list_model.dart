import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/operation/filter_operation/filter_operation_widget.dart';
import '/operation/operation_create/operation_create_widget.dart';
import '/operation/operation_detail/operation_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'operation_list_widget.dart' show OperationListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OperationListModel extends FlutterFlowModel<OperationListWidget> {
  ///  Local state fields for this page.

  List<OperationsStruct> operationList = [];
  void addToOperationList(OperationsStruct item) => operationList.add(item);
  void removeFromOperationList(OperationsStruct item) =>
      operationList.remove(item);
  void removeAtIndexFromOperationList(int index) =>
      operationList.removeAt(index);
  void insertAtIndexInOperationList(int index, OperationsStruct item) =>
      operationList.insert(index, item);
  void updateOperationListAtIndex(
          int index, Function(OperationsStruct) updateFn) =>
      operationList[index] = updateFn(operationList[index]);

  String seachName = '';

  String seachUserCreate = '';

  String searchAction = '';

  String searchDateStart = '';

  String searchDateEnd = '';

  String searchStatus = '';

  String executeId = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks.
  Future getLinkOperations(BuildContext context) async {
    bool? apiResutfRefreshTokenOperations;
    ApiCallResponse? apiResultOperations;

    apiResutfRefreshTokenOperations = await action_blocks.tokenReload(context);
    if (apiResutfRefreshTokenOperations!) {
      apiResultOperations = await OperationGroup.operationListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}${(seachName != null && seachName != '') && (seachName != ' ') ? ',{\"name\":{\"_icontains\":\"${seachName}\"}}' : ' '}${(searchStatus != null && searchStatus != '') && (searchStatus != ' ') ? ',{\"status\":{\"_eq\":\"${searchStatus}\"}}' : ' '}${(searchAction != null && searchAction != '') && (searchAction != ' ') ? ',{\"action_type\":{\"_eq\":\"${searchAction}\"}}' : ' '}${(searchDateStart != null && searchDateStart != '') && (searchDateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${searchDateStart}\"}}' : ''}${(searchDateEnd != null && searchDateEnd != '') && (searchDateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${(String var1) {
                return DateTime.parse(var1).add(Duration(days: 1)).toString();
              }(searchDateEnd)}\"}}' : ' '}]}',
      );
      if ((apiResultOperations?.succeeded ?? true)) {
        operationList = OperationsListDataStruct.maybeFromMap(
                (apiResultOperations?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<OperationsStruct>();
      }
    } else {
      return;
    }
  }
}
