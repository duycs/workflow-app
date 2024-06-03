import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_foud_row/data_not_foud_row_widget.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import 'dart:async';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'lesson_lists_homepage_widget.dart' show LessonListsHomepageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
  void updateMetaRowStruct(Function(MetaDataStruct) updateFn) =>
      updateFn(metaRow ??= MetaDataStruct());

  MetaDataStruct? metaRow2;
  void updateMetaRow2Struct(Function(MetaDataStruct) updateFn) =>
      updateFn(metaRow2 ??= MetaDataStruct());

  MetaDataStruct? metaRow3;
  void updateMetaRow3Struct(Function(MetaDataStruct) updateFn) =>
      updateFn(metaRow3 ??= MetaDataStruct());

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonLists_Homepage widget.
  bool? tokenReloadLessonListsHomepageList;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController4;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall4;

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

    listViewPagingController1?.dispose();
    listViewPagingController2?.dispose();
    listViewPagingController3?.dispose();
    listViewPagingController4?.dispose();
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
      ).toString().toString()}\"}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}' : ' '}${(status != null && status != '') && (status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(status != null && status != '') && (status != 'noData') ? status : ' '}${(status != null && status != '') && (status != 'noData') ? '\"}}' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != 'noData') ? dateStartList : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != 'noData') ? '\"}}' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != 'noData') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEndList)) : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != 'noData') ? '\"}}' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}' : ' '}${programsAllId != null && programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programsAllId != null && programsAllId != '' ? programsAllId : ' '}${programsAllId != null && programsAllId != '' ? '\"}}}}' : ' '},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"_neq\":\"${getJsonField(
        FFAppState().staffDepartment,
        r'''$.id''',
      ).toString().toString()}\"}}}}},{\"status\":{\"_icontains\":\"published\"}}]}',
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
                color: FlutterFlowTheme.of(context).primaryText,
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
          '{\"_and\":[{\"status\":{\"_eq\":\"draft\"}},{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
      offset: 0,
      limit: 0,
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
                color: FlutterFlowTheme.of(context).primaryText,
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
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lte\":\"${(String var1) {
        return DateTime.parse(var1).add(Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
      offset: 0,
      limit: 0,
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
                color: FlutterFlowTheme.of(context).primaryText,
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
          '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"_and\":[{\"_and\":[{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lte\":\"${(String var1) {
        return DateTime.parse(var1).add(Duration(days: 1)).toString();
      }(dateTimeFormat(
        'yyyy-MM-dd',
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      ))}\"}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}]},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
      limit: 0,
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
                color: FlutterFlowTheme.of(context).primaryText,
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
  Future waitForOnePageForListView1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController1?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListView2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController2?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListView3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController3?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListView4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController4?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewEmployeeLessonListPage1);
  }

  void listViewEmployeeLessonListPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewEmployeeLessonListResponse) {
        final pageItems = (EmployeeLessonListDataStruct.maybeFromMap(
                        listViewEmployeeLessonListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewEmployeeLessonListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewEmployeeLessonListPage2);
  }

  void listViewEmployeeLessonListPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewEmployeeLessonListResponse) {
        final pageItems = (EmployeeLessonListDataStruct.maybeFromMap(
                        listViewEmployeeLessonListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewEmployeeLessonListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController3(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall3 = apiCall;
    return listViewPagingController3 ??= _createListViewController3(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController3(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewEmployeeLessonListPage3);
  }

  void listViewEmployeeLessonListPage3(ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker)
          .then((listViewEmployeeLessonListResponse) {
        final pageItems = (EmployeeLessonListDataStruct.maybeFromMap(
                        listViewEmployeeLessonListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController3?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewEmployeeLessonListResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController4(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall4 = apiCall;
    return listViewPagingController4 ??= _createListViewController4(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController4(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetLessonListPage4);
  }

  void listViewGetLessonListPage4(ApiPagingParams nextPageMarker) =>
      listViewApiCall4!(nextPageMarker).then((listViewGetLessonListResponse) {
        final pageItems = (LessonsListDataStruct.maybeFromMap(
                        listViewGetLessonListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController4?.appendPage(
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
