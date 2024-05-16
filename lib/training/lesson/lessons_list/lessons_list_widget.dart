import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/lesson/filter_lesson/filter_lesson_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'lessons_list_model.dart';
export 'lessons_list_model.dart';

class LessonsListWidget extends StatefulWidget {
  const LessonsListWidget({super.key});

  @override
  State<LessonsListWidget> createState() => _LessonsListWidgetState();
}

class _LessonsListWidgetState extends State<LessonsListWidget> {
  late LessonsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().scrollCheck = 'LessonsList';
      });
      _model.tokenReloadLessonsList = await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessonsList!) {
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      while (FFAppState().scrollCheck == 'LessonsList') {
        _model.tokenReloadLessonsListCheck =
            await action_blocks.tokenReload(context);
        if (_model.tokenReloadLessonsListCheck == true) {
          await Future.delayed(const Duration(milliseconds: 12000));
        } else {
          break;
        }
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
          FFAppState().update(() {
            FFAppState().scrollCheck = '';
          });
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              'LessonCreate',
              queryParameters: {
                'checkScroll': serializeParam(
                  'LessonsList',
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

            FFAppState().update(() {
              FFAppState().scrollCheck = '';
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
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
                'StudyProgramList',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );

              FFAppState().update(() {
                FFAppState().scrollCheck = '';
              });
            },
          ),
          title: Text(
            'Danh sách bài học',
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
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.nameSearchTextController,
                            focusNode: _model.nameSearchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.nameSearchTextController',
                              const Duration(milliseconds: 500),
                              () async {
                                setState(() =>
                                    _model.listViewPagingController?.refresh());
                                setState(() {});
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Tìm kiếm...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              suffixIcon: _model
                                      .nameSearchTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.nameSearchTextController
                                            ?.clear();
                                        setState(() => _model
                                            .listViewPagingController
                                            ?.refresh());
                                        setState(() {});
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.nameSearchTextControllerValidator
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
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: FilterLessonWidget(
                                      status: _model.status,
                                      dateStart: _model.dateStart,
                                      dateEnd: _model.dateEnd,
                                      programId: _model.programId,
                                      callBack: (status, dateStart, dateEnd,
                                          programId) async {
                                        setState(() {
                                          _model.status = status!;
                                          _model.dateStart = dateTimeFormat(
                                            'yyyy-MM-dd',
                                            dateStart,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.dateEnd = dateTimeFormat(
                                            'yyyy-MM-dd',
                                            dateEnd,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.programId = programId!;
                                        });
                                        setState(() => _model
                                            .listViewPagingController
                                            ?.refresh());
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
                ),
                if ((_model.nameSearchTextController.text != '') ||
                    (_model.status != '') ||
                    (_model.dateStart != '') ||
                    (_model.dateEnd != ''))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
                    child: Text(
                      '#Kết quả tìm kiếm theo bộ lọc',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 44.0),
                    child: PagedListView<ApiPagingParams, dynamic>.separated(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) => LessonGroup.getLessonListCall.call(
                          accessToken: FFAppState().accessToken,
                          filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                            FFAppState().staffLogin,
                            r'''$.organization_id''',
                          ).toString()}\"}}${_model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}' : ' '}${(_model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(_model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != '') && (_model.status != 'noData') ? '\"}}' : ' '}${(_model.dateStart != '') && (_model.dateStart != 'noDate') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStart != '') && (_model.dateStart != 'noDate') ? _model.dateStart : ' '}${(_model.dateStart != '') && (_model.dateStart != 'noDate') ? '\"}}' : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? ((String var1) {
                              return DateTime.parse(var1)
                                  .add(const Duration(days: 1))
                                  .toString();
                            }(_model.dateEnd)) : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? '\"}}' : ' '}${_model.programId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${_model.programId != '' ? _model.programId : ' '}${_model.programId != '' ? '\"}}}}' : ' '}]}',
                          offset: nextPageMarker.nextPageNumber * 20,
                          limit: 20,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => const SizedBox(height: 12.0),
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
                            child: DataNotFoundWidget(),
                          ),
                        ),
                        itemBuilder: (context, _, listItemsIndex) {
                          final listItemsItem = _model.listViewPagingController!
                              .itemList![listItemsIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'LessonDetail',
                                  queryParameters: {
                                    'idLesson': serializeParam(
                                      listItemsItem.id,
                                      ParamType.String,
                                    ),
                                    'checkSrcoll': serializeParam(
                                      'LessonsList',
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
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${listItemsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listItemsItem.name,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              listItemsItem.description,
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            Text(
                                              '',
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    3.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .timelapse_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        listItemsItem
                                                            .durationHours
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        'phút',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: listItemsItem
                                                                  .status ==
                                                              'published'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2
                                                          : FlutterFlowTheme.of(
                                                                  context)
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
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        listItemsItem.status ==
                                                                'published'
                                                            ? 'Hoạt động'
                                                            : 'Không hoạt động',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              color: listItemsItem
                                                                          .status ==
                                                                      'published'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ].divide(const SizedBox(height: 6.0)),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
