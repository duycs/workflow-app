import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/action_chinh_sua/action_chinh_sua_widget.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/market/add_program_market/add_program_market_widget.dart';
import '/training/study_program/filter_study_program/filter_study_program_widget.dart';
import '/training/study_program/study_program_create/study_program_create_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'study_program_list_widget.dart' show StudyProgramListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StudyProgramListModel extends FlutterFlowModel<StudyProgramListWidget> {
  ///  Local state fields for this page.

  List<StudyProgramListStruct> dataList = [];
  void addToDataList(StudyProgramListStruct item) => dataList.add(item);
  void removeFromDataList(StudyProgramListStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, StudyProgramListStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(StudyProgramListStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  MetaDataStruct? meta;
  void updateMetaStruct(Function(MetaDataStruct) updateFn) =>
      updateFn(meta ??= MetaDataStruct());

  bool isLoad = false;

  String? checkShow;

  String? nameSearch = '';

  String? dateEndSearch = '';

  String? dateStartSearch = '';

  String? lessionsNameSearch = '';

  String status = ' ';

  bool isShow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in StudyProgramList widget.
  bool? tokenReloadStudyProgramList;
  // State field(s) for TextFieldNameSearch widget.
  FocusNode? textFieldNameSearchFocusNode;
  TextEditingController? textFieldNameSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldNameSearchTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNameSearchFocusNode?.dispose();
    textFieldNameSearchTextController?.dispose();

    listViewPagingController1?.dispose();
  }

  /// Action blocks.
  Future getListProgram(BuildContext context) async {
    bool? tokenReloadCallBackGetListProgram;
    ApiCallResponse? apiResultStudyProgramListSearch;

    tokenReloadCallBackGetListProgram =
        await action_blocks.tokenReload(context);
    if (tokenReloadCallBackGetListProgram!) {
      apiResultStudyProgramListSearch =
          await StudyProgramGroup.studyProgramListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{}${(nameSearch != null && nameSearch != '') && (nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${nameSearch}\"}}' : ' '}${(lessionsNameSearch != null && lessionsNameSearch != '') && (lessionsNameSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"${lessionsNameSearch}\"}}}}' : ' '}${(dateStartSearch != null && dateStartSearch != '') && (dateStartSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"${dateStartSearch}\"}}}}' : ' '}${(dateEndSearch != null && dateEndSearch != '') && (dateEndSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${(String var1) {
            return DateTime.parse(var1).add(Duration(days: 1)).toString();
          }(dateEndSearch!)}\"}}}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString()}\"}}'}]}',
      );
      if ((apiResultStudyProgramListSearch?.succeeded ?? true)) {
        dataList = StudyProgramListDataStruct.maybeFromMap(
                (apiResultStudyProgramListSearch?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<StudyProgramListStruct>();
        meta = StudyProgramListDataStruct.maybeFromMap(
                (apiResultStudyProgramListSearch?.jsonBody ?? ''))
            ?.meta;
        checkShow = null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      isLoad = true;
    } else {
      FFAppState().update(() {});
      return;
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
    return controller..addPageRequestListener(listViewStudyProgramListPage1);
  }

  void listViewStudyProgramListPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewStudyProgramListResponse) {
        final pageItems = (StudyProgramListDataStruct.maybeFromMap(
                        listViewStudyProgramListResponse.jsonBody)!
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
                  lastResponse: listViewStudyProgramListResponse,
                )
              : null,
        );
      });
}
