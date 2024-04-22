import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_staff_profile_company_widget.dart'
    show ListStaffProfileCompanyWidget;
import 'package:flutter/material.dart';

class ListStaffProfileCompanyModel
    extends FlutterFlowModel<ListStaffProfileCompanyWidget> {
  ///  Local state fields for this page.

  List<StaffListStruct> listStaff = [];
  void addToListStaff(StaffListStruct item) => listStaff.add(item);
  void removeFromListStaff(StaffListStruct item) => listStaff.remove(item);
  void removeAtIndexFromListStaff(int index) => listStaff.removeAt(index);
  void insertAtIndexInListStaff(int index, StaffListStruct item) =>
      listStaff.insert(index, item);
  void updateListStaffAtIndex(int index, Function(StaffListStruct) updateFn) =>
      listStaff[index] = updateFn(listStaff[index]);

  String filter = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getLinkStaff(BuildContext context) async {
    ApiCallResponse? apiResultGetListStaff;

    apiResultGetListStaff = await StaffGroup.getStaffListCall.call(
      accessToken: FFAppState().accessToken,
      filter: filter,
    );
    if ((apiResultGetListStaff.succeeded ?? true)) {
      listStaff = StaffListDataStruct.maybeFromMap(
              (apiResultGetListStaff.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StaffListStruct>();
    }
  }
}
