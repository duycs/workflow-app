import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'filter_status_department_widget.dart' show FilterStatusDepartmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterStatusDepartmentModel
    extends FlutterFlowModel<FilterStatusDepartmentWidget> {
  ///  Local state fields for this component.

  String? status = '';

  List<BranchListStruct> branchList = [];
  void addToBranchList(BranchListStruct item) => branchList.add(item);
  void removeFromBranchList(BranchListStruct item) => branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, BranchListStruct item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(BranchListStruct) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for branchId widget.
  String? branchIdValue;
  FormFieldController<String>? branchIdValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getLinkBranchList(BuildContext context) async {
    ApiCallResponse? apiResultist;
    bool? checkRefreshTokenBlockadf;

    apiResultist = await BranchGroup.branchListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}}]}',
    );

    if ((apiResultist?.succeeded ?? true)) {
      branchList =
          BranchListDataStruct.maybeFromMap((apiResultist?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<BranchListStruct>();
    } else {
      checkRefreshTokenBlockadf = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultist?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlockadf!) {
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
        await getLinkBranchList(context);
      }
    }
  }
}
