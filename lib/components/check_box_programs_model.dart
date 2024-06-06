import '/flutter_flow/flutter_flow_util.dart';
import 'check_box_programs_widget.dart' show CheckBoxProgramsWidget;
import 'package:flutter/material.dart';

class CheckBoxProgramsModel extends FlutterFlowModel<CheckBoxProgramsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.

  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
