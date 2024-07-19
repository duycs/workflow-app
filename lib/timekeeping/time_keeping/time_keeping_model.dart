import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_widget.dart' show TimeKeepingWidget;
import 'package:flutter/material.dart';

class TimeKeepingModel extends FlutterFlowModel<TimeKeepingWidget> {
  ///  Local state fields for this page.

  List<dynamic> itemTimekeepings = [];
  void addToItemTimekeepings(dynamic item) => itemTimekeepings.add(item);
  void removeFromItemTimekeepings(dynamic item) =>
      itemTimekeepings.remove(item);
  void removeAtIndexFromItemTimekeepings(int index) =>
      itemTimekeepings.removeAt(index);
  void insertAtIndexInItemTimekeepings(int index, dynamic item) =>
      itemTimekeepings.insert(index, item);
  void updateItemTimekeepingsAtIndex(int index, Function(dynamic) updateFn) =>
      itemTimekeepings[index] = updateFn(itemTimekeepings[index]);

  bool isLoad = false;

  List<TimekeepingsStruct> timeKeepingList = [];
  void addToTimeKeepingList(TimekeepingsStruct item) =>
      timeKeepingList.add(item);
  void removeFromTimeKeepingList(TimekeepingsStruct item) =>
      timeKeepingList.remove(item);
  void removeAtIndexFromTimeKeepingList(int index) =>
      timeKeepingList.removeAt(index);
  void insertAtIndexInTimeKeepingList(int index, TimekeepingsStruct item) =>
      timeKeepingList.insert(index, item);
  void updateTimeKeepingListAtIndex(
          int index, Function(TimekeepingsStruct) updateFn) =>
      timeKeepingList[index] = updateFn(timeKeepingList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Button widget.
  bool? authenticateBiometicsTimeKeeping;
  // Stores action output result for [Custom Action - timeKeepingLocation] action in Button widget.
  String? timeKeepingLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getTimekeepings(BuildContext context) async {
    ApiCallResponse? apiResultGetTimekeepings;

    apiResultGetTimekeepings =
        await GroupTimekeepingsGroup.getTimekeepingsCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"staff_id\":{\"_eq\":\"${FFAppState().staffid}\"}}]}',
    );

    if ((apiResultGetTimekeepings.succeeded ?? true)) {
      itemTimekeepings = getJsonField(
        (apiResultGetTimekeepings.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
          .toList()
          .cast<dynamic>();
    }
  }
}
