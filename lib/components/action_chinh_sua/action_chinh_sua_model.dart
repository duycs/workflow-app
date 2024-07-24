import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/certificate/list_certi/list_certi_widget.dart';
import '/training/market/add_program_market/add_program_market_widget.dart';
import '/training/study_program/add_department/add_department_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import 'action_chinh_sua_widget.dart' show ActionChinhSuaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActionChinhSuaModel extends FlutterFlowModel<ActionChinhSuaWidget> {
  ///  Local state fields for this component.

  bool triggerRefreshList = false;

  String checkPage = '';

  int setColor = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
