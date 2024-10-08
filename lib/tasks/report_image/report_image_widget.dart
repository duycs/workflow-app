import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/filter_reprot_image/filter_reprot_image_widget.dart';
import '/tasks/gridview_report_image/gridview_report_image_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'report_image_model.dart';
export 'report_image_model.dart';

class ReportImageWidget extends StatefulWidget {
  const ReportImageWidget({super.key});

  @override
  State<ReportImageWidget> createState() => _ReportImageWidgetState();
}

class _ReportImageWidgetState extends State<ReportImageWidget> {
  late ReportImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportImageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.reloadTokenTasksCheck = await action_blocks.tokenReload(context);
      if (_model.reloadTokenTasksCheck!) {
        _model.checkData = '1';
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
      onTap: () => FocusScope.of(context).unfocus(),
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
              context.pushNamed(
                'WorkResultList',
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
                  'Báo cáo ảnh',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              if (FFAppState().user.role ==
                  '3755a98d-f064-45cd-80e4-5084ab1dd2c4')
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
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: FilterReprotImageWidget(
                              name: _model.nameSearch,
                              nameProcedure: _model.nameProcedure,
                              dateStart: _model.startDate,
                              dateEnd: _model.endDate,
                              nameTask: _model.nameTask,
                              callBack: (name, nameProcedure, dateStart,
                                  dateEnd, nameTask) async {
                                _model.nameSearch = name!;
                                _model.nameProcedure = nameProcedure!;
                                _model.startDate = dateStart!;
                                _model.endDate = dateEnd!;
                                _model.nameTask = nameTask;
                                setState(() {});
                                setState(() =>
                                    _model.listViewPagingController?.refresh());

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
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: '1' == _model.checkData,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((FFAppState().user.role == '82073000-1ba2-43a4-a55c-459d17c23b68') ||
                    (FFAppState().user.role ==
                        'a8d33527-375b-4599-ac70-6a3fcad1de39') ||
                    (FFAppState().user.role ==
                        '6a8bc644-cb2d-4a31-b11e-b86e19824725'))
                  Row(
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
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: FilterReprotImageWidget(
                                    name: _model.nameSearch,
                                    nameProcedure: _model.nameProcedure,
                                    dateStart: _model.startDate,
                                    dateEnd: _model.endDate,
                                    nameTask: _model.nameTask,
                                    callBack: (name, nameProcedure, dateStart,
                                        dateEnd, nameTask) async {
                                      _model.nameSearch = name!;
                                      _model.nameProcedure = nameProcedure!;
                                      _model.startDate = dateStart!;
                                      _model.endDate = dateEnd!;
                                      _model.nameTask = nameTask;
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((_model.nameSearch != null &&
                            _model.nameSearch != '') ||
                        (_model.nameProcedure != null &&
                            _model.nameProcedure != '') ||
                        (_model.startDate != null && _model.startDate != '') ||
                        (_model.endDate != null && _model.endDate != '') ||
                        (_model.nameTask != null && _model.nameTask != ''))
                      Text(
                        '#Kết quả hiển thị theo bộ lọc',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                      ),
                  ],
                ),
                Expanded(
                  child: PagedListView<ApiPagingParams, dynamic>.separated(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) => TaskGroup.getListTaskCall.call(
                        accessToken: FFAppState().accessToken,
                        offset: nextPageMarker.nextPageNumber * 20,
                        limit: 20,
                        filter:
                            '{\"_and\":[{},{\"status\":{\"_eq\":\"done\"}}, {\"action_type\":{\"_eq\":\"image\"}}${(_model.nameProcedure != null && _model.nameProcedure != '') && (_model.nameProcedure != ' ') ? ',{\"workflow_id\":{\"name\":{\"_icontains\":\"${_model.nameProcedure}\"}}}' : ' '}${(_model.nameSearch != null && _model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"submit_staff_id\":{\"user_id\":{\"first_name\":{\"_icontains\":\"${_model.nameSearch}\"}}}}' : ' '}${(_model.startDate != null && _model.startDate != '') && (_model.endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_gte\":\"${_model.startDate}\"}}}}' : ' '}${(_model.endDate != null && _model.endDate != '') && (_model.endDate != ' ') ? ',{\"operations\":{\"operations_id\":{\"date_updated\":{\"_lte\":\"${(String var1) {
                                return DateTime.parse(var1)
                                    .add(Duration(days: 1))
                                    .toString();
                              }(_model.endDate)}\"}}}}' : ' '}${() {
                          if (FFAppState().user.role ==
                              '82073000-1ba2-43a4-a55c-459d17c23b68') {
                            return ',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.organization_id''',
                            ).toString()}\"}}}';
                          } else if (FFAppState().user.role ==
                              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                            return ',{\"submit_staff_id\":{\"branch_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.branch_id''',
                            ).toString()}\"}}}';
                          } else if (FFAppState().user.role ==
                              '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                            return ',{\"submit_staff_id\":{\"department_id\":{\"_eq\":\"${getJsonField(
                              FFAppState().staffLogin,
                              r'''$.department_id''',
                            ).toString()}\"}}}';
                          } else {
                            return ',{\"submit_staff_id\":{\"user_id\":{\"id\":{\"_eq\":\"${FFAppState().user.id}\"}}}}';
                          }
                        }()}${(_model.nameTask != null && _model.nameTask != '') && (_model.nameTask != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.nameTask}\"}}' : ''}]}',
                        sort: '-date_created',
                      ),
                    ),
                    padding: EdgeInsets.zero,
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
                      noItemsFoundIndicatorBuilder: (_) => Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: DataNotFoundWidget(),
                      ),
                      itemBuilder: (context, _, reportImagesIndex) {
                        final reportImagesItem = _model
                            .listViewPagingController!
                            .itemList![reportImagesIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'TaskDetail',
                                queryParameters: {
                                  'workflowId': serializeParam(
                                    reportImagesItem.workflowId.id,
                                    ParamType.String,
                                  ),
                                  'publishedCount': serializeParam(
                                    reportImagesItem.publishedCount,
                                    ParamType.int,
                                  ),
                                  'paramBack': serializeParam(
                                    '7',
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'ProfileUserNew',
                                          queryParameters: {
                                            'staffId': serializeParam(
                                              reportImagesItem.submitStaffId.id,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${reportImagesItem.staffs.length > 0 ? reportImagesItem.submitStaffId.userId.avatar : ' '}?access_token=${FFAppState().accessToken}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Text(
                                              reportImagesItem.staffs.length > 0
                                                  ? reportImagesItem
                                                      .submitStaffId
                                                      .userId
                                                      .firstName
                                                  : ' ',
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          if (reportImagesItem.content !=
                                                  null &&
                                              reportImagesItem.content != '')
                                            Text(
                                              reportImagesItem.content != ''
                                                  ? reportImagesItem.content
                                                  : '',
                                              maxLines: 3,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          if (reportImagesItem
                                                      .workflowId.name !=
                                                  null &&
                                              reportImagesItem
                                                      .workflowId.name !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Text(
                                                reportImagesItem.workflowId
                                                                .name !=
                                                            null &&
                                                        reportImagesItem
                                                                .workflowId
                                                                .name !=
                                                            ''
                                                    ? '#${reportImagesItem.workflowId.name}'
                                                    : ' ',
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                              ),
                                            ),
                                          if ((reportImagesItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .files
                                                      .length >
                                                  0) &&
                                              (reportImagesItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files
                                                          .first
                                                          .directusFilesId
                                                          .id !=
                                                      null &&
                                                  reportImagesItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files
                                                          .first
                                                          .directusFilesId
                                                          .id !=
                                                      ''))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: GridviewReportImageWidget(
                                                key: Key(
                                                    'Key1ct_${reportImagesIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                parameter1: reportImagesItem
                                                    .operations
                                                    .first
                                                    .operationsId
                                                    .files
                                                    .length,
                                                parameter3:
                                                    reportImagesItem.operations,
                                              ),
                                            ),
                                          if ((reportImagesItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .dateUpdated !=
                                                  'null') &&
                                              (reportImagesItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .dateUpdated !=
                                                      null &&
                                                  reportImagesItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .dateUpdated !=
                                                      ''))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                (reportImagesItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .dateUpdated !=
                                                            'null') &&
                                                        (reportImagesItem
                                                                    .operations
                                                                    .first
                                                                    .operationsId
                                                                    .dateUpdated !=
                                                                null &&
                                                            reportImagesItem
                                                                    .operations
                                                                    .first
                                                                    .operationsId
                                                                    .dateUpdated !=
                                                                '')
                                                    ? dateTimeFormat(
                                                        "dd/MM/yyyy hh:MM",
                                                        functions.stringToDateTime(
                                                            reportImagesItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .dateUpdated),
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : ' ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
