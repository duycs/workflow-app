import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/training/lesson/no_data/no_data_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'lesson_lists_homepage_widget.dart' show LessonListsHomepageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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

  MetaDataStruct? metaRow;
  void updateMetaRowStruct(Function(MetaDataStruct) updateFn) {
    updateFn(metaRow ??= MetaDataStruct());
  }

  MetaDataStruct? metaRow2;
  void updateMetaRow2Struct(Function(MetaDataStruct) updateFn) {
    updateFn(metaRow2 ??= MetaDataStruct());
  }

  MetaDataStruct? metaRow3;
  void updateMetaRow3Struct(Function(MetaDataStruct) updateFn) {
    updateFn(metaRow3 ??= MetaDataStruct());
  }

  bool isLoad = false;

  String checkColor = '';

  bool checkLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonLists_Homepage widget.
  bool? tokenReloadLessonListsHomepageList;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

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

    listViewPagingController?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.getLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[${'{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"id\":{\"_neq\":\"${getJsonField(
        FFAppState().staffDepartment,
        r'''$.id''',
      ).toString().toString()}\"}}}}}},{\"status\":{\"_icontains\":\"published\"}}'}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}' : ' '}${(status != null && status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"${status}${status}' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"${dateStartList}\"}}' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != 'noData') ? ',{\"date_created\":{\"_lt\":\"${(String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEndList)}\"}}' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"${FFAppState().staffid}\"}}}}' : ' '}${programsAllId != null && programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"${programsAllId}\"}}}}' : ' '}]}',
    );

    if ((apiResultList?.succeeded ?? true)) {
      listLesson =
          LessonsListDataStruct.maybeFromMap((apiResultList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<LessonsStruct>();
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
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
          '{\"_and\":[${'{\"status\":{\"_eq\":\"draft\"}},{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}'}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}}' : ' '}]}',
      offset: 0,
      limit: 11,
    );

    if ((apiResultListRow?.succeeded ?? true)) {
      listLessonRow = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      metaRow = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow?.jsonBody ?? ''))
          ?.meta;
    } else {
      checkRefreshTokenBlock1 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow?.jsonBody ?? ''),
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
          '{\"_and\":[${'{\"status\":{\"_eq\":\"draft\"}},{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lt\":\"${(String var1) {
        return DateTime.parse(var1).add(Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}'}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}}' : ' '}]}',
      offset: 0,
      limit: 11,
    );

    if ((apiResultListRow2?.succeeded ?? true)) {
      listLessonRow2 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow2?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      metaRow2 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow2?.jsonBody ?? ''))
          ?.meta;
    } else {
      checkRefreshTokenBlock2 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow2?.jsonBody ?? ''),
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
          '{\"_and\":[${'{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"_and\":[{\"_and\":[{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lt\":\"${(String var1) {
        return DateTime.parse(var1).add(Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}]},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}'}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"${nameSearchTextController.text}\"}}}' : ' '}]}',
      limit: 11,
      offset: 0,
    );

    if ((apiResultListRow3?.succeeded ?? true)) {
      listLessonRow3 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow3?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      metaRow3 = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultListRow3?.jsonBody ?? ''))
          ?.meta;
    } else {
      checkRefreshTokenBlock3 = await action_blocks.checkRefreshToken(
        context,
        jsonErrors: (apiResultListRow3?.jsonBody ?? ''),
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
        await getListLessonRow3(context);
      }
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetLessonListPage);
  }

  void listViewGetLessonListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetLessonListResponse) {
        final pageItems = (LessonsListDataStruct.maybeFromMap(
                        listViewGetLessonListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetLessonListResponse,
                )
              : null,
        );
      });
}
