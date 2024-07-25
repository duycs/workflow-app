import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/training/lesson/no_data/no_data_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'lesson_lists_homepage_branch_model.dart';
export 'lesson_lists_homepage_branch_model.dart';

class LessonListsHomepageBranchWidget extends StatefulWidget {
  const LessonListsHomepageBranchWidget({super.key});

  @override
  State<LessonListsHomepageBranchWidget> createState() =>
      _LessonListsHomepageBranchWidgetState();
}

class _LessonListsHomepageBranchWidgetState
    extends State<LessonListsHomepageBranchWidget> {
  late LessonListsHomepageBranchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonListsHomepageBranchModel());

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();

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
            'Danh sách bài học',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nameSearchTextController,
                                  focusNode: _model.nameSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameSearchTextController',
                                    Duration(milliseconds: 500),
                                    () async {
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                    },
                                  ),
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.none,
                                  textInputAction: TextInputAction.search,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 18.0,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 24.0,
                                    ),
                                    suffixIcon: _model.nameSearchTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.nameSearchTextController
                                                  ?.clear();
                                              setState(() => _model
                                                  .listViewPagingController
                                                  ?.refresh());
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  validator: _model
                                      .nameSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
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
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FilterLessonHomePageWidget(
                                          dateStart: _model.dateStartList,
                                          dateEnd: _model.dateEndList,
                                          lessonFavoriteStatus:
                                              _model.lessonFavoriteStatusList,
                                          statusLoveFilter: '',
                                          statusDateToday: '',
                                          statusDateHistory: '',
                                          programsId: _model.programsAllId,
                                          checkPrograms: 'programs',
                                          callBack: (dateStart,
                                              dateEnd,
                                              lessonStatus,
                                              lessonFavoriteStatus,
                                              programsId) async {
                                            _model.dateStartList =
                                                dateTimeFormat(
                                              'yyyy-MM-dd',
                                              dateStart,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            _model.dateEndList = dateTimeFormat(
                                              'yyyy-MM-dd',
                                              dateEnd,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            _model.lessonFavoriteStatusList =
                                                lessonFavoriteStatus!;
                                            _model.programsAllId = programsId!;
                                            setState(() {});
                                            setState(() => _model
                                                .listViewPagingController
                                                ?.refresh());

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ],
                        ),
                      ),
                      if ((_model.nameSearchTextController.text != null &&
                              _model.nameSearchTextController.text != '') ||
                          ((_model.status != null && _model.status != '') &&
                              (_model.status != 'noData')) ||
                          ((_model.dateEndList != null &&
                                  _model.dateEndList != '') &&
                              (_model.dateEndList != 'noData')) ||
                          ((_model.dateStartList != null &&
                                  _model.dateStartList != '') &&
                              (_model.dateStartList != 'noData')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 4.0),
                          child: Text(
                            '#Kết quả tìm kiếm theo bộ lọc',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 16.0),
                        child:
                            PagedListView<ApiPagingParams, dynamic>.separated(
                          pagingController: _model.setListViewController(
                            (nextPageMarker) =>
                                LessonGroup.getLessonListCall.call(
                              accessToken: FFAppState().accessToken,
                              limit: 20,
                              offset: nextPageMarker.nextPageNumber * 20,
                              filter: '{\"_and\":[{}${',{\"organization_id\":{\"_eq\":\"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.organization_id''',
                              ).toString()}\"}},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"id\":{\"_neq\":\"${getJsonField(
                                FFAppState().staffDepartment,
                                r'''$.id''',
                              ).toString()}\"}}}}}},{\"status\":{\"_icontains\":\"published\"}}'}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.nameSearchTextController.text}\"}}' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_eq\":\"${_model.status}\"}}' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"${_model.dateStartList}\"}}' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != 'noData') ? ',{\"date_created\":{\"_lt\":\"${(String var1) {
                                  return DateTime.parse(var1)
                                      .add(Duration(days: 1))
                                      .toString();
                                }(_model.dateEndList)}\"}}' : ' '},{\"status\":{\"_eq\":\"published\"}}]}',
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 300.0, 0.0, 0.0),
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
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 300.0, 0.0, 0.0),
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
                            ),
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: NoDataWidget(),
                            ),
                            itemBuilder: (context, _, listLessonsIndex) {
                              final listLessonsItem = _model
                                  .listViewPagingController!
                                  .itemList![listLessonsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'LessonDetail',
                                    queryParameters: {
                                      'idLesson': serializeParam(
                                        listLessonsItem.id,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${listLessonsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                            width: 100.0,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0.0, 0.0),
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 100.0,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Text(
                                                      listLessonsItem.name,
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        listLessonsItem
                                                            .description,
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Người tạo: ${listLessonsItem.userCreated.firstName}',
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.timelapse_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${listLessonsItem.durationHours.toString()} phút',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ].addToEnd(SizedBox(height: 200.0)),
              ),
            ),
            if (_model.checkLoading == false)
              Container(
                decoration: BoxDecoration(),
                child: Container(
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
    );
  }
}
