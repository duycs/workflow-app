import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/timekeeping/time_keeping_location/time_keeping_location_widget.dart';
import '/timekeeping/time_keeping_shift_select/time_keeping_shift_select_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timekeeping_shift_model.dart';
export 'timekeeping_shift_model.dart';

class TimekeepingShiftWidget extends StatefulWidget {
  const TimekeepingShiftWidget({
    super.key,
    required this.callback,
    required this.callback2,
    this.shiftSelect,
    this.address,
  });

  final Future Function(List<ShiftListStruct> shiftsSelect, String? addressId)?
      callback;
  final Future Function(String? addressId)? callback2;
  final List<ShiftListStruct>? shiftSelect;
  final String? address;

  @override
  State<TimekeepingShiftWidget> createState() => _TimekeepingShiftWidgetState();
}

class _TimekeepingShiftWidgetState extends State<TimekeepingShiftWidget> {
  late TimekeepingShiftModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimekeepingShiftModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.shiftSelect =
          widget!.shiftSelect!.toList().cast<ShiftListStruct>();
      _model.addressId = widget!.address;
      setState(() {});
      while ('1' == '1') {
        if (_model.check == true) {
          _model.check = false;
          setState(() {});
          await widget.callback2?.call(
            _model.addressId,
          );
          Navigator.pop(context);
        }
        await Future.delayed(const Duration(milliseconds: 500));
      }
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
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
                      var _shouldSetState = false;
                      if (_model.shiftSelect.length <= 0) {
                        Navigator.pop(context);
                        if (_shouldSetState) setState(() {});
                        return;
                      }
                      while (_model.loop < _model.shiftSelect.length) {
                        if (_model.shiftSelect[_model.loop].id == null ||
                            _model.shiftSelect[_model.loop].id == '') {
                          _model.shiftCreateBack =
                              await action_blocks.tokenReload(context);
                          _shouldSetState = true;
                          if (_model.shiftCreateBack!) {
                            _model.apiResultShiftCreateback =
                                await TimekeepingShiftGroup.shiftCreateCall
                                    .call(
                              accessToken: FFAppState().accessToken,
                              requestJson: <String, dynamic>{
                                'start_time':
                                    _model.shiftSelect[_model.loop].startTime,
                                'end_time':
                                    _model.shiftSelect[_model.loop].endTime,
                                'status': 'published',
                                'normal': getJsonField(
                                  <String, int>{
                                    'map': 1,
                                  },
                                  r'''$.map''',
                                ),
                                'organization_id': getJsonField(
                                  FFAppState().staffOrganization,
                                  r'''$.id''',
                                ),
                              },
                            );

                            _shouldSetState = true;
                            if (_model.shiftCreateBack!) {
                              _model.updateShiftSelectAtIndex(
                                _model.loop,
                                (e) => e
                                  ..id = getJsonField(
                                    (_model.apiResultShiftCreateback
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.id''',
                                  ).toString(),
                              );
                              setState(() {});
                            }
                          } else {
                            setState(() {});
                          }
                        }
                        _model.loop = _model.loop + 1;
                        setState(() {});
                      }
                      _model.loop = 0;
                      setState(() {});
                      await widget.callback?.call(
                        _model.shiftSelect,
                        _model.addressId,
                      );
                      Navigator.pop(context);
                      if (_shouldSetState) setState(() {});
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Chọn ca làm việc',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var _shouldSetState = false;
                        if (_model.shiftSelect.length <= 0) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('Vui lòng chọn ca làm việc!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        while (_model.loop < _model.shiftSelect.length) {
                          if (_model.shiftSelect[_model.loop].id == null ||
                              _model.shiftSelect[_model.loop].id == '') {
                            _model.shiftCreate =
                                await action_blocks.tokenReload(context);
                            _shouldSetState = true;
                            if (_model.shiftCreate!) {
                              _model.apiResultShiftCreate =
                                  await TimekeepingShiftGroup.shiftCreateCall
                                      .call(
                                accessToken: FFAppState().accessToken,
                                requestJson: <String, dynamic>{
                                  'start_time':
                                      _model.shiftSelect[_model.loop].startTime,
                                  'end_time':
                                      _model.shiftSelect[_model.loop].endTime,
                                  'status': 'published',
                                  'normal': getJsonField(
                                    <String, int>{
                                      'map': 1,
                                    },
                                    r'''$.map''',
                                  ),
                                  'organization_id': getJsonField(
                                    FFAppState().staffOrganization,
                                    r'''$.id''',
                                  ),
                                },
                              );

                              _shouldSetState = true;
                              if ((_model.apiResultShiftCreate?.succeeded ??
                                  true)) {
                                _model.updateShiftSelectAtIndex(
                                  _model.loop,
                                  (e) => e
                                    ..id = getJsonField(
                                      (_model.apiResultShiftCreate?.jsonBody ??
                                          ''),
                                      r'''$.data.id''',
                                    ).toString(),
                                );
                                setState(() {});
                              }
                            } else {
                              setState(() {});
                            }
                          }
                          _model.loop = _model.loop + 1;
                          setState(() {});
                        }
                        _model.loop = 0;
                        setState(() {});
                        await widget.callback?.call(
                          _model.shiftSelect,
                          _model.addressId,
                        );
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                child: TimeKeepingLocationWidget(
                                  addressId: _model.addressId,
                                  callback: (addressId, checkBack) async {
                                    if (checkBack == 1) {
                                      _model.check = false;
                                      _model.addressId = addressId;
                                      setState(() {});
                                    } else {
                                      _model.check = true;
                                      _model.addressId = addressId;
                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        if (_shouldSetState) setState(() {});
                      },
                      child: Text(
                        'Tiếp tục',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                        child: Text(
                          '*Bạn có thể chọn theo ca làm việc được thiết lập sẵn hoặc Tùy chỉnh thời gian làm việc ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 36.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Chọn ca làm việc',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: TimeKeepingShiftSelectWidget(
                                    callback: (item) async {
                                      if (_model.shiftSelect
                                              .where((e) => e.id == item.id)
                                              .toList()
                                              .length >
                                          0) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Ca làm việc đã được chọn. Vui lòng chọn ca làm việc khác!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                      _model.addToShiftSelect(ShiftListStruct(
                                        id: item.id,
                                        startTime: item.startTime,
                                        endTime: item.endTime,
                                        name: item.name,
                                      ));
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Chọn ca làm việc',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_double_arrow_down,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.edit_calendar_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Expanded(
                              child: Text(
                                'Tùy chỉnh ca làm việc',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.datePicked1 == null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Vui lòng chọn thời gian bắt đầu'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                if (_model.datePicked2 == null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Vui lòng chọn thời gian kết thúc'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                _model.addToShiftSelect(ShiftListStruct(
                                  startTime: dateTimeFormat(
                                    'Hm',
                                    _model.datePicked1,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  endTime: dateTimeFormat(
                                    'Hm',
                                    _model.datePicked2,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                ));
                                setState(() {});
                              },
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  28.0, 12.0, 0.0, 4.0),
                              child: Text(
                                'Thời gian bắt đầu làm việc',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  28.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked1Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                    builder: (context, child) {
                                      return wrapInMaterialTimePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );
                                  if (_datePicked1Time != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = DateTime(
                                        getCurrentTimestamp.year,
                                        getCurrentTimestamp.month,
                                        getCurrentTimestamp.day,
                                        _datePicked1Time.hour,
                                        _datePicked1Time.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _model.datePicked1 != null
                                                ? dateTimeFormat(
                                                    'Hm',
                                                    _model.datePicked1,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : 'Chưa cập nhật',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color:
                                                      _model.datePicked1 != null
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0x6D57636C),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.alarm,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 22.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  28.0, 24.0, 0.0, 4.0),
                              child: Text(
                                'Thời gian kết thúc làm việc',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  28.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked2Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                    builder: (context, child) {
                                      return wrapInMaterialTimePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );
                                  if (_datePicked2Time != null) {
                                    safeSetState(() {
                                      _model.datePicked2 = DateTime(
                                        getCurrentTimestamp.year,
                                        getCurrentTimestamp.month,
                                        getCurrentTimestamp.day,
                                        _datePicked2Time.hour,
                                        _datePicked2Time.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _model.datePicked2 != null
                                                ? dateTimeFormat(
                                                    'Hm',
                                                    _model.datePicked2,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : 'Chưa cập nhật',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color:
                                                      _model.datePicked2 != null
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0x6D57636C),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.alarm,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 22.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.list,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Danh sách ca làm việc đã chọn',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final shiftsSelect = _model.shiftSelect.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: shiftsSelect.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 4.0),
                              itemBuilder: (context, shiftsSelectIndex) {
                                final shiftsSelectItem =
                                    shiftsSelect[shiftsSelectIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.25,
                                      children: [
                                        SlidableAction(
                                          label: 'Xóa',
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: Icons.delete_outline,
                                          onPressed: (_) async {
                                            _model.removeAtIndexFromShiftSelect(
                                                shiftsSelectIndex);
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.six_ft_apart_sharp,
                                      ),
                                      title: Text(
                                        shiftsSelectItem.name != null &&
                                                shiftsSelectItem.name != ''
                                            ? shiftsSelectItem.name
                                            : 'Chưa cập nhật',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: shiftsSelectItem.name !=
                                                          null &&
                                                      shiftsSelectItem.name !=
                                                          ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : Color(0x6D57636C),
                                              fontSize: shiftsSelectItem.name !=
                                                          null &&
                                                      shiftsSelectItem.name !=
                                                          ''
                                                  ? 14.0
                                                  : 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      subtitle: Text(
                                        '${shiftsSelectItem.startTime} - ${shiftsSelectItem.endTime}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: true,
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
            ),
          ],
        ),
      ),
    );
  }
}
