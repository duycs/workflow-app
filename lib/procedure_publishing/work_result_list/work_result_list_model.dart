import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'work_result_list_widget.dart' show WorkResultListWidget;
import 'package:flutter/material.dart';

class WorkResultListModel extends FlutterFlowModel<WorkResultListWidget> {
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

  String nameSearch = '';

  String dateStart = '';

  String dateEnd = '';

  String userCreated = '';

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
    bool? reloadTokenResuftPublish;
    ApiCallResponse? apiResultProcedurePublishedList2;

    reloadTokenResuftPublish = await action_blocks.tokenReload(context);
    if (reloadTokenResuftPublish!) {
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
        }()}${(nameSearch != '') && (nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"$nameSearch\"}}' : ' '}${(dateStart != '') && (dateStart != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_gte\":\"$dateStart\"}}}}' : ' '}${(dateEnd != '') && (dateEnd != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_lte\":\"$dateEnd\"}}}}' : ' '}${(userCreated != '') && (userCreated != ' ') ? ',{\"steps\":{\"tasks\":{\"user_created\":{\"first_name\":{\"_icontains\":\"$userCreated\"}}}}}' : ' '}]}',
      );
      if ((apiResultProcedurePublishedList2.succeeded ?? true)) {
        dataList = ProcedurePublishedListDataStruct.maybeFromMap(
                (apiResultProcedurePublishedList2.jsonBody ?? ''))!
            .data
            .toList()
            .cast<ProcedurePublishedListStruct>();
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
