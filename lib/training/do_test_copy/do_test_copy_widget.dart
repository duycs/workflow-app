import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/long_text_list_question/long_text_list_question_widget.dart';
import '/training/do_test/multi_selec_list_question/multi_selec_list_question_widget.dart';
import '/training/do_test/number_list_question/number_list_question_widget.dart';
import '/training/do_test/select_list_question/select_list_question_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'do_test_copy_model.dart';
export 'do_test_copy_model.dart';

class DoTestCopyWidget extends StatefulWidget {
  const DoTestCopyWidget({super.key});

  @override
  State<DoTestCopyWidget> createState() => _DoTestCopyWidgetState();
}

class _DoTestCopyWidgetState extends State<DoTestCopyWidget> {
  late DoTestCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoTestCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.dateStart =
            functions.datetimeToString(getCurrentTimestamp.toString());
      });
      _model.apiResultGetLessionTest = await TestGroup.testOneCall.call(
        testsId: 'c66e319d-e267-46cb-af06-a1beb800c5e3',
        accessToken: FFAppState().accessToken,
      );
      if ((_model.apiResultGetLessionTest?.succeeded ?? true)) {
        setState(() {
          _model.list = TestListStruct.maybeFromMap(getJsonField(
            (_model.apiResultGetLessionTest?.jsonBody ?? ''),
            r'''$.data''',
          ));
        });
        _model.timerController.onStartTimer();
      } else {
        _model.checkRefreshTokenBlock45 = await action_blocks.checkRefreshToken(
          context,
          jsonErrors: (_model.apiResultGetLessionTest?.jsonBody ?? ''),
        );
        if (!_model.checkRefreshTokenBlock45!) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FFAppConstants.ErrorLoadData,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
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
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                const Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate) setState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
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
                                onLinkTap: (url, _, __, ___) => launchURL(url!),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final listQuestion =
                                    _model.list?.questions.toList() ?? [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listQuestion.length,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
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
                                                            data:
                                                                listQuestionItem
                                                                    .questionsId
                                                                    .content,
                                                            onLinkTap: (url, _,
                                                                    __, ___) =>
                                                                launchURL(url!),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (listQuestionItem
                                                      .questionsId.answerType ==
                                                  'radio')
                                                SelectListQuestionWidget(
                                                  key: Key(
                                                      'Keypff_${listQuestionIndex}_of_${listQuestion.length}'),
                                                  listAnswer: listQuestionItem
                                                      .questionsId.answers,
                                                  callback: (answerId,
                                                      correct) async {
                                                    setState(() {
                                                      _model.answerId =
                                                          answerId!;
                                                      _model.correct = correct;
                                                    });
                                                  },
                                                ),
                                              if (listQuestionItem
                                                      .questionsId.answerType ==
                                                  'text')
                                                LongTextListQuestionWidget(
                                                  key: Key(
                                                      'Keysvo_${listQuestionIndex}_of_${listQuestion.length}'),
                                                  callback: (text) async {},
                                                ),
                                              if (listQuestionItem
                                                      .questionsId.answerType ==
                                                  'number')
                                                NumberListQuestionWidget(
                                                  key: Key(
                                                      'Key8zt_${listQuestionIndex}_of_${listQuestion.length}'),
                                                  callBack: (number) async {},
                                                ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child:
                                                    MultiSelecListQuestionWidget(
                                                  key: Key(
                                                      'Key8dl_${listQuestionIndex}_of_${listQuestion.length}'),
                                                  listAnswer: listQuestionItem
                                                      .questionsId.answers,
                                                ),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        _model.timerController.onStopTimer();
                        setState(() {
                          _model.dateEnd = functions
                              .datetimeToString(getCurrentTimestamp.toString());
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
                            'test_id': 'c66e319d-e267-46cb-af06-a1beb800c5e3',
                          },
                          accessToken: FFAppState().accessToken,
                        );
                        shouldSetState = true;
                        if ((_model.apiResultCreateStaffTest?.succeeded ??
                            true)) {
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
                                await DoTestGroup.calculateTestScoresCall.call(
                              accessToken: FFAppState().accessToken,
                            );
                            shouldSetState = true;
                            if ((_model.apiResultCaculatorScores?.succeeded ??
                                true)) {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Nộp bài thành công!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;

                              context.pushNamed(
                                'DoTestDetail',
                                queryParameters: {
                                  'testId': serializeParam(
                                    getJsonField(
                                      (_model.apiResultCreateStaffAnswer
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.data.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'testName': serializeParam(
                                    getJsonField(
                                      (_model.apiResultCreateStaffAnswer
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.data.test_id.name''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'testTime': serializeParam(
                                    getJsonField(
                                      (_model.apiResultCreateStaffAnswer
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.data.test_id.duration_minutes''',
                                    ),
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );

                              if (shouldSetState) setState(() {});
                              return;
                            } else {
                              _model.checkRefreshTokenBlock29 =
                                  await action_blocks.checkRefreshToken(
                                context,
                                jsonErrors: (_model
                                        .apiResultCaculatorScores?.jsonBody ??
                                    ''),
                              );
                              shouldSetState = true;
                              if (!_model.checkRefreshTokenBlock29!) {
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
                            _model.checkRefreshTokenBlock27 =
                                await action_blocks.checkRefreshToken(
                              context,
                              jsonErrors: (_model
                                      .apiResultCreateStaffAnswer?.jsonBody ??
                                  ''),
                            );
                            shouldSetState = true;
                            if (!_model.checkRefreshTokenBlock27!) {
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
                          _model.checkRefreshTokenBlock26 =
                              await action_blocks.checkRefreshToken(
                            context,
                            jsonErrors:
                                (_model.apiResultCreateStaffTest?.jsonBody ??
                                    ''),
                          );
                          shouldSetState = true;
                          if (!_model.checkRefreshTokenBlock26!) {
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
