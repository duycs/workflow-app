import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/process_template/domains_search/domains_search_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'process_template_list_widget.dart' show ProcessTemplateListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ProcessTemplateListModel
    extends FlutterFlowModel<ProcessTemplateListWidget> {
  ///  Local state fields for this page.

  List<WorkflowsStruct> dataList = [];
  void addToDataList(WorkflowsStruct item) => dataList.add(item);
  void removeFromDataList(WorkflowsStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, WorkflowsStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(WorkflowsStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoad = false;

  List<DomainsListStruct> domainList = [];
  void addToDomainList(DomainsListStruct item) => domainList.add(item);
  void removeFromDomainList(DomainsListStruct item) => domainList.remove(item);
  void removeAtIndexFromDomainList(int index) => domainList.removeAt(index);
  void insertAtIndexInDomainList(int index, DomainsListStruct item) =>
      domainList.insert(index, item);
  void updateDomainListAtIndex(
          int index, Function(DomainsListStruct) updateFn) =>
      domainList[index] = updateFn(domainList[index]);

  List<CategoriesListStruct> categoriesList = [];
  void addToCategoriesList(CategoriesListStruct item) =>
      categoriesList.add(item);
  void removeFromCategoriesList(CategoriesListStruct item) =>
      categoriesList.remove(item);
  void removeAtIndexFromCategoriesList(int index) =>
      categoriesList.removeAt(index);
  void insertAtIndexInCategoriesList(int index, CategoriesListStruct item) =>
      categoriesList.insert(index, item);
  void updateCategoriesListAtIndex(
          int index, Function(CategoriesListStruct) updateFn) =>
      categoriesList[index] = updateFn(categoriesList[index]);

  int loop = 0;

  String categoryId = ' ';

  List<String> domainSearch = [];
  void addToDomainSearch(String item) => domainSearch.add(item);
  void removeFromDomainSearch(String item) => domainSearch.remove(item);
  void removeAtIndexFromDomainSearch(int index) => domainSearch.removeAt(index);
  void insertAtIndexInDomainSearch(int index, String item) =>
      domainSearch.insert(index, item);
  void updateDomainSearchAtIndex(int index, Function(String) updateFn) =>
      domainSearch[index] = updateFn(domainSearch[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in ProcessTemplateList widget.
  bool? tokenReloadProcessTemplateList;
  // Stores action output result for [Backend Call - API (GetCategoriesList)] action in ProcessTemplateList widget.
  ApiCallResponse? apiResultx0q;
  // Stores action output result for [Backend Call - API (GetDomainsList)] action in ProcessTemplateList widget.
  ApiCallResponse? apiResultlld;
  // State field(s) for TextName widget.
  FocusNode? textNameFocusNode;
  TextEditingController? textNameTextController;
  String? Function(BuildContext, String?)? textNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for GridView widget.

  PagingController<ApiPagingParams, dynamic>? gridViewPagingController;
  Function(ApiPagingParams nextPageMarker)? gridViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textNameFocusNode?.dispose();
    textNameTextController?.dispose();

    gridViewPagingController?.dispose();
  }

  /// Action blocks.
  Future callSearchList(BuildContext context) async {
    bool? processTemplateListSearchToken;
    ApiCallResponse? apiResultListDataSearch;

    processTemplateListSearchToken = await action_blocks.tokenReload(context);
    if (processTemplateListSearchToken!) {
      apiResultListDataSearch =
          await ProcedureTemplateGroup.workflowsListCall.call(
        accessToken: FFAppState().accessToken,
        filter: '{\"_and\":[{\"template\":{\"_eq\":\"1\"}}${domainSearch.length > 0 ? ',{\"domain_id\":{\"_in\":[${(List<String> strings) {
            return strings.map((str) => '"$str"').join(',');
          }(domainSearch.toList())}]}}' : ' '}${(categoryId != null && categoryId != '') && (categoryId != '1') && (categoryId != ' ') ? ',{\"category_id\":{\"_eq\":\"${categoryId}\"}}' : ' '}${textNameTextController.text != null && textNameTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${textNameTextController.text}\"}}' : ' '}]}',
      );
      if ((apiResultListDataSearch?.succeeded ?? true)) {
        dataList = WorkflowsListDataStruct.maybeFromMap(
                (apiResultListDataSearch?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<WorkflowsStruct>();
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
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForGridView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (gridViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setGridViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    gridViewApiCall = apiCall;
    return gridViewPagingController ??= _createGridViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createGridViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(gridViewWorkflowsListPage);
  }

  void gridViewWorkflowsListPage(ApiPagingParams nextPageMarker) =>
      gridViewApiCall!(nextPageMarker).then((gridViewWorkflowsListResponse) {
        final pageItems = (WorkflowsListDataStruct.maybeFromMap(
                        gridViewWorkflowsListResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        gridViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: gridViewWorkflowsListResponse,
                )
              : null,
        );
      });
}
