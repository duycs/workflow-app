import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'do_test_widget.dart' show DoTestWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DoTestModel extends FlutterFlowModel<DoTestWidget> {
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

  String staffTestId = '';

  int? testTime;

  String testName = '';

  String testDescription = '';

  String testId = '';

  int loopId = 0;

  int loopQuestion = 0;

  int loopList = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - tokenReload] action in DoTest widget.
  bool? getLessionTestToken;
  // Stores action output result for [Backend Call - API (TestOne)] action in DoTest widget.
  ApiCallResponse? apiResultGetLessionTest;
  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (CreateStaffTests)] action in Timer widget.
  ApiCallResponse? apiResultCreateStaffTest2;
  // Stores action output result for [Backend Call - API (CreateStaffAnswer)] action in Timer widget.
  ApiCallResponse? apiResultCreateStaffAnswer2;
  // Stores action output result for [Backend Call - API (CalculateTestScores)] action in Timer widget.
  ApiCallResponse? apiResultCaculatorScores2;
  // State field(s) for Checkbox widget.

  Map<AnswersListStruct, bool> checkboxValueMap = {};
  List<AnswersListStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? createStaffTestToken;
  // Stores action output result for [Backend Call - API (CreateStaffTests)] action in Button widget.
  ApiCallResponse? apiResultCreateStaffTest;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? createStaffAnswerToken;
  // Stores action output result for [Backend Call - API (CreateStaffAnswer)] action in Button widget.
  ApiCallResponse? apiResultCreateStaffAnswer;
  // Stores action output result for [Action Block - tokenReload] action in Button widget.
  bool? caculatorScoresToken;
  // Stores action output result for [Backend Call - API (CalculateTestScores)] action in Button widget.
  ApiCallResponse? apiResultCaculatorScores;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    timerController.dispose();
  }
}
