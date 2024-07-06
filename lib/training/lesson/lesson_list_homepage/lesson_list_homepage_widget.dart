import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/lesson/filter_lesson_home_page/filter_lesson_home_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'lesson_list_homepage_model.dart';
export 'lesson_list_homepage_model.dart';

class LessonListHomepageWidget extends StatefulWidget {
  const LessonListHomepageWidget({
    super.key,
    required this.statusLesson,
    required this.statusLove,
    required this.lessonNewCreate,
    required this.lesonHistory,
    this.checkLesson,
    this.staffId,
  });

  final String? statusLesson;
  final String? statusLove;
  final String? lessonNewCreate;
  final String? lesonHistory;
  final String? checkLesson;
  final String? staffId;

  @override
  State<LessonListHomepageWidget> createState() =>
      _LessonListHomepageWidgetState();
}

class _LessonListHomepageWidgetState extends State<LessonListHomepageWidget> {
  late LessonListHomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonListHomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadLessonListHomepage =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadLessonListHomepage!) {
        _model.isShow = true;
        setState(() {});
      } else {
        FFAppState().update(() {});
        return;
      }
    });

    _model.nameSearchTextController ??= TextEditingController();
    _model.nameSearchFocusNode ??= FocusNode();
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
              context.safePop();
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
          child: Visibility(
            visible: _model.isShow == true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());

                                  setState(() {});
                                },
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.search,
                              readOnly: true,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              validator: _model
                                  .nameSearchTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
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
                                      child: FilterLessonHomePageWidget(
                                        status: _model.status,
                                        dateStart: _model.dateStartList,
                                        dateEnd: _model.dateEndList,
                                        lessonFavoriteStatus:
                                            _model.lessonFavoriteStatusList,
                                        statusLoveFilter: widget.statusLove!,
                                        statusDateToday: widget.lessonNewCreate,
                                        statusDateHistory: widget.lesonHistory!,
                                        programsId: _model.programsId,
                                        checkPrograms: '',
                                        callBack: (status,
                                            dateStart,
                                            dateEnd,
                                            lessonStatus,
                                            lessonFavoriteStatus,
                                            programsId) async {
                                          _model.status = status!;
                                          _model.dateStartList = dateTimeFormat(
                                            'yyyy-MM-dd',
                                            dateStart,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.dateEndList = dateTimeFormat(
                                            'yyyy-MM-dd',
                                            dateEnd,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.statusLesson = lessonStatus!;
                                          _model.lessonFavoriteStatusList =
                                              lessonFavoriteStatus!;
                                          _model.programsId = programsId!;
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
                        ),
                      ],
                    ),
                  ),
                  Text(
                    () {
                      if (widget.statusLesson == 'draft') {
                        return 'Bài học chưa học';
                      } else if (widget.lessonNewCreate == 'dateToday') {
                        return 'Bài học mới đăng';
                      } else if (widget.lesonHistory == 'lessonHistory') {
                        return 'Bài học gần đây';
                      } else if (widget.statusLesson == 'inprogress') {
                        return 'Bài học đang học';
                      } else if (widget.statusLesson == 'done') {
                        return 'Bài học đã hoàn thành';
                      } else if (widget.statusLove == 'love') {
                        return 'Bài học yêu thích';
                      } else if (widget.checkLesson == 'obligatory') {
                        return 'Bài học bắt buộc';
                      } else {
                        return '';
                      }
                    }(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  if ((_model.nameSearchTextController.text != '') ||
                      (_model.status != '') ||
                      ((_model.dateEndList != null &&
                              _model.dateEndList != '') &&
                          (_model.dateEndList != '0')) ||
                      ((_model.dateStartList != null &&
                              _model.dateStartList != '') &&
                          (_model.dateStartList != '0')) ||
                      (_model.statusLesson != ''))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                      child: PagedListView<ApiPagingParams, dynamic>.separated(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) =>
                              LessonGroup.employeeLessonListCall.call(
                            filter: '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${widget.staffId != null && widget.staffId != '' ? widget.staffId : FFAppState().staffid}\"}}}${_model.nameSearchTextController.text != '' ? ',' : ' '}${_model.nameSearchTextController.text != '' ? '{\"lession_id\":{\"name\":{\"_icontains\":\"' : ' '}${_model.nameSearchTextController.text != '' ? _model.nameSearchTextController.text : ' '}${_model.nameSearchTextController.text != '' ? '\"}}}' : ' '}${(_model.status != '') && (_model.status != 'noData') ? ',' : ' '}${(_model.status != '') && (_model.status != 'noData') ? '{\"lession_id\":{\"status\":{\"_icontains\":\"' : ' '}${(_model.status != '') && (_model.status != 'noData') ? _model.status : ' '}${(_model.status != '') && (_model.status != 'noData') ? '\"}}}' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != '0') ? ',' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != '0') ? '{\"lession_id\":{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != '0') ? _model.dateStartList : ' '}${(_model.dateStartList != null && _model.dateStartList != '') && (_model.dateStartList != '0') ? '\"}}}' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != '0') ? ',' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != '0') ? '{\"lession_id\":{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != '0') ? ((String var1) {
                                return DateTime.parse(var1)
                                    .add(const Duration(days: 1))
                                    .toString();
                              }(_model.dateEndList!)) : ' '}${(_model.dateEndList != null && _model.dateEndList != '') && (_model.dateEndList != '0') ? '\"}}}' : ' '}${(_model.statusLesson != '') && (_model.statusLesson != 'noData') ? ',' : ' '}${(_model.statusLesson != '') && (_model.statusLesson != 'noData') ? '{\"status\":{\"_eq\":\"' : ' '}${(_model.statusLesson != '') && (_model.statusLesson != 'noData') ? _model.statusLesson : ' '}${(_model.statusLesson != '') && (_model.statusLesson != 'noData') ? '\"}}' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? ',' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? _model.lessonFavoriteStatusList : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? FFAppState().staffid : ' '}${(_model.lessonFavoriteStatusList != '') && (_model.lessonFavoriteStatusList != 'noData') ? '\"}}}}}' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? ',{\"status\":{\"_eq\":\"' : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? widget.statusLesson : ' '}${widget.statusLesson != null && widget.statusLesson != '' ? '\"}}' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? ',{\"lession_id\":{\"reacts\":{\"reacts_id\":{\"status\":{\"_eq\":\"love\"}}}}}, {\"lession_id\":{\"reacts\":{\"reacts_id\":{\"staff_id\":{\"_eq\":\"' : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? FFAppState().staffid : ' '}${(widget.statusLove != null && widget.statusLove != '') && (widget.statusLove == 'love') ? '\"}}}}}' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}},{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ((String var1) {
                                return DateTime.parse(var1)
                                    .add(const Duration(days: 1))
                                    .toString();
                              }(dateTimeFormat(
                                'yyyy-MM-dd',
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ))) : ' '}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? '\"}}' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ',{\"_and\":[{\"date_created\":{\"_gte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? functions.aDayInThePast(getCurrentTimestamp) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}},{\"date_created\":{\"_lte\":\"' : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? ((String var1) {
                                return DateTime.parse(var1)
                                    .add(const Duration(days: 1))
                                    .toString();
                              }(dateTimeFormat(
                                'yyyy-MM-dd',
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ))) : ' '}${(widget.lesonHistory != null && widget.lesonHistory != '') || (widget.lesonHistory == 'lessonHistory') ? '\"}}]},{\"_or\":[{\"status\":{\"_eq\":\"done\"}},{\"status\":{\"_eq\":\"inprogress\"}}]}' : ' '}${_model.programsId != '' ? ',{\"lession_id\":{\"programs\":{\"programs_id\":{\"id\":{\"_eq\":\"' : ' '}${_model.programsId != '' ? _model.programsId : ' '}${_model.programsId != '' ? '\"}}}}}' : ' '},{\"lession_id\":{\"status\":{\"_eq\":\"published\"}}}${(widget.lessonNewCreate != null && widget.lessonNewCreate != '') && (widget.lessonNewCreate == 'dateToday') ? ',{\"status\":{\"_eq\":\"draft\"}}' : ' '}]}',
                            limit: 20,
                            accessToken: FFAppState().accessToken,
                            offset: nextPageMarker.nextPageNumber * 20,
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
                              child: DataNotFoundWidget(),
                            ),
                          ),
                          itemBuilder: (context, _, listIndex) {
                            final listItem = _model
                                .listViewPagingController!.itemList![listIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'LessonDetail_HomePage',
                                  queryParameters: {
                                    'listItems': serializeParam(
                                      listItem.lessionId.toMap(),
                                      ParamType.JSON,
                                    ),
                                    'status': serializeParam(
                                      listItem.status,
                                      ParamType.String,
                                    ),
                                    'id': serializeParam(
                                      listItem.id,
                                      ParamType.String,
                                    ),
                                    'checkScroll': serializeParam(
                                      'LessonList_Homepage',
                                      ParamType.String,
                                    ),
                                    'programId': serializeParam(
                                      listItem.programId.id,
                                      ParamType.String,
                                    ),
                                    'checkReload': serializeParam(
                                      'noHome',
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
                                height: 140.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                          '${FFAppConstants.ApiBaseUrl}/assets/${listItem.lessionId.imageCover}?access_token=${FFAppState().accessToken}',
                                          width: 100.0,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
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
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      listItem.lessionId.name,
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
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    listItem
                                                        .lessionId.description,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  if (widget.checkLesson ==
                                                      'obligatory')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        () {
                                                          if (listItem.status ==
                                                              'draft') {
                                                            return 'Trạng thái bài học: Chưa học';
                                                          } else if (listItem
                                                                  .status ==
                                                              'done') {
                                                            return 'Trạng thái bài học: Hoàn thành';
                                                          } else if (listItem
                                                                  .status ==
                                                              'inprogress') {
                                                            return 'Trạng thái bài học: Đang học';
                                                          } else {
                                                            return '';
                                                          }
                                                        }(),
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
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
                                                    '${listItem.lessionId.durationHours.toString()} phút',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
