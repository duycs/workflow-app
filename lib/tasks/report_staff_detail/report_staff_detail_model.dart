import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'report_staff_detail_widget.dart' show ReportStaffDetailWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportStaffDetailModel extends FlutterFlowModel<ReportStaffDetailWidget> {
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

  bool isLoad = false;

  String filterRequest = '';

  String? dateStart1Filter;

  String? dateStart2Filter;

  String? typeFilter;

  String? statusFilter;

  String? dateEnd1Filter;

  String? dateEnd2Filter;

  bool checkStatus1 = false;

  bool checkStatus2 = false;

  bool checkStatus3 = false;

  bool checkStatus4 = false;

  bool checkStatus5 = false;

  bool checkStatus6 = false;

  dynamic jsonExport;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? getOneStaffTask1;
  // Stores action output result for [Backend Call - API (StaffGetOne)] action in Button widget.
  ApiCallResponse? apiResultGetOneStaff1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.
  ScrollController? listViewController0;

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController0 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    columnController1?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewController0?.dispose();
    listViewPagingController?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
  }

  /// Action blocks.
  Future getOneUserProgram(BuildContext context) async {
    bool? getOneStaff;
    ApiCallResponse? apiResultGetOneStaff;

    getOneStaff = await action_blocks.tokenReload(context);
    if (getOneStaff!) {
      apiResultGetOneStaff = await StaffGroup.staffGetOneCall.call(
        accessToken: FFAppState().accessToken,
        staffId: widget.staffId,
      );

      if ((apiResultGetOneStaff.succeeded ?? true)) {
        staff = StaffListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneStaff.jsonBody ?? ''),
          r'''$.data''',
        ));
        jsonExport = (apiResultGetOneStaff.jsonBody ?? '');
        while (loop! < 3) {
          updateListPercentAtIndex(
            loop!,
            (_) => () {
              if (loop == 0) {
                return (double.parse((staff!.tasks
                            .where((e) =>
                                (e.tasksId.status == 'todo') &&
                                (e.tasksId.current == 1))
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              } else if (loop == 1) {
                return (double.parse((staff!.tasks
                            .where((e) => e.tasksId.status == 'done')
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              } else {
                return (double.parse((staff!.tasks
                            .where((e) =>
                                (e.tasksId.status == 'todo') &&
                                (e.tasksId.current == 0))
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              }
            }(),
          );
          loop = loop! + 1;
        }
        loop = 0;
        while (loop! < 3) {
          updateListPercentProgramAtIndex(
            loop!,
            (_) => () {
              if (loop == 0) {
                return (staff!.staffPrograms.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffPrograms
                                .where((e) => e.status == 'draft')
                                .toList()
                                .length /
                            staff!.staffPrograms.length)
                        .toStringAsFixed(2))));
              } else if (loop == 1) {
                return (staff!.staffPrograms.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffPrograms
                                .where((e) => e.status == 'inprogress')
                                .toList()
                                .length /
                            staff!.staffPrograms.length)
                        .toStringAsFixed(2))));
              } else {
                return (staff!.staffPrograms.isEmpty
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
                return (staff!.staffLessions.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffLessions
                                .where((e) => e.status == 'draft')
                                .toList()
                                .length /
                            staff!.staffLessions.length)
                        .toStringAsFixed(2))));
              } else if (loop == 1) {
                return (staff!.staffLessions.isEmpty
                    ? 0.0
                    : (double.parse((staff!.staffLessions
                                .where((e) => e.status == 'inprogress')
                                .toList()
                                .length /
                            staff!.staffLessions.length)
                        .toStringAsFixed(2))));
              } else {
                return (staff!.staffLessions.isEmpty
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
          loop = loop! + 1;
        }
        loop = 0;
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  Future getOneUserTask(BuildContext context) async {
    bool? getOneStaffTask;
    ApiCallResponse? apiResultGetOneStaff;

    getOneStaffTask = await action_blocks.tokenReload(context);
    if (getOneStaffTask!) {
      apiResultGetOneStaff = await StaffGroup.staffGetOneCall.call(
        accessToken: FFAppState().accessToken,
        staffId: widget.staffId,
        filter: filterRequest,
      );

      if ((apiResultGetOneStaff.succeeded ?? true)) {
        staff = StaffListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneStaff.jsonBody ?? ''),
          r'''$.data''',
        ));
        while (loop! < 3) {
          updateListPercentAtIndex(
            loop!,
            (_) => () {
              if (loop == 0) {
                return (double.parse((staff!.tasks
                            .where((e) =>
                                (e.tasksId.status == 'todo') &&
                                (e.tasksId.current == 1))
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              } else if (loop == 1) {
                return (double.parse((staff!.tasks
                            .where((e) => e.tasksId.status == 'done')
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              } else {
                return (double.parse((staff!.tasks
                            .where((e) =>
                                (e.tasksId.status == 'todo') &&
                                (e.tasksId.current == 0))
                            .toList()
                            .length /
                        staff!.tasks.length)
                    .toStringAsFixed(2)));
              }
            }(),
          );
          loop = loop! + 1;
        }
        loop = 0;
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
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
