import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/training/order/after_invite/after_invite_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'invite_user_widget.dart' show InviteUserWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InviteUserModel extends FlutterFlowModel<InviteUserWidget> {
  ///  Local state fields for this component.

  List<StaffListStruct> selectedStaffList = [];
  void addToSelectedStaffList(StaffListStruct item) =>
      selectedStaffList.add(item);
  void removeFromSelectedStaffList(StaffListStruct item) =>
      selectedStaffList.remove(item);
  void removeAtIndexFromSelectedStaffList(int index) =>
      selectedStaffList.removeAt(index);
  void insertAtIndexInSelectedStaffList(int index, StaffListStruct item) =>
      selectedStaffList.insert(index, item);
  void updateSelectedStaffListAtIndex(
          int index, Function(StaffListStruct) updateFn) =>
      selectedStaffList[index] = updateFn(selectedStaffList[index]);

  int? loop = 0;

  List<StaffListStruct> getStaffList = [];
  void addToGetStaffList(StaffListStruct item) => getStaffList.add(item);
  void removeFromGetStaffList(StaffListStruct item) =>
      getStaffList.remove(item);
  void removeAtIndexFromGetStaffList(int index) => getStaffList.removeAt(index);
  void insertAtIndexInGetStaffList(int index, StaffListStruct item) =>
      getStaffList.insert(index, item);
  void updateGetStaffListAtIndex(
          int index, Function(StaffListStruct) updateFn) =>
      getStaffList[index] = updateFn(getStaffList[index]);

  MarketLessonListStruct? program;
  void updateProgramStruct(Function(MarketLessonListStruct) updateFn) =>
      updateFn(program ??= MarketLessonListStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (InviteStaff)] action in Button widget.
  ApiCallResponse? apiResultInvite1;
  // Stores action output result for [Backend Call - API (InviteStaff)] action in Button widget.
  ApiCallResponse? apiResultInvite0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getStaffList1(BuildContext context) async {
    bool? reloadGetStaff;
    ApiCallResponse? apiResultGetStaff1;

    reloadGetStaff = await action_blocks.tokenReload(context);
    if (reloadGetStaff!) {
      apiResultGetStaff1 = await StaffGroup.getStaffListCall.call(
        accessToken: FFAppState().accessToken,
        filter: program?.private == 1
            ? '{\"_and\":[{\"id\":{\"_neq\":\"${FFAppState().staffid}\"}},{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}},{\"status\":{\"_eq\":\"active\"}}]}'
            : '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffOrganization,
                r'''$.id''',
              ).toString().toString()}\"}},{\"status\":{\"_eq\":\"active\"}}]}',
      );
      if ((apiResultGetStaff1?.succeeded ?? true)) {
        getStaffList = StaffListDataStruct.maybeFromMap(
                (apiResultGetStaff1?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StaffListStruct>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi lấy danh sách nhân viên!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return;
      }
    } else {
      return;
    }
  }

  Future getOneProgram(BuildContext context) async {
    bool? reloadGetOneProgram;
    ApiCallResponse? apiResultGetOneProgram;

    reloadGetOneProgram = await action_blocks.tokenReload(context);
    if (reloadGetOneProgram!) {
      apiResultGetOneProgram =
          await GroupMarketLessonGroup.getOneProgramsCall.call(
        accessToken: FFAppState().accessToken,
        idPrograms: widget.programId,
      );
      if ((apiResultGetOneProgram?.succeeded ?? true)) {
        program = MarketLessonListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneProgram?.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    } else {
      return;
    }
  }
}
