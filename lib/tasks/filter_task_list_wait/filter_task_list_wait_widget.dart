import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'filter_task_list_wait_model.dart';
export 'filter_task_list_wait_model.dart';

class FilterTaskListWaitWidget extends StatefulWidget {
  const FilterTaskListWaitWidget({
    super.key,
    this.filterSearch,
    required this.callback,
    this.dateStart,
    this.dateEnd,
    this.type,
  });

  final String? filterSearch;
  final Future Function(List<TaskListStruct>? data, String? dateStartCallback,
      String? dateEndCallback, String? typeCallback)? callback;
  final String? dateStart;
  final String? dateEnd;
  final String? type;

  @override
  State<FilterTaskListWaitWidget> createState() =>
      _FilterTaskListWaitWidgetState();
}

class _FilterTaskListWaitWidgetState extends State<FilterTaskListWaitWidget> {
  late FilterTaskListWaitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterTaskListWaitModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.dateStart = widget.dateStart!;
        _model.dateEnd = widget.dateEnd!;
        _model.type = widget.type!;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bộ lọc',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kiểu công việc:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      FlutterFlowChoiceChips(
                        options: const [
                          ChipData('Nhập văn bản'),
                          ChipData('Chụp ảnh'),
                          ChipData('Upload File'),
                          ChipData('Check List Công việc'),
                          ChipData('Phê duyệt')
                        ],
                        onChanged: (val) =>
                            setState(() => _model.typeValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.typeValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.typeValueController ??=
                            FormFieldController<List<String>>(
                          [
                            widget.type != null && widget.type != ''
                                ? widget.type!
                                : ' '
                          ],
                        ),
                        wrapped: true,
                      ),
                    ].divide(const SizedBox(height: 4.0)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngày xuất bản',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
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
                                setState(() {
                                  _model.dateStart = dateTimeFormat(
                                    'yyyy-MM-dd',
                                    _model.datePicked1,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  );
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    _model.dateStart != ''
                                        ? dateTimeFormat(
                                            'dd/MM/yyyy',
                                            functions.stringToDateTime(
                                                _model.dateStart),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : 'Từ ngày',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
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
                                setState(() {
                                  _model.dateEnd = dateTimeFormat(
                                    'yyyy-MM-dd',
                                    _model.datePicked2,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  );
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    _model.dateEnd != ''
                                        ? dateTimeFormat(
                                            'dd/MM/yyyy',
                                            functions.stringToDateTime(
                                                _model.dateEnd),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : 'Đến hết ngày',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 4.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.typeValueController?.reset();
                            });
                            setState(() {
                              _model.dateStart = '';
                              _model.dateEnd = '';
                              _model.type = '';
                            });
                            _model.clearFilterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.clearFilterToken!) {
                              _model.apiResultClearFilter =
                                  await TaskGroup.getListTaskCall.call(
                                accessToken: FFAppState().accessToken,
                                filter:
                                    '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                  FFAppState().staffLogin,
                                  r'''$.id''',
                                ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                  FFAppState().staffLogin,
                                  r'''$.organization_id''',
                                ).toString()}\"}}}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"name\":{\"_icontains\":\"${widget.filterSearch}\"}}' : ' '}]}',
                              );
                              if ((_model.apiResultClearFilter?.succeeded ??
                                  true)) {
                                await widget.callback?.call(
                                  TaskListDataStruct.maybeFromMap((_model
                                              .apiResultClearFilter?.jsonBody ??
                                          ''))
                                      ?.data,
                                  _model.dateStart,
                                  _model.dateEnd,
                                  ' ',
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              setState(() {});
                            }

                            setState(() {});
                          },
                          text: 'Xoá bộ lọc',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.filterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.filterToken!) {
                              _model.apiResultFilter =
                                  await TaskGroup.getListTaskCall.call(
                                accessToken: FFAppState().accessToken,
                                filter: '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                  FFAppState().staffLogin,
                                  r'''$.id''',
                                ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                  FFAppState().staffLogin,
                                  r'''$.organization_id''',
                                ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"0\"}}${_model.dateStart != '' ? ',{\"date_created\":{\"_gte\":\"${dateTimeFormat(
                                    'yyyy-MM-dd',
                                    functions
                                        .stringToDateTime(_model.dateStart),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}\"}}' : ' '}${_model.dateEnd != '' ? ((String var1) {
                                    return DateTime.parse(var1)
                                        .add(const Duration(days: 1))
                                        .toString();
                                  }(',{\"date_created\":{\"_lte\":\"${dateTimeFormat(
                                    'yyyy-MM-dd',
                                    functions.stringToDateTime(_model.dateEnd),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}\"}}')) : ' '}${_model.typeValue != null && _model.typeValue != '' ? ',{\"action_type\":{\"_eq\":\"${() {
                                    if (_model.typeValue == 'Nhập văn bản') {
                                      return 'submit_text';
                                    } else if (_model.typeValue ==
                                        'Upload File') {
                                      return 'upload_file';
                                    } else if (_model.typeValue == 'Chụp ảnh') {
                                      return 'image';
                                    } else if (_model.typeValue ==
                                        'Check List Công việc') {
                                      return 'to_do_list';
                                    } else if (_model.typeValue ==
                                        'Phê duyệt') {
                                      return 'approve';
                                    } else {
                                      return ' ';
                                    }
                                  }()}\"}}' : ' '}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"name\":{\"_icontains\":\"${widget.filterSearch}\"}}' : ' '}]}',
                              );
                              if ((_model.apiResultFilter?.succeeded ?? true)) {
                                await widget.callback?.call(
                                  TaskListDataStruct.maybeFromMap(
                                          (_model.apiResultFilter?.jsonBody ??
                                              ''))
                                      ?.data,
                                  _model.dateStart,
                                  _model.dateEnd,
                                  _model.typeValue,
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              setState(() {});
                            }

                            setState(() {});
                          },
                          text: 'Xác nhận',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF33BA45),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 16.0)),
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
