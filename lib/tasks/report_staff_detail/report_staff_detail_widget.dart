import '/backend/api_requests/api_calls.dart';
import '/components/data_not_found_row_new/data_not_found_row_new_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/tasks/export_excel_get_one/export_excel_get_one_widget.dart';
import '/tasks/filter_report_staff_detail/filter_report_staff_detail_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'report_staff_detail_model.dart';
export 'report_staff_detail_model.dart';

class ReportStaffDetailWidget extends StatefulWidget {
  const ReportStaffDetailWidget({
    super.key,
    required this.staffId,
    this.title,
    this.department,
    this.branch,
    required this.name,
  });

  final String? staffId;
  final String? title;
  final String? department;
  final String? branch;
  final String? name;

  @override
  State<ReportStaffDetailWidget> createState() =>
      _ReportStaffDetailWidgetState();
}

class _ReportStaffDetailWidgetState extends State<ReportStaffDetailWidget>
    with TickerProviderStateMixin {
  late ReportStaffDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportStaffDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getOneUserTask(context);
      setState(() {});
      await _model.getOneUserProgram(context);
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
    context.watch<FFAppState>();
    final chartPieChartColorsList1 = [
      FlutterFlowTheme.of(context).primary,
      const Color(0xFF33BA45),
      FlutterFlowTheme.of(context).tertiary
    ];
    final chartPieChartColorsList2 = [
      FlutterFlowTheme.of(context).tertiary,
      FlutterFlowTheme.of(context).primary,
      const Color(0xFF33BA45)
    ];
    final chartPieChartColorsList3 = [
      FlutterFlowTheme.of(context).accent3,
      FlutterFlowTheme.of(context).accent1,
      FlutterFlowTheme.of(context).accent2
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                widget.name!,
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
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ('1' == '2')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 6.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contact_page_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Chức vụ: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    TextSpan(
                                      text: widget.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                maxLines: 2,
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((widget.department != null &&
                                      widget.department != '') &&
                                  (widget.department != ' '))
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.groups_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Bộ phận: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: widget.department!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              if ((widget.branch != null &&
                                      widget.branch != '') &&
                                  (widget.branch != ' '))
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home_work_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Chi nhánh: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: widget.branch!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Flexible(
                child: Stack(
                  children: [
                    if (_model.staff != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: false,
                                isScrollable: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                labelColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent1,
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedBorderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                elevation: 0.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                tabs: const [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: Icon(
                                          Icons.work_outline,
                                          size: 20.0,
                                        ),
                                      ),
                                      Tab(
                                        text: 'Công việc',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: Icon(
                                          Icons.menu_book,
                                          size: 20.0,
                                        ),
                                      ),
                                      Tab(
                                        text: 'Đào tạo',
                                      ),
                                    ],
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 16.0, 8.0, 16.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Biểu đồ báo cáo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              if ('1' == '2')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController1 ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.dropDownValue1 ??=
                                                          'Tổng',
                                                    ),
                                                    options: const [
                                                      'Tuần này',
                                                      'Tháng này',
                                                      'Năm nay',
                                                      'Tổng'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .dropDownValue1 =
                                                            val),
                                                    width: 120.0,
                                                    height: 48.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 4.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                8.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              if ('1' == '2')
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    var shouldSetState = false;

                                                    setState(() {});
                                                    _model.getOneStaffTask1 =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    shouldSetState = true;
                                                    if (_model
                                                        .getOneStaffTask1!) {
                                                      _model.apiResultGetOneStaff1 =
                                                          await StaffGroup
                                                              .staffGetOneCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        staffId: widget.staffId,
                                                        filter: _model
                                                            .filterRequest,
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiResultGetOneStaff1
                                                              ?.succeeded ??
                                                          true)) {}
                                                    } else {
                                                      FFAppState()
                                                          .update(() {});
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }

                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  text: 'Button',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
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
                                                    var shouldSetState = false;

                                                    setState(() {});
                                                    _model.getOneStaffTask2 =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    shouldSetState = true;
                                                    if (_model
                                                        .getOneStaffTask2!) {
                                                      _model.apiResultGetOneStaff2 =
                                                          await StaffGroup
                                                              .staffGetOneCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        staffId: widget.staffId,
                                                        filter: _model
                                                            .filterRequest,
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiResultGetOneStaff2
                                                              ?.succeeded ??
                                                          true)) {
                                                        await actions
                                                            .reportDetailToCsv(
                                                          (_model.apiResultGetOneStaff2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                      }
                                                    } else {
                                                      FFAppState()
                                                          .update(() {});
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }

                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/export-spreadsheet-512.webp',
                                                      width: 45.0,
                                                      height: 45.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: 160.0,
                                                    height: 160.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Visibility(
                                                      visible: (_model.staff !=
                                                              null) &&
                                                          (_model.staff!.tasks.isNotEmpty),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child:
                                                            FlutterFlowPieChart(
                                                          data: FFPieChartData(
                                                            values: _model
                                                                .listPercent,
                                                            colors:
                                                                chartPieChartColorsList1,
                                                            radius: [80.0],
                                                            borderColor: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground
                                                            ],
                                                          ),
                                                          donutHoleRadius: 0.0,
                                                          donutHoleColor: Colors
                                                              .transparent,
                                                          sectionLabelType:
                                                              PieChartSectionLabelType
                                                                  .percent,
                                                          sectionLabelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if ((_model.staff!.tasks.isNotEmpty
                                                      ? formatNumber(
                                                          _model.staff?.tasks
                                                              .where((e) =>
                                                                  e.tasksId !=
                                                                  null)
                                                              .toList()
                                                              .length,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                        )
                                                      : '0') ==
                                                  '0')
                                                Container(
                                                  width: 160.0,
                                                  height: 160.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 0.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Tổng ',
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
                                                              TextSpan(
                                                                text: _model
                                                                            .staff!
                                                                            .tasks.isNotEmpty
                                                                    ? formatNumber(
                                                                        _model
                                                                            .staff!
                                                                            .tasks
                                                                            .where((e) =>
                                                                                e.tasksId !=
                                                                                null)
                                                                            .toList()
                                                                            .length,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                      )
                                                                    : '0',
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                text:
                                                                    ' nhiệm vụ',
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Chưa thực hiện (',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: _model.staff!.tasks.isNotEmpty
                                                                            ? formatNumber(
                                                                                _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 0)).toList().length,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                              )
                                                                            : '0',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            ')',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.statusFilter =
                                                                          'Chưa thực hiện';
                                                                      _model.checkStatus1 =
                                                                          true;
                                                                      _model.filterRequest =
                                                                          '';
                                                                      setState(
                                                                          () {});
                                                                      setState(() => _model
                                                                          .listViewPagingController
                                                                          ?.refresh());
                                                                      _model.checkStatus2 =
                                                                          false;
                                                                      _model.checkStatus3 =
                                                                          false;
                                                                      _model
                                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                                          if (_model.typeFilter ==
                                                                              'Nhập văn bản') {
                                                                            return 'submit_text';
                                                                          } else if (_model.typeFilter ==
                                                                              'Upload File') {
                                                                            return 'upload_file';
                                                                          } else if (_model.typeFilter ==
                                                                              'Chụp ảnh') {
                                                                            return 'image';
                                                                          } else if (_model.typeFilter ==
                                                                              'Check List Công việc') {
                                                                            return 'to_do_list';
                                                                          } else if (_model.typeFilter ==
                                                                              'Phê duyệt') {
                                                                            return ' approve';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                                          if (_model.statusFilter ==
                                                                              'Chưa thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Đang thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Hoàn thành') {
                                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                                      _model.checkStatus4 =
                                                                          false;
                                                                      _model.checkStatus5 =
                                                                          false;
                                                                      _model.checkStatus6 =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      _model.checkStatus1
                                                                          ? 'Đang chọn xem'
                                                                          : 'Xem',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color: _model.checkStatus1
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Đang thực hiện (',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: _model.staff!.tasks.isNotEmpty
                                                                            ? formatNumber(
                                                                                _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1)).toList().length,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                              )
                                                                            : '0',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            ')',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.statusFilter =
                                                                          'Đang thực hiện';
                                                                      _model.checkStatus2 =
                                                                          true;
                                                                      _model.filterRequest =
                                                                          '';
                                                                      setState(
                                                                          () {});
                                                                      setState(() => _model
                                                                          .listViewPagingController
                                                                          ?.refresh());
                                                                      _model.checkStatus1 =
                                                                          false;
                                                                      _model.checkStatus3 =
                                                                          false;
                                                                      _model
                                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                                          if (_model.typeFilter ==
                                                                              'Nhập văn bản') {
                                                                            return 'submit_text';
                                                                          } else if (_model.typeFilter ==
                                                                              'Upload File') {
                                                                            return 'upload_file';
                                                                          } else if (_model.typeFilter ==
                                                                              'Chụp ảnh') {
                                                                            return 'image';
                                                                          } else if (_model.typeFilter ==
                                                                              'Check List Công việc') {
                                                                            return 'to_do_list';
                                                                          } else if (_model.typeFilter ==
                                                                              'Phê duyệt') {
                                                                            return ' approve';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                                          if (_model.statusFilter ==
                                                                              'Chưa thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Đang thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Hoàn thành') {
                                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                                      _model.checkStatus4 =
                                                                          false;
                                                                      _model.checkStatus5 =
                                                                          false;
                                                                      _model.checkStatus6 =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      _model.checkStatus2
                                                                          ? 'Đang chọn xem'
                                                                          : 'Xem',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color: _model.checkStatus2
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFF33BA45),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Hoàn thành (',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: _model.staff!.tasks.isNotEmpty
                                                                            ? formatNumber(
                                                                                _model.staff!.tasks.where((e) => e.tasksId.status == 'done').toList().length,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                              )
                                                                            : '0',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            ')',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.statusFilter =
                                                                          'Hoàn thành';
                                                                      _model.checkStatus3 =
                                                                          true;
                                                                      _model.filterRequest =
                                                                          '';
                                                                      setState(
                                                                          () {});
                                                                      setState(() => _model
                                                                          .listViewPagingController
                                                                          ?.refresh());
                                                                      _model.checkStatus2 =
                                                                          false;
                                                                      _model.checkStatus1 =
                                                                          false;
                                                                      _model
                                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateStart2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                                          if (_model.typeFilter ==
                                                                              'Nhập văn bản') {
                                                                            return 'submit_text';
                                                                          } else if (_model.typeFilter ==
                                                                              'Upload File') {
                                                                            return 'upload_file';
                                                                          } else if (_model.typeFilter ==
                                                                              'Chụp ảnh') {
                                                                            return 'image';
                                                                          } else if (_model.typeFilter ==
                                                                              'Check List Công việc') {
                                                                            return 'to_do_list';
                                                                          } else if (_model.typeFilter ==
                                                                              'Phê duyệt') {
                                                                            return ' approve';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd1Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                                          return DateTime.parse(var1)
                                                                              .add(const Duration(days: 1))
                                                                              .toString();
                                                                        }(dateTimeFormat(
                                                                          'yyyy-MM-dd',
                                                                          functions
                                                                              .stringToDateTime(_model.dateEnd2Filter),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                                          if (_model.statusFilter ==
                                                                              'Chưa thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Đang thực hiện') {
                                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                                          } else if (_model.statusFilter ==
                                                                              'Hoàn thành') {
                                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                                          } else {
                                                                            return ' ';
                                                                          }
                                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                                      _model.checkStatus4 =
                                                                          false;
                                                                      _model.checkStatus5 =
                                                                          false;
                                                                      _model.checkStatus6 =
                                                                          false;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      _model.checkStatus3
                                                                          ? 'Đang chọn xem'
                                                                          : 'Xem',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color: _model.checkStatus3
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 32.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 0.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Tổng ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: _model
                                                                        .staff!
                                                                        .tasks.isNotEmpty
                                                                ? formatNumber(
                                                                    _model.staff!
                                                                            .tasks
                                                                            .where((e) =>
                                                                                (e.tasksId.status == 'done') &&
                                                                                (e.tasksId.deadline !=
                                                                                        '') &&
                                                                                (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) ==
                                                                                    'before'))
                                                                            .toList()
                                                                            .length +
                                                                        _model
                                                                            .staff!
                                                                            .tasks
                                                                            .where((e) =>
                                                                                (e.tasksId.status == 'todo') &&
                                                                                (e.tasksId.current == 1) &&
                                                                                (e.tasksId.deadline != '') &&
                                                                                ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'after') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal')))
                                                                            .toList()
                                                                            .length,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  )
                                                                : '0',
                                                            style: const TextStyle(
                                                              color: Color(
                                                                  0xFFF20000),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const TextSpan(
                                                            text: ' (',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: _model
                                                                        .staff!
                                                                        .tasks.isNotEmpty
                                                                ? formatNumber(
                                                                    double.parse((((_model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'after')).toList().length + _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'before') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length) / _model.staff!.tasks.length) *
                                                                            100)
                                                                        .toStringAsFixed(
                                                                            2)),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  )
                                                                : '0',
                                                            style: const TextStyle(),
                                                          ),
                                                          const TextSpan(
                                                            text:
                                                                '%) nhiệm vụ trễ deadline.\nTrong đó: ',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                  ),
                                                ),
                                                Container(
                                                  width: 90.0,
                                                  decoration: const BoxDecoration(),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
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
                                                      _model.checkStatus4 =
                                                          true;
                                                      _model.filterRequest = '';
                                                      setState(() {});
                                                      setState(() => _model
                                                          .listViewPagingController
                                                          ?.refresh());
                                                      _model.checkStatus2 =
                                                          false;
                                                      _model.checkStatus1 =
                                                          false;
                                                      _model.checkStatus3 =
                                                          false;
                                                      _model.checkStatus5 =
                                                          false;
                                                      _model.checkStatus6 =
                                                          false;
                                                      _model
                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                          if (_model
                                                                  .typeFilter ==
                                                              'Nhập văn bản') {
                                                            return 'submit_text';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Upload File') {
                                                            return 'upload_file';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Chụp ảnh') {
                                                            return 'image';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Check List Công việc') {
                                                            return 'to_do_list';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Phê duyệt') {
                                                            return ' approve';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                          if (_model
                                                                  .statusFilter ==
                                                              'Chưa thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Đang thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Hoàn thành') {
                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      _model.checkStatus4
                                                          ? 'Đang chọn xem'
                                                          : 'Xem',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: _model
                                                                    .checkStatus4
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                                Expanded(
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            _model.staff!.tasks.isNotEmpty
                                                                ? formatNumber(
                                                                    _model.staff
                                                                        ?.tasks
                                                                        .where((e) =>
                                                                            (e.tasksId.status == 'todo') &&
                                                                            (e.tasksId.current ==
                                                                                1) &&
                                                                            (e.tasksId.deadline != '') &&
                                                                            ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'after') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal')))
                                                                        .toList()
                                                                        .length,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  )
                                                                : '0',
                                                            '0',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: ' (',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            _model.staff!.tasks.isNotEmpty
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    formatNumber(
                                                                      double.parse(((_model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'after') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length / _model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'before')).toList().length + _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'after') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length) *
                                                                              double.parse((((_model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'after')).toList().length + _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'before') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length) / _model.staff!.tasks.length) * 100).toStringAsFixed(2)))
                                                                          .toStringAsFixed(2)),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                    ),
                                                                    '0',
                                                                  )
                                                                : '0',
                                                            '0',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: '%) nhiệm vụ ',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Đang thực hiện ',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  decoration: const BoxDecoration(),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
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
                                                      _model.checkStatus5 =
                                                          true;
                                                      _model.statusFilter =
                                                          'Đang thực hiện';
                                                      _model.filterRequest = '';
                                                      setState(() {});
                                                      setState(() => _model
                                                          .listViewPagingController
                                                          ?.refresh());
                                                      _model.checkStatus2 =
                                                          false;
                                                      _model.checkStatus1 =
                                                          false;
                                                      _model.checkStatus3 =
                                                          false;
                                                      _model.checkStatus6 =
                                                          false;
                                                      _model.checkStatus4 =
                                                          false;
                                                      _model
                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                          if (_model
                                                                  .typeFilter ==
                                                              'Nhập văn bản') {
                                                            return 'submit_text';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Upload File') {
                                                            return 'upload_file';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Chụp ảnh') {
                                                            return 'image';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Check List Công việc') {
                                                            return 'to_do_list';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Phê duyệt') {
                                                            return ' approve';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                          if (_model
                                                                  .statusFilter ==
                                                              'Chưa thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Đang thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Hoàn thành') {
                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      _model.checkStatus5
                                                          ? 'Đang chọn xem'
                                                          : 'Xem',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: _model
                                                                    .checkStatus5
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 8.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                                Expanded(
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            _model.staff!.tasks.isNotEmpty
                                                                ? formatNumber(
                                                                    _model.staff
                                                                        ?.tasks
                                                                        .where((e) =>
                                                                            (e.tasksId.status ==
                                                                                'done') &&
                                                                            (e.tasksId.deadline != '') &&
                                                                            (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'before'))
                                                                        .toList()
                                                                        .length,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  )
                                                                : '0',
                                                            '0',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: ' (',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            _model.staff!.tasks.isNotEmpty
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    (double.parse(((_model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'before')).toList().length / _model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'before')).toList().length + _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'after') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length) *
                                                                                double.parse((((_model.staff!.tasks.where((e) => (e.tasksId.status == 'done') && (e.tasksId.deadline != '') && (functions.compareDatetime(e.tasksId.deadline, e.tasksId.dateEnd) == 'after')).toList().length + _model.staff!.tasks.where((e) => (e.tasksId.status == 'todo') && (e.tasksId.current == 1) && (e.tasksId.deadline != '') && ((functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'before') || (functions.compareDatetime(e.tasksId.deadline, getCurrentTimestamp.toString()) == 'equal'))).toList().length) / _model.staff!.tasks.length) * 100).toStringAsFixed(2)))
                                                                            .toStringAsFixed(2)))
                                                                        .toString(),
                                                                    '0',
                                                                  )
                                                                : '0',
                                                            '0',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: '%) nhiệm vụ ',
                                                          style: TextStyle(),
                                                        ),
                                                        const TextSpan(
                                                          text: 'Hoàn thành',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF33BA45),
                                                          ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  decoration: const BoxDecoration(),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
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
                                                      _model.checkStatus6 =
                                                          true;
                                                      _model.statusFilter =
                                                          'Hoàn thành';
                                                      _model.filterRequest = '';
                                                      setState(() {});
                                                      setState(() => _model
                                                          .listViewPagingController
                                                          ?.refresh());
                                                      _model.checkStatus2 =
                                                          false;
                                                      _model.checkStatus1 =
                                                          false;
                                                      _model.checkStatus3 =
                                                          false;
                                                      _model.checkStatus5 =
                                                          false;
                                                      _model.checkStatus4 =
                                                          false;
                                                      _model
                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                          if (_model
                                                                  .typeFilter ==
                                                              'Nhập văn bản') {
                                                            return 'submit_text';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Upload File') {
                                                            return 'upload_file';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Chụp ảnh') {
                                                            return 'image';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Check List Công việc') {
                                                            return 'to_do_list';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Phê duyệt') {
                                                            return ' approve';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                          if (_model
                                                                  .statusFilter ==
                                                              'Chưa thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Đang thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Hoàn thành') {
                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      _model.checkStatus6
                                                          ? 'Đang chọn xem'
                                                          : 'Xem',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: _model
                                                                    .checkStatus6
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    const Duration(milliseconds: 500),
                                                    () async {
                                                      setState(() => _model
                                                          .listViewPagingController
                                                          ?.refresh());
                                                      _model
                                                          .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateStart2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                          if (_model
                                                                  .typeFilter ==
                                                              'Nhập văn bản') {
                                                            return 'submit_text';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Upload File') {
                                                            return 'upload_file';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Chụp ảnh') {
                                                            return 'image';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Check List Công việc') {
                                                            return 'to_do_list';
                                                          } else if (_model
                                                                  .typeFilter ==
                                                              'Phê duyệt') {
                                                            return ' approve';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd1Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                          return DateTime.parse(
                                                                  var1)
                                                              .add(const Duration(
                                                                  days: 1))
                                                              .toString();
                                                        }(dateTimeFormat(
                                                          'yyyy-MM-dd',
                                                          functions
                                                              .stringToDateTime(
                                                                  _model
                                                                      .dateEnd2Filter),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                          if (_model
                                                                  .statusFilter ==
                                                              'Chưa thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Đang thực hiện') {
                                                            return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                          } else if (_model
                                                                  .statusFilter ==
                                                              'Hoàn thành') {
                                                            return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                      setState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText: 'Tìm kiếm...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    prefixIcon: const Icon(
                                                      Icons.search,
                                                      size: 24.0,
                                                    ),
                                                    suffixIcon:
                                                        _model.textController!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                  setState(() => _model
                                                                      .listViewPagingController
                                                                      ?.refresh());
                                                                  _model
                                                                      .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      functions.stringToDateTime(
                                                                          _model
                                                                              .dateStart1Filter),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                                      return DateTime.parse(
                                                                              var1)
                                                                          .add(const Duration(
                                                                              days: 1))
                                                                          .toString();
                                                                    }(dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      functions.stringToDateTime(
                                                                          _model
                                                                              .dateStart2Filter),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                                      if (_model
                                                                              .typeFilter ==
                                                                          'Nhập văn bản') {
                                                                        return 'submit_text';
                                                                      } else if (_model
                                                                              .typeFilter ==
                                                                          'Upload File') {
                                                                        return 'upload_file';
                                                                      } else if (_model
                                                                              .typeFilter ==
                                                                          'Chụp ảnh') {
                                                                        return 'image';
                                                                      } else if (_model
                                                                              .typeFilter ==
                                                                          'Check List Công việc') {
                                                                        return 'to_do_list';
                                                                      } else if (_model
                                                                              .typeFilter ==
                                                                          'Phê duyệt') {
                                                                        return ' approve';
                                                                      } else {
                                                                        return ' ';
                                                                      }
                                                                    }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      functions.stringToDateTime(
                                                                          _model
                                                                              .dateEnd1Filter),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                                      return DateTime.parse(
                                                                              var1)
                                                                          .add(const Duration(
                                                                              days: 1))
                                                                          .toString();
                                                                    }(dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      functions.stringToDateTime(
                                                                          _model
                                                                              .dateEnd2Filter),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                                      if (_model
                                                                              .statusFilter ==
                                                                          'Chưa thực hiện') {
                                                                        return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                                      } else if (_model
                                                                              .statusFilter ==
                                                                          'Đang thực hiện') {
                                                                        return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                                      } else if (_model
                                                                              .statusFilter ==
                                                                          'Hoàn thành') {
                                                                        return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                                      } else {
                                                                        return ' ';
                                                                      }
                                                                    }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                                  setState(
                                                                      () {});
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 18.0,
                                                                ),
                                                              )
                                                            : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  validator: _model
                                                      .textControllerValidator
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              FilterReportStaffDetailWidget(
                                                            filterSearch: _model
                                                                .textController
                                                                .text,
                                                            dateStart1: _model
                                                                .dateStart1Filter,
                                                            dateStart2: _model
                                                                .dateStart2Filter,
                                                            type: _model
                                                                .typeFilter,
                                                            status: _model
                                                                .statusFilter,
                                                            dateEnd1: _model
                                                                .dateEnd1Filter,
                                                            dateEnd2: _model
                                                                .dateEnd2Filter,
                                                            callback: (dateStart1Callback,
                                                                dateStart2Callback,
                                                                typeCallback,
                                                                dateEnd1Callback,
                                                                dateEnd2Callback,
                                                                statusCallback) async {
                                                              _model.dateStart1Filter =
                                                                  dateStart1Callback;
                                                              _model.dateStart2Filter =
                                                                  dateStart2Callback;
                                                              _model.typeFilter =
                                                                  typeCallback;
                                                              _model.statusFilter =
                                                                  statusCallback;
                                                              _model.dateEnd1Filter =
                                                                  dateEnd1Callback;
                                                              _model.dateEnd2Filter =
                                                                  dateEnd2Callback;
                                                              setState(() {});
                                                              setState(() => _model
                                                                  .listViewPagingController
                                                                  ?.refresh());
                                                              _model
                                                                  .filterRequest = '{\"_and\":[{}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  functions
                                                                      .stringToDateTime(
                                                                          _model
                                                                              .dateStart1Filter),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}\"}}}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_start\":{\"_lte\":\"${(String var1) {
                                                                  return DateTime
                                                                          .parse(
                                                                              var1)
                                                                      .add(const Duration(
                                                                          days:
                                                                              1))
                                                                      .toString();
                                                                }(dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  functions
                                                                      .stringToDateTime(
                                                                          _model
                                                                              .dateStart2Filter),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ))}\"}}}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"tasks\":{\"tasks_id\":{\"action_type\":{\"_eq\":\"${() {
                                                                  if (_model
                                                                          .typeFilter ==
                                                                      'Nhập văn bản') {
                                                                    return 'submit_text';
                                                                  } else if (_model
                                                                          .typeFilter ==
                                                                      'Upload File') {
                                                                    return 'upload_file';
                                                                  } else if (_model
                                                                          .typeFilter ==
                                                                      'Chụp ảnh') {
                                                                    return 'image';
                                                                  } else if (_model
                                                                          .typeFilter ==
                                                                      'Check List Công việc') {
                                                                    return 'to_do_list';
                                                                  } else if (_model
                                                                          .typeFilter ==
                                                                      'Phê duyệt') {
                                                                    return ' approve';
                                                                  } else {
                                                                    return ' ';
                                                                  }
                                                                }()}\"}}}}' : ' '}${_model.textController.text != '' ? ',{\"tasks\":{\"tasks_id\":{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":,{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  functions
                                                                      .stringToDateTime(
                                                                          _model
                                                                              .dateEnd1Filter),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}\"}}}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"tasks\":{\"tasks_id\":{\"date_end\":{\"_lte\":\"${(String var1) {
                                                                  return DateTime
                                                                          .parse(
                                                                              var1)
                                                                      .add(const Duration(
                                                                          days:
                                                                              1))
                                                                      .toString();
                                                                }(dateTimeFormat(
                                                                  'yyyy-MM-dd',
                                                                  functions
                                                                      .stringToDateTime(
                                                                          _model
                                                                              .dateEnd2Filter),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ))}\"}}}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                                  if (_model
                                                                          .statusFilter ==
                                                                      'Chưa thực hiện') {
                                                                    return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"0\"}}}}]}';
                                                                  } else if (_model
                                                                          .statusFilter ==
                                                                      'Đang thực hiện') {
                                                                    return ',{\"_and\":[{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"todo\"}}}},{\"tasks\":{\"tasks_id\":{\"current\":{\"_eq\":\"1\"}}}}]}';
                                                                  } else if (_model
                                                                          .statusFilter ==
                                                                      'Hoàn thành') {
                                                                    return ',{\"tasks\":{\"tasks_id\":{\"status\":{\"_eq\":\"done\"}}}}';
                                                                  } else {
                                                                    return ' ';
                                                                  }
                                                                }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"tasks\":{\"tasks_id\":{\"over_deadline\":{\"_eq\":\"1\"}}}}' : ' '}]}';
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((_model.textController.text !=
                                                                '') ||
                                                        ((_model.dateStart1Filter != null && _model.dateStart1Filter != '') &&
                                                            (_model.dateStart1Filter !=
                                                                '') &&
                                                            (_model.dateStart1Filter !=
                                                                ' ')) ||
                                                        ((_model.dateStart2Filter != null && _model.dateStart2Filter != '') &&
                                                            (_model.dateStart2Filter !=
                                                                '') &&
                                                            (_model.dateStart2Filter !=
                                                                ' ')) ||
                                                        ((_model.typeFilter != null && _model.typeFilter != '') &&
                                                            (_model.typeFilter !=
                                                                '') &&
                                                            (_model.typeFilter !=
                                                                ' ')) ||
                                                        ((_model.statusFilter != null && _model.statusFilter != '') &&
                                                            (_model.statusFilter !=
                                                                '') &&
                                                            (_model.statusFilter !=
                                                                ' ')) ||
                                                        ((_model.dateEnd1Filter != null &&
                                                                _model.dateEnd1Filter !=
                                                                    '') &&
                                                            (_model.dateEnd1Filter !=
                                                                '') &&
                                                            (_model.dateEnd1Filter !=
                                                                ' ')) ||
                                                        ((_model.dateEnd2Filter !=
                                                                    null &&
                                                                _model.dateEnd2Filter != '') &&
                                                            (_model.dateEnd2Filter != '') &&
                                                            (_model.dateEnd2Filter != ' ')))
                                                      Expanded(
                                                        child: Text(
                                                          'Đang tìm kiếm theo bộ lọc',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                    if ((_model.checkStatus1 == true) ||
                                                        (_model.checkStatus3 ==
                                                            true) ||
                                                        (_model.checkStatus2 ==
                                                            true) ||
                                                        (_model.checkStatus4 ==
                                                            true) ||
                                                        (_model.checkStatus5 ==
                                                            true) ||
                                                        (_model.checkStatus6 ==
                                                            true))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.checkStatus1 =
                                                              false;
                                                          _model.checkStatus2 =
                                                              false;
                                                          _model.checkStatus3 =
                                                              false;
                                                          _model.checkStatus4 =
                                                              false;
                                                          _model.checkStatus5 =
                                                              false;
                                                          _model.checkStatus6 =
                                                              false;
                                                          _model.statusFilter =
                                                              null;
                                                          _model.filterRequest =
                                                              '';
                                                          setState(() {});
                                                          setState(() => _model
                                                              .listViewPagingController
                                                              ?.refresh());
                                                        },
                                                        text: 'Xóa bộ lọc',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 32.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
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
                                                  ],
                                                ),
                                              ),
                                              if ((_model.checkStatus1 == true) ||
                                                  (_model.checkStatus3 ==
                                                      true) ||
                                                  (_model.checkStatus2 ==
                                                      true) ||
                                                  (_model.checkStatus4 ==
                                                      true) ||
                                                  (_model.checkStatus5 ==
                                                      true) ||
                                                  (_model.checkStatus6 == true))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (_model.checkStatus1)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc chưa thực hiện',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      if (_model.checkStatus2)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc đang thực hiện',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      if (_model.checkStatus3)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc hoàn thành',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      if (_model.checkStatus4)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc trễ deadline',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      if (_model.checkStatus5)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc đang thực hiện trễ deadline',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                      if (_model.checkStatus6)
                                                        Expanded(
                                                          child: Text(
                                                            'Công việc hoàn thành trễ deadline',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          PagedListView<ApiPagingParams,
                                              dynamic>.separated(
                                            pagingController:
                                                _model.setListViewController(
                                              (nextPageMarker) => TaskGroup
                                                  .getListTaskCall
                                                  .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                offset: nextPageMarker
                                                        .nextPageNumber *
                                                    20,
                                                limit: 20,
                                                filter: '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${widget.staffId}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.organization_id''',
                                                ).toString()}\"}}}${(_model.dateStart1Filter != null && _model.dateStart1Filter != '') && (_model.dateStart1Filter != ' ') ? ',{\"date_start\":{\"_gte\":\"${dateTimeFormat(
                                                    'yyyy-MM-dd',
                                                    functions.stringToDateTime(
                                                        _model
                                                            .dateStart1Filter),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}\"}}' : ' '}${(_model.dateStart2Filter != null && _model.dateStart2Filter != '') && (_model.dateStart2Filter != ' ') ? ',{\"date_start\":{\"_lte\":\"${(String var1) {
                                                    return DateTime.parse(var1)
                                                        .add(const Duration(days: 1))
                                                        .toString();
                                                  }(dateTimeFormat(
                                                    'yyyy-MM-dd',
                                                    functions.stringToDateTime(
                                                        _model
                                                            .dateStart2Filter),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))}\"}}' : ' '}${(_model.typeFilter != ' ') && (_model.typeFilter != null && _model.typeFilter != '') ? ',{\"action_type\":{\"_eq\":\"${() {
                                                    if (_model.typeFilter ==
                                                        'Nhập văn bản') {
                                                      return 'submit_text';
                                                    } else if (_model
                                                            .typeFilter ==
                                                        'Upload File') {
                                                      return 'upload_file';
                                                    } else if (_model
                                                            .typeFilter ==
                                                        'Chụp ảnh') {
                                                      return 'image';
                                                    } else if (_model
                                                            .typeFilter ==
                                                        'Check List Công việc') {
                                                      return 'to_do_list';
                                                    } else if (_model
                                                            .typeFilter ==
                                                        'Phê duyệt') {
                                                      return ' approve';
                                                    } else {
                                                      return ' ';
                                                    }
                                                  }()}\"}}' : ' '}${_model.textController.text != '' ? ',{\"name\":{\"_icontains\":\"${_model.textController.text}\"}}' : ' '}${(_model.dateEnd1Filter != null && _model.dateEnd1Filter != '') && (_model.dateEnd1Filter != ' ') ? ',{\"date_end\":{\"_gte\":\"${dateTimeFormat(
                                                    'yyyy-MM-dd',
                                                    functions.stringToDateTime(
                                                        _model.dateEnd1Filter),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}\"}}' : ' '}${(_model.dateEnd2Filter != null && _model.dateEnd2Filter != '') && (_model.dateEnd2Filter != ' ') ? ',{\"date_end\":{\"_lte\":\"${(String var1) {
                                                    return DateTime.parse(var1)
                                                        .add(const Duration(days: 1))
                                                        .toString();
                                                  }(dateTimeFormat(
                                                    'yyyy-MM-dd',
                                                    functions.stringToDateTime(
                                                        _model.dateEnd2Filter),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))}\"}}' : ' '}${(_model.statusFilter != ' ') && (_model.statusFilter != null && _model.statusFilter != '') ? () {
                                                    if (_model.statusFilter ==
                                                        'Chưa thực hiện') {
                                                      return ',{\"_and\":[{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"0\"}}]}';
                                                    } else if (_model
                                                            .statusFilter ==
                                                        'Đang thực hiện') {
                                                      return ',{\"_and\":[{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                                    } else if (_model
                                                            .statusFilter ==
                                                        'Hoàn thành') {
                                                      return ',{\"status\":{\"_eq\":\"done\"}}';
                                                    } else {
                                                      return ' ';
                                                    }
                                                  }() : ' '}${(_model.checkStatus4 == true) || (_model.checkStatus5 == true) || (_model.checkStatus6 == true) ? ',{\"over_deadline\":{\"_eq\":\"1\"}}' : ' '}]}',
                                                sort: '-date_created',
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
                                                  child:
                                                      DataNotFoundRowNewWidget(),
                                                ),
                                              ),
                                              itemBuilder:
                                                  (context, _, dataListIndex) {
                                                final dataListItem = _model
                                                    .listViewPagingController!
                                                    .itemList![dataListIndex];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 1.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          1.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 16.0,
                                                                8.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
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
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      '${formatNumber(
                                                                        dataListIndex +
                                                                            1,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                      )}. ${dataListItem.name}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '#${dataListItem.workflowId.name}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            () {
                                                                          if (dataListItem.status ==
                                                                              'done') {
                                                                            return FlutterFlowTheme.of(context).accent2;
                                                                          } else if ((dataListItem.status == 'todo') &&
                                                                              (dataListItem.current == 1)) {
                                                                            return FlutterFlowTheme.of(context).accent1;
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).alternate;
                                                                          }
                                                                        }(),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                      ),
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          () {
                                                                            if (dataListItem.status ==
                                                                                'done') {
                                                                              return 'Hoàn thành';
                                                                            } else if ((dataListItem.status == 'todo') &&
                                                                                (dataListItem.current == 1)) {
                                                                              return 'Đang thực hiện';
                                                                            } else {
                                                                              return 'Chờ thực hiện';
                                                                            }
                                                                          }(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: () {
                                                                                  if (dataListItem.status == 'done') {
                                                                                    return FlutterFlowTheme.of(context).secondary;
                                                                                  } else if ((dataListItem.status == 'todo') && (dataListItem.current == 1)) {
                                                                                    return FlutterFlowTheme.of(context).primary;
                                                                                  } else {
                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                  }
                                                                                }(),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (() {
                                                                    if ((dataListItem.status == 'todo') &&
                                                                        (dataListItem.current ==
                                                                            1) &&
                                                                        (dataListItem.deadline != null &&
                                                                            dataListItem.deadline !=
                                                                                '') &&
                                                                        ((functions.compareDatetime(dataListItem.deadline, getCurrentTimestamp.toString()) ==
                                                                                'before') &&
                                                                            (functions.compareDatetime(dataListItem.deadline, getCurrentTimestamp.toString()) ==
                                                                                'equal'))) {
                                                                      return true;
                                                                    } else if ((dataListItem
                                                                                .status ==
                                                                            'done') &&
                                                                        (dataListItem.deadline !=
                                                                                null &&
                                                                            dataListItem.deadline !=
                                                                                '') &&
                                                                        (functions.compareDatetime(dataListItem.deadline,
                                                                                getCurrentTimestamp.toString()) ==
                                                                            'after')) {
                                                                      return true;
                                                                    } else {
                                                                      return false;
                                                                    }
                                                                  }())
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            24.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0x2DEE6060),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              4.0,
                                                                              8.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'Trễ deadline',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: const Color(0xFFF20000),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                        if ((dataListItem
                                                                        .description !=
                                                                    null &&
                                                                dataListItem
                                                                        .description !=
                                                                    '') &&
                                                            ('1' == '2'))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .notes_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      dataListItem
                                                                          .description,
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
                                                              ].divide(const SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ),
                                                        if ((dataListItem
                                                                        .timeOperate !=
                                                                    null &&
                                                                dataListItem
                                                                        .timeOperate !=
                                                                    '') &&
                                                            ('1' == '2'))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .av_timer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Bắt đầu (dự kiến):',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    dataListItem
                                                                        .timeOperate,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
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
                                                              ].divide(const SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ),
                                                        if ((dataListItem
                                                                    .estimateInSecond !=
                                                                0) &&
                                                            ('1' == '2'))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .av_timer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'T.gian thực hiện (dự kiến):',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    dataListItem
                                                                        .estimateInSecond
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
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
                                                              ].divide(const SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (dataListItem
                                                                        .dateStart !=
                                                                    null &&
                                                                dataListItem
                                                                        .dateStart !=
                                                                    '')
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .date_range_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'B.đầu:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'HH:mm dd/MM/yy',
                                                                        functions
                                                                            .stringToDateTime(dataListItem.dateStart),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                  ],
                                                                ),
                                                              ),
                                                            if (dataListItem
                                                                        .dateEnd !=
                                                                    null &&
                                                                dataListItem
                                                                        .dateEnd !=
                                                                    '')
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'K.thúc:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'HH:mm dd/MM/yy',
                                                                        functions
                                                                            .stringToDateTime(dataListItem.dateEnd),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                  ],
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Biểu đồ báo cáo',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                if ('1' == '2')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController2 ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.dropDownValue2 ??=
                                                            '3',
                                                      ),
                                                      options:
                                                          List<String>.from([
                                                        '0',
                                                        '1',
                                                        '2',
                                                        '3'
                                                      ]),
                                                      optionLabels: const [
                                                        'Tuần này',
                                                        'Tháng này',
                                                        'Năm nay',
                                                        'Tổng'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownValue2 =
                                                              val),
                                                      width: 120.0,
                                                      height: 48.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 4.0,
                                                      margin:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                if ('1' == '2')
                                                  Builder(
                                                    builder: (context) =>
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .fileExcel,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showAlignedDialog(
                                                          context: context,
                                                          isGlobal: false,
                                                          avoidOverflow: true,
                                                          targetAnchor:
                                                              const AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          followerAnchor:
                                                              const AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          builder:
                                                              (dialogContext) {
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    SizedBox(
                                                                  height: 190.0,
                                                                  width: 300.0,
                                                                  child:
                                                                      ExportExcelGetOneWidget(
                                                                    json: _model
                                                                        .jsonExport,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
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
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
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
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ExportExcelGetOneWidget(
                                                                json: _model
                                                                    .jsonExport,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/export-spreadsheet-512.webp',
                                                        width: 45.0,
                                                        height: 45.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 0.0),
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          160.0,
                                                                      height:
                                                                          160.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        child:
                                                                            FlutterFlowPieChart(
                                                                          data:
                                                                              FFPieChartData(
                                                                            values:
                                                                                _model.listPercentProgram,
                                                                            colors:
                                                                                chartPieChartColorsList2,
                                                                            radius: [
                                                                              80.0
                                                                            ],
                                                                            borderColor: [
                                                                              FlutterFlowTheme.of(context).secondaryBackground
                                                                            ],
                                                                          ),
                                                                          donutHoleRadius:
                                                                              0.0,
                                                                          donutHoleColor:
                                                                              Colors.transparent,
                                                                          sectionLabelType:
                                                                              PieChartSectionLabelType.percent,
                                                                          sectionLabelStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if ((_model.staff!.staffPrograms.isNotEmpty
                                                                          ? formatNumber(
                                                                              _model.staff?.staffPrograms.length,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                            )
                                                                          : '0') ==
                                                                      '0')
                                                                    Container(
                                                                      width:
                                                                          160.0,
                                                                      height:
                                                                          160.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(90.0),
                                                                      ),
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (_model.staff !=
                                                                null)
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (_model
                                                                              .staff !=
                                                                          null)
                                                                        RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'Tổng ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: _model.staff!.staffPrograms.isNotEmpty
                                                                                    ? formatNumber(
                                                                                        _model.staff!.staffPrograms.length,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.commaDecimal,
                                                                                      )
                                                                                    : '0',
                                                                                style: const TextStyle(
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              ),
                                                                              const TextSpan(
                                                                                text: ' chương trình',
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'StudyProgramListUser',
                                                                            queryParameters:
                                                                                {
                                                                              'checkStatusPrograms': serializeParam(
                                                                                'draft',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Chưa học (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffPrograms.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffPrograms.where((e) => e.status == 'draft').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffPrograms.isNotEmpty ? formatNumber(
                                                                                    _model.staff?.staffPrograms.where((e) => e.status == 'draft').toList().length,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  ) : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'StudyProgramListUser',
                                                                            queryParameters:
                                                                                {
                                                                              'checkStatusPrograms': serializeParam(
                                                                                'inprogress',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Đang học (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffPrograms.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffPrograms.where((e) => e.status == 'inprogress').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffPrograms.isNotEmpty ? formatNumber(
                                                                                    _model.staff?.staffPrograms.where((e) => e.status == 'inprogress').toList().length,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  ) : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'StudyProgramListUser',
                                                                            queryParameters:
                                                                                {
                                                                              'checkStatusPrograms': serializeParam(
                                                                                'done',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: const Color(0xFF33BA45),
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Hoàn thành (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffPrograms.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffPrograms.where((e) => e.status == 'done').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffPrograms.isNotEmpty ? formatNumber(
                                                                                    _model.staff?.staffPrograms.where((e) => e.status == 'done').toList().length,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  ) : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          160.0,
                                                                      height:
                                                                          120.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        child:
                                                                            FlutterFlowPieChart(
                                                                          data:
                                                                              FFPieChartData(
                                                                            values:
                                                                                _model.listPercentLesson,
                                                                            colors:
                                                                                chartPieChartColorsList3,
                                                                            radius: [
                                                                              60.0
                                                                            ],
                                                                            borderColor: [
                                                                              FlutterFlowTheme.of(context).secondaryBackground
                                                                            ],
                                                                          ),
                                                                          donutHoleRadius:
                                                                              0.0,
                                                                          donutHoleColor:
                                                                              Colors.transparent,
                                                                          sectionLabelType:
                                                                              PieChartSectionLabelType.percent,
                                                                          sectionLabelStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if ((_model.staff!.staffLessions.isNotEmpty
                                                                          ? formatNumber(
                                                                              _model.staff?.staffLessions.length,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                            )
                                                                          : '0') ==
                                                                      '0')
                                                                    Container(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          120.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(90.0),
                                                                      ),
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (_model.staff !=
                                                                null)
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Tổng ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: _model.staff!.staffLessions.isNotEmpty
                                                                                  ? formatNumber(
                                                                                      _model.staff!.staffLessions.length,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.commaDecimal,
                                                                                    )
                                                                                  : '0',
                                                                              style: const TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            ),
                                                                            const TextSpan(
                                                                              text: ' bài học',
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'LessonList_Homepage',
                                                                            queryParameters:
                                                                                {
                                                                              'statusLesson': serializeParam(
                                                                                'draft',
                                                                                ParamType.String,
                                                                              ),
                                                                              'statusLove': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lessonNewCreate': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lesonHistory': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'checkLesson': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Chưa học (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffLessions.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffLessions.where((e) => e.status == 'draft').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffLessions.isNotEmpty ? formatNumber(
                                                                                    _model.staff?.staffLessions.where((e) => e.status == 'draft').toList().length,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  ) : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'LessonList_Homepage',
                                                                            queryParameters:
                                                                                {
                                                                              'statusLesson': serializeParam(
                                                                                'inpogress',
                                                                                ParamType.String,
                                                                              ),
                                                                              'statusLove': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lessonNewCreate': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lesonHistory': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'checkLesson': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Đang học (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffLessions.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffLessions.where((e) => e.status == 'inprogress').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffLessions.isNotEmpty
                                                                                    ? formatNumber(
                                                                                        _model.staff?.staffLessions.where((e) => e.status == 'inprogress').toList().length,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.commaDecimal,
                                                                                      )
                                                                                    : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'LessonList_Homepage',
                                                                            queryParameters:
                                                                                {
                                                                              'statusLesson': serializeParam(
                                                                                'done',
                                                                                ParamType.String,
                                                                              ),
                                                                              'statusLove': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lessonNewCreate': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'lesonHistory': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'checkLesson': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                              'staffId': serializeParam(
                                                                                widget.staffId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: const TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Hoàn thành (',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: _model.staff!.staffLessions.isNotEmpty
                                                                                          ? formatNumber(
                                                                                              _model.staff!.staffLessions.where((e) => e.status == 'done').toList().length,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                            )
                                                                                          : '0',
                                                                                      style: const TextStyle(
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ')',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((_model.staff!.staffLessions.isNotEmpty ? formatNumber(
                                                                                    _model.staff?.staffLessions.where((e) => e.status == 'done').toList().length,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                  ) : '0') !=
                                                                                '0')
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                child: Text(
                                                                                  'Xem',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Nunito Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontStyle: FontStyle.italic,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ].divide(const SizedBox(width: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      if (_model.staff != null)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        const TextSpan(
                                                                          text:
                                                                              'Tổng ',
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: _model.staff!.staffTests.isNotEmpty
                                                                              ? formatNumber(
                                                                                  _model.staff!.staffTests.length,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.commaDecimal,
                                                                                )
                                                                              : '0',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                        const TextSpan(
                                                                          text:
                                                                              ' bài thi đã làm. Trong đó: ',
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
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
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((_model.staff!.staffTests.isNotEmpty ? formatNumber(
                                                                      _model
                                                                          .staff
                                                                          ?.staffTests
                                                                          .length,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                    ) : '0') !=
                                                                  '0')
                                                                InkWell(
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
                                                                    context
                                                                        .pushNamed(
                                                                      'DoTestList',
                                                                      queryParameters:
                                                                          {
                                                                        'lessionId':
                                                                            serializeParam(
                                                                          '',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'status':
                                                                            serializeParam(
                                                                          0,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'staffId':
                                                                            serializeParam(
                                                                          widget
                                                                              .staffId,
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
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Xem',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model.staff != null)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 16.0,
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            _model.staff?.staffTests.where((e) => ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() == '1').toList().length,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.commaDecimal,
                                                                          ),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            ' (',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: _model.staff!.staffTests.isNotEmpty
                                                                            ? (double.parse((valueOrDefault<int>(
                                                                                          _model.staff?.staffTests.where((e) => ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() == '1').toList().length,
                                                                                          0,
                                                                                        ) /
                                                                                        _model.staff!.staffTests.length)
                                                                                    .toStringAsFixed(2)))
                                                                                .toString()
                                                                            : '0',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            '%) bài thi ',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            'Không đạt',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (valueOrDefault<String>(
                                                                    formatNumber(
                                                                      _model
                                                                          .staff
                                                                          ?.staffTests
                                                                          .where((e) =>
                                                                              ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() ==
                                                                              '1')
                                                                          .toList()
                                                                          .length,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                    ),
                                                                    '0',
                                                                  ) !=
                                                                  '0')
                                                                InkWell(
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
                                                                    context
                                                                        .pushNamed(
                                                                      'DoTestList',
                                                                      queryParameters:
                                                                          {
                                                                        'lessionId':
                                                                            serializeParam(
                                                                          '',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'status':
                                                                            serializeParam(
                                                                          0,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'staffId':
                                                                            serializeParam(
                                                                          widget
                                                                              .staffId,
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
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Xem',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model.staff != null)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      24.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 16.0,
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            _model.staff?.staffTests.where((e) => ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() != '1').toList().length,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.commaDecimal,
                                                                          ),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            ' (',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: _model.staff!.staffTests.isNotEmpty
                                                                            ? (double.parse(((valueOrDefault<int>(
                                                                                              _model.staff?.staffTests.where((e) => ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() != '1').toList().length,
                                                                                              0,
                                                                                            ) /
                                                                                            _model.staff!.staffTests.length) *
                                                                                        100)
                                                                                    .toStringAsFixed(2)))
                                                                                .toString()
                                                                            : '0',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            '%) bài thi ',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            'Đạt',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFF33BA45),
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (valueOrDefault<String>(
                                                                    formatNumber(
                                                                      _model
                                                                          .staff
                                                                          ?.staffTests
                                                                          .where((e) =>
                                                                              ((e.goodScore).compareTo(double.parse(e.percentCorrect))).toString() !=
                                                                              '1')
                                                                          .toList()
                                                                          .length,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                    ),
                                                                    '0',
                                                                  ) !=
                                                                  '0')
                                                                InkWell(
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
                                                                    context
                                                                        .pushNamed(
                                                                      'DoTestList',
                                                                      queryParameters:
                                                                          {
                                                                        'lessionId':
                                                                            serializeParam(
                                                                          '',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'status':
                                                                            serializeParam(
                                                                          1,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'staffId':
                                                                            serializeParam(
                                                                          widget
                                                                              .staffId,
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
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Xem',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                              ),
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
                      ),
                    if (_model.staff == null)
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.LoadingPageWidget(
                          width: double.infinity,
                          height: double.infinity,
                          size: 45.0,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
