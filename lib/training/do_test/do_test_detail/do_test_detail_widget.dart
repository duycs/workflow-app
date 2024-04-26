import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/do_test/long_text_do_test/long_text_do_test_widget.dart';
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
    this.avatar,
    this.lessionId,
  });

  final String? testId;
  final String? testName;
  final int? testTime;
  final String? testDescription;
  final String? percentCorect;
  final int? goodScore;
  final String? avatar;
  final String? lessionId;

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
      _model.getStaffAnswerListToken = await action_blocks.tokenReload(context);
      if (_model.getStaffAnswerListToken!) {
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
        }
      } else {
        setState(() {});
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
                        Stack(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
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
                            FlutterFlowIconButton(
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
                                  queryParameters: {
                                    'lessionId': serializeParam(
                                      widget.lessionId,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
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
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${widget.testName}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            if ((widget.percentCorect != null &&
                                    widget.percentCorect != '') &&
                                (widget.goodScore != null))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (((((widget.goodScore!)).compareTo(double.parse((widget.percentCorect!)))).toString() ==
                                          '-1') ||
                                      ((((widget.goodScore!)).compareTo(double.parse((widget.percentCorect!)))).toString() ==
                                          '0'))
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
                                              color: const Color(0xFF38B647),
                                              width: 1.0,
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
                                                    fontFamily: 'Nunito Sans',
                                                    color: const Color(0xFF38B647),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((((widget.goodScore!)).compareTo(double.parse((widget.percentCorect!)))).toString() ==
                                      '1')
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
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 4.0, 6.0, 4.0),
                                            child: Text(
                                              'Không đạt',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 14.0,
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
                                                fontFamily: 'Nunito Sans',
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
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          ' phút ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                                if (widget.percentCorect != null &&
                                    widget.percentCorect != '')
                                  Text(
                                    '${(double.parse((widget.percentCorect!)).roundToDouble()).toString()} điểm',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 14.0,
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
                                  fontFamily: 'Nunito Sans',
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
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (_model.list.isNotEmpty)
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
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${(questionListIndex + 1).toString()}.',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
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
                                                    if ((questionListItem
                                                                    .answerType ==
                                                                'text') ||
                                                            (questionListItem
                                                                    .answerType ==
                                                                'number')
                                                        ? (questionListItem
                                                                .correct ==
                                                            1)
                                                        : (questionListItem
                                                                .answers
                                                                .where((e) =>
                                                                    e.answersId
                                                                        .correct ==
                                                                    1)
                                                                .toList()
                                                                .length ==
                                                            questionListItem
                                                                .questionId
                                                                .answers
                                                                .where((e) =>
                                                                    e.answersId
                                                                        .correct ==
                                                                    1)
                                                                .toList()
                                                                .length))
                                                      const Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF38B647),
                                                        size: 24.0,
                                                      ),
                                                    if ((questionListItem
                                                                    .answerType ==
                                                                'text') ||
                                                            (questionListItem
                                                                    .answerType ==
                                                                'number')
                                                        ? (questionListItem
                                                                .correct !=
                                                            1)
                                                        : (questionListItem
                                                                .answers
                                                                .where((e) =>
                                                                    e.answersId
                                                                        .correct ==
                                                                    1)
                                                                .toList()
                                                                .length !=
                                                            questionListItem
                                                                .questionId
                                                                .answers
                                                                .where((e) =>
                                                                    e.answersId
                                                                        .correct ==
                                                                    1)
                                                                .toList()
                                                                .length))
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
                                                corect:
                                                    questionListItem.correct,
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (questionListItem
                                                        .answerType ==
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
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Text(
                                                        questionListItem
                                                            .answerContent,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Đáp án đúng: ${questionListItem.questionId.answers.isNotEmpty ? questionListItem.questionId.answers.first.answersId.content : ' '}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ),
                                              ].divide(const SizedBox(height: 8.0)),
                                            ),
                                            if (questionListItem.answerType ==
                                                'checkbox')
                                              Builder(
                                                builder: (context) {
                                                  final listAnswer2 =
                                                      questionListItem
                                                          .questionId.answers
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listAnswer2.length,
                                                    itemBuilder: (context,
                                                        listAnswer2Index) {
                                                      final listAnswer2Item =
                                                          listAnswer2[
                                                              listAnswer2Index];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .noColor,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                        .checkboxValueMap[
                                                                    listAnswer2Item] ??= questionListItem
                                                                            .answers
                                                                            .where((e) =>
                                                                                e.answersId.id ==
                                                                                listAnswer2Item.answersId.id)
                                                                            .toList().isNotEmpty
                                                                    ? true
                                                                    : false,
                                                                onChanged: ('1' ==
                                                                        '1')
                                                                    ? null
                                                                    : (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxValueMap[listAnswer2Item] =
                                                                                newValue!);
                                                                      },
                                                                side:
                                                                    BorderSide(
                                                                  width: 2,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor: ('1' ==
                                                                        '1')
                                                                    ? null
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                            Text(
                                                              listAnswer2Item
                                                                  .answersId
                                                                  .content,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: () {
                                                                      if ((listAnswer2Item.answersId.correct ==
                                                                              1) &&
                                                                          (questionListItem.answers.where((e) => e.answersId.id == listAnswer2Item.answersId.id).toList().isNotEmpty)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listAnswer2Item.answersId.correct !=
                                                                              1) &&
                                                                          (questionListItem.answers.where((e) => e.answersId.id == listAnswer2Item.answersId.id).toList().isNotEmpty)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else if ((listAnswer2Item.answersId.correct ==
                                                                              1) &&
                                                                          (questionListItem.answers.isEmpty)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listAnswer2Item.answersId.correct !=
                                                                              1) &&
                                                                          (questionListItem.answers.isEmpty)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      } else if (listAnswer2Item
                                                                              .answersId
                                                                              .correct ==
                                                                          1) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
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
