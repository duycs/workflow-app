import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/filter_procedure_published/filter_procedure_published_widget.dart';
import '/procedure_publishing/procedure_pushlished/procedure_pushlished_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'procedure_published_list_widget.dart' show ProcedurePublishedListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProcedurePublishedListModel
    extends FlutterFlowModel<ProcedurePublishedListWidget> {
  ///  Local state fields for this page.

  List<ProcedurePublishedListStruct> dataList = [];
  void addToDataList(ProcedurePublishedListStruct item) => dataList.add(item);
  void removeFromDataList(ProcedurePublishedListStruct item) =>
      dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, ProcedurePublishedListStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(ProcedurePublishedListStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  String searchName = '';

  String dateStart = '';

  String dateEnd = '';

  String searchUserCreated = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks.
  Future getProcedurePublishedList(BuildContext context) async {
    bool? reloadTokenPublishedList;
    ApiCallResponse? apiResultProcedurePublishedList2;

    reloadTokenPublishedList = await action_blocks.tokenReload(context);
    if (reloadTokenPublishedList!) {
      apiResultProcedurePublishedList2 =
          await ProcedurePublishedGroup.procedurePublishedListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{}${() {
          if (FFAppState().user.role ==
              '82073000-1ba2-43a4-a55c-459d17c23b68') {
            return ',{\"organization_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString()}\"}}';
          } else if (FFAppState().user.role ==
              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.branch_id''',
            ).toString().toString()}\"}}}}}';
          } else if (FFAppState().user.role ==
              '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.department_id''',
            ).toString().toString()}\"}}}}}';
          } else {
            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.id''',
            ).toString().toString()}\"}}}}}';
          }
        }()}${(searchName != null && searchName != '') && (searchName != ' ') ? ',{\"name\":{\"_icontains\":\"${searchName}\"}}' : ' '}${(dateStart != null && dateStart != '') && (dateStart != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_gte\":\"${dateStart}\"}}}}' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_lte\":\"${(String var1) {
            return DateTime.parse(var1).add(Duration(days: 1)).toString();
          }(dateEnd)}\"}}}}' : ' '}${(searchUserCreated != null && searchUserCreated != '') && (searchUserCreated != ' ') ? ',{\"steps\":{\"tasks\":{\"user_created\":{\"first_name\":{\"_icontains\":\"${searchUserCreated}\"}}}}}' : ' '}]}',
      );
      if ((apiResultProcedurePublishedList2?.succeeded ?? true)) {
        dataList = ProcedurePublishedListDataStruct.maybeFromMap(
                (apiResultProcedurePublishedList2?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<ProcedurePublishedListStruct>();
      }
    } else {
      return;
    }
  }
}
