import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'procedure_published_model.dart';
export 'procedure_published_model.dart';

class ProcedurePublishedWidget extends StatefulWidget {
  const ProcedurePublishedWidget({
    super.key,
    required this.callback,
  });

  final Future Function()? callback;

  @override
  State<ProcedurePublishedWidget> createState() =>
      _ProcedurePublishedWidgetState();
}

class _ProcedurePublishedWidgetState extends State<ProcedurePublishedWidget> {
  late ProcedurePublishedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedurePublishedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultProcedureList =
          await ProcedureTemplateGroup.workflowsListCall.call(
        accessToken: FFAppState().accessToken,
        filter: (FFAppState().user.role ==
                    'a8d33527-375b-4599-ac70-6a3fcad1de39') ||
                (FFAppState().user.role ==
                    '82073000-1ba2-43a4-a55c-459d17c23b68')
            ? '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString()}\"}},{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}}]}'
            : '{\"_or\":[{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString()}\"}},{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}}]},{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.organization_id''',
              ).toString().toString()}\"}},{\"departments\":{\"departments_id\":{\"id\":{\"_eq\":\"${getJsonField(
                FFAppState().staffLogin,
                r'''$.department_id''',
              ).toString().toString()}\"}}}}]}]}',
      );

      if ((_model.apiResultProcedureList?.succeeded ?? true)) {
        _model.workflowList = WorkflowsListDataStruct.maybeFromMap(
                (_model.apiResultProcedureList?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<WorkflowsStruct>();
        setState(() {});
      }
      _model.isLoad = true;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Stack(
            children: [
              if (_model.isLoad == true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Thực hiện công việc',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.workflowList.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= '',
                                      ),
                                      options: List<String>.from(_model
                                          .workflowList
                                          .map((e) => e.id)
                                          .toList()),
                                      optionLabels: _model.workflowList
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue = val);
                                        _model.workflowSelected = _model
                                            .workflowList
                                            .where((e) =>
                                                e.id == _model.dropDownValue)
                                            .toList()
                                            .first;
                                        _model.staffOne = (getJsonField(
                                          _model.workflowSelected!.toMap(),
                                          r'''$.steps''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<ProcedurePublishedStepStruct?>(
                                                        ProcedurePublishedStepStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    ProcedurePublishedStepStruct?>)
                                            .withoutNulls
                                            .where((e) => e.number == 1)
                                            .toList()
                                            .cast<
                                                ProcedurePublishedStepStruct>();
                                        setState(() {});
                                      },
                                      width: 300.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Chọn quy trình',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 1.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                if ((_model.workflowList.isEmpty) &&
                                    (FFAppState().user.role !=
                                        '3755a98d-f064-45cd-80e4-5084ab1dd2c4'))
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .noColor,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Chưa có quy trình nào!',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'ProcedureCreate',
                                                  queryParameters: {
                                                    'checkRouter':
                                                        serializeParam(
                                                      'task',
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
                                              text: 'Thêm',
                                              icon: const Icon(
                                                Icons.add,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_model.workflowSelected?.cron != null &&
                                    _model.workflowSelected?.cron != '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final datePicked1Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (datePicked1Date != null) {
                                          safeSetState(() {
                                            _model.datePicked1 = DateTime(
                                              datePicked1Date.year,
                                              datePicked1Date.month,
                                              datePicked1Date.day,
                                            );
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.event_repeat,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 0.0),
                                            child: Text(
                                              'Thiết lập lặp: ${_model.workflowSelected?.cron != null && _model.workflowSelected?.cron != '' ? () {
                                                  if (functions.checkTypeCron(_model.workflowSelected!.cron) ==
                                                      '3') {
                                                    return 'Trong tháng';
                                                  } else if (functions.checkTypeCron(_model.workflowSelected!.cron) ==
                                                      '2') {
                                                    return 'Trong tuần';
                                                  } else if (functions.checkTypeCron(_model.workflowSelected!.cron) ==
                                                      '1') {
                                                    return 'Hàng ngày';
                                                  } else {
                                                    return 'Không lặp';
                                                  }
                                                }() : ' '}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      26.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    _model.workflowSelected?.cron != null &&
                                            _model.workflowSelected?.cron != ''
                                        ? ((List<String> var1) {
                                            return var1.join(", ");
                                          }(functions
                                            .cronToType(
                                                _model.workflowSelected!.cron)
                                            .toList()))
                                        : ' ',
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                if (_model.workflowSelected?.cron != null &&
                                    _model.workflowSelected?.cron != '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final datePicked2Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (datePicked2Date != null) {
                                          safeSetState(() {
                                            _model.datePicked2 = DateTime(
                                              datePicked2Date.year,
                                              datePicked2Date.month,
                                              datePicked2Date.day,
                                            );
                                          });
                                        }
                                        _model.limitPublished =
                                            functions.totalLimitPublished(
                                                dateTimeFormat(
                                                  'dd/MM/yyyy',
                                                  _model.datePicked2,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                functions
                                                    .cronToType(_model
                                                        .workflowSelected!.cron)
                                                    .toList(),
                                                functions.checkTypeCron(_model
                                                    .workflowSelected!.cron));
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 0.0),
                                            child: Text(
                                              _model.datePicked2 != null
                                                  ? 'Kết thúc chạy lặp: ${dateTimeFormat(
                                                      'dd/MM/yyyy',
                                                      _model.datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}'
                                                  : 'Chọn thời gian kết thúc chạy lặp',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                if (_model.workflowSelected != null)
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Sơ đồ quy trình',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final listView = functions
                                                  .sortArrayStepWorkflows(_model
                                                      .workflowSelected!.steps
                                                      .toList())
                                                  .toList();

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
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        if (listViewIndex > 0)
                                                          const Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 15.0,
                                                                  child:
                                                                      VerticalDivider(
                                                                    thickness:
                                                                        3.0,
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
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            40.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                            return const Color(0xFF3ABEF9);
                                                                          } else if ((int var1) {
                                                                            return var1 % 5 == 1
                                                                                ? true
                                                                                : false;
                                                                          }(listViewIndex)) {
                                                                            return const Color(0xFF26355D);
                                                                          } else if ((int var1) {
                                                                            return var1 % 5 == 2
                                                                                ? true
                                                                                : false;
                                                                          }(listViewIndex)) {
                                                                            return const Color(0xFF059212);
                                                                          } else if ((int var1) {
                                                                            return var1 % 5 == 3
                                                                                ? true
                                                                                : false;
                                                                          }(listViewIndex)) {
                                                                            return const Color(0xFFFF407D);
                                                                          } else if ((int var1) {
                                                                            return var1 % 5 == 4
                                                                                ? true
                                                                                : false;
                                                                          }(listViewIndex)) {
                                                                            return const Color(0xFF7E8EF1);
                                                                          } else {
                                                                            return const Color(0x00000000);
                                                                          }
                                                                        }(),
                                                                        boxShadow: const [
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
                                                                            const BorderRadius.only(
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
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
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
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          55.0,
                                                                      height:
                                                                          55.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x6814181B),
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
                                                                            BorderRadius.circular(100.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).noColor,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Bước',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: () {
                                                                                    if ((int var1) {
                                                                                      return var1 % 5 == 0 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF3ABEF9);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 1 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF26355D);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 2 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF059212);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 3 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFFFF407D);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 4 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF7E8EF1);
                                                                                    } else {
                                                                                      return const Color(0x00000000);
                                                                                    }
                                                                                  }(),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            (listViewIndex + 1).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: () {
                                                                                    if ((int var1) {
                                                                                      return var1 % 5 == 0 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF3ABEF9);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 1 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF26355D);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 2 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF059212);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 3 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFFFF407D);
                                                                                    } else if ((int var1) {
                                                                                      return var1 % 5 == 4 ? true : false;
                                                                                    }(listViewIndex)) {
                                                                                      return const Color(0xFF7E8EF1);
                                                                                    } else {
                                                                                      return const Color(0x00000000);
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
                                                            (functions
                                                                    .sortArrayStepWorkflows(_model
                                                                        .workflowSelected!
                                                                        .steps
                                                                        .toList())
                                                                    .length -
                                                                1))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        30.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                if ((_model.workflowList.isEmpty) &&
                                    (FFAppState().user.role ==
                                        '3755a98d-f064-45cd-80e4-5084ab1dd2c4'))
                                  Flexible(
                                    child: Container(
                                      width: 3.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.dataNotFoundModel,
                                          updateCallback: () => setState(() {}),
                                          child: const DataNotFoundWidget(),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Hủy',
                                  options: FFButtonOptions(
                                    height: 44.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.workflowList.isNotEmpty)
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var shouldSetState = false;
                                    if (_model.workflowSelected?.type ==
                                        'schedule') {
                                      _model.reloadTokenUpdateLimit =
                                          await action_blocks
                                              .tokenReload(context);
                                      shouldSetState = true;
                                      if (!_model.reloadTokenUpdateLimit!) {
                                        setState(() {});
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                      _model.apiResultUpdateLimit =
                                          await ProcedurePublishedGroup
                                              .procedureTemplateUpdateLimitPublishedCall
                                              .call(
                                        id: _model.workflowSelected?.id,
                                        accessToken: FFAppState().accessToken,
                                        limitPublished: _model.limitPublished,
                                      );

                                      shouldSetState = true;
                                      if (!(_model.apiResultUpdateLimit
                                              ?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Lỗi thiết lập hời hạn chạy tuần lặp!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    }
                                    _model.procedurePublished =
                                        await action_blocks
                                            .tokenReload(context);
                                    shouldSetState = true;
                                    if (!_model.procedurePublished!) {
                                      setState(() {});
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                    _model.apiResultProcedurePublished =
                                        await ProcedurePublishedGroup
                                            .procedurePublishedCall
                                            .call(
                                      accessToken: FFAppState().accessToken,
                                      workflowId: _model.workflowSelected?.id,
                                    );

                                    shouldSetState = true;
                                    if ((_model.apiResultProcedurePublished
                                            ?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Tạo công việc thành công!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      await widget.callback?.call();
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Lỗi tạo công việc!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                  text: 'Xác nhận',
                                  options: FFButtonOptions(
                                    height: 44.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (_model.isLoad == false)
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
      ),
    );
  }
}
