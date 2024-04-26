import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/staff/filter_personnel_list/filter_personnel_list_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'personnel_list_widget.dart' show PersonnelListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PersonnelListModel extends FlutterFlowModel<PersonnelListWidget> {
  ///  Local state fields for this page.

  List<StaffListStruct> list = [];
  void addToList(StaffListStruct item) => list.add(item);
  void removeFromList(StaffListStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, StaffListStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  dynamic staffData;

  dynamic departmentData;

  dynamic branchData;

  String statusFilter = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in PersonnelList widget.
  bool? getStaffListToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in PersonnelList widget.
  ApiCallResponse? apiResultGetStaffList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? filterToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in TextField widget.
  ApiCallResponse? apiResultFilter;
  // Stores action output result for [Action Block - tokenReload] action in TextField widget.
  bool? getNoFilterToken;
  // Stores action output result for [Backend Call - API (GetStaffList)] action in TextField widget.
  ApiCallResponse? apiResultGetNoFilter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
