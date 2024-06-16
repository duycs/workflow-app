import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'report_task_detail_widget.dart' show ReportTaskDetailWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportTaskDetailModel extends FlutterFlowModel<ReportTaskDetailWidget> {
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
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
  }

  /// Action blocks.
  Future getOneUser(BuildContext context) async {
    bool? getOneStaff;
    ApiCallResponse? apiResultGetOneStaff;

    getOneStaff = await action_blocks.tokenReload(context);
    if (getOneStaff!) {
      apiResultGetOneStaff = await StaffGroup.getStaffGetOneCall.call(
        accessToken: FFAppState().accessToken,
        staffId: widget.staffId,
      );
      if ((apiResultGetOneStaff.succeeded ?? true)) {
        staff = StaffListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneStaff.jsonBody ?? ''),
          r'''$.data''',
        ));
        while (loop! < 3) {
          updateListPercentProgramAtIndex(
            loop!,
            (_) => () {
              if (loop == 0) {
                return (staff?.staffPrograms.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffPrograms
                                .where((e) => e.status == 'draft')
                                .toList()
                                .length /
                            staff!.staffPrograms.length)
                        .toStringAsFixed(2))));
              } else if (loop == 1) {
                return (staff?.staffPrograms.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffPrograms
                                .where((e) => e.status == 'inprogress')
                                .toList()
                                .length /
                            staff!.staffPrograms.length)
                        .toStringAsFixed(2))));
              } else {
                return (staff?.staffPrograms.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffPrograms
                                .where((e) => e.status == 'done')
                                .toList()
                                .length /
                            staff!.staffPrograms.length)
                        .toStringAsFixed(2))));
              }
            }(),
          );
          loop = loop! + 1;
        }
        loop = 0;
        while (loop! < 3) {
          updateListPercentLessonAtIndex(
            loop!,
            (_) => () {
              if (loop == 0) {
                return (staff?.staffLessions.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffLessions
                                .where((e) => e.status == 'draft')
                                .toList()
                                .length /
                            staff!.staffLessions.length)
                        .toStringAsFixed(2))));
              } else if (loop == 1) {
                return (staff?.staffLessions.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffLessions
                                .where((e) => e.status == 'inprogress')
                                .toList()
                                .length /
                            staff!.staffLessions.length)
                        .toStringAsFixed(2))));
              } else {
                return (staff?.staffLessions.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffLessions
                                .where((e) => e.status == 'done')
                                .toList()
                                .length /
                            staff!.staffLessions.length)
                        .toStringAsFixed(2))));
              }
            }(),
          );
        }
        loop = 0;
      }
    } else {
      return;
    }
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
