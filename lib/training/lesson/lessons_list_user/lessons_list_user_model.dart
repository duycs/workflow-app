import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_user/filter_lesson_user_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'lessons_list_user_widget.dart' show LessonsListUserWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LessonsListUserModel extends FlutterFlowModel<LessonsListUserWidget> {
  ///  Local state fields for this page.

  List<EmployeeLessonListStruct> listLessonStaff = [];
  void addToListLessonStaff(EmployeeLessonListStruct item) =>
      listLessonStaff.add(item);
  void removeFromListLessonStaff(EmployeeLessonListStruct item) =>
      listLessonStaff.remove(item);
  void removeAtIndexFromListLessonStaff(int index) =>
      listLessonStaff.removeAt(index);
  void insertAtIndexInListLessonStaff(
          int index, EmployeeLessonListStruct item) =>
      listLessonStaff.insert(index, item);
  void updateListLessonStaffAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonStaff[index] = updateFn(listLessonStaff[index]);

  String dateStartSearch = '';

  String dateEndStartSearch = '';

  String checkAPI = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();
  }

  /// Action blocks.
  Future getLessons(BuildContext context) async {
    ApiCallResponse? apiResultLinkLessonStaff;
    bool? checkRefreshTokenBlock;

    apiResultLinkLessonStaff = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"done\"}}'}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ', {\"lession_id\":{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}}' : ' '}${(dateStartSearch != null && dateStartSearch != '') && (dateStartSearch != ' ') ? ',{\"lession_id\":{\"date_created\":{\"_gte\":\"${dateStartSearch}\"}}}' : '  '}${(dateEndStartSearch != null && dateEndStartSearch != '') && (dateEndStartSearch != ' ') ? ',{\"lession_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEndStartSearch)}\"}}}' : ' '}]}',
    );
    if ((apiResultLinkLessonStaff?.succeeded ?? true)) {
      listLessonStaff = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultLinkLessonStaff?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      checkAPI = '1';
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultLinkLessonStaff?.jsonBody ?? ''),
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
        await getLessons(context);
      }
    }
  }
}
