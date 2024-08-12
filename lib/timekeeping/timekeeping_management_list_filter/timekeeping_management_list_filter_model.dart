import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'timekeeping_management_list_filter_widget.dart'
    show TimekeepingManagementListFilterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimekeepingManagementListFilterModel
    extends FlutterFlowModel<TimekeepingManagementListFilterWidget> {
  ///  Local state fields for this component.

  List<BranchListStruct> listBranch = [];
  void addToListBranch(BranchListStruct item) => listBranch.add(item);
  void removeFromListBranch(BranchListStruct item) => listBranch.remove(item);
  void removeAtIndexFromListBranch(int index) => listBranch.removeAt(index);
  void insertAtIndexInListBranch(int index, BranchListStruct item) =>
      listBranch.insert(index, item);
  void updateListBranchAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      listBranch[index] = updateFn(listBranch[index]);

  List<DepartmentListStruct> listDepartment = [];
  void addToListDepartment(DepartmentListStruct item) =>
      listDepartment.add(item);
  void removeFromListDepartment(DepartmentListStruct item) =>
      listDepartment.remove(item);
  void removeAtIndexFromListDepartment(int index) =>
      listDepartment.removeAt(index);
  void insertAtIndexInListDepartment(int index, DepartmentListStruct item) =>
      listDepartment.insert(index, item);
  void updateListDepartmentAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      listDepartment[index] = updateFn(listDepartment[index]);

  List<StaffListStruct> listStaffs = [];
  void addToListStaffs(StaffListStruct item) => listStaffs.add(item);
  void removeFromListStaffs(StaffListStruct item) => listStaffs.remove(item);
  void removeAtIndexFromListStaffs(int index) => listStaffs.removeAt(index);
  void insertAtIndexInListStaffs(int index, StaffListStruct item) =>
      listStaffs.insert(index, item);
  void updateListStaffsAtIndex(int index, Function(StaffListStruct) updateFn) =>
      listStaffs[index] = updateFn(listStaffs[index]);

  List<ShiftListStruct> listShifts = [];
  void addToListShifts(ShiftListStruct item) => listShifts.add(item);
  void removeFromListShifts(ShiftListStruct item) => listShifts.remove(item);
  void removeAtIndexFromListShifts(int index) => listShifts.removeAt(index);
  void insertAtIndexInListShifts(int index, ShiftListStruct item) =>
      listShifts.insert(index, item);
  void updateListShiftsAtIndex(int index, Function(ShiftListStruct) updateFn) =>
      listShifts[index] = updateFn(listShifts[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;
  // State field(s) for DropDown3 widget.
  String? dropDown3Value;
  FormFieldController<String>? dropDown3ValueController;
  // State field(s) for DropDown4 widget.
  String? dropDown4Value;
  FormFieldController<String>? dropDown4ValueController;
  // State field(s) for DropDown5 widget.
  String? dropDown5Value;
  FormFieldController<String>? dropDown5ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getListBranch(BuildContext context) async {
    ApiCallResponse? apiResultGetListBranch;
    bool? checkRefreshTokenBlock;

    apiResultGetListBranch = await BranchGroup.branchListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}}]}',
    );

    if ((apiResultGetListBranch?.succeeded ?? true)) {
      listBranch = BranchListDataStruct.maybeFromMap(
              (apiResultGetListBranch?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<BranchListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListBranch?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListBranch(context);
      }
    }
  }

  Future getListDepartment(BuildContext context) async {
    ApiCallResponse? apiResultListDeparment;
    bool? checkRefreshTokenBlock1;

    apiResultListDeparment = await DepartmentGroup.getDepartmentListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"branch_id\":{\"id\":{\"_eq\":\"${functions.isRoleBranchAdmin(FFAppState().user) ? getJsonField(
              FFAppState().staffLogin,
              r'''$.branch_id''',
            ).toString().toString() : dropDown1Value}\"}}}]}',
    );

    if ((apiResultListDeparment?.succeeded ?? true)) {
      listDepartment = DepartmentListDataStruct.maybeFromMap(
              (apiResultListDeparment?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DepartmentListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListDeparment?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListDepartment(context);
      }
    }
  }

  Future getListStaffs(BuildContext context) async {
    ApiCallResponse? apiResuitListStaffs;
    bool? checkRefreshTokenBlock3;

    apiResuitListStaffs = await StaffGroup.getStaffListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"department_id\":{\"id\":{\"_eq\":\"${FFAppState().user.role == '6a8bc644-cb2d-4a31-b11e-b86e19824725' ? getJsonField(
              FFAppState().staffLogin,
              r'''$.department_id''',
            ).toString().toString() : dropDown2Value}\"}}}]}',
    );

    if ((apiResuitListStaffs?.succeeded ?? true)) {
      listStaffs = StaffListDataStruct.maybeFromMap(
              (apiResuitListStaffs?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StaffListStruct>();
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResuitListStaffs?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock3!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListStaffs(context);
      }
    }
  }

  Future getListShifts(BuildContext context) async {
    ApiCallResponse? apiResultGetListShifts;
    bool? checkRefreshTokenBlock2;

    apiResultGetListShifts =
        await TimekeepingShiftConfigsGroup.shiftListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffOrganization,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"published\"}}]}',
    );

    if ((apiResultGetListShifts?.succeeded ?? true)) {
      listShifts = (getJsonField(
        (apiResultGetListShifts?.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
              .toList()
              .map<ShiftListStruct?>(ShiftListStruct.maybeFromMap)
              .toList() as Iterable<ShiftListStruct?>)
          .withoutNulls
          .toList()
          .cast<ShiftListStruct>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListShifts?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListShifts(context);
      }
    }
  }
}
