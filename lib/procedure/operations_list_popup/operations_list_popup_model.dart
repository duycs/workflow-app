import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'operations_list_popup_widget.dart' show OperationsListPopupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OperationsListPopupModel
    extends FlutterFlowModel<OperationsListPopupWidget> {
  ///  Local state fields for this component.

  bool isLoad = false;

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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - tokenReload] action in OperationsListPopup widget.
  bool? tokenOperationsListPopup;
  // Stores action output result for [Backend Call - API (OperationList)] action in OperationsListPopup widget.
  ApiCallResponse? apiResult9q7;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    tabBarController?.dispose();
  }
}
