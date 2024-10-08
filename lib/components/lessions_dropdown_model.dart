import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'lessions_dropdown_widget.dart' show LessionsDropdownWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LessionsDropdownModel extends FlutterFlowModel<LessionsDropdownWidget> {
  ///  Local state fields for this component.

  List<LessonsStruct> dataList = [];
  void addToDataList(LessonsStruct item) => dataList.add(item);
  void removeFromDataList(LessonsStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, LessonsStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(LessonsStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - tokenReload] action in LessionsDropdown widget.
  bool? tokenReloadLessionsDropdown;
  // Stores action output result for [Backend Call - API (GetLessonList)] action in LessionsDropdown widget.
  ApiCallResponse? apiResultLessonList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
