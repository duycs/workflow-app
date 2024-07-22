import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_widget.dart' show TimeKeepingWidget;
import 'package:flutter/material.dart';

class TimeKeepingModel extends FlutterFlowModel<TimeKeepingWidget> {
  ///  Local state fields for this page.

  dynamic itemTimekeepings;

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

  DateTime? dateStart;

  DateTime? dateEnd;

  LocationStruct? request;
  void updateRequestStruct(Function(LocationStruct) updateFn) {
    updateFn(request ??= LocationStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Button widget.
  bool? authenticateBiometicsTimeKeeping;
  // Stores action output result for [Custom Action - timeKeepingLocation] action in Button widget.
  String? timeKeepingLocation;
  // Stores action output result for [Custom Action - getCurrentLocationStruct] action in Button widget.
  List<double>? getLocation;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? apiCheckin;
  // Stores action output result for [Backend Call - API (CheckIn)] action in Button widget.
  ApiCallResponse? apiResulCheckin;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Button widget.
  bool? authenticateBiometicsTimeKeepingCheckOut;
  // Stores action output result for [Custom Action - timeKeepingLocation] action in Button widget.
  String? timeKeepingLocationCheckOut;
  // Stores action output result for [Custom Action - getCurrentLocationStruct] action in Button widget.
  List<double>? getLocationCheckOut;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? apiCheckOut;
  // Stores action output result for [Backend Call - API (CheckIn)] action in Button widget.
  ApiCallResponse? apiResulCheckOut;

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
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"date_created\":{\"_gte\":\"${dateStart?.toString()}\"}},{\"date_created\":{\"_lt\":\"${dateEnd?.toString()}\"}}]}',
    );

    if ((apiResultGetTimekeepings.succeeded ?? true)) {
      itemTimekeepings = getJsonField(
        (apiResultGetTimekeepings.jsonBody ?? ''),
        r'''$.data''',
      );
      timeKeepingList = TimekeepingsListDataStruct.maybeFromMap(
              (apiResultGetTimekeepings.jsonBody ?? ''))!
          .data
          .toList()
          .cast<TimekeepingsStruct>();
    }
  }
}
