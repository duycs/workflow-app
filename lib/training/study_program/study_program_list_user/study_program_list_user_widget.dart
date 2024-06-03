import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/do_test/confirm_do_test/confirm_do_test_widget.dart';
import '/training/lesson/certificate/certificate_widget.dart';
import '/training/study_program/filter_study_program_user_copy/filter_study_program_user_copy_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'study_program_list_user_model.dart';
export 'study_program_list_user_model.dart';

class StudyProgramListUserWidget extends StatefulWidget {
  const StudyProgramListUserWidget({super.key});

  @override
  State<StudyProgramListUserWidget> createState() =>
      _StudyProgramListUserWidgetState();
}

class _StudyProgramListUserWidgetState
    extends State<StudyProgramListUserWidget> {
  late StudyProgramListUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyProgramListUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadStudyProgramListUserList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadStudyProgramListUserList!) {
        _model.isShow = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    _model.textFieldNameSearchTextController ??= TextEditingController();
    _model.textFieldNameSearchFocusNode ??= FocusNode();
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chương trình đào tạo',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: _model.isShow == true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textFieldNameSearchTextController,
                          focusNode: _model.textFieldNameSearchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textFieldNameSearchTextController',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() =>
                                  _model.listViewPagingController?.refresh());
                            },
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Tìm kiếm...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            prefixIcon: const Icon(
                              Icons.search_sharp,
                            ),
                            suffixIcon: _model
                                    .textFieldNameSearchTextController!
                                    .text
                                    .isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textFieldNameSearchTextController
                                          ?.clear();
                                      setState(() => _model
                                          .listViewPagingController
                                          ?.refresh());
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model
                              .textFieldNameSearchTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: FilterStudyProgramUserCopyWidget(
                                        lessonName: _model.lessonName,
                                        dateStart: _model.dateStart,
                                        dateEnd: _model.dateEnd,
                                        callBack: (lessonName, dateStart,
                                            dateEnd) async {
                                          _model.lessonName = lessonName!;
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
                                          setState(() {});
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                        },
                                      ),
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
                if ((_model.textFieldNameSearchTextController.text != '') ||
                    ((_model.dateStart != '') &&
                        (_model.dateStart != 'noData')) ||
                    ((_model.dateEnd != '') &&
                        (_model.dateEnd != 'noData')) ||
                    (_model.lessonName != ''))
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Text(
                        '#Kết quả hiển thị theo bộ lọc',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                      ),
                    ),
                  ),
                Expanded(
                  child: PagedListView<ApiPagingParams, dynamic>.separated(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) =>
                          StudyProgramGroup.staffsProgramsCall.call(
                        accessToken: FFAppState().accessToken,
                        limit: 20,
                        offset: nextPageMarker.nextPageNumber * 20,
                        filter: '{\"_and\":[ {\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                          FFAppState().staffLogin,
                          r'''$.organization_id''',
                        ).toString()}\"}}},{\"staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
                          FFAppState().staffLogin,
                          r'''$.id''',
                        ).toString()}\"}}}${(_model.dateStart != '') && (_model.dateStart != 'noData') ? ',{\"date_created\":{\"_gte\":\"' : ' '}${(_model.dateStart != '') && (_model.dateStart != 'noData') ? _model.dateStart : ' '}${(_model.dateStart != '') && (_model.dateStart != 'noData') ? '\"}}' : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? ',{\"date_created\":{\"_lte\":\"' : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? ((String var1) {
                            return DateTime.parse(var1)
                                .add(const Duration(days: 1))
                                .toString();
                          }(_model.dateEnd)) : ' '}${(_model.dateEnd != '') && (_model.dateEnd != 'noData') ? '\"}}' : ' '}${_model.textFieldNameSearchTextController.text != '' ? ',{\"program_id\":{\"name\":{\"_icontains\":\"' : ' '}${_model.textFieldNameSearchTextController.text != '' ? _model.textFieldNameSearchTextController.text : ' '}${_model.textFieldNameSearchTextController.text != '' ? '\"}}}' : ' '}${(_model.lessonName != '') && (_model.lessonName != 'noData') ? ',{\"program_id\":{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"' : ' '}${(_model.lessonName != '') && (_model.lessonName != 'noData') ? _model.lessonName : ' '}${(_model.lessonName != '') && (_model.lessonName != 'noData') ? '\"}}}}}' : ' '},{\"program_id\":{\"status\":{\"_eq\":\"published\"}}}]}',
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
                      itemBuilder: (context, _, itemProgramIdTilteIndex) {
                        final itemProgramIdTilteItem = _model
                            .listViewPagingController!
                            .itemList![itemProgramIdTilteIndex];
                        return Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.checkOpen ==
                                        itemProgramIdTilteItem.programId.id) {
                                      _model.checkOpen = '';
                                      setState(() {});
                                    } else {
                                      _model.checkOpen =
                                          itemProgramIdTilteItem.programId.id;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 12.0, 6.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/${itemProgramIdTilteItem.programId.imageCover}?access_token=${FFAppState().accessToken}',
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Text(
                                                          '#${(itemProgramIdTilteIndex + 1).toString()} ${itemProgramIdTilteItem.programId.name != null && itemProgramIdTilteItem.programId.name != '' ? itemProgramIdTilteItem.programId.name : ''} ${itemProgramIdTilteItem.programId.lessions.length > 0 ? '(${formatNumber(
                                                              itemProgramIdTilteItem
                                                                  .programId
                                                                  .lessions
                                                                  .where((e) =>
                                                                      e.lessionsId
                                                                          .status ==
                                                                      'published')
                                                                  .toList()
                                                                  .length,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                            )} bài học)' : ''}',
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            () {
                                                              if ((itemProgramIdTilteItem
                                                                          .programId
                                                                          .estimateInDay ==
                                                                      null) ||
                                                                  (itemProgramIdTilteItem
                                                                          .programId
                                                                          .estimateInDay ==
                                                                      0)) {
                                                                return 'Không có hạn';
                                                              } else if ((itemProgramIdTilteItem
                                                                          .programId
                                                                          .estimateInDay !=
                                                                      null) &&
                                                                  (itemProgramIdTilteItem
                                                                          .programId
                                                                          .estimateInDay >
                                                                      0)) {
                                                                return ((String item1,
                                                                            int
                                                                                item2,
                                                                            String
                                                                                item3) {
                                                                  return DateTime.parse(
                                                                              item1)
                                                                          .add(Duration(
                                                                              days:
                                                                                  item2))
                                                                          .difference(
                                                                              DateTime.parse(item3))
                                                                          .inDays >
                                                                      0;
                                                                }(
                                                                        itemProgramIdTilteItem
                                                                            .dateCreated,
                                                                        itemProgramIdTilteItem
                                                                            .programId
                                                                            .estimateInDay,
                                                                        getCurrentTimestamp
                                                                            .toString())
                                                                    ? '${(String item1, int item2, String item3) {
                                                                        return DateTime.parse(item1)
                                                                            .add(Duration(days: item2))
                                                                            .difference(DateTime.parse(item3))
                                                                            .inDays
                                                                            .toString();
                                                                      }(itemProgramIdTilteItem.dateCreated, itemProgramIdTilteItem.programId.estimateInDay, dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))} ngày'
                                                                    : 'Hết hạn');
                                                              } else {
                                                                return '  ';
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (itemProgramIdTilteItem
                                                                  .status !=
                                                              'done')
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                () {
                                                                  if (itemProgramIdTilteItem
                                                                          .status ==
                                                                      'draft') {
                                                                    return 'Chưa học';
                                                                  } else if (itemProgramIdTilteItem
                                                                          .status ==
                                                                      'inprogress') {
                                                                    return 'Đang học';
                                                                  } else {
                                                                    return '';
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
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
                                                          if ('1' == '2')
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: ConfirmDoTestWidget(
                                                                                testId: itemProgramIdTilteItem.programId.tests.first.testsId.id,
                                                                                lessionId: null,
                                                                                avatar: '',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  text:
                                                                      'Bài thi tổng kết chương',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        25.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (itemProgramIdTilteItem
                                                                  .status ==
                                                              'done')
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                child: CertificateWidget(
                                                                                  program: itemProgramIdTilteItem.programId.name,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  text:
                                                                      'Chứng chỉ',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        25.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  showLoadingIndicator:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                          if ('1' == '2')
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .noColor,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .noColor,
                                                              icon: Icon(
                                                                Icons
                                                                    .golf_course_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  'StudyProgramRank',
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
                                                            ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 75.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                (_model.checkOpen !=
                                                                                null &&
                                                                            _model.checkOpen !=
                                                                                '') &&
                                                                        (itemProgramIdTilteItem.programId.id ==
                                                                            _model.checkOpen)
                                                                    ? 'Thu nhỏ'
                                                                    : 'Xem thêm',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              if ((_model.checkOpen !=
                                                                          null &&
                                                                      _model.checkOpen !=
                                                                          '') &&
                                                                  (itemProgramIdTilteItem
                                                                          .programId
                                                                          .id ==
                                                                      _model
                                                                          .checkOpen))
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_arrow_up,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 14.0,
                                                                ),
                                                              if (itemProgramIdTilteItem
                                                                      .programId
                                                                      .id !=
                                                                  _model
                                                                      .checkOpen)
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 14.0,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (itemProgramIdTilteItem.programId.id ==
                                  _model.checkOpen)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final dataLesson = itemProgramIdTilteItem
                                          .programId.lessions
                                          .toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(dataLesson.length,
                                                (dataLessonIndex) {
                                          final dataLessonItem =
                                              dataLesson[dataLessonIndex];
                                          return Visibility(
                                            visible: dataLessonItem
                                                    .lessionsId.status ==
                                                'published',
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Staffs_programs_lesson',
                                                  queryParameters: {
                                                    'programsId':
                                                        serializeParam(
                                                      itemProgramIdTilteItem
                                                          .programId.id,
                                                      ParamType.String,
                                                    ),
                                                    'lessionId': serializeParam(
                                                      dataLessonItem
                                                          .lessionsId.id,
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
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .noColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.ApiBaseUrl}/assets/${dataLessonItem.lessionsId.imageCover}?access_token=${FFAppState().accessToken}',
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    dataLessonItem
                                                                        .lessionsId
                                                                        .name,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dataLessonItem
                                                                        .lessionsId
                                                                        .dateCreated,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'Staffs_programs_lesson',
                                                            queryParameters: {
                                                              'programsId':
                                                                  serializeParam(
                                                                itemProgramIdTilteItem
                                                                    .programId
                                                                    .id,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'lessionId':
                                                                  serializeParam(
                                                                dataLessonItem
                                                                    .lessionsId
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
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(
                                          const SizedBox(height: 8.0),
                                          filterFn: (dataLessonIndex) {
                                            final dataLessonItem =
                                                dataLesson[dataLessonIndex];
                                            return dataLessonItem
                                                    .lessionsId.status ==
                                                'published';
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
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
