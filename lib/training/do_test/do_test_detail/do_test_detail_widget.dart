import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/do_test/long_text_do_test/long_text_do_test_widget.dart';
import '/training/do_test/multi_select_do_test/multi_select_do_test_widget.dart';
import '/training/do_test/select_do_test/select_do_test_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'do_test_detail_model.dart';
export 'do_test_detail_model.dart';

class DoTestDetailWidget extends StatefulWidget {
  const DoTestDetailWidget({
    super.key,
    this.testId,
    this.testName,
    this.testTime,
    this.testDescription,
    this.percentCorect,
    required this.goodScore,
  });

  final String? testId;
  final String? testName;
  final int? testTime;
  final String? testDescription;
  final int? percentCorect;
  final int? goodScore;

  @override
  State<DoTestDetailWidget> createState() => _DoTestDetailWidgetState();
}

class _DoTestDetailWidgetState extends State<DoTestDetailWidget> {
  late DoTestDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoTestDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultGetStaffAnswerList =
          await DoTestGroup.staffAnswerListCall.call(
        accessToken: FFAppState().accessToken,
        filter:
            '{\"_and\":[{\"staff_test_id\":{\"_eq\":\"${widget.testId}\"}}]}',
      );
      if ((_model.apiResultGetStaffAnswerList?.succeeded ?? true)) {
        setState(() {
          _model.list = StaffAnswerListDataStruct.maybeFromMap(
                  (_model.apiResultGetStaffAnswerList?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<StaffAnswerListStruct>();
        });
      } else {
        _model.checkRefreshTokenBlock67 = await action_blocks.checkRefreshToken(
          context,
          jsonErrors: (_model.apiResultGetStaffAnswerList?.jsonBody ?? ''),
        );
        if (!_model.checkRefreshTokenBlock67!) {
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
              context.pushNamed(
                'DoTestList',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Chi tiết bài test',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                '${widget.testName}',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            if ((widget.percentCorect != null) &&
                                (widget.goodScore != null))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((widget.percentCorect ==
                                          widget.goodScore) ||
                                      (widget.percentCorect! >
                                          widget.goodScore!))
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 2.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 4.0, 6.0, 4.0),
                                            child: Text(
                                              'Đạt',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.percentCorect! < widget.goodScore!)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 4.0, 6.0, 4.0),
                                            child: Text(
                                              'Trượt',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                        Text(
                                          valueOrDefault<String>(
                                            widget.testTime?.toString(),
                                            'Loading',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'phút',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                if (widget.percentCorect != null)
                                  Text(
                                    '${widget.percentCorect?.toString()} điểm',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                              ],
                            ),
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
                              16.0, 4.0, 16.0, 0.0),
                          child: Text(
                            '${widget.testDescription}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final questionList = _model.list.toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: questionList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 16.0),
                                itemBuilder: (context, questionListIndex) {
                                  final questionListItem =
                                      questionList[questionListIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '${(questionListIndex + 1).toString()}.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Html(
                                                      data: questionListItem
                                                          .questionId.content,
                                                      onLinkTap:
                                                          (url, _, __, ___) =>
                                                              launchURL(url!),
                                                    ),
                                                  ),
                                                  if (questionListItem.answers
                                                          .where((e) =>
                                                              e.answersId
                                                                  .correct ==
                                                              1)
                                                          .toList()
                                                          .length ==
                                                      questionListItem
                                                          .questionId.answers
                                                          .where((e) =>
                                                              e.answersId
                                                                  .correct ==
                                                              1)
                                                          .toList()
                                                          .length)
                                                    Icon(
                                                      Icons
                                                          .check_circle_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      size: 24.0,
                                                    ),
                                                  if (questionListItem.answers
                                                          .where((e) =>
                                                              e.answersId
                                                                  .correct ==
                                                              1)
                                                          .toList()
                                                          .length !=
                                                      questionListItem
                                                          .questionId.answers
                                                          .where((e) =>
                                                              e.answersId
                                                                  .correct ==
                                                              1)
                                                          .toList()
                                                          .length)
                                                    Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (questionListItem.answerType ==
                                              'checkbox')
                                            Builder(
                                              builder: (context) {
                                                final listAnswer =
                                                    questionListItem
                                                        .questionId.answers
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listAnswer.length,
                                                  itemBuilder: (context,
                                                      listAnswerIndex) {
                                                    final listAnswerItem =
                                                        listAnswer[
                                                            listAnswerIndex];
                                                    return MultiSelectDoTestWidget(
                                                      key: Key(
                                                          'Keym0t_${listAnswerIndex}_of_${listAnswer.length}'),
                                                      listQuestion:
                                                          listAnswerItem
                                                              .answersId,
                                                      listAnswer:
                                                          questionListItem
                                                              .answers,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          if (questionListItem.answerType ==
                                              'radio')
                                            Builder(
                                              builder: (context) {
                                                final listAnswerRadio =
                                                    questionListItem
                                                        .questionId.answers
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listAnswerRadio.length,
                                                  itemBuilder: (context,
                                                      listAnswerRadioIndex) {
                                                    final listAnswerRadioItem =
                                                        listAnswerRadio[
                                                            listAnswerRadioIndex];
                                                    return SelectDoTestWidget(
                                                      key: Key(
                                                          'Keyw3b_${listAnswerRadioIndex}_of_${listAnswerRadio.length}'),
                                                      listQuestion:
                                                          listAnswerRadioItem
                                                              .answersId,
                                                      listAnswer: questionListItem
                                                                  .answers.isNotEmpty
                                                          ? questionListItem
                                                              .answers.first
                                                          : AnswersListStruct(
                                                              answersId:
                                                                  TestAnswersIdStruct(
                                                                id: '1',
                                                              ),
                                                            ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          if (questionListItem.answerType ==
                                              'text')
                                            LongTextDoTestWidget(
                                              key: Key(
                                                  'Key6so_${questionListIndex}_of_${questionList.length}'),
                                              listAnswerText: questionListItem
                                                  .answerContent,
                                              questionAnswer: questionListItem
                                                  .questionId
                                                  .answers
                                                  .first
                                                  .answersId
                                                  .content,
                                              corect: questionListItem.correct,
                                            ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (questionListItem.answerType ==
                                                  'number')
                                                Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(
                                                    minHeight: 40.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    child: Text(
                                                      questionListItem
                                                          .answerContent,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              if ((questionListItem.correct ==
                                                      0) &&
                                                  (questionListItem
                                                          .answerType ==
                                                      'number'))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Đáp án đúng: ${questionListItem.questionId.answers.isNotEmpty ? questionListItem.questionId.answers.first.answersId.content : ' '}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
