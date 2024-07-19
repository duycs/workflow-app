import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'time_keeping_shift_filter_model.dart';
export 'time_keeping_shift_filter_model.dart';

class TimeKeepingShiftFilterWidget extends StatefulWidget {
  const TimeKeepingShiftFilterWidget({
    super.key,
    this.dateStartCheckIn,
    String? dateEndCheckIn,
    this.name,
    this.status,
    this.dateStartCheckOut,
    this.dateEndCheckOut,
    this.callBack,
  }) : dateEndCheckIn = dateEndCheckIn ?? '';

  final String? dateStartCheckIn;
  final String dateEndCheckIn;
  final String? name;
  final String? status;
  final String? dateStartCheckOut;
  final String? dateEndCheckOut;
  final Future Function(
      String? dateStartCheckIn,
      String? dateEndCheckIn,
      String? name,
      String? status,
      String? dateEndCheckOut,
      String? dateEndcheckOut)? callBack;

  @override
  State<TimeKeepingShiftFilterWidget> createState() =>
      _TimeKeepingShiftFilterWidgetState();
}

class _TimeKeepingShiftFilterWidgetState
    extends State<TimeKeepingShiftFilterWidget> {
  late TimeKeepingShiftFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeKeepingShiftFilterModel());

    _model.textController ??= TextEditingController(
        text: widget.name != null && widget.name != '' ? widget.name : '');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 600.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
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
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Thời gian bắt đầu làm việc',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final datePicked1Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
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
                        if (datePicked1Time != null) {
                          safeSetState(() {
                            _model.datePicked1 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              datePicked1Time.hour,
                              datePicked1Time.minute,
                            );
                          });
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.datePicked1 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked1,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateStartCheckIn,
                              'Từ giờ',
                            ),
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
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final datePicked2Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
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
                        if (datePicked2Time != null) {
                          safeSetState(() {
                            _model.datePicked2 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              datePicked2Time.hour,
                              datePicked2Time.minute,
                            );
                          });
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.datePicked2 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked2,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateEndCheckIn,
                              'Đến giờ',
                            ),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Thời gian kết thúc làm việc',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final datePicked3Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
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
                        if (datePicked3Time != null) {
                          safeSetState(() {
                            _model.datePicked3 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              datePicked3Time.hour,
                              datePicked3Time.minute,
                            );
                          });
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.datePicked3 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked3,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateStartCheckOut,
                              'Từ giờ',
                            ),
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
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final datePicked4Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
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
                        if (datePicked4Time != null) {
                          safeSetState(() {
                            _model.datePicked4 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              datePicked4Time.hour,
                              datePicked4Time.minute,
                            );
                          });
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.datePicked4 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked4,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateEndCheckOut,
                              'Đến giờ',
                            ),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Tên ca làm việc',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'VD: Ca sáng',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Trạng thái hoạt động',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownStatusValueController ??=
                        FormFieldController<String>(
                      _model.dropDownStatusValue ??=
                          (widget.status != null && widget.status != '') &&
                                  (widget.status == 'published')
                              ? 'Hoạt động'
                              : 'Không hoạt dộng',
                    ),
                    options: List<String>.from(['1', '2']),
                    optionLabels: const ['Không hoạt động', 'Hoạt động'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownStatusValue = val),
                    width: double.infinity,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Trạng thái hoạt động',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
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
                            await widget.callBack?.call(
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                            );
                            Navigator.pop(context);
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
                            await widget.callBack?.call(
                              _model.datePicked1 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked1,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateStartCheckIn,
                              _model.datePicked2 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked2,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateEndCheckIn,
                              _model.textController.text,
                              _model.dropDownStatusValue == 'Hoạt động'
                                  ? 'published'
                                  : 'draft',
                              _model.datePicked4 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked4,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateEndCheckOut,
                              _model.datePicked3 != null
                                  ? dateTimeFormat(
                                      'Hm',
                                      _model.datePicked3,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                  : widget.dateStartCheckOut,
                            );
                            Navigator.pop(context);
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
