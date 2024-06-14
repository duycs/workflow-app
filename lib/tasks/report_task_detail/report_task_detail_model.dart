import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'report_task_detail_widget.dart' show ReportTaskDetailWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportTaskDetailModel extends FlutterFlowModel<ReportTaskDetailWidget> {
  ///  Local state fields for this page.

  List<String> listLabel = [
    'Đang làm',
    'Hoàn thành',
    'Đang chờ',
    'Trễ deadline'
  ];
  void addToListLabel(String item) => listLabel.add(item);
  void removeFromListLabel(String item) => listLabel.remove(item);
  void removeAtIndexFromListLabel(int index) => listLabel.removeAt(index);
  void insertAtIndexInListLabel(int index, String item) =>
      listLabel.insert(index, item);
  void updateListLabelAtIndex(int index, Function(String) updateFn) =>
      listLabel[index] = updateFn(listLabel[index]);

  List<double> listPercent = [1.0, 3.2, 2.8, 4.0];
  void addToListPercent(double item) => listPercent.add(item);
  void removeFromListPercent(double item) => listPercent.remove(item);
  void removeAtIndexFromListPercent(int index) => listPercent.removeAt(index);
  void insertAtIndexInListPercent(int index, double item) =>
      listPercent.insert(index, item);
  void updateListPercentAtIndex(int index, Function(double) updateFn) =>
      listPercent[index] = updateFn(listPercent[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
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
    return controller..addPageRequestListener(listViewGetListTaskPage);
  }

  void listViewGetListTaskPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetListTaskResponse,
                )
              : null,
        );
      });
}
