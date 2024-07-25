import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/filter_work_result/filter_work_result_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'work_result_list_model.dart';
export 'work_result_list_model.dart';

class WorkResultListWidget extends StatefulWidget {
  const WorkResultListWidget({super.key});

  @override
  State<WorkResultListWidget> createState() => _WorkResultListWidgetState();
}

class _WorkResultListWidgetState extends State<WorkResultListWidget> {
  late WorkResultListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkResultListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadWorkResultListList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadWorkResultListList!) {
        _model.isLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Kết quả công việc',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.image_search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'ReportImage',
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
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: _model.isLoad == true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 500),
                          () async {
                            _model.nameSearch = _model.textController.text;
                            _model.dataList = [];
                            setState(() {});
                            setState(() =>
                                _model.listViewPagingController?.refresh());

                            setState(() {});
                          },
                        ),
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Tìm kiếm...',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
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
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    _model.nameSearch =
                                        _model.textController.text;
                                    _model.dataList = [];
                                    setState(() {});
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
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
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
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: FilterWorkResultWidget(
                                  name: _model.nameSearch,
                                  dateStart: _model.dateStart,
                                  dateEnd: _model.dateEnd,
                                  userCreated: _model.userCreated,
                                  callBack: (name, dateStart, dateEnd,
                                      userCreated) async {
                                    _model.nameSearch = name!;
                                    _model.dateStart = dateStart!;
                                    _model.dateEnd = dateEnd!;
                                    _model.userCreated = userCreated!;
                                    setState(() {});
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    setState(() => _model
                                        .listViewPagingController
                                        ?.refresh());
                                    setState(() {
                                      _model.textController?.text = name!;
                                      _model.textController?.selection =
                                          TextSelection.collapsed(
                                              offset: _model
                                                  .textController!.text.length);
                                    });
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
              if ((_model.nameSearch != null && _model.nameSearch != '') ||
                  (_model.dateStart != null && _model.dateStart != '') ||
                  (_model.dateEnd != null && _model.dateEnd != '') ||
                  (_model.userCreated != null && _model.userCreated != ''))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((_model.nameSearch != null &&
                              _model.nameSearch != '') ||
                          (_model.dateStart != null &&
                              _model.dateStart != '') ||
                          (_model.dateEnd != null && _model.dateEnd != '') ||
                          (_model.userCreated != null &&
                              _model.userCreated != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '#Kết quả hiển thị theo bộ lọc',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                  child: PagedListView<ApiPagingParams, dynamic>(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) => ProcedurePublishedGroup
                          .procedurePublishedListCall
                          .call(
                        accessToken: FFAppState().accessToken,
                        filter: '{\"_and\":[{}${() {
                          if (FFAppState().user.role ==
                              '82073000-1ba2-43a4-a55c-459d17c23b68') {
                            return ',{\"organization_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.organization_id''',
                            ).toString()}\"}}';
                          } else if (FFAppState().user.role ==
                              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.branch_id''',
                            ).toString()}\"}}}}}';
                          } else if (FFAppState().user.role ==
                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.department_id''',
                            ).toString()}\"}}}}}';
                          } else {
                            return ',{\"steps\":{\"tasks\":{\"submit_staff_id\":{\"id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.id''',
                            ).toString()}\"}}}}}';
                          }
                        }()}${(_model.nameSearch != null && _model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.nameSearch}\"}}' : ' '}${(_model.dateStart != null && _model.dateStart != '') && (_model.dateStart != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_gte\":\"${_model.dateStart}\"}}}}' : ' '}${(_model.dateEnd != null && _model.dateEnd != '') && (_model.dateEnd != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_lt\":\"${(String var1) {
                            return DateTime.parse(var1)
                                .add(Duration(days: 1))
                                .toString();
                          }(_model.dateEnd)}\"}}}}' : ' '}${(_model.userCreated != null && _model.userCreated != '') && (_model.userCreated != ' ') ? ',{\"steps\":{\"tasks\":{\"created_user_id\":{\"first_name\":{\"_icontains\":\"${_model.userCreated}\"}}}}}' : ' '}]}',
                        offset: nextPageMarker.nextPageNumber * 20,
                        limit: 20,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      16.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
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
                              0.0, 50.0, 0.0, 0.0),
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
                        child: Container(
                          width: double.infinity,
                          child: DataNotFoundWidget(),
                        ),
                      ),
                      itemBuilder: (context, _, itemsIndex) {
                        final itemsItem = _model
                            .listViewPagingController!.itemList![itemsIndex];
                        return Visibility(
                          visible: (itemsItem.steps.isNotEmpty) &&
                              (itemsItem.steps.first.tasks.isNotEmpty) &&
                              (itemsItem.steps
                                      .where((e) =>
                                          (e.tasks
                                                  .where(
                                                      (e) => e.status == 'done')
                                                  .toList()
                                                  .length >
                                              0) ==
                                          true)
                                      .toList()
                                      .length >
                                  0) &&
                              (functions.countJobDone(itemsItem.toMap()) != 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0x00000000),
                                  child: ExpandableNotifier(
                                    initialExpanded: false,
                                    child: ExpandablePanel(
                                      header: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    itemsItem.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    formatNumber(
                                                      functions.countJobDone(
                                                          itemsItem.toMap()),
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                      collapsed: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (itemsItem.steps.first.tasks
                                                  .where((e) =>
                                                      (itemsItem.steps.length >
                                                          0) &&
                                                      (dateTimeFormat(
                                                            'dd/MM/yyyy',
                                                            functions.stringToDateTime(itemsItem
                                                                .steps
                                                                .where((e) =>
                                                                    e.number ==
                                                                    itemsItem
                                                                        .steps
                                                                        .length)
                                                                .toList()
                                                                .first
                                                                .tasks
                                                                .first
                                                                .dateEnd),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'dd/MM/yyyy',
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )))
                                                  .toList()
                                                  .length >
                                              0)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 2.0, 0.0),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 22.0,
                                                  ),
                                                ),
                                                if (itemsItem.steps.first.tasks
                                                        .where((e) =>
                                                            (itemsItem.steps
                                                                    .length >
                                                                0) &&
                                                            (dateTimeFormat(
                                                                  'dd/MM/yyyy',
                                                                  functions.stringToDateTime(itemsItem
                                                                      .steps
                                                                      .where((e) =>
                                                                          e.number ==
                                                                          itemsItem
                                                                              .steps
                                                                              .length)
                                                                      .toList()
                                                                      .first
                                                                      .tasks
                                                                      .first
                                                                      .dateEnd),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) ==
                                                                dateTimeFormat(
                                                                  'dd/MM/yyyy',
                                                                  getCurrentTimestamp,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )))
                                                        .toList()
                                                        .length >
                                                    0)
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: itemsItem
                                                              .steps.first.tasks
                                                              .where((e) =>
                                                                  ((e.status ==
                                                                          'done') &&
                                                                      (dateTimeFormat(
                                                                            'dd/MM/yyyy',
                                                                            functions.stringToDateTime(itemsItem.steps.where((e) => e.number == itemsItem.steps.length).toList().first.tasks.first.dateEnd),
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) ==
                                                                          dateTimeFormat(
                                                                            'dd/MM/yyyy',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))) ==
                                                                  true)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' công việc hoàn thành hôm nay',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 2.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final itemTaskDone = functions
                                                    .sortArrayStepWorkflowResuftWoflow(
                                                        (getJsonField(
                                                      itemsItem.toMap(),
                                                      r'''$.steps[0].tasks''',
                                                      true,
                                                    )!
                                                                    .toList()
                                                                    .map<ProcedurePublishedStepTaskStruct?>(
                                                                        ProcedurePublishedStepTaskStruct
                                                                            .maybeFromMap)
                                                                    .toList()
                                                                as Iterable<
                                                                    ProcedurePublishedStepTaskStruct?>)
                                                            .withoutNulls
                                                            .toList())
                                                    .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: List.generate(
                                                      itemTaskDone.length,
                                                      (itemTaskDoneIndex) {
                                                    final itemTaskDoneItem =
                                                        itemTaskDone[
                                                            itemTaskDoneIndex];
                                                    return Visibility(
                                                      visible: (itemsItem.steps
                                                                  .where((e) =>
                                                                      (e.tasks
                                                                          .where((e) =>
                                                                              ((e.publishedCount == itemTaskDoneItem.publishedCount) && (e.status == 'done')) ==
                                                                              true)
                                                                          .toList()
                                                                          .isNotEmpty) ==
                                                                      true)
                                                                  .toList()
                                                                  .length ==
                                                              itemsItem.steps
                                                                  .length) &&
                                                          (dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                functions.stringToDateTime(itemsItem
                                                                    .steps
                                                                    .where((e) =>
                                                                        e.number ==
                                                                        itemsItem
                                                                            .steps
                                                                            .length)
                                                                    .toList()
                                                                    .first
                                                                    .tasks
                                                                    .first
                                                                    .dateEnd),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                getCurrentTimestamp,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'WorkResultDetail',
                                                              queryParameters: {
                                                                'workflowId':
                                                                    serializeParam(
                                                                  itemsItem.id,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'publishedCount':
                                                                    serializeParam(
                                                                  itemTaskDoneItem
                                                                      .publishedCount,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
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
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        16.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        16.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          12.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Lần chạy thứ: ${itemTaskDoneItem.publishedCount.toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.access_time,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'T.gian tạo: ${dateTimeFormat(
                                                                                  'dd/MM/yyyy',
                                                                                  functions.stringToDateTime(itemTaskDoneItem.dateCreated),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.update_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  'T.gian hoàn thành: ${dateTimeFormat(
                                                                                    'dd/MM/yyyy',
                                                                                    functions.stringToDateTime(itemsItem.steps.where((e) => e.number == itemsItem.steps.length).toList().first.tasks.first.dateEnd),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.person_outline,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Text(
                                                                                  'Người tạo: ',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  '${FFAppConstants.ApiBaseUrl}/assets/${itemTaskDoneItem.createdUserId.avatar}?access_token=${FFAppState().accessToken}',
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          if ('1' ==
                                                                              '3')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                'Người tham gia: ${itemTaskDoneItem.createdUserId.firstName == 'null' ? ' ' : itemTaskDoneItem.submitStaffId.userId.firstName}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ].divide(SizedBox(height: 4.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            CircularPercentIndicator(
                                                                          percent:
                                                                              itemsItem.steps.where((e) => (e.tasks.where((e) => ((e.publishedCount == itemTaskDoneItem.publishedCount) && (e.status == 'done')) == true).toList().isNotEmpty) == true).toList().length / itemsItem.steps.length,
                                                                          radius:
                                                                              35.0,
                                                                          lineWidth:
                                                                              7.0,
                                                                          animation:
                                                                              true,
                                                                          animateFromLastPercent:
                                                                              true,
                                                                          progressColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${itemsItem.steps.where((e) => (e.tasks.where((e) => ((e.publishedCount == itemTaskDoneItem.publishedCount) && (e.status == 'done')) == true).toList().isNotEmpty) == true).toList().length.toString()}/${itemsItem.steps.length.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                      expanded: Visibility(
                                        visible: (itemsItem.steps.length > 0) &&
                                            (itemsItem
                                                    .steps.first.tasks.length >
                                                0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 2.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final itemPublishedList =
                                                  (getJsonField(
                                                        itemsItem.toMap(),
                                                        r'''$.steps[0].tasks''',
                                                        true,
                                                      )
                                                                  ?.toList()
                                                                  .map<ProcedurePublishedStepTaskStruct?>(
                                                                      ProcedurePublishedStepTaskStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  ProcedurePublishedStepTaskStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: List.generate(
                                                    itemPublishedList.length,
                                                    (itemPublishedListIndex) {
                                                  final itemPublishedListItem =
                                                      itemPublishedList[
                                                          itemPublishedListIndex];
                                                  return Visibility(
                                                    visible: itemsItem.steps
                                                            .where((e) =>
                                                                (e.tasks
                                                                    .where((e) =>
                                                                        ((e.publishedCount == itemPublishedListItem.publishedCount) &&
                                                                            (e.status ==
                                                                                'done')) ==
                                                                        true)
                                                                    .toList()
                                                                    .isNotEmpty) ==
                                                                true)
                                                            .toList()
                                                            .length ==
                                                        itemsItem.steps.length,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: InkWell(
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
                                                            'WorkResultDetail',
                                                            queryParameters: {
                                                              'workflowId':
                                                                  serializeParam(
                                                                itemsItem.id,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'publishedCount':
                                                                  serializeParam(
                                                                itemPublishedListItem
                                                                    .publishedCount,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
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
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                offset: Offset(
                                                                  0.0,
                                                                  1.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          16.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Lần chạy thứ: ${itemPublishedListItem.publishedCount.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.access_time,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Thời gian tạo: ${dateTimeFormat(
                                                                              'dd/MM/yyyy',
                                                                              functions.stringToDateTime(itemPublishedListItem.dateCreated),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            )}',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.person_outline,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                          if ('1' ==
                                                                              '2')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                'Người tạo: ${itemPublishedListItem.createdUserId.firstName == 'null' ? ' ' : itemPublishedListItem.createdUserId.firstName}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Người tạo: ',
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              '${FFAppConstants.ApiBaseUrl}/assets/${itemPublishedListItem.createdUserId.avatar}?access_token=${FFAppState().accessToken}',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      CircularPercentIndicator(
                                                                    percent: itemsItem
                                                                            .steps
                                                                            .where((e) =>
                                                                                (e.tasks.where((e) => ((e.publishedCount == itemPublishedListItem.publishedCount) && (e.status == 'done')) == true).toList().isNotEmpty) ==
                                                                                true)
                                                                            .toList()
                                                                            .length /
                                                                        itemsItem
                                                                            .steps
                                                                            .length,
                                                                    radius:
                                                                        30.0,
                                                                    lineWidth:
                                                                        7.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${itemsItem.steps.where((e) => (e.tasks.where((e) => ((e.publishedCount == itemPublishedListItem.publishedCount) && (e.status == 'done')) == true).toList().isNotEmpty) == true).toList().length.toString()}/${itemsItem.steps.length.toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                  ),
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
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
