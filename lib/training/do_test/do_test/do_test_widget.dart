import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/one_select_answer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/training/do_test/long_text_list_question/long_text_list_question_widget.dart';
import '/training/do_test/number_list_question/number_list_question_widget.dart';
import '/training/do_test/select_list_question/select_list_question_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
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
    this.lessionId,
    this.avatar,
    this.goodScore,
  });

  final String? testId;
  final String? lessionId;
  final String? avatar;
  final int? goodScore;

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
      await actions.blockNavigateBack(
        context,
        1,
      );
      _model.dateStart =
          functions.datetimeToString(getCurrentTimestamp.toString());
      setState(() {});
      _model.getLessionTestToken = await action_blocks.tokenReload(context);
      if (_model.getLessionTestToken!) {
        _model.apiResultGetLessionTest = await TestGroup.testOneCall.call(
          testsId: widget.testId,
          accessToken: FFAppState().accessToken,
        );

        if ((_model.apiResultGetLessionTest?.succeeded ?? true)) {
          _model.list = TestListStruct.maybeFromMap(getJsonField(
            (_model.apiResultGetLessionTest?.jsonBody ?? ''),
            r'''$.data''',
          ));
          setState(() {});
          while (_model.loopList < _model.list!.questions.length) {
            _model.addToRequestData(RequestAnswerStaffStruct(
              status: 'published',
              staffId: getJsonField(
                FFAppState().staffLogin,
                r'''$.id''',
              ).toString().toString(),
              questionId: '',
            ));
            _model.addToListIdCheck('');
            setState(() {});
            _model.loopList = _model.loopList + 1;
            setState(() {});
          }
          _model.loopList = 0;
          setState(() {});
          _model.instantTimer = InstantTimer.periodic(
            duration: const Duration(milliseconds: 1000),
            callback: (timer) async {
              _model.timerController.onStartTimer();
            },
            startImmediately: true,
          );
        }
      } else {
        setState(() {});
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (widget.avatar != null &&
                                    widget.avatar != '')
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          '${FFAppConstants.ApiBaseUrl}/assets/${widget.avatar}?access_token=${FFAppState().accessToken}',
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.list?.name,
                                      'Loading',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Text(
                                              'Thời gian: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowTimer(
                                                initialTime: _model
                                                        .list!.durationMinutes *
                                                    60000,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller:
                                                    _model.timerController,
                                                updateStateInterval: const Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timerMilliseconds =
                                                      value;
                                                  _model.timerValue =
                                                      displayTime;
                                                  if (shouldUpdate) {
                                                    setState(() {});
                                                  }
                                                },
                                                onEnded: () async {
                                                  var shouldSetState = false;
                                                  _model.timerController.timer
                                                      .setPresetTime(
                                                          mSec: 0, add: false);
                                                  _model.timerController
                                                      .onResetTimer();

                                                  _model.instantTimer?.cancel();
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
                                                      _model.addToRequestData(
                                                          RequestAnswerStaffStruct(
                                                        status: 'published',
                                                        correct: 0,
                                                        answerType: (_model.list
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
                                                        questionId: (_model.list
                                                                    ?.questions[
                                                                _model
                                                                    .loopQuestion])
                                                            ?.questionsId
                                                            .id,
                                                      ));
                                                      setState(() {});
                                                    }
                                                    _model.loopQuestion =
                                                        _model.loopQuestion + 1;
                                                    setState(() {});
                                                  }
                                                  _model.loopQuestion = 0;
                                                  setState(() {});
                                                  while (_model.loopQuestion <
                                                      _model
                                                          .requestData.length) {
                                                    if (_model
                                                            .requestData[_model
                                                                .loopQuestion]
                                                            .questionId ==
                                                        '') {
                                                      _model
                                                          .removeAtIndexFromRequestData(
                                                              _model
                                                                  .loopQuestion);
                                                      setState(() {});
                                                    } else {
                                                      _model.loopQuestion =
                                                          _model.loopQuestion +
                                                              1;
                                                      setState(() {});
                                                    }

                                                    setState(() {});
                                                  }
                                                  _model.dateEnd = functions
                                                      .datetimeToString(
                                                          getCurrentTimestamp
                                                              .toString());
                                                  _model.loopQuestion = 0;
                                                  setState(() {});
                                                  _model.createStaffTestToken1 =
                                                      await action_blocks
                                                          .tokenReload(context);
                                                  shouldSetState = true;
                                                  if (_model
                                                      .createStaffTestToken1!) {
                                                    _model.apiResultCreateStaffTest1 =
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
                                                        'staff_id': FFAppState()
                                                            .staffid,
                                                        'test_id':
                                                            widget.testId,
                                                        'lession_id':
                                                            widget.lessionId,
                                                      },
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                    );

                                                    shouldSetState = true;
                                                    if ((_model
                                                            .apiResultCreateStaffTest1
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.testId =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest1
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.id''',
                                                      ).toString();
                                                      _model.testTime =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest1
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.duration_minutes''',
                                                      );
                                                      _model.testName =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest1
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.name''',
                                                      ).toString();
                                                      _model.testDescription =
                                                          getJsonField(
                                                        (_model.apiResultCreateStaffTest1
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.test_id.description''',
                                                      ).toString();
                                                      setState(() {});
                                                      while (_model.loopId <
                                                          _model.requestData
                                                              .length) {
                                                        _model
                                                            .updateRequestDataAtIndex(
                                                          _model.loopId,
                                                          (e) => e
                                                            ..staffTestId =
                                                                getJsonField(
                                                              (_model.apiResultCreateStaffTest1
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.id''',
                                                            ).toString(),
                                                        );
                                                        setState(() {});
                                                        _model.loopId =
                                                            _model.loopId + 1;
                                                        setState(() {});
                                                      }
                                                      _model.loopId = 0;
                                                      setState(() {});
                                                      _model.createStaffAnswerToken1 =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      shouldSetState = true;
                                                      if (_model
                                                          .createStaffAnswerToken1!) {
                                                        _model.apiResultCreateStaffAnswer1 =
                                                            await DoTestGroup
                                                                .createStaffAnswerCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          requestJson: _model
                                                              .requestData
                                                              .map((e) =>
                                                                  e.toMap())
                                                              .toList(),
                                                        );

                                                        shouldSetState = true;
                                                        if ((_model
                                                                .apiResultCreateStaffAnswer1
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.caculatorScoresToken1 =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                              .caculatorScoresToken1!) {
                                                            _model.apiResultCaculatorScores1 =
                                                                await DoTestGroup
                                                                    .calculateTestScoresCall
                                                                    .call(
                                                              accessToken:
                                                                  FFAppState()
                                                                      .accessToken,
                                                              staffTestId:
                                                                  _model.testId,
                                                            );

                                                            shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultCaculatorScores1
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Nộp bài thi thành công!',
                                                                    style:
                                                                        TextStyle(
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
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if (widget.lessionId !=
                                                                      null &&
                                                                  widget.lessionId !=
                                                                      '') {
                                                                context
                                                                    .pushNamed(
                                                                  'DoTestDetail',
                                                                  queryParameters:
                                                                      {
                                                                    'testId':
                                                                        serializeParam(
                                                                      _model
                                                                          .testId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'testName':
                                                                        serializeParam(
                                                                      _model
                                                                          .testName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'testTime':
                                                                        serializeParam(
                                                                      _model
                                                                          .testTime,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'testDescription':
                                                                        serializeParam(
                                                                      _model
                                                                          .testDescription,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'percentCorect':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        (_model.apiResultCaculatorScores1?.jsonBody ??
                                                                            ''),
                                                                        r'''$.percent_correct''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'goodScore':
                                                                        serializeParam(
                                                                      widget
                                                                          .goodScore,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'avatar':
                                                                        serializeParam(
                                                                      widget
                                                                          .avatar,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'lessionId':
                                                                        serializeParam(
                                                                      widget
                                                                          .lessionId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'StudyProgramListUserDraft',
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );
                                                              }

                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            } else {
                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }
                                                          } else {
                                                            setState(() {});
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }
                                                        } else {
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }
                                                      } else {
                                                        setState(() {});
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }
                                                    } else {
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    setState(() {});
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
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
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    'Nội dung',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Html(
                                    data: _model.list!.description,
                                    onLinkTap: (url, _, __) => launchURL(url!),
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
                                          const SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, listQuestionIndex) {
                                        final listQuestionItem =
                                            listQuestion[listQuestionIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
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
                                                                      'Nunito Sans',
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
                                                                      _, __) =>
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
                                                    'radio')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(Chọn 1 đáp án đúng)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'checkbox')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(Chọn 1 hoặc nhiều đáp án đúng)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'number')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(Trả lời số)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'text')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(Trả lời văn bản ngắn)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
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
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            dataQuestion.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 4.0),
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
                                                                            _model.checkboxAnswer =
                                                                                dataQuestionItem.answersId.id;
                                                                            _model.checkTrue =
                                                                                dataQuestionItem.answersId.correct;
                                                                            setState(() {});
                                                                            _model.addToAnswerToList(AnswersListStruct(
                                                                              answersId: TestAnswersIdStruct(
                                                                                id: _model.checkboxAnswer,
                                                                              ),
                                                                            ));
                                                                            setState(() {});
                                                                            _model.updateRequestDataAtIndex(
                                                                              listQuestionIndex,
                                                                              (e) => e
                                                                                ..correct = _model.checkTrue
                                                                                ..answerType = listQuestionItem.questionsId.answerType
                                                                                ..questionId = listQuestionItem.questionsId.id
                                                                                ..answers = _model.answerToList.toList(),
                                                                            );
                                                                            setState(() {});
                                                                            _model.checkboxAnswer =
                                                                                null;
                                                                            _model.checkTrue =
                                                                                null;
                                                                            setState(() {});
                                                                          } else {
                                                                            _model.checkboxAnswer =
                                                                                dataQuestionItem.answersId.id;
                                                                            setState(() {});
                                                                            while (_model.loop! <
                                                                                _model.requestData[listQuestionIndex].answers.length) {
                                                                              if (_model.requestData[listQuestionIndex].answers.where((e) => e.answersId.id == _model.checkboxAnswer).toList().isNotEmpty) {
                                                                                _model.updateRequestDataAtIndex(
                                                                                  listQuestionIndex,
                                                                                  (e) => e
                                                                                    ..updateAnswers(
                                                                                      (e) => e.removeAt(_model.loop!),
                                                                                    ),
                                                                                );
                                                                                setState(() {});
                                                                              }
                                                                              _model.loop = _model.loop! + 1;
                                                                              setState(() {});
                                                                            }
                                                                            _model.checkboxAnswer =
                                                                                null;
                                                                            setState(() {});
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
                                                                              fontFamily: 'Nunito Sans',
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
                                                  Builder(
                                                    builder: (context) {
                                                      final dataQuestionOne =
                                                          listQuestionItem
                                                              .questionsId
                                                              .answers
                                                              .toList();
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            dataQuestionOne
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 4.0),
                                                        itemBuilder: (context,
                                                            dataQuestionOneIndex) {
                                                          final dataQuestionOneItem =
                                                              dataQuestionOne[
                                                                  dataQuestionOneIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .oneSelectAnswerModels
                                                                .getModel(
                                                              '${dataQuestionOneItem.answersId.id}${_model.listIdCheck[listQuestionIndex]}',
                                                              dataQuestionOneIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                OneSelectAnswerWidget(
                                                              key: Key(
                                                                'Keycaz_${'${dataQuestionOneItem.answersId.id}${_model.listIdCheck[listQuestionIndex]}'}',
                                                              ),
                                                              data:
                                                                  dataQuestionOneItem
                                                                      .answersId,
                                                              stringId: _model
                                                                      .listIdCheck[
                                                                  listQuestionIndex],
                                                              callback:
                                                                  (id) async {
                                                                _model
                                                                    .updateListIdCheckAtIndex(
                                                                  listQuestionIndex,
                                                                  (_) => id!,
                                                                );
                                                                setState(() {});
                                                                _model.checkboxAnswer =
                                                                    dataQuestionOneItem
                                                                        .answersId
                                                                        .id;
                                                                _model.checkTrue =
                                                                    dataQuestionOneItem
                                                                        .answersId
                                                                        .correct;
                                                                setState(() {});
                                                                _model
                                                                    .updateRequestDataAtIndex(
                                                                  listQuestionIndex,
                                                                  (e) => e
                                                                    ..answers =
                                                                        [],
                                                                );
                                                                setState(() {});
                                                                _model
                                                                    .updateRequestDataAtIndex(
                                                                  listQuestionIndex,
                                                                  (e) => e
                                                                    ..correct =
                                                                        _model
                                                                            .checkTrue
                                                                    ..answerType =
                                                                        listQuestionItem
                                                                            .questionsId
                                                                            .answerType
                                                                    ..questionId =
                                                                        listQuestionItem
                                                                            .questionsId
                                                                            .id
                                                                    ..updateAnswers(
                                                                      (e) => e.add(
                                                                          AnswersListStruct(
                                                                        answersId:
                                                                            TestAnswersIdStruct(
                                                                          id: _model
                                                                              .checkboxAnswer,
                                                                        ),
                                                                      )),
                                                                    ),
                                                                );
                                                                setState(() {});
                                                                _model.checkboxAnswer =
                                                                    null;
                                                                _model.checkTrue =
                                                                    null;
                                                                setState(() {});
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    '1')
                                                  SelectListQuestionWidget(
                                                    key: Key(
                                                        'Keyias_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    listAnswer: listQuestionItem
                                                        .questionsId.answers,
                                                    callback: (answerId,
                                                        correct) async {
                                                      _model.answerId =
                                                          answerId!;
                                                      _model.correct = correct;
                                                      setState(() {});
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
                                                          ..answers =
                                                              listQuestionItem
                                                                  .questionsId
                                                                  .answers
                                                                  .where((e) =>
                                                                      e.answersId
                                                                          .id ==
                                                                      _model
                                                                          .answerId)
                                                                  .toList(),
                                                      );
                                                      setState(() {});
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'text')
                                                  LongTextListQuestionWidget(
                                                    key: Key(
                                                        'Key2km_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    callback: (text) async {
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
                                                      setState(() {});
                                                    },
                                                  ),
                                                if (listQuestionItem.questionsId
                                                        .answerType ==
                                                    'number')
                                                  NumberListQuestionWidget(
                                                    key: Key(
                                                        'Keyybg_${listQuestionIndex}_of_${listQuestion.length}'),
                                                    callBack: (number) async {
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
                                                      setState(() {});
                                                    },
                                                  ),
                                              ].divide(const SizedBox(height: 4.0)),
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
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Bạn xác nhận nộp bài thi?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Thoát'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Xác nhận'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              _model.instantTimer?.cancel();
                              _model.timerController.onStopTimer();
                              _model.timerController.onResetTimer();

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
                                  _model.addToRequestData(
                                      RequestAnswerStaffStruct(
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
                                  setState(() {});
                                }
                                _model.loopQuestion = _model.loopQuestion + 1;
                                setState(() {});
                              }
                              _model.loopQuestion = 0;
                              setState(() {});
                              while (_model.loopQuestion <
                                  _model.requestData.length) {
                                if (_model.requestData[_model.loopQuestion]
                                        .questionId ==
                                    '') {
                                  _model.removeAtIndexFromRequestData(
                                      _model.loopQuestion);
                                  setState(() {});
                                } else {
                                  _model.loopQuestion = _model.loopQuestion + 1;
                                  setState(() {});
                                }

                                setState(() {});
                              }
                              _model.dateEnd = functions.datetimeToString(
                                  getCurrentTimestamp.toString());
                              _model.loopQuestion = 0;
                              setState(() {});
                              _model.createStaffTestToken =
                                  await action_blocks.tokenReload(context);
                              shouldSetState = true;
                              if (_model.createStaffTestToken!) {
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
                                    'lession_id': widget.lessionId,
                                  },
                                  accessToken: FFAppState().accessToken,
                                );

                                shouldSetState = true;
                                if ((_model
                                        .apiResultCreateStaffTest?.succeeded ??
                                    true)) {
                                  _model.testId = getJsonField(
                                    (_model.apiResultCreateStaffTest
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.id''',
                                  ).toString();
                                  _model.testTime = getJsonField(
                                    (_model.apiResultCreateStaffTest
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.test_id.duration_minutes''',
                                  );
                                  _model.testName = getJsonField(
                                    (_model.apiResultCreateStaffTest
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.test_id.name''',
                                  ).toString();
                                  _model.testDescription = getJsonField(
                                    (_model.apiResultCreateStaffTest
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.test_id.description''',
                                  ).toString();
                                  setState(() {});
                                  while (_model.loopId <
                                      _model.requestData.length) {
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
                                    setState(() {});
                                    _model.loopId = _model.loopId + 1;
                                    setState(() {});
                                  }
                                  _model.loopId = 0;
                                  setState(() {});
                                  _model.createStaffAnswerToken =
                                      await action_blocks.tokenReload(context);
                                  shouldSetState = true;
                                  if (_model.createStaffAnswerToken!) {
                                    _model.apiResultCreateStaffAnswer =
                                        await DoTestGroup.createStaffAnswerCall
                                            .call(
                                      accessToken: FFAppState().accessToken,
                                      requestJson: _model.requestData
                                          .map((e) => e.toMap())
                                          .toList(),
                                    );

                                    shouldSetState = true;
                                    if ((_model.apiResultCreateStaffAnswer
                                            ?.succeeded ??
                                        true)) {
                                      _model.caculatorScoresToken =
                                          await action_blocks
                                              .tokenReload(context);
                                      shouldSetState = true;
                                      if (_model.caculatorScoresToken!) {
                                        _model.apiResultCaculatorScores =
                                            await DoTestGroup
                                                .calculateTestScoresCall
                                                .call(
                                          accessToken: FFAppState().accessToken,
                                          staffTestId: _model.testId,
                                        );

                                        shouldSetState = true;
                                        if ((_model.apiResultCaculatorScores
                                                ?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Nộp bài thi thành công!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (widget.lessionId != null &&
                                              widget.lessionId != '') {
                                            context.goNamed(
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
                                                'testDescription':
                                                    serializeParam(
                                                  _model.testDescription,
                                                  ParamType.String,
                                                ),
                                                'percentCorect': serializeParam(
                                                  getJsonField(
                                                    (_model.apiResultCaculatorScores
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.percent_correct''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'goodScore': serializeParam(
                                                  widget.goodScore,
                                                  ParamType.int,
                                                ),
                                                'avatar': serializeParam(
                                                  widget.avatar,
                                                  ParamType.String,
                                                ),
                                                'lessionId': serializeParam(
                                                  widget.lessionId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          } else {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'StudyProgramListUser',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }

                                          if (shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        setState(() {});
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    setState(() {});
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                setState(() {});
                                if (shouldSetState) setState(() {});
                                return;
                              }
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
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
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
      ),
    );
  }
}
