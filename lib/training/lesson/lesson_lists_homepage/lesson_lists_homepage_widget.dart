import '/backend/api_requests/api_calls.dart';
import '/components/data_not_foud_row/data_not_foud_row_widget.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'lesson_lists_homepage_model.dart';
export 'lesson_lists_homepage_model.dart';

class LessonListsHomepageWidget extends StatefulWidget {
  const LessonListsHomepageWidget({super.key});

  @override
  State<LessonListsHomepageWidget> createState() =>
      _LessonListsHomepageWidgetState();
}

class _LessonListsHomepageWidgetState extends State<LessonListsHomepageWidget>
    with TickerProviderStateMixin {
  late LessonListsHomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonListsHomepageModel());

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

      if ((FFAppState().staffid != '') &&
          (FFAppState().staffid != '${null}')) {
        await _model.getListLessonRow(context);
        setState(() {});
        await _model.getListLessonRow2(context);
        setState(() {});
        await _model.getListLessonRow3(context);
        setState(() {});
        await _model.getListLesson(context);
        setState(() {});
      }
      setState(() {
        _model.isLoad = true;
      });
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

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 550.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(0, 0.349),
          ),
        ],
      ),
    });
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
            'Tài liệu đào tạo',
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
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nameSearchTextController,
                                  focusNode: _model.nameSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameSearchTextController',
                                    const Duration(milliseconds: 500),
                                    () async {
                                      setState(() => _model
                                          .listViewPagingController1
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewPagingController2
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewPagingController3
                                          ?.refresh());
                                      setState(() => _model
                                          .listViewPagingController4
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
                                              setState(() => _model
                                                  .listViewPagingController1
                                                  ?.refresh());
                                              setState(() => _model
                                                  .listViewPagingController2
                                                  ?.refresh());
                                              setState(() => _model
                                                  .listViewPagingController3
                                                  ?.refresh());
                                              setState(() => _model
                                                  .listViewPagingController4
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
                            if (_model.isLoad == true)
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Bài học chưa học',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'statusLesson':
                                                        serializeParam(
                                                      'draft',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Xem thêm',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if ((_model.nameSearchTextController
                                                    .text !=
                                                '') &&
                                        (FFAppState().staffid != '') &&
                                        (_model.metaRow!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 2.0, 16.0, 0.0),
                                        child: Text(
                                          '#Kết quả tìm kiếm theo bộ lọc',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow!.filterCount > 0))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 4.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 130.0,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible: (FFAppState().staffid !=
                                                          '') &&
                                                  (_model.metaRow!.filterCount >
                                                      0) &&
                                                  (_model.metaRow!.filterCount >
                                                      0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: PagedListView<
                                                    ApiPagingParams,
                                                    dynamic>.separated(
                                                  pagingController: _model
                                                      .setListViewController1(
                                                    (nextPageMarker) => LessonGroup
                                                        .employeeLessonListCall
                                                        .call(
                                                      filter:
                                                          '{\"_and\":[{\"status\":{\"_eq\":\"draft\"}},{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${_model.nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                      offset: nextPageMarker
                                                              .nextPageNumber *
                                                          20,
                                                      limit: 20,
                                                    ),
                                                  ),
                                                  padding: const EdgeInsets.fromLTRB(
                                                    16.0,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                  primary: false,
                                                  reverse: false,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(width: 12.0),
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          dynamic>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) => Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Customize what your widget looks like when it's loading another page.
                                                    newPageProgressIndicatorBuilder:
                                                        (_) => Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    noItemsFoundIndicatorBuilder:
                                                        (_) => const Center(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child:
                                                            DataNotFoudRowWidget(),
                                                      ),
                                                    ),
                                                    itemBuilder: (context, _,
                                                        listRowIndex) {
                                                      final listRowItem = _model
                                                          .listViewPagingController1!
                                                          .itemList![listRowIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'LessonDetail_HomePage',
                                                            queryParameters: {
                                                              'listItems':
                                                                  serializeParam(
                                                                listRowItem
                                                                    .lessionId
                                                                    .toMap(),
                                                                ParamType.JSON,
                                                              ),
                                                              'status':
                                                                  serializeParam(
                                                                listRowItem
                                                                    .status,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'id':
                                                                  serializeParam(
                                                                listRowItem.id,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'programId':
                                                                  serializeParam(
                                                                listRowItem
                                                                    .programId
                                                                    .id,
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
                                                        },
                                                        child: Container(
                                                          width: 105.0,
                                                          height: 130.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    6.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${listRowItem.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listRowItem
                                                                        .lessionId
                                                                        .name,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    () {
                                                                      if ((listRowItem.dateStart != null && listRowItem.dateStart != '') &&
                                                                          (listRowItem.lessionId.estimateInDay !=
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay !=
                                                                              null)) {
                                                                        return () {
                                                                          if ((String item1,
                                                                              int item2,
                                                                              String item3,
                                                                              int item4) {
                                                                            return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays >=
                                                                                0;
                                                                          }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, listRowItem.dateStart, listRowItem.lessionId.estimateInDay)) {
                                                                            return () {
                                                                              if ((String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays > 0;
                                                                              }(
                                                                                  listRowItem.dateStart,
                                                                                  listRowItem.lessionId.estimateInDay,
                                                                                  dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))) {
                                                                                return 'Thời hạ còn: ${(String item1, int item2, String item3) {
                                                                                  return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                                }(listRowItem.dateStart, listRowItem.lessionId.estimateInDay, dateTimeFormat(
                                                                                      'yyyy-MM-dd',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ))} ngày';
                                                                              } else if ((String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <= 0;
                                                                              }(
                                                                                  listRowItem.dateStart,
                                                                                  listRowItem.lessionId.estimateInDay,
                                                                                  dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))) {
                                                                                return 'Hết hạn';
                                                                              } else {
                                                                                return null!;
                                                                              }
                                                                            }();
                                                                          } else if ((String item1, int item2, String item3, int item4) {
                                                                            return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays <
                                                                                0;
                                                                          }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, listRowItem.dateStart, listRowItem.lessionId.estimateInDay)) {
                                                                            return () {
                                                                              if ((String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays > 0;
                                                                              }(
                                                                                  listRowItem.dateCreated,
                                                                                  listRowItem.programId.estimateInDay,
                                                                                  dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))) {
                                                                                return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                                  return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                                }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, dateTimeFormat(
                                                                                      'yyyy-MM-dd',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ))} ngày';
                                                                              } else if ((String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <= 0;
                                                                              }(
                                                                                  listRowItem.dateCreated,
                                                                                  listRowItem.programId.estimateInDay,
                                                                                  dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))) {
                                                                                return 'Hết hạn';
                                                                              } else {
                                                                                return null!;
                                                                              }
                                                                            }();
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((listRowItem.dateStart != null && listRowItem.dateStart != '') &&
                                                                          (listRowItem.lessionId.estimateInDay !=
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay ==
                                                                              null)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateStart,
                                                                              listRowItem.lessionId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRowItem.dateStart, listRowItem.lessionId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))} ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateStart,
                                                                              listRowItem.lessionId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((listRowItem.dateStart != null && listRowItem.dateStart != '') &&
                                                                          (listRowItem.lessionId.estimateInDay ==
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay !=
                                                                              null)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))}ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((listRowItem.dateStart == null || listRowItem.dateStart == '') &&
                                                                          (listRowItem.lessionId.estimateInDay !=
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay !=
                                                                              null)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))}ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((listRowItem.dateStart == null || listRowItem.dateStart == '') &&
                                                                          (listRowItem.lessionId.estimateInDay ==
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay !=
                                                                              null)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRowItem.dateCreated, listRowItem.programId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))}ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRowItem.dateCreated,
                                                                              listRowItem.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((listRowItem.dateStart == null || listRowItem.dateStart == '') &&
                                                                          (listRowItem.lessionId.estimateInDay !=
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay ==
                                                                              null)) {
                                                                        return 'Không có hạn';
                                                                      } else if ((listRowItem.dateStart != null &&
                                                                              listRowItem.dateStart !=
                                                                                  '') &&
                                                                          (listRowItem.lessionId.estimateInDay ==
                                                                              null) &&
                                                                          (listRowItem.programId.estimateInDay ==
                                                                              null)) {
                                                                        return 'Không có hạn';
                                                                      } else if ((listRowItem.dateStart ==
                                                                                  null ||
                                                                              listRowItem.dateStart ==
                                                                                  '') &&
                                                                          (listRowItem.programId.estimateInDay ==
                                                                              null) &&
                                                                          (listRowItem.lessionId.estimateInDay ==
                                                                              null)) {
                                                                        return 'Không có hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
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
                                            ),
                                          ),
                                        ),
                                      ),
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow2!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Bài học mới đăng',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      'dateToday',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Xem thêm',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if ((_model.nameSearchTextController
                                                    .text !=
                                                '') &&
                                        ((FFAppState().staffid != '') &&
                                            (_model.metaRow2!.filterCount > 0)))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 2.0, 16.0, 0.0),
                                        child: Text(
                                          '#Kết quả tìm kiếm theo bộ lọc',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow2!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 4.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 130.0,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: (FFAppState().staffid !=
                                                        '') &&
                                                (_model.metaRow2!.filterCount >
                                                    0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: PagedListView<
                                                  ApiPagingParams,
                                                  dynamic>.separated(
                                                pagingController: _model
                                                    .setListViewController2(
                                                  (nextPageMarker) => LessonGroup
                                                      .employeeLessonListCall
                                                      .call(
                                                    accessToken: FFAppState()
                                                        .accessToken,
                                                    limit: 20,
                                                    offset: nextPageMarker
                                                            .nextPageNumber *
                                                        20,
                                                    filter:
                                                        '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}},{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lte\":\"${(String var1) {
                                                      return DateTime.parse(
                                                              var1)
                                                          .add(
                                                              const Duration(days: 1))
                                                          .toString();
                                                    }(dateTimeFormat(
                                                      'yyyy-MM-dd',
                                                      getCurrentTimestamp,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))}\"}}${_model.nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
                                                  ),
                                                ),
                                                padding: const EdgeInsets.fromLTRB(
                                                  16.0,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                primary: false,
                                                reverse: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 12.0),
                                                builderDelegate:
                                                    PagedChildBuilderDelegate<
                                                        dynamic>(
                                                  // Customize what your widget looks like when it's loading the first page.
                                                  firstPageProgressIndicatorBuilder:
                                                      (_) => Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Customize what your widget looks like when it's loading another page.
                                                  newPageProgressIndicatorBuilder:
                                                      (_) => Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  noItemsFoundIndicatorBuilder:
                                                      (_) => const Center(
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child:
                                                          DataNotFoudRowWidget(),
                                                    ),
                                                  ),
                                                  itemBuilder: (context, _,
                                                      listRow2Index) {
                                                    final listRow2Item = _model
                                                        .listViewPagingController2!
                                                        .itemList![listRow2Index];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'LessonDetail_HomePage',
                                                          queryParameters: {
                                                            'listItems':
                                                                serializeParam(
                                                              listRow2Item
                                                                  .lessionId
                                                                  .toMap(),
                                                              ParamType.JSON,
                                                            ),
                                                            'status':
                                                                serializeParam(
                                                              listRow2Item
                                                                  .status,
                                                              ParamType.String,
                                                            ),
                                                            'id':
                                                                serializeParam(
                                                              listRow2Item.id,
                                                              ParamType.String,
                                                            ),
                                                            'programId':
                                                                serializeParam(
                                                              listRow2Item
                                                                  .programId.id,
                                                              ParamType.String,
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
                                                      },
                                                      child: Container(
                                                        width: 105.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  6.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${listRow2Item.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listRow2Item
                                                                      .lessionId
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            2.0),
                                                                child: Text(
                                                                  () {
                                                                    if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                        (listRow2Item.lessionId.estimateInDay !=
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay !=
                                                                            null)) {
                                                                      return () {
                                                                        if ((String item1,
                                                                                int
                                                                                    item2,
                                                                                String
                                                                                    item3,
                                                                                int
                                                                                    item4) {
                                                                          return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays >=
                                                                              0;
                                                                        }(
                                                                            listRow2Item
                                                                                .dateCreated,
                                                                            listRow2Item
                                                                                .programId.estimateInDay,
                                                                            listRow2Item
                                                                                .dateStart,
                                                                            listRow2Item
                                                                                .lessionId.estimateInDay)) {
                                                                          return () {
                                                                            if ((String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays > 0;
                                                                            }(
                                                                                listRow2Item.dateStart,
                                                                                listRow2Item.lessionId.estimateInDay,
                                                                                dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))) {
                                                                              return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                              }(listRow2Item.dateStart, listRow2Item.lessionId.estimateInDay, dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))} ngày';
                                                                            } else if ((String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <= 0;
                                                                            }(
                                                                                listRow2Item.dateStart,
                                                                                listRow2Item.lessionId.estimateInDay,
                                                                                dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))) {
                                                                              return 'Hết hạn';
                                                                            } else {
                                                                              return null!;
                                                                            }
                                                                          }();
                                                                        } else if ((String
                                                                                item1,
                                                                            int item2,
                                                                            String item3,
                                                                            int item4) {
                                                                          return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays <
                                                                              0;
                                                                        }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, listRow2Item.dateStart, listRow2Item.lessionId.estimateInDay)) {
                                                                          return () {
                                                                            if ((String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays > 0;
                                                                            }(
                                                                                listRow2Item.dateCreated,
                                                                                listRow2Item.programId.estimateInDay,
                                                                                dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))) {
                                                                              return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                                return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                              }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                                    'yyyy-MM-dd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ))} ngày';
                                                                            } else if ((String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <= 0;
                                                                            }(
                                                                                listRow2Item.dateCreated,
                                                                                listRow2Item.programId.estimateInDay,
                                                                                dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))) {
                                                                              return 'Hết hạn';
                                                                            } else {
                                                                              return null!;
                                                                            }
                                                                          }();
                                                                        } else {
                                                                          return null!;
                                                                        }
                                                                      }();
                                                                    } else if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                        (listRow2Item.lessionId.estimateInDay !=
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay ==
                                                                            null)) {
                                                                      return () {
                                                                        if ((String item1,
                                                                                int item2,
                                                                                String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateStart,
                                                                            listRow2Item.lessionId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                          }(listRow2Item.dateStart, listRow2Item.lessionId.estimateInDay, dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))} ngày';
                                                                        } else if ((String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateStart,
                                                                            listRow2Item.lessionId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Hết hạn';
                                                                        } else {
                                                                          return null!;
                                                                        }
                                                                      }();
                                                                    } else if ((listRow2Item.dateStart != null && listRow2Item.dateStart != '') &&
                                                                        (listRow2Item.lessionId.estimateInDay ==
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay !=
                                                                            null)) {
                                                                      return () {
                                                                        if ((String item1,
                                                                                int item2,
                                                                                String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                          }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))}ngày';
                                                                        } else if ((String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Hết hạn';
                                                                        } else {
                                                                          return null!;
                                                                        }
                                                                      }();
                                                                    } else if ((listRow2Item.dateStart == null || listRow2Item.dateStart == '') &&
                                                                        (listRow2Item.lessionId.estimateInDay !=
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay !=
                                                                            null)) {
                                                                      return () {
                                                                        if ((String item1,
                                                                                int item2,
                                                                                String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                          }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))} ngày';
                                                                        } else if ((String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Hết hạn';
                                                                        } else {
                                                                          return null!;
                                                                        }
                                                                      }();
                                                                    } else if ((listRow2Item.dateStart == null ||
                                                                            listRow2Item.dateStart ==
                                                                                '') &&
                                                                        (listRow2Item.lessionId.estimateInDay ==
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay !=
                                                                            null)) {
                                                                      return () {
                                                                        if ((String item1,
                                                                                int item2,
                                                                                String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                          }(listRow2Item.dateCreated, listRow2Item.programId.estimateInDay, dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))} ngày';
                                                                        } else if ((String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                              0;
                                                                        }(
                                                                            listRow2Item.dateCreated,
                                                                            listRow2Item.programId.estimateInDay,
                                                                            dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))) {
                                                                          return 'Hết hạn';
                                                                        } else {
                                                                          return null!;
                                                                        }
                                                                      }();
                                                                    } else if ((listRow2Item.dateStart ==
                                                                                null ||
                                                                            listRow2Item.dateStart ==
                                                                                '') &&
                                                                        (listRow2Item.lessionId.estimateInDay !=
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay ==
                                                                            null)) {
                                                                      return 'Không có hạn';
                                                                    } else if ((listRow2Item.dateStart ==
                                                                                null ||
                                                                            listRow2Item.dateStart ==
                                                                                '') &&
                                                                        (listRow2Item.lessionId.estimateInDay ==
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay ==
                                                                            null)) {
                                                                      return 'Không có hạn';
                                                                    } else if ((listRow2Item.dateStart ==
                                                                                null ||
                                                                            listRow2Item.dateStart ==
                                                                                '') &&
                                                                        (listRow2Item.lessionId.estimateInDay ==
                                                                            null) &&
                                                                        (listRow2Item.programId.estimateInDay == null)) {
                                                                      return 'Không có hạn';
                                                                    } else {
                                                                      return null!;
                                                                    }
                                                                  }(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
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
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Text(
                                        'Bài học khác',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      'inprogress',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x2A4B39EF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.menu_book_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 18.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Đang học',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      'done',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x2A4B39EF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.done_all_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 18.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Hoàn thành',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      'love',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x2A4B39EF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 18.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Yêu thích',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x2A4B39EF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Icon(
                                                          Icons.style_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Bắt buộc',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow3!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 24.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Đã học gần đây',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'LessonList_Homepage',
                                                  queryParameters: {
                                                    'statusLesson':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'statusLove':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lessonNewCreate':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                    'lesonHistory':
                                                        serializeParam(
                                                      'lessonHistory',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Xem thêm',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if ((_model.nameSearchTextController
                                                    .text !=
                                                '') &&
                                        ((FFAppState().staffid != '') &&
                                            (_model.metaRow3!.filterCount > 0)))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 2.0, 16.0, 0.0),
                                        child: Text(
                                          '#Kết quả tìm kiếm theo bộ lọc',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    if ((FFAppState().staffid != '') &&
                                        (_model.metaRow3!.filterCount > 0))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 4.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 130.0,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: (FFAppState().staffid !=
                                                        '') &&
                                                (_model.metaRow3!.filterCount >
                                                    0),
                                            child: PagedListView<
                                                ApiPagingParams,
                                                dynamic>.separated(
                                              pagingController:
                                                  _model.setListViewController3(
                                                (nextPageMarker) => LessonGroup
                                                    .employeeLessonListCall
                                                    .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  offset: nextPageMarker
                                                          .nextPageNumber *
                                                      20,
                                                  limit: 20,
                                                  filter:
                                                      '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${_model.nameSearchTextController.text != '' ? ',{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}}' : ' '},{\"_and\":[{\"_and\":[{\"date_created\":{\"_gte\":\"${functions.aDayInThePast(getCurrentTimestamp)}\"}},{\"date_created\":{\"_lte\":\"${(String var1) {
                                                    return DateTime.parse(var1)
                                                        .add(const Duration(days: 1))
                                                        .toString();
                                                  }(dateTimeFormat(
                                                    'yyyy-MM-dd',
                                                    getCurrentTimestamp,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))}\"}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}]},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
                                                ),
                                              ),
                                              padding: const EdgeInsets.fromLTRB(
                                                16.0,
                                                0,
                                                0,
                                                0,
                                              ),
                                              primary: false,
                                              reverse: false,
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(width: 12.0),
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => const Center(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child:
                                                        DataNotFoudRowWidget(),
                                                  ),
                                                ),
                                                itemBuilder: (context, _,
                                                    listRow3Index) {
                                                  final listRow3Item = _model
                                                      .listViewPagingController3!
                                                      .itemList![listRow3Index];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'LessonDetail_HomePage',
                                                        queryParameters: {
                                                          'listItems':
                                                              serializeParam(
                                                            listRow3Item
                                                                .lessionId
                                                                .toMap(),
                                                            ParamType.JSON,
                                                          ),
                                                          'status':
                                                              serializeParam(
                                                            listRow3Item.status,
                                                            ParamType.String,
                                                          ),
                                                          'id': serializeParam(
                                                            listRow3Item.id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 105.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(6.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  '${FFAppConstants.ApiBaseUrl}/assets/${listRow3Item.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listRow3Item
                                                                    .lessionId
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          5.0,
                                                                          2.0),
                                                              child: Text(
                                                                () {
                                                                  if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                      (listRow3Item.lessionId.estimateInDay !=
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay !=
                                                                          null)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3,
                                                                              int
                                                                                  item4) {
                                                                        return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays >=
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          listRow3Item
                                                                              .dateStart,
                                                                          listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRow3Item.dateStart,
                                                                              listRow3Item.lessionId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRow3Item.dateStart, listRow3Item.lessionId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))} ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRow3Item.dateStart,
                                                                              listRow3Item.lessionId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3,
                                                                              int
                                                                                  item4) {
                                                                        return (DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3).add(Duration(days: item4)))).inDays <
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          listRow3Item
                                                                              .dateStart,
                                                                          listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay)) {
                                                                        return () {
                                                                          if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                                0;
                                                                          }(
                                                                              listRow3Item.dateCreated,
                                                                              listRow3Item.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                              return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays.toString();
                                                                            }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                                  'yyyy-MM-dd',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ))} ngày';
                                                                          } else if ((String item1, int item2, String item3) {
                                                                            return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                                0;
                                                                          }(
                                                                              listRow3Item.dateCreated,
                                                                              listRow3Item.programId.estimateInDay,
                                                                              dateTimeFormat(
                                                                                'yyyy-MM-dd',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))) {
                                                                            return 'Hết hạn';
                                                                          } else {
                                                                            return null!;
                                                                          }
                                                                        }();
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                      (listRow3Item.lessionId.estimateInDay !=
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay ==
                                                                          null)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateStart,
                                                                          listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow3Item.dateStart, listRow3Item.lessionId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))} ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateStart,
                                                                          listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                      (listRow3Item.lessionId.estimateInDay ==
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay !=
                                                                          null)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))}ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                      (listRow3Item.lessionId.estimateInDay !=
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay !=
                                                                          null)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))}ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                      (listRow3Item.lessionId.estimateInDay ==
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay !=
                                                                          null)) {
                                                                    return () {
                                                                      if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays >
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Thời hạn còn: ${(String item1, int item2, String item3) {
                                                                          return DateTime.parse(item1)
                                                                              .add(Duration(days: item2))
                                                                              .difference(DateTime.parse(item3))
                                                                              .inDays
                                                                              .toString();
                                                                        }(listRow3Item.dateCreated, listRow3Item.programId.estimateInDay, dateTimeFormat(
                                                                              'yyyy-MM-dd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ))}ngày';
                                                                      } else if ((String item1,
                                                                              int
                                                                                  item2,
                                                                              String
                                                                                  item3) {
                                                                        return DateTime.parse(item1).add(Duration(days: item2)).difference(DateTime.parse(item3)).inDays <=
                                                                            0;
                                                                      }(
                                                                          listRow3Item
                                                                              .dateCreated,
                                                                          listRow3Item
                                                                              .programId
                                                                              .estimateInDay,
                                                                          dateTimeFormat(
                                                                            'yyyy-MM-dd',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) {
                                                                        return 'Hết hạn';
                                                                      } else {
                                                                        return null!;
                                                                      }
                                                                    }();
                                                                  } else if ((listRow3Item.dateStart == null || listRow3Item.dateStart == '') &&
                                                                      (listRow3Item.lessionId.estimateInDay !=
                                                                          null) &&
                                                                      (listRow3Item.programId.estimateInDay ==
                                                                          null)) {
                                                                    return 'Không có hạn';
                                                                  } else if ((listRow3Item.dateStart != null && listRow3Item.dateStart != '') &&
                                                                      (listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay ==
                                                                          null) &&
                                                                      (listRow3Item
                                                                              .programId
                                                                              .estimateInDay ==
                                                                          null)) {
                                                                    return 'Không có hạn';
                                                                  } else if ((listRow3Item.dateStart == null ||
                                                                          listRow3Item.dateStart ==
                                                                              '') &&
                                                                      (listRow3Item
                                                                              .lessionId
                                                                              .estimateInDay ==
                                                                          null) &&
                                                                      (listRow3Item
                                                                              .programId
                                                                              .estimateInDay ==
                                                                          null)) {
                                                                    return 'Không có hạn';
                                                                  } else {
                                                                    return null!;
                                                                  }
                                                                }(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
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
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Text(
                                        'Hãy thử khám phá',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x2539D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.filter_list_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Bộ lọc bài học',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x2539D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Bài học yêu thích',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tất cả bài học khác',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              if ((_model.nameSearchTextController
                                                              .text !=
                                                          '') ||
                                                  ((_model.status !=
                                                              '') &&
                                                      (_model.status !=
                                                          'noData')) ||
                                                  ((_model.dateEndList !=
                                                              '') &&
                                                      (_model.dateEndList !=
                                                          'noData')) ||
                                                  ((_model.dateStartList !=
                                                              '') &&
                                                      (_model.dateStartList !=
                                                          'noData')))
                                                Text(
                                                  '#Kết quả tìm kiếm theo bộ lọc',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 10.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                icon: Icon(
                                                  Icons.tune_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child:
                                                              FilterLessonHomePageWidget(
                                                            status:
                                                                _model.status,
                                                            dateStart: _model
                                                                .dateStartList,
                                                            dateEnd: _model
                                                                .dateEndList,
                                                            lessonFavoriteStatus:
                                                                _model
                                                                    .lessonFavoriteStatusList,
                                                            statusLoveFilter:
                                                                '',
                                                            statusDateToday: '',
                                                            statusDateHistory:
                                                                '',
                                                            programsId: _model
                                                                .programsAllId,
                                                            checkPrograms:
                                                                'programs',
                                                            callBack: (status,
                                                                dateStart,
                                                                dateEnd,
                                                                lessonStatus,
                                                                lessonFavoriteStatus,
                                                                programsId) async {
                                                              setState(() {
                                                                _model.status =
                                                                    status!;
                                                                _model.dateStartList =
                                                                    dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  dateStart,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                                _model.dateEndList =
                                                                    dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  dateEnd,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                                _model.lessonFavoriteStatusList =
                                                                    lessonFavoriteStatus!;
                                                                _model.programsAllId =
                                                                    programsId!;
                                                              });
                                                              setState(() => _model
                                                                  .listViewPagingController4
                                                                  ?.refresh());
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (FFAppState().staffid != '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 16.0),
                                        child: PagedListView<ApiPagingParams,
                                            dynamic>.separated(
                                          pagingController:
                                              _model.setListViewController4(
                                            (nextPageMarker) => LessonGroup
                                                .getLessonListCall
                                                .call(
                                              accessToken:
                                                  FFAppState().accessToken,
                                              limit: 20,
                                              offset: nextPageMarker
                                                      .nextPageNumber *
                                                  20,
                                              filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                FFAppState().staffLogin,
                                                r'''$.organization_id''',
                                              ).toString()}\"}}${_model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}' : ' '}${(_model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_icontains\":\"' : ' '}${(_model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != '') && (_model.status != 'noData') ? '\"}}' : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? _model.dateStartList : ' '}${(_model.dateStartList != '') && (_model.dateStartList != 'noData') ? '\"}}' : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? ((String var1) {
                                                  return DateTime.parse(var1)
                                                      .add(const Duration(days: 1))
                                                      .toString();
                                                }(_model.dateEndList)) : ' '}${(_model.dateEndList != '') && (_model.dateEndList != 'noData') ? '\"}}' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? ',{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}},{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '\"}}}}' : ' '}${_model.programsAllId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${_model.programsAllId != '' ? _model.programsAllId : ' '}${_model.programsAllId != '' ? '\"}}}}' : ' '},{\"programs\":{\"programs_id\":{\"departments\":{\"departments_id\":{\"_neq\":\"${getJsonField(
                                                FFAppState().staffDepartment,
                                                r'''$.id''',
                                              ).toString()}\"}}}}},{\"status\":{\"_icontains\":\"published\"}}]}',
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          reverse: false,
                                          scrollDirection: Axis.vertical,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 8.0),
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  dynamic>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Customize what your widget looks like when it's loading another page.
                                            newPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            noItemsFoundIndicatorBuilder: (_) =>
                                                const Center(
                                              child: DataNotFoundWidget(),
                                            ),
                                            itemBuilder:
                                                (context, _, listIndex) {
                                              final listItem = _model
                                                  .listViewPagingController4!
                                                  .itemList![listIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'LessonDetail_HomePage',
                                                    queryParameters: {
                                                      'listItems':
                                                          serializeParam(
                                                        listItem.toMap(),
                                                        ParamType.JSON,
                                                      ),
                                                      'status': serializeParam(
                                                        '',
                                                        ParamType.String,
                                                      ),
                                                      'id': serializeParam(
                                                        '',
                                                        ParamType.String,
                                                      ),
                                                      'checkLesson':
                                                          serializeParam(
                                                        'closeTest',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
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
                                                        const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${listItem.imageCover}?access_token=${FFAppState().accessToken}',
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                const Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      listItem
                                                                          .name,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        listItem
                                                                            .description,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .timelapse_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${listItem.durationHours.toString()} phút',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
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
                              ),
                            if (_model.isLoad != true)
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Đang tải dữ liệu...',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: const NavBarWidget(
                      selectedPageIndex: 6,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
