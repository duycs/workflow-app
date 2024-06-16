import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'report_task_detail_copy_widget.dart' show ReportTaskDetailCopyWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportTaskDetailCopyModel
    extends FlutterFlowModel<ReportTaskDetailCopyWidget> {
  ///  Local state fields for this page.

  List<double> listPercent = [1.0, 3.2, 2.8];
  void addToListPercent(double item) => listPercent.add(item);
  void removeFromListPercent(double item) => listPercent.remove(item);
  void removeAtIndexFromListPercent(int index) => listPercent.removeAt(index);
  void insertAtIndexInListPercent(int index, double item) =>
      listPercent.insert(index, item);
  void updateListPercentAtIndex(int index, Function(double) updateFn) =>
      listPercent[index] = updateFn(listPercent[index]);

  StaffListStruct? staff;
  void updateStaffStruct(Function(StaffListStruct) updateFn) {
    updateFn(staff ??= StaffListStruct());
  }

  List<double> listPercentProgram = [30.0, 40.0, 30.0];
  void addToListPercentProgram(double item) => listPercentProgram.add(item);
  void removeFromListPercentProgram(double item) =>
      listPercentProgram.remove(item);
  void removeAtIndexFromListPercentProgram(int index) =>
      listPercentProgram.removeAt(index);
  void insertAtIndexInListPercentProgram(int index, double item) =>
      listPercentProgram.insert(index, item);
  void updateListPercentProgramAtIndex(int index, Function(double) updateFn) =>
      listPercentProgram[index] = updateFn(listPercentProgram[index]);

  int? loop = 0;

  List<double> listPercentLesson = [30.0, 40.0, 50.0];
  void addToListPercentLesson(double item) => listPercentLesson.add(item);
  void removeFromListPercentLesson(double item) =>
      listPercentLesson.remove(item);
  void removeAtIndexFromListPercentLesson(int index) =>
      listPercentLesson.removeAt(index);
  void insertAtIndexInListPercentLesson(int index, double item) =>
      listPercentLesson.insert(index, item);
  void updateListPercentLessonAtIndex(int index, Function(double) updateFn) =>
      listPercentLesson[index] = updateFn(listPercentLesson[index]);

  List<String> labelList = ['Chưa học', 'Đang học', 'Hoàn thành'];
  void addToLabelList(String item) => labelList.add(item);
  void removeFromLabelList(String item) => labelList.remove(item);
  void removeAtIndexFromLabelList(int index) => labelList.removeAt(index);
  void insertAtIndexInLabelList(int index, String item) =>
      labelList.insert(index, item);
  void updateLabelListAtIndex(int index, Function(String) updateFn) =>
      labelList[index] = updateFn(labelList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    listViewPagingController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    listViewPagingController2?.dispose();
  }

  /// Action blocks.
  Future getOneUser(BuildContext context) async {}

  /// Additional helper methods.
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
    return controller..addPageRequestListener(listViewGetListTaskPage1);
  }

  void listViewGetListTaskPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
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
    return controller..addPageRequestListener(listViewGetListTaskPage2);
  }

  void listViewGetListTaskPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker).then((listViewGetListTaskResponse) {
        final pageItems = (TaskListDataStruct.maybeFromMap(
                        listViewGetListTaskResponse.jsonBody)!
                    .data ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
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
