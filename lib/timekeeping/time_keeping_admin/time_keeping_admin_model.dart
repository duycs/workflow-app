import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_keeping_admin_widget.dart' show TimeKeepingAdminWidget;
import 'package:flutter/material.dart';

class TimeKeepingAdminModel extends FlutterFlowModel<TimeKeepingAdminWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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
