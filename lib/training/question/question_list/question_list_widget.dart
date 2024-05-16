import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/question/filter_question/filter_question_widget.dart';
import '/training/question/question_create/question_create_widget.dart';
import '/training/question/question_menu/question_menu_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'question_list_model.dart';
export 'question_list_model.dart';

class QuestionListWidget extends StatefulWidget {
  const QuestionListWidget({super.key});

  @override
  State<QuestionListWidget> createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget>
    with TickerProviderStateMixin {
  late QuestionListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().scrollCheck = 'QuestionList';
      });
      _model.tokenReloadQuestionList = await action_blocks.tokenReload(context);
      if (_model.tokenReloadQuestionList!) {
        setState(() {
          _model.isLoad = true;
        });
        while (FFAppState().scrollCheck == 'QuestionList') {
          _model.tokenReloadQuestionListCheck =
              await action_blocks.tokenReload(context);
          if (_model.tokenReloadQuestionListCheck == true) {
            await Future.delayed(const Duration(milliseconds: 12000));
          } else {
            break;
          }
        }
      } else {
        FFAppState().update(() {});
        return;
      }
    });

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {
          setState(() {
            FFAppState().scrollCheck = '';
          });
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    _model.questionNameTextController ??= TextEditingController();
    _model.questionNameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    shakeDetector.stopListening();
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
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: const AlignmentDirectional(0.0, 1.0)
                        .resolve(Directionality.of(context)),
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: QuestionCreateWidget(
                        callBackList: () async {
                          setState(() {
                            _model.nameSearch = ' ';
                            _model.status = ' ';
                          });
                          setState(() {
                            _model.questionNameTextController?.clear();
                          });
                          setState(
                              () => _model.listViewPagingController?.refresh());
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
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
                'Profile',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );

              setState(() {
                FFAppState().scrollCheck = '';
              });
            },
          ),
          title: Text(
            'Bộ câu hỏi bài thi',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: TextFormField(
                          controller: _model.questionNameTextController,
                          focusNode: _model.questionNameFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.questionNameTextController',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() {
                                _model.nameSearch =
                                    _model.questionNameTextController.text;
                              });
                              setState(() =>
                                  _model.listViewPagingController?.refresh());
                              setState(() {});
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelText: 'Tìm kiếm ...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            suffixIcon: _model
                                    .questionNameTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.questionNameTextController
                                          ?.clear();
                                      setState(() {
                                        _model.nameSearch = _model
                                            .questionNameTextController.text;
                                      });
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                      setState(() {});
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          validator: _model.questionNameTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.tune_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: FilterQuestionWidget(
                                    name: (_model.nameSearch != '') &&
                                            (_model.nameSearch != ' ')
                                        ? _model.nameSearch
                                        : '',
                                    status: _model.status,
                                    callBack: (statusFilter, nameFilter) async {
                                      setState(() {
                                        _model.nameSearch = nameFilter!;
                                        _model.status = statusFilter!;
                                      });
                                      setState(() {
                                        _model.questionNameTextController
                                            ?.clear();
                                      });
                                      setState(() {
                                        _model.questionNameTextController
                                            ?.text = ((nameFilter != null &&
                                                    nameFilter != '') &&
                                                (nameFilter != ' ')
                                            ? nameFilter
                                            : '');
                                      });
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                      await _model.waitForOnePageForListView();
                                      setState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
                if (((_model.questionNameTextController.text != '') &&
                        (_model.questionNameTextController.text != ' ')) ||
                    ((_model.status != '') &&
                        (_model.status != ' ')))
                  Text(
                    '#Kết quả hiển thị theo bộ lọc',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                if (_model.isLoad == true)
                  Expanded(
                    child: PagedListView<ApiPagingParams, dynamic>.separated(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) => QuestionGroup.questionListCall.call(
                          accessToken: FFAppState().accessToken,
                          limit: 20,
                          offset: nextPageMarker.nextPageNumber * 20,
                          filter:
                              '{\"_and\":[{}${(_model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"content\":{\"_icontains\":\"${_model.nameSearch}\"}}' : ' '}${(_model.status != '') && (_model.status != ' ') ? ',{\"status\":{\"_eq\":\"${_model.status}\"}}' : ' '}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffLogin,
                            r'''$.organization_id''',
                          ).toString()}\"}}'}]}',
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => const Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: DataNotFoundWidget(),
                          ),
                        ),
                        itemBuilder: (context, _, detailViewIndex) {
                          final detailViewItem = _model
                              .listViewPagingController!
                              .itemList![detailViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '#${(detailViewIndex + 1).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              detailViewItem.content,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              '# ${() {
                                                if (detailViewItem.answerType ==
                                                    'radio') {
                                                  return 'Trắc nghiệm 1 đáp án';
                                                } else if (detailViewItem
                                                        .answerType ==
                                                    'checkbox') {
                                                  return 'Trắc nghiệm 1 hoặc nhiều đáp án';
                                                } else if (detailViewItem
                                                        .answerType ==
                                                    'text') {
                                                  return 'Trả lời văn bản ngắn';
                                                } else {
                                                  return 'Trả lời số';
                                                }
                                              }()}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'dd-MM-yyyy',
                                                      functions
                                                          .stringToDateTime(
                                                              detailViewItem
                                                                  .dateCreated),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        '${detailViewItem.status}' ==
                                                                'published'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Text(
                                                      '${detailViewItem.status}' ==
                                                              'published'
                                                          ? 'Hoạt động'
                                                          : 'Không hoạt động',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: '${detailViewItem.status}' ==
                                                                    'published'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: true,
                                            targetAnchor: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                const AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: SizedBox(
                                                    height: 150.0,
                                                    child: QuestionMenuWidget(
                                                      item: detailViewItem,
                                                      callBackRequest:
                                                          () async {
                                                        setState(() {
                                                          _model.nameSearch =
                                                              ' ';
                                                          _model.status = ' ';
                                                        });
                                                        setState(() {
                                                          _model
                                                              .questionNameTextController
                                                              ?.clear();
                                                        });
                                                        setState(() => _model
                                                            .listViewPagingController
                                                            ?.refresh());
                                                        await _model
                                                            .waitForOnePageForListView();
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
