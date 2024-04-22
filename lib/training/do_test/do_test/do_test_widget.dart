import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/long_text_list_question/long_text_list_question_widget.dart';
import '/training/do_test/number_list_question/number_list_question_widget.dart';
import '/training/do_test/select_list_question/select_list_question_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'do_test_model.dart';
export 'do_test_model.dart';

class DoTestWidget extends StatefulWidget {
  const DoTestWidget({
    super.key,
    required this.testId,
  });

  final String? testId;

  @override
  State<DoTestWidget> createState() => _DoTestWidgetState();
}

class _DoTestWidgetState extends State<DoTestWidget> {
  late DoTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoTestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.dateStart =
            functions.datetimeToString(getCurrentTimestamp.toString());
      });
      _model.apiResultGetLessionTest = await TestGroup.testOneCall.call(
        testsId: widget.testId,
        accessToken: FFAppState().accessToken,
      );
      if ((_model.apiResultGetLessionTest?.succeeded ?? true)) {
        setState(() {
          _model.list = TestListStruct.maybeFromMap(getJsonField(
            (_model.apiResultGetLessionTest?.jsonBody ?? ''),
            r'''$.data''',
          ));
        });
        while (_model.loopList < _model.list!.questions.length) {
          setState(() {
            _model.addToRequestData(RequestAnswerStaffStruct(
              status: 'published',
              staffId: getJsonField(
                FFAppState().staffLogin,
                r'''$.id''',
              ).toString().toString(),
              correct: 0,
              questionId: '',
            ));
          });
          setState(() {
            _model.loopList = _model.loopList + 1;
          });
        }
        setState(() {
          _model.loopList = 0;
        });
        _model.timerController.onStartTimer();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Nội dung bài test',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.list != null,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.list != null)
                      Expanded(
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/ab2f86f664c11bcf601c50cd80c396b4.jpg',
                                      width: double.infinity,
                                      height: 230.0,
                                      fit: BoxFit.cover,
                                      alignment: const Alignment(0.0, 1.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.list?.name,
                                    'Loading',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.timelapse_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Thời gian: ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowTimer(
                                              initialTime:
                                                  _model.list!.durationMinutes *
                                                      60000,
                                              getDisplayTime: (value) =>
                                                  StopWatchTimer.getDisplayTime(
                                                value,
                                                hours: false,
                                                milliSecond: false,
                                              ),
                                              controller:
                                                  _model.timerController,
                                              updateStateInterval:
                                                  const Duration(milliseconds: 1000),
                                              onChanged: (value, displayTime,
                                                  shouldUpdate) {
                                                _model.timerMilliseconds =
                                                    value;
                                                _model.timerValue = displayTime;
                                                if (shouldUpdate) {
                                                  setState(() {});
                                                }
                                              },
                                              onEnded: () async {
                                                var shouldSetState = false;
                                                if (_model.timerMilliseconds ==
                                                    0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Hết thời gian làm bài',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                  while (_model.loopQuestion <
                                                      _model.list!.questions
                                                          .length) {
                                                    if (_model.requestData
                                                            .where((e) =>
                                                                e.questionId ==
                                                                (_model.list?.questions[
                                                                        _model
                                                                            .loopQuestion])
                                                                    ?.questionsId
                                                                    .id)
                                                            .toList().isEmpty) {
                                                      setState(() {
                                                        _model.addToRequestData(
                                                            RequestAnswerStaffStruct(
                                                          status: 'published',
                                                          correct: 0,
                                                          answerType: (_model
                                                                      .list
                                                                      ?.questions[
                                                                  _model
                                                                      .loopQuestion])
                                                              ?.questionsId
                                                              .answerType,
                                                          staffId: getJsonField(
                                                            FFAppState()
                                                                .staffLogin,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          questionId: (_model
                                                                      .list
                                                                      ?.questions[
                                                                  _model
                                                                      .loopQuestion])
                                                              ?.questionsId
                                                              .id,
                                                        ));
                                                      });
                                                    }
                                                    setState(() {
                                                      _model.loopQuestion =
                                                          _model.loopQuestion +
                                                              1;
                                                    });
                                                  }
                                                  setState(() {
                                                    _model.dateEnd = functions
                                                        .datetimeToString(
                                                            getCurrentTimestamp
                                                                .toString());
                                                    _model.loopQuestion = 0;
                                                  });
                                                  _model.apiResultCreateStaffTest2 =
                                                      await DoTestGroup
                                                          .createStaffTestsCall
                                                          .call(
                                                    requestDataJson: <String,
                                                        dynamic>{
                                                      'status': 'published',
                                                      'score': getJsonField(
                                                        <String, int>{
                                                          'map': 100,
                                                        },
                                                        r'''$.map''',
                                                      ),
                                                      'date_start':
                                                          _model.dateStart,
                                                      'date_end':
                                                          _model.dateEnd,
                                                      'staff_id':
                                                          FFAppState().staffid,
                                                      'test_id': widget.testId,
                                                    },
                                                    accessToken: FFAppState()
                                                        .accessToken,
                                                  );
                                                  shouldSetState = true;
                                                  if ((_model
                                                          .apiResultCreateStaffTest2
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.testId =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.id''',
                                                      ).toString();
                                                      _model.testTime =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.duration_minutes''',
                                                      );
                                                      _model.testName =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.name''',
                                                      ).toString();
                                                      _model.testDescription =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.description''',
                                                      ).toString();
                                                    });
                                                    while (_model.loopId <
                                                        _model.requestData
                                                            .length) {
                                                      setState(() {
                                                        _model
                                                            .updateRequestDataAtIndex(
                                                          _model.loopId,
                                                          (e) => e
                                                            ..staffTestId =
                                                                getJsonField(
                                                              (_model.apiResultCreateStaffTest
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.id''',
                                                            ).toString(),
                                                        );
                                                      });
                                                      setState(() {
                                                        _model.loopId =
                                                            _model.loopId + 1;
                                                      });
                                                    }
                                                    setState(() {
                                                      _model.loopId = 0;
                                                    });
                                                    _model.apiResultCreateStaffAnswer2 =
                                                        await DoTestGroup
                                                            .createStaffAnswerCall
                                                            .call(
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                      requestJson: _model
                                                          .requestData
                                                          .map((e) => e.toMap())
                                                          .toList(),
                                                    );
                                                    shouldSetState = true;
                                                    if ((_model
                                                            .apiResultCreateStaffAnswer2
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiResultCaculatorScores2 =
                                                          await DoTestGroup
                                                              .calculateTestScoresCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        staffTestId:
                                                            _model.testId,
                                                      );
                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiResultCaculatorScores2
                                                              ?.succeeded ??
                                                          true)) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Thông báo'),
                                                              content: const Text(
                                                                  'Nộp bài thi thành công!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        context.pushNamed(
                                                          'DoTestDetail',
                                                          queryParameters: {
                                                            'testId':
                                                                serializeParam(
                                                              _model.testId,
                                                              ParamType.String,
                                                            ),
                                                            'testName':
                                                                serializeParam(
                                                              _model.testName,
                                                              ParamType.String,
                                                            ),
                                                            'testTime':
                                                                serializeParam(
                                                              _model.testTime,
                                                              ParamType.int,
                                                            ),
                                                            'testDescription':
                                                                serializeParam(
                                                              _model
                                                                  .testDescription,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'lỗi tính  điểm',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'lỗi tạo đáp án bài thi',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'lỗi tạo bài thi',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                      ),
                                                    );
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }
                                                }
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                              },
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 2.0)),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                              Divider(
                                height: 20.0,
                                thickness: 2.0,
                                indent: 16.0,
                                endIndent: 16.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Nội dung',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Html(
                                  data: _model.list!.description,
                                  onLinkTap: (url, _, __, ___) =>
                                      launchURL(url!),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final listQuestion =
                                      _model.list?.questions.toList() ?? [];
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listQuestion.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 16.0),
                                    itemBuilder: (context, listQuestionIndex) {
                                      final listQuestionItem =
                                          listQuestion[listQuestionIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 0.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.9, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '${(listQuestionIndex + 1).toString()}.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Html(
                                                              data: listQuestionItem
                                                                  .questionsId
                                                                  .content,
                                                              onLinkTap: (url,
                                                                      _,
                                                                      __,
                                                                      ___) =>
                                                                  launchURL(
                                                                      url!),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'checkbox')
                                                  Builder(
                                                    builder: (context) {
                                                      final dataQuestion =
                                                          listQuestionItem
                                                              .questionsId
                                                              .answers
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            dataQuestion.length,
                                                        itemBuilder: (context,
                                                            dataQuestionIndex) {
                                                          final dataQuestionItem =
                                                              dataQuestion[
                                                                  dataQuestionIndex];
                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Theme(
                                                                      data:
                                                                          ThemeData(
                                                                        checkboxTheme:
                                                                            CheckboxThemeData(
                                                                          visualDensity:
                                                                              VisualDensity.compact,
                                                                          materialTapTargetSize:
                                                                              MaterialTapTargetSize.shrinkWrap,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        unselectedWidgetColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      child:
                                                                          Checkbox(
                                                                        value: _model.checkboxValueMap[dataQuestionItem] ??=
                                                                            false,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          setState(() =>
                                                                              _model.checkboxValueMap[dataQuestionItem] = newValue!);
                                                                          if (newValue!) {
                                                                            setState(() {
                                                                              _model.checkboxAnswer = dataQuestionItem.answersId.id;
                                                                              _model.checkTrue = dataQuestionItem.answersId.correct;
                                                                            });
                                                                            setState(() {
                                                                              _model.updateRequestDataAtIndex(
                                                                                listQuestionIndex,
                                                                                (e) => e
                                                                                  ..correct = _model.checkTrue
                                                                                  ..answerType = listQuestionItem.questionsId.answerType
                                                                                  ..questionId = listQuestionItem.questionsId.id
                                                                                  ..updateAnswers(
                                                                                    (e) => e.add(AnswersListStruct(
                                                                                      answersId: TestAnswersIdStruct(
                                                                                        id: _model.checkboxAnswer,
                                                                                      ),
                                                                                    )),
                                                                                  ),
                                                                              );
                                                                            });
                                                                            setState(() {
                                                                              _model.checkboxAnswer = null;
                                                                              _model.checkTrue = null;
                                                                            });
                                                                          } else {
                                                                            setState(() {
                                                                              _model.checkboxAnswer = dataQuestionItem.answersId.id;
                                                                            });
                                                                            while (_model.loop! <
                                                                                _model.requestData[listQuestionIndex].answers.length) {
                                                                              if (_model.requestData[listQuestionIndex].answers.where((e) => e.answersId.id == _model.checkboxAnswer).toList().isNotEmpty) {
                                                                                setState(() {
                                                                                  _model.updateRequestDataAtIndex(
                                                                                    listQuestionIndex,
                                                                                    (e) => e
                                                                                      ..updateAnswers(
                                                                                        (e) => e.removeAt(_model.loop!),
                                                                                      ),
                                                                                  );
                                                                                });
                                                                              }
                                                                              setState(() {
                                                                                _model.loop = _model.loop! + 1;
                                                                              });
                                                                            }
                                                                            setState(() {
                                                                              _model.checkboxAnswer = null;
                                                                            });
                                                                          }
                                                                        },
                                                                        side:
                                                                            BorderSide(
                                                                          width:
                                                                              2,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        dataQuestionItem
                                                                            .answersId
                                                                            .content,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'radio')
                                                  SelectListQuestionWidget(
                                                    key: Key(
                                                        'Keyias_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    listAnswer: listQuestionItem
                                                        .questionsId.answers,
                                                    callback: (answerId,
                                                        correct) async {
                                                      setState(() {
                                                        _model.answerId =
                                                            answerId!;
                                                        _model.correct =
                                                            correct;
                                                      });
                                                      setState(() {
                                                        _model
                                                            .updateRequestDataAtIndex(
                                                          listQuestionIndex,
                                                          (e) => e
                                                            ..correct = correct
                                                            ..answerType =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .answerType
                                                            ..questionId =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .id
                                                            ..answers = listQuestionItem
                                                                .questionsId
                                                                .answers
                                                                .where((e) =>
                                                                    e.answersId
                                                                        .id ==
                                                                    _model
                                                                        .answerId)
                                                                .toList(),
                                                        );
                                                      });
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'text')
                                                  LongTextListQuestionWidget(
                                                    key: Key(
                                                        'Key2km_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    callback: (text) async {
                                                      setState(() {
                                                        _model
                                                            .updateRequestDataAtIndex(
                                                          listQuestionIndex,
                                                          (e) => e
                                                            ..answerType =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .answerType
                                                            ..questionId =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .id
                                                            ..answerContent =
                                                                text,
                                                        );
                                                      });
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'number')
                                                  NumberListQuestionWidget(
                                                    key: Key(
                                                        'Keyybg_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    callBack: (number) async {
                                                      setState(() {
                                                        _model
                                                            .updateRequestDataAtIndex(
                                                          listQuestionIndex,
                                                          (e) => e
                                                            ..answerType =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .answerType
                                                            ..questionId =
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .id
                                                            ..answerContent =
                                                                number
                                                                    ?.toString(),
                                                        );
                                                      });
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var shouldSetState = false;
                          _model.timerController.onStopTimer();
                          while (_model.loopQuestion <
                              _model.list!.questions.length) {
                            if (_model.requestData
                                    .where((e) =>
                                        e.questionId ==
                                        (_model.list?.questions[
                                                _model.loopQuestion])
                                            ?.questionsId
                                            .id)
                                    .toList().isEmpty) {
                              setState(() {
                                _model
                                    .addToRequestData(RequestAnswerStaffStruct(
                                  status: 'published',
                                  correct: 0,
                                  answerType: (_model.list
                                          ?.questions[_model.loopQuestion])
                                      ?.questionsId
                                      .answerType,
                                  staffId: getJsonField(
                                    FFAppState().staffLogin,
                                    r'''$.id''',
                                  ).toString(),
                                  questionId: (_model.list
                                          ?.questions[_model.loopQuestion])
                                      ?.questionsId
                                      .id,
                                ));
                              });
                            }
                            setState(() {
                              _model.loopQuestion = _model.loopQuestion + 1;
                            });
                          }
                          setState(() {
                            _model.loopQuestion = 0;
                          });
                          while (
                              _model.loopQuestion < _model.requestData.length) {
                            if (_model.requestData[_model.loopQuestion]
                                    .questionId ==
                                '') {
                              setState(() {
                                _model.removeAtIndexFromRequestData(
                                    _model.loopQuestion);
                              });
                            } else {
                              setState(() {
                                _model.loopQuestion = _model.loopQuestion + 1;
                              });
                            }

                            setState(() {});
                          }
                          setState(() {
                            _model.dateEnd = functions.datetimeToString(
                                getCurrentTimestamp.toString());
                            _model.loopQuestion = 0;
                          });
                          _model.apiResultCreateStaffTest =
                              await DoTestGroup.createStaffTestsCall.call(
                            requestDataJson: <String, dynamic>{
                              'status': 'published',
                              'score': getJsonField(
                                <String, int>{
                                  'map': 100,
                                },
                                r'''$.map''',
                              ),
                              'date_start': _model.dateStart,
                              'date_end': _model.dateEnd,
                              'staff_id': FFAppState().staffid,
                              'test_id': widget.testId,
                            },
                            accessToken: FFAppState().accessToken,
                          );
                          shouldSetState = true;
                          if ((_model.apiResultCreateStaffTest?.succeeded ??
                              true)) {
                            setState(() {
                              _model.testId = getJsonField(
                                (_model.apiResultCreateStaffTest?.jsonBody ??
                                    ''),
                                r'''$.data.id''',
                              ).toString();
                              _model.testTime = getJsonField(
                                (_model.apiResultCreateStaffTest?.jsonBody ??
                                    ''),
                                r'''$.data.test_id.duration_minutes''',
                              );
                              _model.testName = getJsonField(
                                (_model.apiResultCreateStaffTest?.jsonBody ??
                                    ''),
                                r'''$.data.test_id.name''',
                              ).toString();
                              _model.testDescription = getJsonField(
                                (_model.apiResultCreateStaffTest?.jsonBody ??
                                    ''),
                                r'''$.data.test_id.description''',
                              ).toString();
                            });
                            while (_model.loopId < _model.requestData.length) {
                              setState(() {
                                _model.updateRequestDataAtIndex(
                                  _model.loopId,
                                  (e) => e
                                    ..staffTestId = getJsonField(
                                      (_model.apiResultCreateStaffTest
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.data.id''',
                                    ).toString(),
                                );
                              });
                              setState(() {
                                _model.loopId = _model.loopId + 1;
                              });
                            }
                            setState(() {
                              _model.loopId = 0;
                            });
                            _model.apiResultCreateStaffAnswer =
                                await DoTestGroup.createStaffAnswerCall.call(
                              accessToken: FFAppState().accessToken,
                              requestJson: _model.requestData
                                  .map((e) => e.toMap())
                                  .toList(),
                            );
                            shouldSetState = true;
                            if ((_model.apiResultCreateStaffAnswer?.succeeded ??
                                true)) {
                              _model.apiResultCaculatorScores =
                                  await DoTestGroup.calculateTestScoresCall
                                      .call(
                                accessToken: FFAppState().accessToken,
                                staffTestId: _model.testId,
                              );
                              shouldSetState = true;
                              if ((_model.apiResultCaculatorScores?.succeeded ??
                                  true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Thông báo'),
                                      content: const Text('Nộp bài thi thành công!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                context.pushNamed(
                                  'DoTestDetail',
                                  queryParameters: {
                                    'testId': serializeParam(
                                      _model.testId,
                                      ParamType.String,
                                    ),
                                    'testName': serializeParam(
                                      _model.testName,
                                      ParamType.String,
                                    ),
                                    'testTime': serializeParam(
                                      _model.testTime,
                                      ParamType.int,
                                    ),
                                    'testDescription': serializeParam(
                                      _model.testDescription,
                                      ParamType.String,
                                    ),
                                    'percentCorect': serializeParam(
                                      getJsonField(
                                        (_model.apiResultCaculatorScores
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.percent_corect''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                _model.checkRefreshTokenBlock2 =
                                    await action_blocks.checkRefreshToken(
                                  context,
                                  jsonErrors: (_model
                                          .apiResultCaculatorScores?.jsonBody ??
                                      ''),
                                );
                                shouldSetState = true;
                                if (!_model.checkRefreshTokenBlock2!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFAppConstants.ErrorLoadData,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                                if (shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              _model.checkRefreshTokenBlock1 =
                                  await action_blocks.checkRefreshToken(
                                context,
                                jsonErrors: (_model
                                        .apiResultCreateStaffAnswer?.jsonBody ??
                                    ''),
                              );
                              shouldSetState = true;
                              if (!_model.checkRefreshTokenBlock1!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      FFAppConstants.ErrorLoadData,
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }
                              if (shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            _model.checkRefreshTokenBlock =
                                await action_blocks.checkRefreshToken(
                              context,
                              jsonErrors:
                                  (_model.apiResultCreateStaffTest?.jsonBody ??
                                      ''),
                            );
                            shouldSetState = true;
                            if (!_model.checkRefreshTokenBlock!) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFAppConstants.ErrorLoadData,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }
                            if (shouldSetState) setState(() {});
                            return;
                          }

                          if (shouldSetState) setState(() {});
                        },
                        text: 'Nộp bài',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
