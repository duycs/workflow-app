import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
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

  List<BranchListStruct> brandList = [];
  void addToBrandList(BranchListStruct item) => brandList.add(item);
  void removeFromBrandList(BranchListStruct item) => brandList.remove(item);
  void removeAtIndexFromBrandList(int index) => brandList.removeAt(index);
  void insertAtIndexInBrandList(int index, BranchListStruct item) =>
      brandList.insert(index, item);
  void updateBrandListAtIndex(int index, Function(BranchListStruct) updateFn) =>
      brandList[index] = updateFn(brandList[index]);

  List<DepartmentListStruct> departmentList = [];
  void addToDepartmentList(DepartmentListStruct item) =>
      departmentList.add(item);
  void removeFromDepartmentList(DepartmentListStruct item) =>
      departmentList.remove(item);
  void removeAtIndexFromDepartmentList(int index) =>
      departmentList.removeAt(index);
  void insertAtIndexInDepartmentList(int index, DepartmentListStruct item) =>
      departmentList.insert(index, item);
  void updateDepartmentListAtIndex(
          int index, Function(DepartmentListStruct) updateFn) =>
      departmentList[index] = updateFn(departmentList[index]);

  List<StaffListStruct> staffsList = [];
  void addToStaffsList(StaffListStruct item) => staffsList.add(item);
  void removeFromStaffsList(StaffListStruct item) => staffsList.remove(item);
  void removeAtIndexFromStaffsList(int index) => staffsList.removeAt(index);
  void insertAtIndexInStaffsList(int index, StaffListStruct item) =>
      staffsList.insert(index, item);
  void updateStaffsListAtIndex(int index, Function(StaffListStruct) updateFn) =>
      staffsList[index] = updateFn(staffsList[index]);

  DateTime? calendarMonth;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;
  // State field(s) for DropDown3 widget.
  String? dropDown3Value;
  FormFieldController<String>? dropDown3ValueController;
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
  // Stores action output result for [Backend Call - API (CheckOut)] action in Button widget.
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
    bool? checkRefreshTokenBlock3;

    apiResultGetTimekeepings =
        await GroupTimekeepingsGroup.getTimekeepingsCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${widget!.checkShowFilter == 'adminReport' ? dropDown3Value : FFAppState().staffid}\"}}},{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffOrganization,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"date_created\":{\"_gte\":\"${dateStart != null ? dateStart?.toString() : (DateTime(DateTime.parse(getCurrentTimestamp.toString()).year, DateTime.parse(getCurrentTimestamp.toString()).month, 0).toString())}\"}},{\"date_created\":{\"_lt\":\"${dateEnd != null ? dateEnd?.toString() : ((String var1) {
              return DateTime.parse(var1).month == 12
                  ? DateTime(DateTime.parse(var1).year + 1, 1, 0).toString()
                  : DateTime(DateTime.parse(var1).year,
                          DateTime.parse(var1).month + 1, 0)
                      .toString();
            }(getCurrentTimestamp.toString()))}\"}}]}',
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
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetTimekeepings.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getTimekeepings(context);
      }
    }
  }

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

    if ((apiResultGetListBranch.succeeded ?? true)) {
      brandList = BranchListDataStruct.maybeFromMap(
              (apiResultGetListBranch.jsonBody ?? ''))!
          .data
          .toList()
          .cast<BranchListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultGetListBranch.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
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

    if ((apiResultListDeparment.succeeded ?? true)) {
      departmentList = DepartmentListDataStruct.maybeFromMap(
              (apiResultListDeparment.jsonBody ?? ''))!
          .data
          .toList()
          .cast<DepartmentListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListDeparment.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
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
    bool? checkRefreshTokenBlock2;

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

    if ((apiResuitListStaffs.succeeded ?? true)) {
      staffsList = StaffListDataStruct.maybeFromMap(
              (apiResuitListStaffs.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StaffListStruct>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResuitListStaffs.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListStaffs(context);
      }
    }
  }
}
