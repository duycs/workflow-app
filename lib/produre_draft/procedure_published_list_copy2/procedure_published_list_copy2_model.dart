import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'procedure_published_list_copy2_widget.dart'
    show ProcedurePublishedListCopy2Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProcedurePublishedListCopy2Model
    extends FlutterFlowModel<ProcedurePublishedListCopy2Widget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (ProcedurePublishedList)] action in ProcedurePublishedListCopy2 widget.
  ApiCallResponse? apiResultProcedurePublishedList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    expandableExpandableController.dispose();
  }

  /// Action blocks.
  Future getProcedurePublishedList(BuildContext context) async {
    ApiCallResponse? apiResultProcedurePublishedList2;

    apiResultProcedurePublishedList2 =
        await ProcedurePublishedGroup.procedurePublishedListCall.call(
      accessToken: FFAppState().accessToken,
    );
    if ((apiResultProcedurePublishedList2?.succeeded ?? true)) {
      dataList = ProcedurePublishedListDataStruct.maybeFromMap(
              (apiResultProcedurePublishedList2?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<ProcedurePublishedListStruct>();
    }
  }
}
