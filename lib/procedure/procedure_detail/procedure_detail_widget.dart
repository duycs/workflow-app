import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure/procedure_step_detail/procedure_step_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'procedure_detail_model.dart';
export 'procedure_detail_model.dart';

class ProcedureDetailWidget extends StatefulWidget {
  const ProcedureDetailWidget({
    super.key,
    required this.workflowsId,
    String? checkScroll,
    required this.idCreate,
  }) : this.checkScroll = checkScroll ?? '0';

  final String? workflowsId;
  final String checkScroll;
  final String? idCreate;

  @override
  State<ProcedureDetailWidget> createState() => _ProcedureDetailWidgetState();
}

class _ProcedureDetailWidgetState extends State<ProcedureDetailWidget>
    with TickerProviderStateMixin {
  late ProcedureDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadProcedureDetail =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadProcedureDetail!) {
        _model.apiResultStepData =
            await ProcedureTemplateGroup.workflowsOneCall.call(
          accessToken: FFAppState().accessToken,
          id: widget!.workflowsId,
        );

        if ((_model.apiResultStepData?.succeeded ?? true)) {
          _model.stepsList = functions
              .sortArrayStepList((getJsonField(
                (_model.apiResultStepData?.jsonBody ?? ''),
                r'''$.data.steps''',
                true,
              )!
                      .toList()
                      .map<WorkflowsStepCreateStruct?>(
                          WorkflowsStepCreateStruct.maybeFromMap)
                      .toList() as Iterable<WorkflowsStepCreateStruct?>)
                  .withoutNulls
                  .toList())
              .toList()
              .cast<WorkflowsStepCreateStruct>();
          _model.data = WorkflowsStepCreateStruct(
            id: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.id''',
            ).toString().toString(),
            status: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.status''',
            ).toString().toString(),
            name: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.name''',
            ).toString().toString(),
            description: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.description''',
            ).toString().toString(),
            remind: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.remind''',
            ),
            remindInSecond: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.remind_in_second''',
            ),
            remind2: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.remind_2''',
            ),
            cron: getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.cron''',
            ).toString().toString(),
            departments: (getJsonField(
              (_model.apiResultStepData?.jsonBody ?? ''),
              r'''$.data.departments''',
              true,
            )
                    ?.toList()
                    .map<DepartmentListStruct?>(
                        DepartmentListStruct.maybeFromMap)
                    .toList() as Iterable<DepartmentListStruct?>)
                .withoutNulls,
          );
          setState(() {});
          if ((getJsonField(
                (_model.apiResultStepData?.jsonBody ?? ''),
                r'''$.data.departments''',
              )
                      .toList()
                      .map<DepartmentListStruct?>(
                          DepartmentListStruct.maybeFromMap)
                      .toList() as Iterable<DepartmentListStruct?>)
                  .withoutNulls
                  .length >
              0) {
            setState(() {});
          } else {
            _model.updateDataStruct(
              (e) => e
                ..staffs = (getJsonField(
                  (_model.apiResultStepData?.jsonBody ?? ''),
                  r'''$.data.staffs''',
                  true,
                )!
                        .toList()
                        .map<StaffsStepStruct?>(StaffsStepStruct.maybeFromMap)
                        .toList() as Iterable<StaffsStepStruct?>)
                    .withoutNulls
                    .toList(),
            );
            setState(() {});
          }

          _model.idLoad = true;
          setState(() {});
        } else {
          await actions.showToast(
            context,
            'Lỗi tải dữ liệu!',
            FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).error,
          );
          return;
        }
      } else {
        setState(() {});
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              context.pop();
            },
          ),
          title: Text(
            'Chi tiết quy trình',
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
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                if (_model.idLoad == true)
                  Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito',
                                    letterSpacing: 0.0,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: 'Cài đặt chung',
                            ),
                            Tab(
                              text: 'Bước quy trình',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Icon(
                                                              Icons.settings,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    _model.data?.name !=
                                                                                null &&
                                                                            _model.data?.name !=
                                                                                ''
                                                                        ? _model
                                                                            .data!
                                                                            .name
                                                                        : ' ',
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if ((_model.data?.description !=
                                                                null &&
                                                            _model.data
                                                                    ?.description !=
                                                                '') &&
                                                        ('${_model.data?.description}' !=
                                                            'null') &&
                                                        ('${_model.data?.description}' !=
                                                            'undefined'))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Text(
                                                                  (_model.data?.description != null &&
                                                                              _model.data?.description !=
                                                                                  '') &&
                                                                          ('${_model.data?.description}' !=
                                                                              'null') &&
                                                                          ('${_model.data?.description}' !=
                                                                              'undefined')
                                                                      ? _model
                                                                          .data!
                                                                          .description
                                                                      : ' ',
                                                                  maxLines: 2,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (_model.data!.staffs.length > 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '# Danh sách nhân viên khởi chạy',
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
                                            ),
                                          if (_model.data!.staffs.length > 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(Chỉ nhân viên được gán mới được phép khởi chạy quy trình)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                            ),
                                          if (_model.data!.staffs.length > 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .noColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final staffList = _model
                                                              .data?.staffs
                                                              ?.toList() ??
                                                          [];

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            staffList.length,
                                                        itemBuilder: (context,
                                                            staffListIndex) {
                                                          final staffListItem =
                                                              staffList[
                                                                  staffListIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: staffListItem
                                                                    .staffsId
                                                                    .userId
                                                                    .firstName,
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 25.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (_model.data!.departments.length >
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '# Danh sách bộ phận khởi chạy',
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
                                            ),
                                          if (_model.data!.departments.length >
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(Chỉ nhân viên của bộ phận được gán mới được phép khởi chạy quy trình)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                            ),
                                          if (_model.data!.departments.length >
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .noColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final departmentsList =
                                                          _model.data
                                                                  ?.departments
                                                                  ?.toList() ??
                                                              [];

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            departmentsList
                                                                .length,
                                                        itemBuilder: (context,
                                                            departmentsListIndex) {
                                                          final departmentsListItem =
                                                              departmentsList[
                                                                  departmentsListIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: departmentsListItem
                                                                    .departmentsId
                                                                    .name,
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 25.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.event_repeat,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Thiết lập: ${_model.data?.cron != null && _model.data?.cron != '' ? () {
                                                        if ('${functions.checkTypeCron(_model.data!.cron)}' ==
                                                            '3') {
                                                          return 'trong tháng';
                                                        } else if ('${functions.checkTypeCron(_model.data!.cron)}' ==
                                                            '2') {
                                                          return 'trong tuần';
                                                        } else if ('${functions.checkTypeCron(_model.data!.cron)}' ==
                                                            '1') {
                                                          return 'hàng ngày';
                                                        } else {
                                                          return 'không lặp';
                                                        }
                                                      }() : ' '}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                _model.data?.cron != null &&
                                                        _model.data?.cron != ''
                                                    ? ((List<String> var1) {
                                                        return var1.join(", ");
                                                      }(functions
                                                        .cronToType(
                                                            _model.data!.cron)
                                                        .toList()))
                                                    : ' ',
                                                maxLines: 3,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape: CircleBorder(),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue1 ??=
                                                            '${_model.data?.remind?.toString()}' ==
                                                                    '1'
                                                                ? true
                                                                : false,
                                                        onChanged: ('2' == '2')
                                                            ? null
                                                            : (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxValue1 =
                                                                        newValue!);
                                                              },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor: ('2' == '2')
                                                            ? null
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Thiết lập nhắc trước khi bắt đầu bước:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            '(${_model.data?.remindInSecond != null ? formatNumber(
                                                                _model.data
                                                                    ?.remindInSecond,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                              ) : '0'} phút)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue2 ??=
                                                        '${_model.data?.remind2?.toString()}' ==
                                                                '1'
                                                            ? true
                                                            : false,
                                                    onChanged: ('2' == '2')
                                                        ? null
                                                        : (newValue) async {
                                                            setState(() => _model
                                                                    .checkboxValue2 =
                                                                newValue!);
                                                          },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor: ('2' == '2')
                                                        ? null
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Thiết lập nhắc chuyển bước',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
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
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 60.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Sơ đồ quy trình',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    if (_model.idLoad == true)
                                      Builder(
                                        builder: (context) {
                                          final listView =
                                              _model.stepsList.toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listView.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewItem =
                                                  listView[listViewIndex];
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    if (listViewIndex > 0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 15.0,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 3.0,
                                                                color: Color(
                                                                    0xB00F0E0E),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                ProcedureStepDetailWidget(
                                                                              item: listViewItem,
                                                                              check: false,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if ((int
                                                                            var1) {
                                                                          return var1 % 5 == 0
                                                                              ? true
                                                                              : false;
                                                                        }(listViewIndex)) {
                                                                          return Color(
                                                                              0xFF3ABEF9);
                                                                        } else if ((int var1) {
                                                                          return var1 % 5 == 1
                                                                              ? true
                                                                              : false;
                                                                        }(listViewIndex)) {
                                                                          return Color(
                                                                              0xFF26355D);
                                                                        } else if ((int var1) {
                                                                          return var1 % 5 == 2
                                                                              ? true
                                                                              : false;
                                                                        }(listViewIndex)) {
                                                                          return Color(
                                                                              0xFF059212);
                                                                        } else if ((int var1) {
                                                                          return var1 % 5 == 3
                                                                              ? true
                                                                              : false;
                                                                        }(listViewIndex)) {
                                                                          return Color(
                                                                              0xFFFF407D);
                                                                        } else if ((int var1) {
                                                                          return var1 % 5 == 4
                                                                              ? true
                                                                              : false;
                                                                        }(listViewIndex)) {
                                                                          return Color(
                                                                              0xFF7E8EF1);
                                                                        } else {
                                                                          return Color(
                                                                              0x00000000);
                                                                        }
                                                                      }(),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            2.0,
                                                                            10.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(30.0),
                                                                        bottomRight:
                                                                            Radius.circular(30.0),
                                                                        topLeft:
                                                                            Radius.circular(30.0),
                                                                        topRight:
                                                                            Radius.circular(30.0),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                30.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewItem.name,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 55.0,
                                                                  height: 55.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x6814181B),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            1.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .noColor,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Bước',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: () {
                                                                                if ((int var1) {
                                                                                  return var1 % 5 == 0 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF3ABEF9);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 1 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF26355D);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 2 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF059212);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 3 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFFFF407D);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 4 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF7E8EF1);
                                                                                } else {
                                                                                  return Color(0x00000000);
                                                                                }
                                                                              }(),
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '${(listViewIndex + 1).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: () {
                                                                                if ((int var1) {
                                                                                  return var1 % 5 == 0 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF3ABEF9);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 1 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF26355D);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 2 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF059212);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 3 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFFFF407D);
                                                                                } else if ((int var1) {
                                                                                  return var1 % 5 == 4 ? true : false;
                                                                                }(listViewIndex)) {
                                                                                  return Color(0xFF7E8EF1);
                                                                                } else {
                                                                                  return Color(0x00000000);
                                                                                }
                                                                              }(),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (listViewIndex ==
                                                        (_model.stepsList
                                                                .length -
                                                            1))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if ((_model.idLoad == true) &&
                    (widget!.idCreate == FFAppState().user.id))
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'ProcedureUpdate',
                          queryParameters: {
                            'itemData': serializeParam(
                              _model.data,
                              ParamType.DataStruct,
                            ),
                            'stepListPar': serializeParam(
                              _model.stepsList,
                              ParamType.DataStruct,
                              isList: true,
                            ),
                            'check': serializeParam(
                              true,
                              ParamType.bool,
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
                      text: 'Chỉnh sửa',
                      icon: Icon(
                        Icons.edit,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
