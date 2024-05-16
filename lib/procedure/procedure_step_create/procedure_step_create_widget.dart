import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/alert_staff_check_departments/alert_staff_check_departments_widget.dart';
import '/procedure/dropdown_departments_list/dropdown_departments_list_widget.dart';
import '/procedure/dropdown_user_list/dropdown_user_list_widget.dart';
import '/procedure/operations_list_popup/operations_list_popup_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'procedure_step_create_model.dart';
export 'procedure_step_create_model.dart';

class ProcedureStepCreateWidget extends StatefulWidget {
  const ProcedureStepCreateWidget({
    super.key,
    required this.callBack,
  });

  final Future Function(StepsStruct? addItem)? callBack;

  @override
  State<ProcedureStepCreateWidget> createState() =>
      _ProcedureStepCreateWidgetState();
}

class _ProcedureStepCreateWidgetState extends State<ProcedureStepCreateWidget> {
  late ProcedureStepCreateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureStepCreateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.updateStepsEditStruct(
          (e) => e
            ..executeType = 'manual'
            ..operations = [],
        );
      });
    });

    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();

    _model.textDscriptionTextController ??= TextEditingController();
    _model.textDscriptionFocusNode ??= FocusNode();

    _model.estimateDayTextController ??= TextEditingController();
    _model.estimateDayFocusNode ??= FocusNode();

    _model.estimateHourTextController ??= TextEditingController();
    _model.estimateHourFocusNode ??= FocusNode();

    _model.estimateMinuteTextController ??= TextEditingController();
    _model.estimateMinuteFocusNode ??= FocusNode();

    _model.operationsTextTextController ??= TextEditingController();
    _model.operationsTextFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 870.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.cancel,
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
                          TextFormField(
                            controller: _model.textNameTextController,
                            focusNode: _model.textNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textNameTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..name =
                                          _model.textNameTextController.text,
                                  );
                                });
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintText: 'Nhập tên bước...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                              ),
                              suffixIcon: _model
                                      .textNameTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textNameTextController?.clear();
                                        setState(() {
                                          _model.updateStepsEditStruct(
                                            (e) => e
                                              ..name = _model
                                                  .textNameTextController.text,
                                          );
                                        });
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
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
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 50,
                            validator: _model.textNameTextControllerValidator
                                .asValidator(context),
                          ),
                          TextFormField(
                            controller: _model.textDscriptionTextController,
                            focusNode: _model.textDscriptionFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textDscriptionTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..description = _model
                                          .textDscriptionTextController.text,
                                  );
                                });
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Nhập mô tả...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              prefixIcon: Icon(
                                Icons.notes_sharp,
                              ),
                              suffixIcon: _model.textDscriptionTextController!
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textDscriptionTextController
                                            ?.clear();
                                        setState(() {
                                          _model.updateStepsEditStruct(
                                            (e) => e
                                              ..description = _model
                                                  .textDscriptionTextController
                                                  .text,
                                          );
                                        });
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
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
                            maxLines: 2,
                            validator: _model
                                .textDscriptionTextControllerValidator
                                .asValidator(context),
                          ),
                          if ('1' == '2')
                            Opacity(
                              opacity: 0.2,
                              child: Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      getCurrentTimestamp),
                                  builder: (context, child) {
                                    return wrapInMaterialTimePickerTheme(
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
                                if (_datePickedTime != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      getCurrentTimestamp.year,
                                      getCurrentTimestamp.month,
                                      getCurrentTimestamp.day,
                                      _datePickedTime.hour,
                                      _datePickedTime.minute,
                                    );
                                  });
                                }
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..timeOperate = dateTimeFormat(
                                        'Hm',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                  );
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.date_range,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          'Bắt đầu: ${(_model.datePicked != null) && (_model.stepsEdit?.timeOperate != null && _model.stepsEdit?.timeOperate != '') ? dateTimeFormat(
                                              'Hm',
                                              _model.datePicked,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) : ' '}',
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
                                  if (_model.stepsEdit?.timeOperate != null &&
                                      _model.stepsEdit?.timeOperate != '')
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.updateStepsEditStruct(
                                            (e) => e..timeOperate = null,
                                          );
                                        });
                                      },
                                    ),
                                ].divide(SizedBox(width: 1.0)),
                              ),
                            ),
                          ),
                          if ('1' == '2')
                            Opacity(
                              opacity: 0.2,
                              child: Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          if ('1' == '2')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.update_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Thời gian thực hiện: ${formatNumber(
                                    _model.stepsEdit?.estimateInSecond,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.commaDecimal,
                                  )} phút',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          if ('1' == '2')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 90.0,
                                      child: TextFormField(
                                        controller:
                                            _model.estimateDayTextController,
                                        focusNode: _model.estimateDayFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.estimateDayTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.updateStepsEditStruct(
                                                (e) => e
                                                  ..estimateInSecond = functions.timeToMinute(
                                                      _model.estimateHourTextController.text != null &&
                                                              _model.estimateHourTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateHourTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateMinuteTextController.text != null &&
                                                              _model.estimateMinuteTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateMinuteTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateDayTextController
                                                                      .text !=
                                                                  null &&
                                                              _model.estimateDayTextController.text != ''
                                                          ? _model.estimateDayTextController.text
                                                          : '0'),
                                              );
                                            });
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .estimateDayTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 90.0,
                                      child: TextFormField(
                                        controller:
                                            _model.estimateHourTextController,
                                        focusNode: _model.estimateHourFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.estimateHourTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.updateStepsEditStruct(
                                                (e) => e
                                                  ..estimateInSecond = functions.timeToMinute(
                                                      _model.estimateHourTextController.text != null &&
                                                              _model.estimateHourTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateHourTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateMinuteTextController.text != null &&
                                                              _model.estimateMinuteTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateMinuteTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateDayTextController
                                                                      .text !=
                                                                  null &&
                                                              _model.estimateDayTextController.text != ''
                                                          ? _model.estimateDayTextController.text
                                                          : '0'),
                                              );
                                            });
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Giờ',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .estimateHourTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 90.0,
                                      child: TextFormField(
                                        controller:
                                            _model.estimateMinuteTextController,
                                        focusNode:
                                            _model.estimateMinuteFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.estimateMinuteTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.updateStepsEditStruct(
                                                (e) => e
                                                  ..estimateInSecond = functions.timeToMinute(
                                                      _model.estimateHourTextController.text != null &&
                                                              _model.estimateHourTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateHourTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateMinuteTextController.text != null &&
                                                              _model.estimateMinuteTextController.text !=
                                                                  ''
                                                          ? _model
                                                              .estimateMinuteTextController
                                                              .text
                                                          : '0',
                                                      _model.estimateDayTextController
                                                                      .text !=
                                                                  null &&
                                                              _model.estimateDayTextController.text != ''
                                                          ? _model.estimateDayTextController.text
                                                          : '0'),
                                              );
                                            });
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Phút',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .estimateMinuteTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          if ('1' == '2')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 5.0),
                              child: Text(
                                '#Công việc',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          Builder(
                            builder: (context) {
                              final operationsView =
                                  _model.stepsEdit?.operations?.toList() ?? [];
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: operationsView.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, operationsViewIndex) {
                                  final operationsViewItem =
                                      operationsView[operationsViewIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${(operationsViewIndex + 1).toString()}.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              operationsViewItem.content,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.updateStepsEditStruct(
                                                  (e) => e
                                                    ..updateOperations(
                                                      (e) => e.removeAt(
                                                          operationsViewIndex),
                                                    ),
                                                );
                                              });
                                            },
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 8.0, 4.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 200.0,
                                            decoration: BoxDecoration(),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .actionTypeValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: List<String>.from([
                                                'submit_text',
                                                'image',
                                                'upload_file',
                                                'to_do_list',
                                                'approve'
                                              ]),
                                              optionLabels: [
                                                'Nhập văn bản',
                                                'Chụp ảnh',
                                                'Upload file',
                                                'Checklist công việc',
                                                'Phê duyệt'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .actionTypeValue = val);
                                                setState(() {
                                                  _model.updateStepsEditStruct(
                                                    (e) => e
                                                      ..actionType =
                                                          _model.actionTypeValue
                                                      ..operations = [],
                                                  );
                                                });
                                                setState(() {
                                                  _model
                                                      .operationsTextTextController
                                                      ?.text = '';
                                                });
                                              },
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Kiểu hành động',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 1.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.actionTypeValue !=
                                                    null &&
                                                _model.actionTypeValue != '') {
                                              if ('${_model.actionTypeValue}' ==
                                                  'to_do_list') {
                                                setState(() {
                                                  _model.updateStepsEditStruct(
                                                    (e) => e
                                                      ..updateOperations(
                                                        (e) => e.add(
                                                            OperationsStruct(
                                                          content: _model
                                                              .operationsTextTextController
                                                              .text,
                                                          actionType: _model
                                                              .actionTypeValue,
                                                        )),
                                                      ),
                                                  );
                                                });
                                                setState(() {
                                                  _model
                                                      .operationsTextTextController
                                                      ?.text = '';
                                                });
                                              } else {
                                                if (_model.stepsEdit?.operations
                                                        ?.length ==
                                                    1) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Kiểu hành động này chỉ có 1 công việc!'),
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
                                                } else {
                                                  setState(() {
                                                    _model
                                                        .updateStepsEditStruct(
                                                      (e) => e
                                                        ..updateOperations(
                                                          (e) => e.add(
                                                              OperationsStruct(
                                                            content: _model
                                                                .operationsTextTextController
                                                                .text,
                                                            actionType: _model
                                                                .actionTypeValue,
                                                          )),
                                                        ),
                                                    );
                                                  });
                                                  setState(() {
                                                    _model
                                                        .operationsTextTextController
                                                        ?.text = '';
                                                  });
                                                }
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Vui lòng chọn kiểu hành động!'),
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
                                            }
                                          },
                                          text: 'Thêm',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {});
                                            if (_model.stepsEdit!.operations
                                                    .length >
                                                0) {
                                              setState(() {});
                                              if (_model.actionTypeValue ==
                                                  'to_do_list') {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          OperationsListPopupWidget(
                                                        actionType: _model
                                                            .actionTypeValue!,
                                                        callBack: (item) async {
                                                          setState(() {
                                                            _model.actionTypeValueController
                                                                    ?.value =
                                                                item!
                                                                    .actionType;
                                                          });
                                                          await _model
                                                              .addOperations(
                                                            context,
                                                            item: item,
                                                          );
                                                          setState(() {});
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Kiểu hành động này chỉ có 1 công việc!'),
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

                                              return;
                                            } else {
                                              setState(() {
                                                _model.updateStepsEditStruct(
                                                  (e) => e..operations = [],
                                                );
                                              });
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        OperationsListPopupWidget(
                                                      actionType:
                                                          '${_model.actionTypeValue}',
                                                      callBack: (item) async {
                                                        setState(() {
                                                          _model.actionTypeValueController
                                                                  ?.value =
                                                              item!.actionType;
                                                        });
                                                        await _model
                                                            .addOperations(
                                                          context,
                                                          item: item,
                                                        );
                                                        setState(() {});
                                                      },
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          text: 'Chọn',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.operationsTextTextController,
                                      focusNode: _model.operationsTextFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '   Nhập công việc...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                4.0, 0.0, 4.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 2,
                                      validator: _model
                                          .operationsTextTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DropdownUserListWidget(
                                                dataPar: _model.staffsStepNv,
                                                callback: (item) async {
                                                  await _model.addStaff(
                                                    context,
                                                    item: item,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Nhân viên',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 1.0)),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 180.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final staffsListView =
                                    _model.staffsStepNv.toList();
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: staffsListView.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 4.0),
                                  itemBuilder: (context, staffsListViewIndex) {
                                    final staffsListViewItem =
                                        staffsListView[staffsListViewIndex];
                                    return Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${(staffsListViewIndex + 1).toString()}.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    staffsListViewItem
                                                                    .staffsId
                                                                    .userId
                                                                    .firstName !=
                                                                null &&
                                                            staffsListViewItem
                                                                    .staffsId
                                                                    .userId
                                                                    .firstName !=
                                                                ''
                                                        ? staffsListViewItem
                                                            .staffsId
                                                            .userId
                                                            .firstName
                                                        : ' ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  _model
                                                      .removeAtIndexFromStaffsStepNv(
                                                          staffsListViewIndex);
                                                });
                                              },
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  DropdownDepartmentsListWidget(
                                                dataPar:
                                                    _model.stafStepDepartments,
                                                callback: (item) async {
                                                  setState(() {
                                                    _model.stafStepDepartments =
                                                        [];
                                                  });
                                                  setState(() {
                                                    _model.stafStepDepartments =
                                                        item!.toList().cast<
                                                            DepartmentsIdStruct>();
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Bộ phận',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 1.0)),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final departmentsListView =
                                  _model.stafStepDepartments.toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: departmentsListView.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder:
                                    (context, departmentsListViewIndex) {
                                  final departmentsListViewItem =
                                      departmentsListView[
                                          departmentsListViewIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${(departmentsListViewIndex + 1).toString()}.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  departmentsListViewItem
                                                                  .departmentsId
                                                                  .name !=
                                                              null &&
                                                          departmentsListViewItem
                                                                  .departmentsId
                                                                  .name !=
                                                              ''
                                                      ? departmentsListViewItem
                                                          .departmentsId.name
                                                      : ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.removeAtIndexFromStafStepDepartments(
                                                    departmentsListViewIndex);
                                              });
                                            },
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
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
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Hủy',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            setState(() {
                              _model.staffAlias = null;
                            });
                            if (_model.stepsEdit!.operations.length > 0) {
                              while (_model.loop! <
                                  _model.stafStepDepartments.length) {
                                setState(() {
                                  _model.updateStaffAliasStruct(
                                    (e) => e
                                      ..updateDepartments(
                                        (e) => e.add(DepartmentsStruct(
                                          id: _model
                                              .stafStepDepartments[_model.loop!]
                                              .departmentsId
                                              .id,
                                          name: _model
                                              .stafStepDepartments[_model.loop!]
                                              .departmentsId
                                              .name,
                                        )),
                                      ),
                                  );
                                });
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..updateDepartments(
                                        (e) => e.add(DepartmentListStruct(
                                          departmentsId: DepartmentsStruct(
                                            id: _model
                                                .stafStepDepartments[
                                                    _model.loop!]
                                                .departmentsId
                                                .id,
                                            name: _model
                                                .stafStepDepartments[
                                                    _model.loop!]
                                                .departmentsId
                                                .name,
                                          ),
                                        )),
                                      ),
                                  );
                                });
                                while (_model.loop2 <
                                    _model.stafStepDepartments[_model.loop!]
                                        .checkStaff.length) {
                                  setState(() {
                                    _model.updateStepsEditStruct(
                                      (e) => e
                                        ..updateStaffs(
                                          (e) => e.add(StaffsStepStruct(
                                            staffsId: StaffIdStruct(
                                              id: _model
                                                  .stafStepDepartments[
                                                      _model.loop!]
                                                  .checkStaff[_model.loop2]
                                                  .staffsId
                                                  .id,
                                              staffName: _model
                                                  .stafStepDepartments[
                                                      _model.loop!]
                                                  .departmentsId
                                                  .name,
                                              userId: UserIdStruct(
                                                firstName: _model
                                                    .stafStepDepartments[
                                                        _model.loop!]
                                                    .checkStaff[_model.loop2]
                                                    .staffsId
                                                    .userId
                                                    .firstName,
                                              ),
                                            ),
                                          )),
                                        )
                                        ..updateDepartments(
                                          (e) => e[_model.loop!]
                                            ..updateCheckStaff(
                                              (e) => e.add(StaffsStepStruct(
                                                staffsId: StaffIdStruct(
                                                  id: _model
                                                      .stafStepDepartments[
                                                          _model.loop!]
                                                      .checkStaff[_model.loop2]
                                                      .staffsId
                                                      .id,
                                                  userId: _model
                                                      .stafStepDepartments[
                                                          _model.loop!]
                                                      .checkStaff[_model.loop2]
                                                      .staffsId
                                                      .userId,
                                                ),
                                              )),
                                            ),
                                        ),
                                    );
                                  });
                                  setState(() {
                                    _model.loop2 = _model.loop2 + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop2 = 0;
                                });
                                setState(() {
                                  _model.loop = _model.loop! + 1;
                                });
                              }
                              setState(() {
                                _model.loop = 0;
                                _model.loop2 = 0;
                              });
                              while (
                                  _model.loop! < _model.staffsStepNv.length) {
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..updateStaffs(
                                        (e) => e.add(StaffsStepStruct(
                                          staffsId: StaffIdStruct(
                                            id: _model
                                                .staffsStepNv[_model.loop!]
                                                .staffsId
                                                .id,
                                            userId: UserIdStruct(
                                              firstName: _model
                                                  .staffsStepNv[_model.loop!]
                                                  .staffsId
                                                  .userId
                                                  .firstName,
                                            ),
                                          ),
                                        )),
                                      ),
                                  );
                                  _model.updateStaffAliasStruct(
                                    (e) => e
                                      ..updateStaffs(
                                        (e) => e.add(StaffIdStruct(
                                          id: _model.staffsStepNv[_model.loop!]
                                              .staffsId.id,
                                          staffName: _model
                                              .staffsStepNv[_model.loop!]
                                              .staffsId
                                              .userId
                                              .firstName,
                                        )),
                                      ),
                                  );
                                });
                                setState(() {
                                  _model.loop = _model.loop! + 1;
                                });
                              }
                              setState(() {
                                _model.loop = 0;
                              });
                              while (_model.loop! <
                                  _model.stepsEdit!.staffs.length) {
                                setState(() {
                                  _model.loop2 = (_model.loop!) + 1;
                                });
                                while (_model.loop2 <
                                    _model.stepsEdit!.staffs.length) {
                                  if ((_model.stepsEdit?.staffs?[_model.loop!])
                                          ?.staffsId
                                          ?.id ==
                                      (_model.stepsEdit?.staffs?[_model.loop2])
                                          ?.staffsId
                                          ?.id) {
                                    setState(() {
                                      _model.addToCheckStaff(
                                          CheckUpdateStepStruct(
                                        firstName: (_model.stepsEdit
                                                ?.staffs?[_model.loop!])
                                            ?.staffsId
                                            ?.userId
                                            ?.firstName,
                                        staffId: (_model.stepsEdit
                                                ?.staffs?[_model.loop!])
                                            ?.staffsId
                                            ?.id,
                                        name: (_model.stepsEdit
                                                ?.staffs?[_model.loop!])
                                            ?.staffsId
                                            ?.staffName,
                                      ));
                                    });
                                  }
                                  setState(() {
                                    _model.loop2 = _model.loop2 + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop = _model.loop! + 1;
                                });
                              }
                              setState(() {
                                _model.loop = 0;
                                _model.loop2 = 0;
                              });
                              if (_model.checkStaff.length > 0) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: AlertStaffCheckDepartmentsWidget(
                                        listParam: _model.checkStaff,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..staffs = []
                                      ..departments = [],
                                  );
                                  _model.checkStaff = [];
                                });
                                return;
                              } else {
                                setState(() {
                                  _model.updateStepsEditStruct(
                                    (e) => e..staffs = [],
                                  );
                                });
                                while (
                                    _model.loop! < _model.staffsStepNv.length) {
                                  setState(() {
                                    _model.updateStepsEditStruct(
                                      (e) => e
                                        ..updateStaffs(
                                          (e) => e.add(StaffsStepStruct(
                                            staffsId: StaffIdStruct(
                                              id: _model
                                                  .staffsStepNv[_model.loop!]
                                                  .staffsId
                                                  .id,
                                              userId: UserIdStruct(
                                                firstName: _model
                                                    .staffsStepNv[_model.loop!]
                                                    .staffsId
                                                    .userId
                                                    .firstName,
                                              ),
                                            ),
                                          )),
                                        ),
                                    );
                                  });
                                  setState(() {
                                    _model.loop = _model.loop! + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop = 0;
                                });
                                setState(() {
                                  _model.loop = 0;
                                  _model.updateStepsEditStruct(
                                    (e) => e
                                      ..staffsAlias = functions.jsontoString(
                                          _model.staffAlias?.toMap()),
                                  );
                                });
                                await widget.callBack?.call(
                                  _model.stepsEdit,
                                );
                                Navigator.pop(context);
                                return;
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text('Vui lòng nhập công việc!'),
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
                              return;
                            }
                          },
                          text: 'Lưu',
                          options: FFButtonOptions(
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                            borderSide: BorderSide(
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
        ),
      ),
    );
  }
}
