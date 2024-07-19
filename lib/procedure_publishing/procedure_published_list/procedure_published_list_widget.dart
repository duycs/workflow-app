import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/filter_procedure_published/filter_procedure_published_widget.dart';
import '/procedure_publishing/procedure_published/procedure_published_widget.dart';
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
import 'procedure_published_list_model.dart';
export 'procedure_published_list_model.dart';

class ProcedurePublishedListWidget extends StatefulWidget {
  const ProcedurePublishedListWidget({super.key});

  @override
  State<ProcedurePublishedListWidget> createState() =>
      _ProcedurePublishedListWidgetState();
}

class _ProcedurePublishedListWidgetState
    extends State<ProcedurePublishedListWidget> {
  late ProcedurePublishedListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedurePublishedListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenPublishedListApp =
          await action_blocks.tokenReload(context);
      if (_model.reloadTokenPublishedListApp!) {
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
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: ProcedurePublishedWidget(
                        callback: () async {
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
            elevation: 1.0,
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
            'Công việc theo quy trình',
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
        body: Visibility(
          visible: _model.isLoad == true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                              _model.searchName = _model.textController.text;
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
                                      _model.searchName =
                                          _model.textController.text;
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                  child: FilterProcedurePublishedWidget(
                                    name: _model.searchName,
                                    dateStart: _model.dateStart,
                                    dateEnd: _model.dateEnd,
                                    userCreated: _model.searchUserCreated,
                                    callBack: (name, dateStart, dateEnd,
                                        userCreated) async {
                                      _model.searchName = name!;
                                      _model.dateStart = dateStart!;
                                      _model.dateEnd = dateEnd!;
                                      _model.searchUserCreated = userCreated!;
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
                                                offset: _model.textController!
                                                    .text.length);
                                      });

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
                if ((_model.searchName != null && _model.searchName != '') ||
                    (_model.dateStart != null && _model.dateStart != '') ||
                    (_model.dateEnd != null && _model.dateEnd != '') ||
                    (_model.searchUserCreated != null &&
                        _model.searchUserCreated != ''))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      '#Kết quả hiển thị theo bộ lọc',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: PagedListView<ApiPagingParams, dynamic>(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) => ProcedurePublishedGroup
                            .procedurePublishedListCall
                            .call(
                          limit: 20,
                          offset: nextPageMarker.nextPageNumber * 20,
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
                              return ',{\"steps\":{\"tasks\":{\"staffs\":{\"staffs_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.branch_id''',
                              ).toString()}\"}}}}}}';
                            } else if (FFAppState().user.role ==
                                '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                              return ',{\"steps\":{\"tasks\":{\"staffs\":{\"staffs_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.department_id''',
                              ).toString()}\"}}}}}}';
                            } else {
                              return ',{\"steps\":{\"tasks\":{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                FFAppState().staffLogin,
                                r'''$.id''',
                              ).toString()}\"}}}}}}';
                            }
                          }()}${(_model.searchName != null && _model.searchName != '') && (_model.searchName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.searchName}\"}}' : ' '}${(_model.dateStart != null && _model.dateStart != '') && (_model.dateStart != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_gte\":\"${_model.dateStart}\"}}}}' : ' '}${(_model.dateEnd != null && _model.dateEnd != '') && (_model.dateEnd != ' ') ? ',{\"steps\":{\"tasks\":{\"date_created\":{\"_lte\":\"${(String var1) {
                              return DateTime.parse(var1)
                                  .add(Duration(days: 1))
                                  .toString();
                            }(_model.dateEnd)}\"}}}}' : ' '}${(_model.searchUserCreated != null && _model.searchUserCreated != '') && (_model.searchUserCreated != ' ') ? ',{\"steps\":{\"tasks\":{\"created_user_id\":{\"first_name\":{\"_icontains\":\"${_model.searchUserCreated}\"}}}}}' : ' '}]}',
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        52.0,
                      ),
                      primary: false,
                      reverse: false,
                      scrollDirection: Axis.vertical,
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
                        itemBuilder: (context, _, itemsIndex) {
                          final itemsItem = _model
                              .listViewPagingController!.itemList![itemsIndex];
                          return Visibility(
                            visible: (itemsItem.steps.isNotEmpty) &&
                                (itemsItem.steps
                                    .where((e) => e.number == 1)
                                    .toList()
                                    .first
                                    .tasks
                                    .isNotEmpty),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 1.0, 12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      offset: Offset(
                                        1.0,
                                        2.0,
                                      ),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  itemsItem.name,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: (itemsItem.steps
                                                                    .isNotEmpty) &&
                                                                (itemsItem.steps
                                                                    .where((e) =>
                                                                        e.number ==
                                                                        1)
                                                                    .toList()
                                                                    .first
                                                                    .tasks
                                                                    .isNotEmpty)
                                                            ? itemsItem.steps
                                                                .where((e) =>
                                                                    e.number ==
                                                                    1)
                                                                .toList()
                                                                .first
                                                                .tasks
                                                                .length
                                                                .toString()
                                                            : '0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' công việc theo quy trình',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      )
                                                    ],
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        collapsed: Container(),
                                        expanded: Visibility(
                                          visible: (itemsItem
                                                  .steps.isNotEmpty) &&
                                              (itemsItem.steps
                                                  .where((e) => e.number == 1)
                                                  .toList()
                                                  .first
                                                  .tasks
                                                  .isNotEmpty),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: List.generate(
                                                      itemPublishedList.length,
                                                      (itemPublishedListIndex) {
                                                    final itemPublishedListItem =
                                                        itemPublishedList[
                                                            itemPublishedListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
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
                                                            'TaskDetail',
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
                                                              'paramBack':
                                                                  serializeParam(
                                                                '4',
                                                                ParamType
                                                                    .String,
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
                                                                            .stretch,
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
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                22.0,
                                                                          ),
                                                                          Text(
                                                                            'T.gian tạo: ${dateTimeFormat(
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
                                                                        ].divide(SizedBox(width: 2.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.person_outline,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                22.0,
                                                                          ),
                                                                          Text(
                                                                            'Người tạo: ',
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          if ('1' ==
                                                                              '2')
                                                                            Text(
                                                                              'Người tạo: ${itemPublishedListItem.createdUserId.firstName == 'null' ? ' ' : itemPublishedListItem.createdUserId.firstName}',
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
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
                                                                        ].divide(SizedBox(width: 2.0)),
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
                                                                                (e.tasks.where((e) => (('${e.publishedCount.toString()}' == '${itemPublishedListItem.publishedCount.toString()}') && (e.status == 'done')) == true).toList().isNotEmpty) ==
                                                                                true)
                                                                            .toList()
                                                                            .length /
                                                                        itemsItem
                                                                            .steps
                                                                            .length,
                                                                    radius:
                                                                        35.0,
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
                                                                    center:
                                                                        Text(
                                                                      '${((itemsItem.steps.where((e) => (e.tasks.where((e) => (('${e.publishedCount.toString()}' == '${itemPublishedListItem.publishedCount.toString()}') && (e.status == 'done')) == true).toList().isNotEmpty) == true).toList().length / itemsItem.steps.length * 100).round()).toString()} %',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${itemsItem.steps.where((e) => (e.tasks.where((e) => (('${e.publishedCount.toString()}' == '${itemPublishedListItem.publishedCount.toString()}') && (e.status == 'done')) == true).toList().isNotEmpty) == true).toList().length.toString()}/${itemsItem.steps.length.toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 6.0)),
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
                                          iconColor:
                                              FlutterFlowTheme.of(context)
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
      ),
    );
  }
}
