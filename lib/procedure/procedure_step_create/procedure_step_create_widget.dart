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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      _model.updateStepsEditStruct(
        (e) => e
          ..executeType = 'manual'
          ..operations = [],
      );
      _model.staffsStepNv = [];
      _model.stafStepDepartments = [];
      setState(() {});
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
    _model.operationsTextFocusNode!.addListener(
      () async {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 800.0,
          ),
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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                          TextFormField(
                            controller: _model.textNameTextController,
                            focusNode: _model.textNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textNameTextController',
                              const Duration(milliseconds: 2000),
                              () async {
                                _model.updateStepsEditStruct(
                                  (e) => e
                                    ..name = _model.textNameTextController.text,
                                );
                                setState(() {});
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
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              prefixIcon: const Icon(
                                Icons.drive_file_rename_outline,
                              ),
                              suffixIcon: _model
                                      .textNameTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textNameTextController?.clear();
                                        _model.updateStepsEditStruct(
                                          (e) => e
                                            ..name = _model
                                                .textNameTextController.text,
                                        );
                                        setState(() {});
                                        setState(() {});
                                      },
                                      child: const Icon(
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
                              const Duration(milliseconds: 2000),
                              () async {
                                _model.updateStepsEditStruct(
                                  (e) => e
                                    ..description = _model
                                        .textDscriptionTextController.text,
                                );
                                setState(() {});
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
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              prefixIcon: const Icon(
                                Icons.notes_sharp,
                              ),
                              suffixIcon: _model.textDscriptionTextController!
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textDscriptionTextController
                                            ?.clear();
                                        _model.updateStepsEditStruct(
                                          (e) => e
                                            ..description = _model
                                                .textDscriptionTextController
                                                .text,
                                        );
                                        setState(() {});
                                        setState(() {});
                                      },
                                      child: const Icon(
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final datePickedTime = await showTimePicker(
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
                                if (datePickedTime != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      getCurrentTimestamp.year,
                                      getCurrentTimestamp.month,
                                      getCurrentTimestamp.day,
                                      datePickedTime.hour,
                                      datePickedTime.minute,
                                    );
                                  });
                                }
                                _model.updateStepsEditStruct(
                                  (e) => e
                                    ..timeOperate = dateTimeFormat(
                                      'Hm',
                                      _model.datePicked,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                );
                                setState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
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
                                          'Bắt đầu ${(_model.datePicked != null) && (_model.stepsEdit?.timeOperate != null && _model.stepsEdit?.timeOperate != '') ? dateTimeFormat(
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
                                        _model.updateStepsEditStruct(
                                          (e) => e..timeOperate = null,
                                        );
                                        setState(() {});
                                      },
                                    ),
                                ].divide(const SizedBox(width: 1.0)),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.update_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 90.0,
                                    child: TextFormField(
                                      controller:
                                          _model.estimateDayTextController,
                                      focusNode: _model.estimateDayFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.estimateDayTextController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          _model.updateStepsEditStruct(
                                            (e) => e
                                              ..estimateInSecond = functions.timeToMinute(
                                                  _model.estimateHourTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateHourTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateMinuteTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateMinuteTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateDayTextController.text != ''
                                                      ? _model.estimateDayTextController.text
                                                      : '0'),
                                          );
                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Ngày',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                  child: SizedBox(
                                    width: 90.0,
                                    child: TextFormField(
                                      controller:
                                          _model.estimateHourTextController,
                                      focusNode: _model.estimateHourFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.estimateHourTextController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          _model.updateStepsEditStruct(
                                            (e) => e
                                              ..estimateInSecond = functions.timeToMinute(
                                                  _model.estimateHourTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateHourTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateMinuteTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateMinuteTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateDayTextController.text != ''
                                                      ? _model.estimateDayTextController.text
                                                      : '0'),
                                          );
                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Giờ',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                  child: SizedBox(
                                    width: 90.0,
                                    child: TextFormField(
                                      controller:
                                          _model.estimateMinuteTextController,
                                      focusNode: _model.estimateMinuteFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.estimateMinuteTextController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          _model.updateStepsEditStruct(
                                            (e) => e
                                              ..estimateInSecond = functions.timeToMinute(
                                                  _model.estimateHourTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateHourTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateMinuteTextController.text !=
                                                              ''
                                                      ? _model
                                                          .estimateMinuteTextController
                                                          .text
                                                      : '0',
                                                  _model.estimateDayTextController.text != ''
                                                      ? _model.estimateDayTextController.text
                                                      : '0'),
                                          );
                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Phút',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 5.0),
                            child: Text(
                              '#Nhiệm vụ',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Builder(
                              builder: (context) {
                                final operationsView =
                                    _model.stepsEdit?.operations.toList() ??
                                        [];
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: operationsView.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 4.0),
                                  itemBuilder: (context, operationsViewIndex) {
                                    final operationsViewItem =
                                        operationsView[operationsViewIndex];
                                    return Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${(operationsViewIndex + 1).toString()}.',
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
                                                _model.updateStepsEditStruct(
                                                  (e) => e
                                                    ..updateOperations(
                                                      (e) => e.removeAt(
                                                          operationsViewIndex),
                                                    ),
                                                );
                                                setState(() {});
                                              },
                                            ),
                                          ].divide(const SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                                            decoration: const BoxDecoration(),
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
                                              optionLabels: const [
                                                'Nhập văn bản',
                                                'Chụp ảnh',
                                                'Upload file',
                                                'Checklist công việc',
                                                'Phê duyệt'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .actionTypeValue = val);
                                                _model.updateStepsEditStruct(
                                                  (e) => e
                                                    ..actionType =
                                                        _model.actionTypeValue
                                                    ..operations = [],
                                                );
                                                setState(() {});
                                                setState(() {
                                                  _model
                                                      .operationsTextTextController
                                                      ?.text = '';
                                                  _model.operationsTextTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .operationsTextTextController!
                                                              .text
                                                              .length);
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
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                        if (_model.operationsTextTextController
                                                    .text !=
                                                '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.actionTypeValue !=
                                                      null &&
                                                  _model.actionTypeValue !=
                                                      '') {
                                                if ('${_model.actionTypeValue}' ==
                                                    'to_do_list') {
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
                                                  setState(() {});
                                                  setState(() {
                                                    _model
                                                        .operationsTextTextController
                                                        ?.text = '';
                                                    _model.operationsTextTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .operationsTextTextController!
                                                                .text
                                                                .length);
                                                  });
                                                } else {
                                                  if (_model
                                                          .stepsEdit
                                                          ?.operations
                                                          .length ==
                                                      1) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: const Text(
                                                              'Kiểu hành động này chỉ có 1 công việc!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
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
                                                    setState(() {});
                                                    setState(() {
                                                      _model
                                                          .operationsTextTextController
                                                          ?.text = '';
                                                      _model.operationsTextTextController
                                                              ?.selection =
                                                          TextSelection.collapsed(
                                                              offset: _model
                                                                  .operationsTextTextController!
                                                                  .text
                                                                  .length);
                                                    });
                                                  }
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: const Text(
                                                          'Vui lòng chọn kiểu hành động!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
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
                                        if ('1' == '2')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {});
                                              if (_model.stepsEdit!.operations.isNotEmpty) {
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
                                                          callBack:
                                                              (item) async {
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
                                                        content: const Text(
                                                            'Kiểu hành động này chỉ có 1 công việc!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }

                                                return;
                                              } else {
                                                _model.updateStepsEditStruct(
                                                  (e) => e..operations = [],
                                                );
                                                setState(() {});
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
                                                        actionType:
                                                            '${_model.actionTypeValue}',
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
                                              }
                                            },
                                            text: 'Chọn',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
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
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.operationsTextTextController,
                                      focusNode: _model.operationsTextFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.operationsTextTextController',
                                        const Duration(milliseconds: 50),
                                        () => setState(() {}),
                                      ),
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
                                            const EdgeInsetsDirectional.fromSTEB(
                                                4.0, 0.0, 4.0, 0.0),
                                        suffixIcon: _model
                                                .operationsTextTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .operationsTextTextController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: const Icon(
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
                                          .operationsTextTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              '#Chọn bộ phận hoặc nhân viên thực hiện nhiệm vụ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            '(Có thể chọn gộp nhiều nhân viên và nhiều bộ phận. Lưu ý: Không chọn nhân viên thuộc bộ phận đã được chọn!) ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                                                  _model.stafStepDepartments =
                                                      [];
                                                  setState(() {});
                                                  _model.stafStepDepartments =
                                                      item!.toList().cast<
                                                          DepartmentsIdStruct>();
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
                                          borderRadius: const BorderRadius.only(
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
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
                              ].divide(const SizedBox(width: 1.0)),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final departmentsListView =
                                  _model.stafStepDepartments.toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: departmentsListView.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 4.0),
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                              ].divide(const SizedBox(height: 8.0)),
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
                                              _model
                                                  .removeAtIndexFromStafStepDepartments(
                                                      departmentsListViewIndex);
                                              setState(() {});
                                            },
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                                          borderRadius: const BorderRadius.only(
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
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
                              ].divide(const SizedBox(width: 1.0)),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final staffsListView =
                                  _model.staffsStepNv.toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: staffsListView.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 4.0),
                                itemBuilder: (context, staffsListViewIndex) {
                                  final staffsListViewItem =
                                      staffsListView[staffsListViewIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${(staffsListViewIndex + 1).toString()}.',
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
                                              ].divide(const SizedBox(height: 8.0)),
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
                                              _model
                                                  .removeAtIndexFromStaffsStepNv(
                                                      staffsListViewIndex);
                                              setState(() {});
                                            },
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
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
                      const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
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
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            _model.staffAlias = null;
                            _model.staffListId = [];
                            _model.departmentListStep = [];
                            _model.checkStaffList = [];
                            _model.staffsList = [];
                            _model.departmentList = [];
                            setState(() {});
                            if (_model.stepsEdit!.operations.isNotEmpty) {
                              if ((_model.stafStepDepartments.isNotEmpty) ||
                                  (_model.staffsStepNv.isNotEmpty)) {
                                setState(() {});
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Vui lòng xác nhận! '),
                                          content: const Text(
                                              'Chưa có nhân viên hoặc bộ phận được giao. '),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: const Text(
                                                  'Chọn nhân viên/bộ phận'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: const Text('Tiếp tục lưu'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  setState(() {});
                                } else {
                                  return;
                                }
                              }

                              while (_model.loop! <
                                  _model.stafStepDepartments.length) {
                                _model.addToDepartmentList(DepartmentsStruct(
                                  id: _model.stafStepDepartments[_model.loop!]
                                      .departmentsId.id,
                                  name: _model.stafStepDepartments[_model.loop!]
                                      .departmentsId.name,
                                ));
                                _model.addToDepartmentListStep(
                                    DepartmentListStruct(
                                  departmentsId: DepartmentsStruct(
                                    id: _model.stafStepDepartments[_model.loop!]
                                        .departmentsId.id,
                                    name: _model
                                        .stafStepDepartments[_model.loop!]
                                        .departmentsId
                                        .name,
                                  ),
                                ));
                                setState(() {});
                                while (_model.loop2 <
                                    _model.stafStepDepartments[_model.loop!]
                                        .checkStaff.length) {
                                  _model.addToCheckStaffList(StaffsStepStruct(
                                    staffsId: StaffIdStruct(
                                      id: _model
                                          .stafStepDepartments[_model.loop!]
                                          .checkStaff[_model.loop2]
                                          .staffsId
                                          .id,
                                      userId: _model
                                          .stafStepDepartments[_model.loop!]
                                          .checkStaff[_model.loop2]
                                          .staffsId
                                          .userId,
                                    ),
                                  ));
                                  setState(() {});
                                  _model.addToStaffsList(StaffsStepStruct(
                                    staffsId: StaffIdStruct(
                                      id: _model
                                          .stafStepDepartments[_model.loop!]
                                          .checkStaff[_model.loop2]
                                          .staffsId
                                          .id,
                                      staffName: _model
                                          .stafStepDepartments[_model.loop!]
                                          .departmentsId
                                          .name,
                                      userId: UserIdStruct(
                                        firstName: _model
                                            .stafStepDepartments[_model.loop!]
                                            .checkStaff[_model.loop2]
                                            .staffsId
                                            .userId
                                            .firstName,
                                      ),
                                    ),
                                  ));
                                  setState(() {});
                                  _model.loop2 = _model.loop2 + 1;
                                  setState(() {});
                                }
                                _model.loop2 = 0;
                                setState(() {});
                                _model.updateDepartmentListStepAtIndex(
                                  _model.loop!,
                                  (e) => e
                                    ..checkStaff =
                                        _model.checkStaffList.toList(),
                                );
                                setState(() {});
                                _model.loop = _model.loop! + 1;
                                setState(() {});
                              }
                              _model.loop = 0;
                              _model.loop2 = 0;
                              setState(() {});
                              while (
                                  _model.loop! < _model.staffsStepNv.length) {
                                _model.addToStaffsList(StaffsStepStruct(
                                  staffsId: StaffIdStruct(
                                    id: _model
                                        .staffsStepNv[_model.loop!].staffsId.id,
                                    userId: UserIdStruct(
                                      firstName: _model
                                          .staffsStepNv[_model.loop!]
                                          .staffsId
                                          .userId
                                          .firstName,
                                    ),
                                  ),
                                ));
                                _model.addToStaffListId(StaffIdStruct(
                                  id: _model
                                      .staffsStepNv[_model.loop!].staffsId.id,
                                  staffName: _model.staffsStepNv[_model.loop!]
                                      .staffsId.userId.firstName,
                                ));
                                setState(() {});
                                _model.loop = _model.loop! + 1;
                                setState(() {});
                              }
                              _model.loop = 0;
                              setState(() {});
                              _model.updateStaffAliasStruct(
                                (e) => e
                                  ..departments = _model.departmentList.toList()
                                  ..staffs = _model.staffListId.toList(),
                              );
                              _model.updateStepsEditStruct(
                                (e) => e
                                  ..departments =
                                      _model.departmentListStep.toList()
                                  ..staffs = _model.staffsList.toList(),
                              );
                              setState(() {});
                              while (_model.loop! <
                                  _model.stepsEdit!.staffs.length) {
                                _model.loop2 = (_model.loop!) + 1;
                                setState(() {});
                                while (_model.loop2 <
                                    _model.stepsEdit!.staffs.length) {
                                  if ((_model.stepsEdit?.staffs[_model.loop!])
                                          ?.staffsId
                                          .id ==
                                      (_model.stepsEdit?.staffs[_model.loop2])
                                          ?.staffsId
                                          .id) {
                                    _model
                                        .addToCheckStaff(CheckUpdateStepStruct(
                                      firstName: (_model
                                              .stepsEdit?.staffs[_model.loop!])
                                          ?.staffsId
                                          .userId
                                          .firstName,
                                      staffId: (_model
                                              .stepsEdit?.staffs[_model.loop!])
                                          ?.staffsId
                                          .id,
                                      name: (_model
                                              .stepsEdit?.staffs[_model.loop!])
                                          ?.staffsId
                                          .staffName,
                                    ));
                                    setState(() {});
                                  }
                                  _model.loop2 = _model.loop2 + 1;
                                  setState(() {});
                                }
                                _model.loop = _model.loop! + 1;
                                setState(() {});
                              }
                              _model.loop = 0;
                              _model.loop2 = 0;
                              setState(() {});
                              if (_model.checkStaff.isNotEmpty) {
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

                                _model.updateStepsEditStruct(
                                  (e) => e
                                    ..staffs = []
                                    ..departments = [],
                                );
                                _model.checkStaff = [];
                                setState(() {});
                                return;
                              } else {
                                _model.updateStepsEditStruct(
                                  (e) => e..staffs = [],
                                );
                                _model.staffsList = [];
                                setState(() {});
                                while (
                                    _model.loop! < _model.staffsStepNv.length) {
                                  _model.addToStaffsList(StaffsStepStruct(
                                    staffsId: StaffIdStruct(
                                      id: _model.staffsStepNv[_model.loop!]
                                          .staffsId.id,
                                      userId: UserIdStruct(
                                        firstName: _model
                                            .staffsStepNv[_model.loop!]
                                            .staffsId
                                            .userId
                                            .firstName,
                                      ),
                                    ),
                                  ));
                                  setState(() {});
                                  _model.loop = _model.loop! + 1;
                                  setState(() {});
                                }
                                _model.loop = 0;
                                setState(() {});
                                _model.updateStepsEditStruct(
                                  (e) => e..staffs = _model.staffsList.toList(),
                                );
                                setState(() {});
                                _model.loop = 0;
                                _model.updateStepsEditStruct(
                                  (e) => e
                                    ..staffsAlias = functions.jsontoString(
                                        _model.staffAlias?.toMap()),
                                );
                                setState(() {});
                                await widget.callBack?.call(
                                  _model.stepsEdit,
                                );
                                Navigator.pop(context);
                                Navigator.pop(context);
                                return;
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text('Vui lòng nhập công việc!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
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
        ),
      ),
    );
  }
}
