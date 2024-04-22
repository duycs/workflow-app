import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'do_test_copy_widget.dart' show DoTestCopyWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DoTestCopyModel extends FlutterFlowModel<DoTestCopyWidget> {
  ///  Local state fields for this page.

  TestListStruct? list;
  void updateListStruct(Function(TestListStruct) updateFn) =>
      updateFn(list ??= TestListStruct());

  String? dateStart = '';

  String? dateEnd = '';

  List<RequestAnswerStaffStruct> requestData = [];
  void addToRequestData(RequestAnswerStaffStruct item) => requestData.add(item);
  void removeFromRequestData(RequestAnswerStaffStruct item) =>
      requestData.remove(item);
  void removeAtIndexFromRequestData(int index) => requestData.removeAt(index);
  void insertAtIndexInRequestData(int index, RequestAnswerStaffStruct item) =>
      requestData.insert(index, item);
  void updateRequestDataAtIndex(
          int index, Function(RequestAnswerStaffStruct) updateFn) =>
      requestData[index] = updateFn(requestData[index]);

  String? checkboxAnswer;

  int? checkTrue;

  String answerId = '';

  int? correct;

  int? loop = 0;

  int? loopAnswer = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (TestOne)] action in DoTestCopy widget.
  ApiCallResponse? apiResultGetLessionTest;
  // Stores action output result for [Action Block - CheckRefreshToken] action in DoTestCopy widget.
  bool? checkRefreshTokenBlock45;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (CreateStaffTests)] action in Button widget.
  ApiCallResponse? apiResultCreateStaffTest;
  // Stores action output result for [Backend Call - API (CreateStaffAnswer)] action in Button widget.
  ApiCallResponse? apiResultCreateStaffAnswer;
  // Stores action output result for [Backend Call - API (CalculateTestScores)] action in Button widget.
  ApiCallResponse? apiResultCaculatorScores;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlock29;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlock27;
  // Stores action output result for [Action Block - CheckRefreshToken] action in Button widget.
  bool? checkRefreshTokenBlock26;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }
}
