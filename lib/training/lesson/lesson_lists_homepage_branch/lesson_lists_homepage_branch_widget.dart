import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/training/lesson/no_data/no_data_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonListsHomepageBranchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadLessonListsHomepageList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessonListsHomepageList!) {
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      _model.isLoad = true;
      _model.checkLoading = true;
      setState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
          actions: const [],
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                      await _model.getListLesson(context);
                                      setState(() {});
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 24.0,
                                    ),
                                    suffixIcon: _model.nameSearchTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.nameSearchTextController
                                                  ?.clear();
                                              await _model
                                                  .getListLesson(context);
                                              setState(() {});
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
                      if ((_model.nameSearchTextController.text != '') ||
                          ((_model.status != '') &&
                              (_model.status != 'noData')) ||
                          ((_model.dateEndList != '') &&
                              (_model.dateEndList != 'noData')) ||
                          ((_model.dateStartList != '') &&
                              (_model.dateStartList != 'noData')))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 16.0),
                        child:
                            PagedListView<ApiPagingParams, dynamic>.separated(
                          pagingController: _model.setListViewController(
                            (nextPageMarker) =>
                                LessonGroup.getLessonListCall.call(
                              accessToken: FFAppState().accessToken,
                              limit: 20,
                              offset: nextPageMarker.nextPageNumber * 20,
                              filter: '{\"_and\":[{},{\"organization_id\":{\"_eq\":\"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.organization_id''',
                              ).toString()}\"}}${_model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}' : ' '}${(_model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(_model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != '') && (_model.status != 'noData') ? '\"}}' : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? _model.dateStartList : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? '\"}}' : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? ((String var1) {
                                  return DateTime.parse(var1)
                                      .add(const Duration(days: 1))
                                      .toString();
                                }(_model.dateEndList)) : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? '\"}}' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '\"}}}}' : ' '}${_model.programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${_model.programsAllId != '' ? _model.programsAllId : ' '}${_model.programsAllId != '' ? '\"}}}}' : ' '},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"id\":{\"_neq\":\"${getJsonField(
                                FFAppState().staffDepartment,
                                r'''$.id''',
                              ).toString()}\"}}}}}},{\"status\":{\"_eq\":\"published\"}}]}',
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                            noItemsFoundIndicatorBuilder: (_) => const Center(
                              child: NoDataWidget(),
                            ),
                            itemBuilder: (context, _, listIndex) {
                              final listItem = _model.listViewPagingController!
                                  .itemList![listIndex];
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
                                        listItem.id,
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${listItem.imageCover}?access_token=${FFAppState().accessToken}',
                                            width: 100.0,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 100.0,
                                              height: double.infinity,
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
                                                      listItem.name,
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
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        listItem.description,
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
                                                      'Người tạo: ${listItem.userCreated.firstName}',
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
                                                      '${listItem.durationHours.toString()} phút',
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
                                                ].divide(const SizedBox(width: 4.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
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
                ].addToEnd(const SizedBox(height: 200.0)),
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: const NavBarWidget(
                      selectedPageIndex: 8,
                    ),
                  ),
                ),
              ),
            if (_model.checkLoading == false)
              Container(
                decoration: const BoxDecoration(),
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
    );
  }
}
