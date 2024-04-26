import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure_publishing/filter_work_result/filter_work_result_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
      await _model.getProcedurePublishedList(context);
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Kết quả công việc',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FlutterFlowIconButton(
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
                      kTransitionInfoKey: const TransitionInfo(
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
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.nameSearch =
                                        _model.textController.text;
                                    _model.dataList = [];
                                  });
                                  await _model
                                      .getProcedurePublishedList(context);
                                  setState(() {});
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
                                  borderSide: const BorderSide(
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                                suffixIcon: _model
                                        .textController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController?.clear();
                                          setState(() {
                                            _model.nameSearch =
                                                _model.textController.text;
                                            _model.dataList = [];
                                          });
                                          await _model
                                              .getProcedurePublishedList(
                                                  context);
                                          setState(() {});
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: FilterWorkResultWidget(
                                        name: _model.nameSearch,
                                        dateStart: _model.dateEnd,
                                        dateEnd: _model.dateEnd,
                                        userCreated: _model.userCreated,
                                        callBack: (name, dateStart, dateEnd,
                                            userCreated) async {
                                          setState(() {
                                            _model.nameSearch = name!;
                                            _model.dateStart = dateStart!;
                                            _model.dateEnd = dateEnd!;
                                            _model.userCreated = userCreated!;
                                          });
                                          await _model
                                              .getProcedurePublishedList(
                                                  context);
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
                    if ((_model.nameSearch != '') ||
                        (_model.dateStart != '') ||
                        (_model.dateEnd != '') ||
                        (_model.userCreated != ''))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 0.0, 0.0),
                        child: Text(
                          '#Kết quả hiển thị theo bộ lọc',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    if (_model.dataList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 16.0),
                        child: Builder(
                          builder: (context) {
                            final items = _model.dataList.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              itemBuilder: (context, itemsIndex) {
                                final itemsItem = items[itemsIndex];
                                return Visibility(
                                  visible: (itemsItem.steps.isNotEmpty) &&
                                      (itemsItem.steps.first.tasks.isNotEmpty) &&
                                      (itemsItem.steps.first.tasks
                                              .where((e) => e.status == 'done')
                                              .toList().isNotEmpty),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          width: double.infinity,
                                          color: const Color(0x00000000),
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
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            itemsItem.name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            itemsItem.steps
                                                                .first.tasks
                                                                .where((e) =>
                                                                    e.status ==
                                                                    'done')
                                                                .toList()
                                                                .length
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                              collapsed: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 16.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Hoàn thành hôm nay:  ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: itemsItem
                                                                .steps
                                                                .first
                                                                .tasks
                                                                .where((e) =>
                                                                    (e.status ==
                                                                        'done') &&
                                                                    (dateTimeFormat(
                                                                          'dd/MM/yyyy',
                                                                          functions
                                                                              .stringToDateTime(e.dateEnd),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        dateTimeFormat(
                                                                          'dd/MM/yyyy',
                                                                          getCurrentTimestamp,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )))
                                                                .toList()
                                                                .length
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
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
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final itemTaskDone =
                                                          (getJsonField(
                                                                itemsItem
                                                                    .toMap(),
                                                                r'''$.steps[0].tasks''',
                                                                true,
                                                              )
                                                                      ?.toList()
                                                                      .map<ProcedurePublishedStepTaskStruct?>(
                                                                          ProcedurePublishedStepTaskStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<ProcedurePublishedStepTaskStruct?>)
                                                                  .withoutNulls
                                                                  .toList() ??
                                                              [];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            itemTaskDone.length,
                                                            (itemTaskDoneIndex) {
                                                          final itemTaskDoneItem =
                                                              itemTaskDone[
                                                                  itemTaskDoneIndex];
                                                          return Visibility(
                                                            visible: (itemsItem
                                                                        .steps
                                                                        .where((e) => e
                                                                            .tasks
                                                                            .where((e) =>
                                                                                (e.publishedCount == itemTaskDoneItem.publishedCount) &&
                                                                                (e.status ==
                                                                                    'done'))
                                                                            .toList()
                                                                            .isNotEmpty)
                                                                        .toList()
                                                                        .length ==
                                                                    itemsItem
                                                                        .steps
                                                                        .length) &&
                                                                (dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      functions.stringToDateTime(
                                                                          itemTaskDoneItem
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
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'TaskDetail',
                                                                  queryParameters:
                                                                      {
                                                                    'workflowId':
                                                                        serializeParam(
                                                                      itemsItem
                                                                          .id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'publishedCount':
                                                                        serializeParam(
                                                                      itemTaskDoneItem
                                                                          .publishedCount,
                                                                      ParamType
                                                                          .int,
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
                                                                width: double
                                                                    .infinity,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Text(
                                                                                'Lần chạy thứ: ${itemTaskDoneItem.publishedCount.toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                'Thời gian tạo: ${dateTimeFormat(
                                                                                  'dd/MM/yyyy',
                                                                                  functions.stringToDateTime(itemTaskDoneItem.dateCreated),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: Text(
                                                                                  'Người tạo: ${itemTaskDoneItem.userCreated.firstName}',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                  child: CircularPercentIndicator(
                                                                                    percent: itemsItem.steps.where((e) => e.tasks.where((e) => (e.publishedCount == itemTaskDoneItem.publishedCount) && (e.status == 'done')).toList().isNotEmpty).toList().length / itemsItem.steps.length,
                                                                                    radius: 20.0,
                                                                                    lineWidth: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${itemsItem.steps.where((e) => e.tasks.where((e) => (e.publishedCount == itemTaskDoneItem.publishedCount) && (e.status == 'done')).toList().isNotEmpty).toList().length.toString()}/${itemsItem.steps.length.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              expanded: Visibility(
                                                visible:
                                                    _model.dataList.isNotEmpty,
                                                child: Builder(
                                                  builder: (context) {
                                                    final itemPublishedList =
                                                        (getJsonField(
                                                              itemsItem.toMap(),
                                                              r'''$.steps[0].tasks''',
                                                              true,
                                                            )
                                                                        ?.toList()
                                                                        .map<ProcedurePublishedStepTaskStruct?>(ProcedurePublishedStepTaskStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        ProcedurePublishedStepTaskStruct?>)
                                                                .withoutNulls
                                                                .toList() ??
                                                            [];
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: List.generate(
                                                            itemPublishedList
                                                                .length,
                                                            (itemPublishedListIndex) {
                                                          final itemPublishedListItem =
                                                              itemPublishedList[
                                                                  itemPublishedListIndex];
                                                          return Visibility(
                                                            visible: itemsItem
                                                                    .steps
                                                                    .where((e) => e
                                                                        .tasks
                                                                        .where((e) =>
                                                                            (e.publishedCount == itemPublishedListItem.publishedCount) &&
                                                                            (e.status ==
                                                                                'done'))
                                                                        .toList()
                                                                        .isNotEmpty)
                                                                    .toList()
                                                                    .length ==
                                                                itemsItem.steps
                                                                    .length,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'WorkResultDetail',
                                                                  queryParameters:
                                                                      {
                                                                    'workflowId':
                                                                        serializeParam(
                                                                      itemsItem
                                                                          .id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'publishedCount':
                                                                        serializeParam(
                                                                      itemPublishedListItem
                                                                          .publishedCount,
                                                                      ParamType
                                                                          .int,
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
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          0.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      offset:
                                                                          const Offset(
                                                                        0.0,
                                                                        1.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Lần chạy thứ: ${itemPublishedListItem.publishedCount.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
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
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                'Người tạo: ${itemPublishedListItem.userCreated.firstName}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                  child: CircularPercentIndicator(
                                                                                    percent: itemsItem.steps.where((e) => e.tasks.where((e) => (e.publishedCount == itemPublishedListItem.publishedCount) && (e.status == 'done')).toList().isNotEmpty).toList().length / itemsItem.steps.length,
                                                                                    radius: 20.0,
                                                                                    lineWidth: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${itemsItem.steps.where((e) => e.tasks.where((e) => (e.publishedCount == itemPublishedListItem.publishedCount) && (e.status == 'done')).toList().isNotEmpty).toList().length.toString()}/${itemsItem.steps.length.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(const SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  selectedPageIndex: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
