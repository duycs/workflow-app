import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/test/checkbox_groups_test/checkbox_groups_test_widget.dart';
import '/training/test/radio_buton_detail/radio_buton_detail_widget.dart';
import '/training/test/test_long_text/test_long_text_widget.dart';
import '/training/test/test_number/test_number_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'test_detail_model.dart';
export 'test_detail_model.dart';

class TestDetailWidget extends StatefulWidget {
  const TestDetailWidget({
    super.key,
    this.id,
    this.name,
    this.description,
    this.time,
    this.goodScore,
    String? checkScroll,
    this.status,
    this.idUser,
  }) : checkScroll = checkScroll ?? '0';

  final String? id;
  final String? name;
  final String? description;
  final String? time;
  final int? goodScore;
  final String checkScroll;
  final String? status;
  final String? idUser;

  @override
  State<TestDetailWidget> createState() => _TestDetailWidgetState();
}

class _TestDetailWidgetState extends State<TestDetailWidget> {
  late TestDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenTestOne1 = await action_blocks.tokenReload(context);
      if (_model.reloadTokenTestOne1!) {
        _model.apiResultlistTest1 = await TestGroup.testOneCall.call(
          testsId: widget.id,
          accessToken: FFAppState().accessToken,
        );

        if ((_model.apiResultlistTest1?.succeeded ?? true)) {
          _model.detail = TestListStruct.maybeFromMap(getJsonField(
            (_model.apiResultlistTest1?.jsonBody ?? ''),
            r'''$.data''',
          ));
          _model.check = true;
          setState(() {});
          _model.questions = getJsonField(
            (_model.apiResultlistTest1?.jsonBody ?? ''),
            r'''$.data.questions[:].questions_id''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        }
      } else {
        FFAppState().update(() {});
        return;
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
              context.pop();
            },
          ),
          title: Text(
            'Nội dung bài thi',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.asset(
                                          'assets/images/career_center-interview-what_exactly_are_aptitude_tests.jpg',
                                          fit: BoxFit.contain,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                        allowRotation: false,
                                        tag: 'imageTag',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'imageTag',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/career_center-interview-what_exactly_are_aptitude_tests.jpg',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      alignment: const Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              widget.name == 'null' ? ' ' : widget.name!,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              valueOrDefault<String>(
                                                        widget.time,
                                                        '0',
                                                      ) ==
                                                      'null'
                                                  ? ' '
                                                  : widget.time,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            ' phút',
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
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_score,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  'Điểm đạt:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  widget.goodScore != null
                                      ? widget.goodScore!.toString()
                                      : '0',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
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
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 16.0),
                            child: Text(
                              widget.description == 'null'
                                  ? ' '
                                  : widget.description!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if ((_model.detail != null) && (_model.check == true))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final questionList =
                                      _model.detail?.questions.toList() ?? [];
                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      24.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: questionList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 12.0),
                                    itemBuilder: (context, questionListIndex) {
                                      final questionListItem =
                                          questionList[questionListIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${(questionListIndex + 1).toString()}:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Html(
                                                      data: questionListItem
                                                          .questionsId.content,
                                                      onLinkTap: (url, _, __) =>
                                                          launchURL(url!),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final answers = questionListItem
                                                  .questionsId.answers
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.vertical,
                                                itemCount: answers.length,
                                                itemBuilder:
                                                    (context, answersIndex) {
                                                  final answersItem =
                                                      answers[answersIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (questionListItem
                                                              .questionsId
                                                              .answerType ==
                                                          'number')
                                                        TestNumberWidget(
                                                          key: Key(
                                                              'Keyw1b_${answersIndex}_of_${answers.length}'),
                                                          answersId:
                                                              answersItem,
                                                        ),
                                                      if (questionListItem
                                                              .questionsId
                                                              .answerType ==
                                                          'text')
                                                        TestLongTextWidget(
                                                          key: Key(
                                                              'Keypxe_${answersIndex}_of_${answers.length}'),
                                                          answersId:
                                                              answersItem,
                                                        ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible: questionListItem
                                                                  .questionsId
                                                                  .answerType ==
                                                              'checkbox',
                                                          child:
                                                              CheckboxGroupsTestWidget(
                                                            key: Key(
                                                                'Keytp2_${answersIndex}_of_${answers.length}'),
                                                            parameter1:
                                                                answersItem,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Visibility(
                                                          visible: questionListItem
                                                                  .questionsId
                                                                  .answerType ==
                                                              'radio',
                                                          child:
                                                              RadioButonDetailWidget(
                                                            key: Key(
                                                                'Keyh3q_${answersIndex}_of_${answers.length}'),
                                                            parameter1:
                                                                answersItem,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (_model.check == false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.LoadingPageWidget(
                            width: double.infinity,
                            height: double.infinity,
                            size: 50.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if ((FFAppState().user.id == widget.idUser) &&
                  (_model.check == true))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 15.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          'TestUpdate',
                          queryParameters: {
                            'id': serializeParam(
                              widget.id,
                              ParamType.String,
                            ),
                            'name': serializeParam(
                              _model.detail?.name,
                              ParamType.String,
                            ),
                            'time': serializeParam(
                              _model.detail?.durationMinutes.toString(),
                              ParamType.String,
                            ),
                            'description': serializeParam(
                              _model.detail?.description,
                              ParamType.String,
                            ),
                            'questions': serializeParam(
                              _model.questions,
                              ParamType.JSON,
                              isList: true,
                            ),
                            'godScore': serializeParam(
                              widget.goodScore,
                              ParamType.int,
                            ),
                            'status': serializeParam(
                              widget.status,
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
                      text: 'Chỉnh sửa',
                      icon: const Icon(
                        Icons.edit,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            72.0, 0.0, 72.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
