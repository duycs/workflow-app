import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'lesson_lists_homepage_widget.dart' show LessonListsHomepageWidget;
import 'package:flutter/material.dart';

class LessonListsHomepageModel
    extends FlutterFlowModel<LessonListsHomepageWidget> {
  ///  Local state fields for this page.

  List<LessonsStruct> listLesson = [];
  void addToListLesson(LessonsStruct item) => listLesson.add(item);
  void removeFromListLesson(LessonsStruct item) => listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, LessonsStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(int index, Function(LessonsStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  List<EmployeeLessonListStruct> listLessonRow = [];
  void addToListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.add(item);
  void removeFromListLessonRow(EmployeeLessonListStruct item) =>
      listLessonRow.remove(item);
  void removeAtIndexFromListLessonRow(int index) =>
      listLessonRow.removeAt(index);
  void insertAtIndexInListLessonRow(int index, EmployeeLessonListStruct item) =>
      listLessonRow.insert(index, item);
  void updateListLessonRowAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow[index] = updateFn(listLessonRow[index]);

  String status = '';

  String dateStartList = '';

  String dateEndList = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  List<EmployeeLessonListStruct> listLessonRow2 = [];
  void addToListLessonRow2(EmployeeLessonListStruct item) =>
      listLessonRow2.add(item);
  void removeFromListLessonRow2(EmployeeLessonListStruct item) =>
      listLessonRow2.remove(item);
  void removeAtIndexFromListLessonRow2(int index) =>
      listLessonRow2.removeAt(index);
  void insertAtIndexInListLessonRow2(
          int index, EmployeeLessonListStruct item) =>
      listLessonRow2.insert(index, item);
  void updateListLessonRow2AtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow2[index] = updateFn(listLessonRow2[index]);

  List<EmployeeLessonListStruct> listLessonRow3 = [];
  void addToListLessonRow3(EmployeeLessonListStruct item) =>
      listLessonRow3.add(item);
  void removeFromListLessonRow3(EmployeeLessonListStruct item) =>
      listLessonRow3.remove(item);
  void removeAtIndexFromListLessonRow3(int index) =>
      listLessonRow3.removeAt(index);
  void insertAtIndexInListLessonRow3(
          int index, EmployeeLessonListStruct item) =>
      listLessonRow3.insert(index, item);
  void updateListLessonRow3AtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLessonRow3[index] = updateFn(listLessonRow3[index]);

  String programsAllId = '';

  List<ProgramIdStruct> listPrograms = [];
  void addToListPrograms(ProgramIdStruct item) => listPrograms.add(item);
  void removeFromListPrograms(ProgramIdStruct item) =>
      listPrograms.remove(item);
  void removeAtIndexFromListPrograms(int index) => listPrograms.removeAt(index);
  void insertAtIndexInListPrograms(int index, ProgramIdStruct item) =>
      listPrograms.insert(index, item);
  void updateListProgramsAtIndex(
          int index, Function(ProgramIdStruct) updateFn) =>
      listPrograms[index] = updateFn(listPrograms[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}${nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}' : ' '}${(status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(status != '') && (status != 'noData') ? status : ' '}${(status != '') && (status != 'noData') ? '\"}}' : ' '}${(dateStartList != '') && (dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(dateStartList != '') && (dateStartList != 'noData') ? dateStartList : ' '}${(dateStartList != '') && (dateStartList != 'noData') ? '\"}}' : ' '}${(dateEndList != '') && (dateEndList != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(dateEndList != '') && (dateEndList != 'noData') ? ((String var1) {
          return DateTime.parse(var1).add(const Duration(days: 1)).toString();
        }(dateEndList)) : ' '}${(dateEndList != '') && (dateEndList != 'noData') ? '\"}}' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}' : ' '}${programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programsAllId != '' ? programsAllId : ' '}${programsAllId != '' ? '\"}}}}' : ' '},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"_neq\":\"${getJsonField(
        FFAppState().staffDepartment,
        r'''$.id''',
      ).toString().toString()}\"}}}}}]}',
    );
    if ((apiResultList.succeeded ?? true)) {
      listLesson =
          LessonsListDataStruct.maybeFromMap((apiResultList.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
    } else {
      checkRefreshTokenBlock = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultList.jsonBody ?? ''),
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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListLesson(context);
      }
    }
  }

  Future getListLessonRow(BuildContext context) async {
    ApiCallResponse? apiResultListRow;
    bool? checkRefreshTokenBlock1;

    apiResultListRow = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"status\":{\"_eq\":\"draft\"}},{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}}' : ' '}]}',
    );
    if ((apiResultListRow.succeeded ?? true)) {
      listLessonRow = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock1!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListLessonRow(context);
      }
    }
  }

  Future getListLessonRow2(BuildContext context) async {
    ApiCallResponse? apiResultListRow2;
    bool? checkRefreshTokenBlock2;

    apiResultListRow2 = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lte\":\"${(String var1) {
        return DateTime.parse(var1).add(const Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}}${nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}}' : ' '}]}',
    );
    if ((apiResultListRow2.succeeded ?? true)) {
      listLessonRow2 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow2.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow2.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock2!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListLessonRow2(context);
      }
    }
  }

  Future getListLessonRow3(BuildContext context) async {
    ApiCallResponse? apiResultListRow3;
    bool? checkRefreshTokenBlock3;

    apiResultListRow3 = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter:
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"_and\":[{\"lession_id\":{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}}},{\"lession_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
        return DateTime.parse(var1).add(const Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}]}',
    );
    if ((apiResultListRow3.succeeded ?? true)) {
      listLessonRow3 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow3.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow3.jsonBody ?? ''),
      );
      if (!checkRefreshTokenBlock3!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.ErrorLoadData,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      } else {
        await getListLessonRow3(context);
      }
    }
  }
}
