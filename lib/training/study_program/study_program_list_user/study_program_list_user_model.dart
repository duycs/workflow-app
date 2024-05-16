import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/confirm_do_test/confirm_do_test_widget.dart';
import '/training/lesson/certificate/certificate_widget.dart';
import '/training/study_program/filter_study_program_user_copy/filter_study_program_user_copy_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'study_program_list_user_widget.dart' show StudyProgramListUserWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyProgramListUserModel
    extends FlutterFlowModel<StudyProgramListUserWidget> {
  ///  Local state fields for this page.

  List<StaffsProgramsListStruct> staffsProgramsList = [];
  void addToStaffsProgramsList(StaffsProgramsListStruct item) =>
      staffsProgramsList.add(item);
  void removeFromStaffsProgramsList(StaffsProgramsListStruct item) =>
      staffsProgramsList.remove(item);
  void removeAtIndexFromStaffsProgramsList(int index) =>
      staffsProgramsList.removeAt(index);
  void insertAtIndexInStaffsProgramsList(
          int index, StaffsProgramsListStruct item) =>
      staffsProgramsList.insert(index, item);
  void updateStaffsProgramsListAtIndex(
          int index, Function(StaffsProgramsListStruct) updateFn) =>
      staffsProgramsList[index] = updateFn(staffsProgramsList[index]);

  String? checkOpen = '';

  String lessonName = '';

  String dateStart = '';

  String dateEnd = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldNameSearch widget.
  FocusNode? textFieldNameSearchFocusNode;
  TextEditingController? textFieldNameSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldNameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNameSearchFocusNode?.dispose();
    textFieldNameSearchTextController?.dispose();
  }

  /// Action blocks.
  Future getStaffsProgramsList(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await StudyProgramGroup.staffsProgramsCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[ {\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}}${(dateStart != null && dateStart != '') && (dateStart != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(dateStart != null && dateStart != '') && (dateStart != 'noData') ? dateStart : ' '}${(dateStart != null && dateStart != '') && (dateStart != 'noData') ? '\"}}' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEnd)) : ' '}${(dateEnd != null && dateEnd != '') && (dateEnd != 'noData') ? '\"}}' : ' '}${textFieldNameSearchTextController.text != null && textFieldNameSearchTextController.text != '' ? ',{\"program_id\":{\"name\":{\"_icontains\":\"' : ' '}${textFieldNameSearchTextController.text != null && textFieldNameSearchTextController.text != '' ? textFieldNameSearchTextController.text : ' '}${textFieldNameSearchTextController.text != null && textFieldNameSearchTextController.text != '' ? '\"}}}' : ' '}${(lessonName != null && lessonName != '') && (lessonName != 'noData') ? ',{\"program_id\":{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"' : ' '}${(lessonName != null && lessonName != '') && (lessonName != 'noData') ? lessonName : ' '}${(lessonName != null && lessonName != '') && (lessonName != 'noData') ? '\"}}}}}' : ' '},{\"program_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
    );
    if ((apiResultList?.succeeded ?? true)) {
      staffsProgramsList = StaffsProgramsListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<StaffsProgramsListStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList?.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getStaffsProgramsList(context);
      }
    }
  }
}
