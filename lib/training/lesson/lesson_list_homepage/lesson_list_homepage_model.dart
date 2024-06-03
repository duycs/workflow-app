import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'lesson_list_homepage_widget.dart' show LessonListHomepageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LessonListHomepageModel
    extends FlutterFlowModel<LessonListHomepageWidget> {
  ///  Local state fields for this page.

  List<EmployeeLessonListStruct> listLesson = [];
  void addToListLesson(EmployeeLessonListStruct item) => listLesson.add(item);
  void removeFromListLesson(EmployeeLessonListStruct item) =>
      listLesson.remove(item);
  void removeAtIndexFromListLesson(int index) => listLesson.removeAt(index);
  void insertAtIndexInListLesson(int index, EmployeeLessonListStruct item) =>
      listLesson.insert(index, item);
  void updateListLessonAtIndex(
          int index, Function(EmployeeLessonListStruct) updateFn) =>
      listLesson[index] = updateFn(listLesson[index]);

  String status = '';

  String? dateStartList = '0';

  String? dateEndList = '0';

  String statusLesson = '';

  String statusLove = '';

  String lessonFavoriteStatusList = '';

  String programsId = '';

  String checkAPI = '';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in LessonList_Homepage widget.
  bool? tokenReloadLessonListHomepage;
  // State field(s) for nameSearch widget.
  FocusNode? nameSearchFocusNode;
  TextEditingController? nameSearchTextController;
  String? Function(BuildContext, String?)? nameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameSearchFocusNode?.dispose();
    nameSearchTextController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getListLesson(BuildContext context) async {
    ApiCallResponse? apiResultList;
    bool? checkRefreshTokenBlock;

    apiResultList = await LessonGroup.employeeLessonListCall.call(
      accessToken: FFAppState().accessToken,
      filter: '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? ',' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? nameSearchTextController.text : ' '}${nameSearchTextController.text != null && nameSearchTextController.text != '' ? '\"}}}' : ' '}${(status != null && status != '') && (status != 'noData') ? ',' : ' '}${(status != null && status != '') && (status != 'noData') ? '{\"lession_id\":{\"status\":{\"_icontains\":\"' : ' '}${(status != null && status != '') && (status != 'noData') ? status : ' '}${(status != null && status != '') && (status != 'noData') ? '\"}}}' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? ',' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? '{\"lession_id\":{\"date_created\":{\"_gte\":\"' : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? dateStartList : ' '}${(dateStartList != null && dateStartList != '') && (dateStartList != '0') ? '\"}}}' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? ',' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? '{\"lession_id\":{\"date_created\":{\"_lte\":\"' : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateEndList!)) : ' '}${(dateEndList != null && dateEndList != '') && (dateEndList != '0') ? '\"}}}' : ' '}${(statusLesson != null && statusLesson != '') && (statusLesson != 'noData') ? ',' : ' '}${(statusLesson != null && statusLesson != '') && (statusLesson != 'noData') ? '{\"status\":{\"_eq\":\"' : ' '}${(statusLesson != null && statusLesson != '') && (statusLesson != 'noData') ? statusLesson : ' '}${(statusLesson != null && statusLesson != '') && (statusLesson != 'noData') ? '\"}}' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? ',' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? lessonFavoriteStatusList : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(lessonFavoriteStatusList != null && lessonFavoriteStatusList != '') && (lessonFavoriteStatusList != 'noData') ? '\"}}}}}' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? ',{\"status\":{\"_eq\":\"' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? widget.statusLesson : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? '\"}}' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? ',{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? FFAppState().staffid : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? '\"}}}}}' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}},{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateTimeFormat(
          'yyyy-MM-dd',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ))) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}}' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ',{\"_and\":[{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}},{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ((String var1) {
          return DateTime.parse(var1).add(Duration(days: 1)).toString();
        }(dateTimeFormat(
          'yyyy-MM-dd',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ))) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}' : ' '}${programsId != null && programsId != '' ? ',{\"lession_id\":{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${programsId != null && programsId != '' ? programsId : ' '}${programsId != null && programsId != '' ? '\"}}}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
    );
    if ((apiResultList?.succeeded ?? true)) {
      listLesson = EmployeeLessonListDataStruct.maybeFromMap(
              (apiResultList?.jsonBody ?? ''))!
          .data
          .toList()
          .cast<EmployeeLessonListStruct>();
      checkAPI = '1';
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
    return controller..addPageRequestListener(listViewEmployeeLessonListPage);
  }

  void listViewEmployeeLessonListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewEmployeeLessonListResponse) {
        final pageItems = (EmployeeLessonListDataStruct.maybeFromMap(
                        listViewEmployeeLessonListResponse.jsonBody)!
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
                  lastResponse: listViewEmployeeLessonListResponse,
                )
              : null,
        );
      });
}
