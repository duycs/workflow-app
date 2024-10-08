import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'filter_do_test_widget.dart' show FilterDoTestWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterDoTestModel extends FlutterFlowModel<FilterDoTestWidget> {
  ///  Local state fields for this component.

  String dateStart = '';

  String dateEnd = '';

  List<StaffsTestsListStruct> llst = [];
  void addToLlst(StaffsTestsListStruct item) => llst.add(item);
  void removeFromLlst(StaffsTestsListStruct item) => llst.remove(item);
  void removeAtIndexFromLlst(int index) => llst.removeAt(index);
  void insertAtIndexInLlst(int index, StaffsTestsListStruct item) =>
      llst.insert(index, item);
  void updateLlstAtIndex(int index, Function(StaffsTestsListStruct) updateFn) =>
      llst[index] = updateFn(llst[index]);

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
