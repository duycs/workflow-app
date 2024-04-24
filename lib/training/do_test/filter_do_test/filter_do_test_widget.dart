import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'filter_do_test_model.dart';
export 'filter_do_test_model.dart';

class FilterDoTestWidget extends StatefulWidget {
  const FilterDoTestWidget({
    super.key,
    required this.filterSearch,
    required this.dateStart,
    required this.dateEnd,
    required this.callback,
  });

  final String? filterSearch;
  final String? dateStart;
  final String? dateEnd;
  final Future Function(List<StaffsTestsListStruct>? listCallback,
      String? dateStartCallback, String? dateEndCallback)? callback;

  @override
  State<FilterDoTestWidget> createState() => _FilterDoTestWidgetState();
}

class _FilterDoTestWidgetState extends State<FilterDoTestWidget> {
  late FilterDoTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterDoTestModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.dateStart = widget.dateStart!;
        _model.dateEnd = widget.dateEnd!;
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
                            fontFamily: 'Readex Pro',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Khoảng thời gian làm bài thi :',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
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
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
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
                                'yyyy-MM-dd', _model.datePicked1);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Text(
                              (_model.dateStart != '') &&
                                      (_model.dateStart != ' ')
                                  ? _model.dateStart
                                  : 'Ngày bắt đầu',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
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
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
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
                                'yyyy-MM-dd', _model.datePicked2);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Text(
                              (_model.dateEnd != '') &&
                                      (_model.dateEnd != ' ')
                                  ? _model.dateEnd
                                  : 'Ngày kết thúc',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
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
                            _model.clearListStaffTestToken =
                                await action_blocks.tokenReload(context);
                            if (_model.clearListStaffTestToken!) {
                              _model.apiResultClearListStaffTest =
                                  await DoTestGroup.staffsTestsListCall.call(
                                accessToken: FFAppState().accessToken,
                                filter:
                                    '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"test_id\":{\"name\":{\"_icontains\":\"${widget.filterSearch}\"}}}' : ' '}]}',
                              );
                              if ((_model
                                      .apiResultClearListStaffTest?.succeeded ??
                                  true)) {
                                _model.llst =
                                    StaffsTestsListDataStruct.maybeFromMap(
                                            (_model.apiResultClearListStaffTest
                                                    ?.jsonBody ??
                                                ''))!
                                        .data
                                        .toList()
                                        .cast<StaffsTestsListStruct>();
                                await widget.callback?.call(
                                  _model.llst,
                                  ' ',
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
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            _model.filterListStaffTestToken =
                                await action_blocks.tokenReload(context);
                            if (_model.filterListStaffTestToken!) {
                              _model.apiResultFilterListStaffTest =
                                  await DoTestGroup.staffsTestsListCall.call(
                                accessToken: FFAppState().accessToken,
                                filter:
                                    '{\"_and\":[{\"staff_id\":{\"id\":{\"_eq\":\"${FFAppState().staffid}\"}}}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"test_id\":{\"name\":{\"_icontains\":\"${widget.filterSearch}\"}}}' : ' '}${_model.dateStart != '' ? ',{\"date_start\":{\"_gte\":\"${_model.dateStart}\"}}' : ' '}${_model.dateEnd != '' ? ',{\"date_start\":{\"_lte\":\"${_model.dateEnd}\"}}' : ' '}]}',
                              );
                              if ((_model.apiResultFilterListStaffTest
                                      ?.succeeded ??
                                  true)) {
                                _model.llst =
                                    StaffsTestsListDataStruct.maybeFromMap(
                                            (_model.apiResultFilterListStaffTest
                                                    ?.jsonBody ??
                                                ''))!
                                        .data
                                        .toList()
                                        .cast<StaffsTestsListStruct>();
                                await widget.callback?.call(
                                  StaffsTestsListDataStruct.maybeFromMap((_model
                                              .apiResultFilterListStaffTest
                                              ?.jsonBody ??
                                          ''))
                                      ?.data,
                                  _model.dateStart,
                                  _model.dateEnd,
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
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
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
