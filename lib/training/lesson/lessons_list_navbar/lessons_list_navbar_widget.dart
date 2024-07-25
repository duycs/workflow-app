import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/lesson/filter_lesson/filter_lesson_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'lessons_list_navbar_model.dart';
export 'lessons_list_navbar_model.dart';

class LessonsListNavbarWidget extends StatefulWidget {
  const LessonsListNavbarWidget({
    super.key,
    this.checkpage,
  });

  final String? checkpage;

  @override
  State<LessonsListNavbarWidget> createState() =>
      _LessonsListNavbarWidgetState();
}

class _LessonsListNavbarWidgetState extends State<LessonsListNavbarWidget> {
  late LessonsListNavbarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsListNavbarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadLessonsList = await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessonsList!) {
        _model.isShow = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
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
              context.goNamed(
                'Home',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
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
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                  prefixIcon: Icon(
                                    Icons.search,
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: FilterLessonWidget(
                                        status: _model.status,
                                        dateStart: _model.dateStart,
                                        dateEnd: _model.dateEnd,
                                        programId: _model.programId,
                                        callBack: (status, dateStart, dateEnd,
                                            programId) async {
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
                        (_model.status != null && _model.status != '') ||
                        (_model.dateStart != null && _model.dateStart != '') ||
                        (_model.dateEnd != null && _model.dateEnd != ''))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 24.0, 4.0),
                        child: Text(
                          '#Kết quả tìm kiếm theo bộ lọc',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    Expanded(
                      child: PagedListView<ApiPagingParams, dynamic>.separated(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) =>
                              LessonGroup.getLessonListCall.call(
                            accessToken: FFAppState().accessToken,
                            filter: '{\"_and\":[${'{\"organization_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.organization_id''',
                            ).toString()}\"}}'}${_model.nameSearchTextController.text != null && _model.nameSearchTextController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.nameSearchTextController.text}\"}}' : ' '}${(_model.status != null && _model.status != '') && (_model.status != 'noData') ? ',{\"status\":{\"_icontains\":\"${_model.status}\"}}' : ' '}${(_model.dateStart != null && _model.dateStart != '') && (_model.dateStart != 'noDate') ? ',{\"date_created\":{\"_gte\":\"${_model.dateStart}\"}}' : ' '}${(_model.dateEnd != null && _model.dateEnd != '') && (_model.dateEnd != 'noData') ? ',{\"date_created\":{\"_lt\":\"${(String var1) {
                                return DateTime.parse(var1)
                                    .add(Duration(days: 1))
                                    .toString();
                              }(_model.dateEnd)}\"}}' : ' '}${_model.programId != null && _model.programId != '' ? ',{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"${_model.programId}\"}}}}' : ' '},{\"status\":{\"_eq\":\"published\"}}]}',
                            offset: nextPageMarker.nextPageNumber * 20,
                            limit: 20,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          30.0,
                        ),
                        primary: false,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
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
                          noItemsFoundIndicatorBuilder: (_) => Center(
                            child: Container(
                              width: double.infinity,
                              child: DataNotFoundWidget(),
                            ),
                          ),
                          itemBuilder: (context, _, listItemsIndex) {
                            final listItemsItem = _model
                                .listViewPagingController!
                                .itemList![listItemsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                      'checkPage': serializeParam(
                                        widget!.checkpage,
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
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              '${FFAppConstants.ApiBaseUrl}/assets/${listItemsItem.imageCover}?access_token=${FFAppState().accessToken}',
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listItemsItem.name,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          listItemsItem
                                                              .description,
                                                          textAlign:
                                                              TextAlign.start,
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
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 6.0)),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                EdgeInsetsDirectional
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 2.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
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
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(
                        selectedPageIndex: 8,
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
