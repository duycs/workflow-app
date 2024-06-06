import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'procedure_setting_model.dart';
export 'procedure_setting_model.dart';

class ProcedureSettingWidget extends StatefulWidget {
  const ProcedureSettingWidget({
    super.key,
    this.callBack,
    this.data,
    bool? detailCheck,
  }) : this.detailCheck = detailCheck ?? false;

  final Future Function(RequestWorkflowsCreateStruct? cron)? callBack;
  final RequestWorkflowsCreateStruct? data;
  final bool detailCheck;

  @override
  State<ProcedureSettingWidget> createState() => _ProcedureSettingWidgetState();
}

class _ProcedureSettingWidgetState extends State<ProcedureSettingWidget> {
  late ProcedureSettingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureSettingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.data != null) {
        _model.settingAdd = RequestWorkflowsCreateStruct(
          remind2: widget.data?.remind2 != null ? widget.data?.remind2 : 0,
          remind: widget.data?.remind != null ? widget.data?.remind : 0,
          remindInSecond: widget.data?.remindInSecond != null
              ? widget.data?.remindInSecond
              : 0,
          cron: widget.data?.cron != null && widget.data?.cron != ''
              ? widget.data?.cron
              : 'null',
        );
        setState(() {});
      } else {
        _model.settingAdd = RequestWorkflowsCreateStruct(
          remind2: 0,
          remind: 0,
          cron: null,
        );
        setState(() {});
      }

      _model.checkType = functions.checkTypeCron(_model.settingAdd!.cron);
      setState(() {});
      if (functions.checkTypeCron(_model.settingAdd!.cron) == '3') {
        while (_model.loop! < 6) {
          _model.addToCheckOne(CheckBoxGroupStruct(
            type: false,
            title: ((_model.loop!) + 1) < 10
                ? '0${((_model.loop!) + 1).toString()}'
                : '${((_model.loop!) + 1).toString()}',
          ));
          _model.addToCheckTwo(CheckBoxGroupStruct(
            type: false,
            title: ((_model.loop!) + 7) < 10
                ? '0${((_model.loop!) + 7).toString()}'
                : '${((_model.loop!) + 7).toString()}',
          ));
          _model.addToCheckThrees(CheckBoxGroupStruct(
            type: false,
            title: ((_model.loop!) + 13) < 10
                ? '0${((_model.loop!) + 13).toString()}'
                : '${((_model.loop!) + 13).toString()}',
          ));
          _model.addToCheckBoxFour(CheckBoxGroupStruct(
            type: false,
            title: ((_model.loop!) + 19) < 10
                ? '0${((_model.loop!) + 19).toString()}'
                : '${((_model.loop!) + 19).toString()}',
          ));
          _model.addToCheckBoxFive(CheckBoxGroupStruct(
            type: false,
            title: ((_model.loop!) + 25) < 10
                ? '0${((_model.loop!) + 25).toString()}'
                : '${((_model.loop!) + 25).toString()}',
          ));
          setState(() {});
          _model.loop = _model.loop! + 1;
          setState(() {});
        }
        _model.loop = 0;
        setState(() {});
        _model.addToCheckBoxSix(CheckBoxGroupStruct(
          type: false,
          title: '31',
        ));
        setState(() {});
        while (_model.loop! <
            functions.cronToType(_model.settingAdd!.cron).length) {
          if (int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) <
              7) {
            while (_model.loop2 < _model.checkOne.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkOne[_model.loop2].title) {
                _model.updateCheckOneAtIndex(
                  _model.loop2,
                  (e) => e..type = true,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          } else if (6 < int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) &&
              int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) <
                  13) {
            while (_model.loop2 < _model.checkTwo.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkTwo[_model.loop2].title) {
                _model.updateCheckTwoAtIndex(
                  _model.loop2,
                  (e) => e
                    ..type = functions.cronToType(
                                _model.settingAdd!.cron)[_model.loop!] ==
                            _model.checkTwo[_model.loop2].title
                        ? true
                        : false,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          } else if (12 <
                  int.parse(functions
                      .cronToType(_model.settingAdd!.cron)[_model.loop!]) &&
              int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) <
                  19) {
            while (_model.loop2 < _model.checkThrees.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkThrees[_model.loop2].title) {
                _model.updateCheckThreesAtIndex(
                  _model.loop2,
                  (e) => e
                    ..type = functions.cronToType(
                                _model.settingAdd!.cron)[_model.loop!] ==
                            _model.checkThrees[_model.loop2].title
                        ? true
                        : false,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          } else if (18 <
                  int.parse(functions
                      .cronToType(_model.settingAdd!.cron)[_model.loop!]) &&
              int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) <
                  25) {
            while (_model.loop2 < _model.checkBoxFour.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkBoxFour[_model.loop2].title) {
                _model.updateCheckBoxFourAtIndex(
                  _model.loop2,
                  (e) => e
                    ..type = functions.cronToType(
                                _model.settingAdd!.cron)[_model.loop!] ==
                            _model.checkBoxFour[_model.loop2].title
                        ? true
                        : false,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          } else if (24 <
                  int.parse(
                      functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) &&
              int.parse(functions.cronToType(_model.settingAdd!.cron)[_model.loop!]) < 31) {
            while (_model.loop2 < _model.checkBoxFive.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkBoxFive[_model.loop2].title) {
                _model.updateCheckBoxFiveAtIndex(
                  _model.loop2,
                  (e) => e
                    ..type = functions.cronToType(
                                _model.settingAdd!.cron)[_model.loop!] ==
                            _model.checkBoxFive[_model.loop2].title
                        ? true
                        : false,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          } else {
            while (_model.loop2 < _model.checkBoxSix.length) {
              if (functions.cronToType(_model.settingAdd!.cron)[_model.loop!] ==
                  _model.checkBoxSix[_model.loop2].title) {
                _model.updateCheckBoxSixAtIndex(
                  _model.loop2,
                  (e) => e
                    ..type = functions.cronToType(
                                _model.settingAdd!.cron)[_model.loop!] ==
                            _model.checkBoxSix[_model.loop2].title
                        ? true
                        : false,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
          }

          _model.loop = _model.loop! + 1;
          _model.loop2 = 0;
          setState(() {});
        }
        _model.loop = 0;
        _model.loop2 = 0;
        setState(() {});
      }
      _model.isLoad = true;
      setState(() {});
    });

    _model.timeHourTextController ??= TextEditingController();
    _model.timeHourFocusNode ??= FocusNode();

    _model.timeMinuteTextController ??= TextEditingController();
    _model.timeMinuteFocusNode ??= FocusNode();
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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Color(0xFFE0E3E7),
            ),
          ),
          child: Visibility(
            visible: _model.isLoad == true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 14.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text(
                              'Thiết lập cấu hình',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                22.0, 0.0, 16.0, 0.0),
                            child: Text(
                              'Thiết lập tuần lặp',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownCronValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownCronValue ??= functions
                                      .checkTypeCron(_model.settingAdd!.cron),
                                ),
                                options:
                                    List<String>.from(['0', '1', '2', '3']),
                                optionLabels: [
                                  'Không lặp',
                                  'Lặp hàng ngày',
                                  'Lặp trong tuần',
                                  'Lặp trong tháng'
                                ],
                                onChanged: (val) async {
                                  setState(
                                      () => _model.dropDownCronValue = val);
                                  if (_model.dropDownCronValue != '3') {
                                    _model.loop = 0;
                                    _model.checkCron = [];
                                    _model.checkOne = [];
                                    _model.checkTwo = [];
                                    _model.checkThrees = [];
                                    _model.checkBoxFour = [];
                                    _model.checkBoxFive = [];
                                    _model.checkBoxSix = [];
                                    setState(() {});
                                    _model.checkOne = [];
                                    _model.checkTwo = [];
                                    _model.checkThrees = [];
                                    _model.checkBoxFour = [];
                                    _model.checkBoxFive = [];
                                    _model.checkBoxSix = [];
                                    setState(() {});
                                    _model.checkType = _model.dropDownCronValue;
                                    setState(() {});
                                  } else {
                                    while (_model.loop! < 6) {
                                      _model.addToCheckOne(CheckBoxGroupStruct(
                                        type: false,
                                        title: ((_model.loop!) + 1) < 10
                                            ? '0${((_model.loop!) + 1).toString()}'
                                            : '${((_model.loop!) + 1).toString()}',
                                      ));
                                      _model.addToCheckTwo(CheckBoxGroupStruct(
                                        type: false,
                                        title: ((_model.loop!) + 7) < 10
                                            ? '0${((_model.loop!) + 7).toString()}'
                                            : '${((_model.loop!) + 7).toString()}',
                                      ));
                                      _model
                                          .addToCheckThrees(CheckBoxGroupStruct(
                                        type: false,
                                        title: ((_model.loop!) + 12) < 10
                                            ? '0${((_model.loop!) + 13).toString()}'
                                            : '${((_model.loop!) + 13).toString()}',
                                      ));
                                      _model.addToCheckBoxFour(
                                          CheckBoxGroupStruct(
                                        type: false,
                                        title: ((_model.loop!) + 18) < 10
                                            ? '0${((_model.loop!) + 19).toString()}'
                                            : '${((_model.loop!) + 19).toString()}',
                                      ));
                                      _model.addToCheckBoxFive(
                                          CheckBoxGroupStruct(
                                        type: false,
                                        title: ((_model.loop!) + 24) < 10
                                            ? '0${((_model.loop!) + 25).toString()}'
                                            : '${((_model.loop!) + 25).toString()}',
                                      ));
                                      setState(() {});
                                      _model.loop = _model.loop! + 1;
                                      setState(() {});
                                    }
                                    _model.addToCheckBoxSix(CheckBoxGroupStruct(
                                      type: false,
                                      title: '31',
                                    ));
                                    setState(() {});
                                    _model.loop = 0;
                                    setState(() {});
                                    _model.checkType = _model.dropDownCronValue;
                                    setState(() {});
                                  }
                                },
                                width: double.infinity,
                                height: 60.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Vui lòng chọn lặp',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 1.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                disabled: widget.detailCheck == true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          if ((_model.checkType == '2') &&
                              responsiveVisibility(
                                context: context,
                                tablet: false,
                              ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget.detailCheck == false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '# Ngày cụ thể trong tuần (chọn một hoặc nhiều)',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    if (widget.detailCheck == false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                setState(() => _model
                                                        .groupWeekValueController
                                                        ?.value = List.from([
                                                      'Thứ Hai',
                                                      'Thứ Ba',
                                                      'Thứ Tư',
                                                      'Thứ Năm',
                                                      'Thứ Sáu',
                                                      'Thứ Bảy',
                                                      'Chủ Nhật'
                                                    ]));
                                                while (_model.loop! < 7) {
                                                  _model.addToCheckCron(
                                                      '${((_model.loop!) + 1).toString()}');
                                                  setState(() {});
                                                  _model.loop =
                                                      _model.loop! + 1;
                                                  setState(() {});
                                                }
                                                _model.loop = 0;
                                                setState(() {});
                                              },
                                              text: 'Chọn tất cả',
                                              options: FFButtonOptions(
                                                width: 100.0,
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
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
                                                setState(() => _model
                                                    .groupWeekValueController
                                                    ?.value = []);
                                                _model.checkCron = [];
                                                setState(() {});
                                              },
                                              text: 'Bỏ chọn',
                                              options: FFButtonOptions(
                                                width: 100.0,
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                borderSide: BorderSide(
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
                                    FlutterFlowCheckboxGroup(
                                      options: [
                                        'Thứ Hai',
                                        'Thứ Ba',
                                        'Thứ Tư',
                                        'Thứ Năm',
                                        'Thứ Sáu',
                                        'Thứ Bảy',
                                        'Chủ Nhật'
                                      ],
                                      onChanged: (widget.detailCheck == true)
                                          ? null
                                          : (val) => setState(() =>
                                              _model.groupWeekValues = val),
                                      controller:
                                          _model.groupWeekValueController ??=
                                              FormFieldController<List<String>>(
                                        List.from(functions.cronToType(
                                                _model.settingAdd!.cron) ??
                                            []),
                                      ),
                                      activeColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      unselectedTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                      checkboxBorderRadius:
                                          BorderRadius.circular(4.0),
                                      initialized:
                                          _model.groupWeekValues != null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (_model.checkType == '3')
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.detailCheck == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 10.0, 16.0, 0.0),
                              child: Text(
                                '# Danh sách ngày cụ thể trong tháng (chọn một hoặc nhiều)',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          if (widget.detailCheck == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      while (_model.loop! < 6) {
                                        _model.updateCheckOneAtIndex(
                                          _model.loop!,
                                          (e) => e..type = true,
                                        );
                                        _model.updateCheckTwoAtIndex(
                                          _model.loop!,
                                          (e) => e..type = true,
                                        );
                                        _model.updateCheckThreesAtIndex(
                                          _model.loop!,
                                          (e) => e..type = true,
                                        );
                                        _model.updateCheckBoxFourAtIndex(
                                          _model.loop!,
                                          (e) => e..type = true,
                                        );
                                        _model.updateCheckBoxFiveAtIndex(
                                          _model.loop!,
                                          (e) => e..type = true,
                                        );
                                        setState(() {});
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      _model.updateCheckBoxSixAtIndex(
                                        0,
                                        (e) => e..type = true,
                                      );
                                      setState(() {});
                                      _model.updateCheckBoxSixAtIndex(
                                        1,
                                        (e) => e..type = true,
                                      );
                                      setState(() {});
                                    },
                                    text: 'Chọn tất cả',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      while (_model.loop! < 6) {
                                        _model.updateCheckOneAtIndex(
                                          _model.loop!,
                                          (e) => e..type = false,
                                        );
                                        _model.updateCheckTwoAtIndex(
                                          _model.loop!,
                                          (e) => e..type = false,
                                        );
                                        _model.updateCheckThreesAtIndex(
                                          _model.loop!,
                                          (e) => e..type = false,
                                        );
                                        _model.updateCheckBoxFourAtIndex(
                                          _model.loop!,
                                          (e) => e..type = false,
                                        );
                                        _model.updateCheckBoxFiveAtIndex(
                                          _model.loop!,
                                          (e) => e..type = false,
                                        );
                                        setState(() {});
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      _model.updateCheckBoxSixAtIndex(
                                        0,
                                        (e) => e..type = false,
                                      );
                                      setState(() {});
                                      _model.updateCheckBoxSixAtIndex(
                                        1,
                                        (e) => e..type = false,
                                      );
                                      setState(() {});
                                    },
                                    text: 'Bỏ chọn',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listOne = _model.checkOne.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listOne.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listOneIndex) {
                                      final listOneItem = listOne[listOneIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels1
                                                  .getModel(
                                                '${listOneItem.title}${listOneItem.type.toString()}',
                                                listOneIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Keyiek_${'${listOneItem.title}${listOneItem.type.toString()}'}',
                                                ),
                                                checkParam: listOneItem.type,
                                                callBack: (checkCall) async {
                                                  _model.updateCheckOneAtIndex(
                                                    listOneIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listOneItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listTwo = _model.checkTwo.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listTwo.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listTwoIndex) {
                                      final listTwoItem = listTwo[listTwoIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels2
                                                  .getModel(
                                                '${listTwoItem.title}${listTwoItem.type.toString()}',
                                                listTwoIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Keygxf_${'${listTwoItem.title}${listTwoItem.type.toString()}'}',
                                                ),
                                                checkParam: listTwoItem.type,
                                                callBack: (checkCall) async {
                                                  _model.updateCheckTwoAtIndex(
                                                    listTwoIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listTwoItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listThree = _model.checkThrees.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listThree.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listThreeIndex) {
                                      final listThreeItem =
                                          listThree[listThreeIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels3
                                                  .getModel(
                                                '${listThreeItem.title}${listThreeItem.type.toString()}',
                                                listThreeIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Keye58_${'${listThreeItem.title}${listThreeItem.type.toString()}'}',
                                                ),
                                                checkParam: listThreeItem.type,
                                                callBack: (checkCall) async {
                                                  _model
                                                      .updateCheckThreesAtIndex(
                                                    listThreeIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listThreeItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listFour = _model.checkBoxFour.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listFour.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listFourIndex) {
                                      final listFourItem =
                                          listFour[listFourIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels4
                                                  .getModel(
                                                '${listFourItem.title}${listFourItem.type.toString()}',
                                                listFourIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Keywf5_${'${listFourItem.title}${listFourItem.type.toString()}'}',
                                                ),
                                                checkParam: listFourItem.type,
                                                callBack: (checkCall) async {
                                                  _model
                                                      .updateCheckBoxFourAtIndex(
                                                    listFourIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listFourItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listFive = _model.checkBoxFive.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listFive.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listFiveIndex) {
                                      final listFiveItem =
                                          listFive[listFiveIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels5
                                                  .getModel(
                                                '${listFiveItem.title}${listFiveItem.type.toString()}',
                                                listFiveIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Keylw1_${'${listFiveItem.title}${listFiveItem.type.toString()}'}',
                                                ),
                                                checkParam: listFiveItem.type,
                                                callBack: (checkCall) async {
                                                  _model
                                                      .updateCheckBoxFiveAtIndex(
                                                    listFiveIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listFiveItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final listSix = _model.checkBoxSix.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listSix.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 4.0),
                                    itemBuilder: (context, listSixIndex) {
                                      final listSixItem = listSix[listSixIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .checkBoxToggleModels6
                                                  .getModel(
                                                '${listSixItem.title}${listSixItem.type.toString()}',
                                                listSixIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: CheckBoxToggleWidget(
                                                key: Key(
                                                  'Key385_${'${listSixItem.title}${listSixItem.type.toString()}'}',
                                                ),
                                                checkParam: listSixItem.type,
                                                callBack: (checkCall) async {
                                                  _model
                                                      .updateCheckBoxSixAtIndex(
                                                    listSixIndex,
                                                    (e) => e..type = checkCall,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Text(
                                              listSixItem.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: CircleBorder(),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue1 ??=
                                        '${_model.settingAdd?.remind?.toString()}' ==
                                                '1'
                                            ? true
                                            : false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue1 = newValue!);
                                      if (newValue!) {
                                        _model.updateSettingAddStruct(
                                          (e) => e..remind = 1,
                                        );
                                        setState(() {});
                                      } else {
                                        _model.updateSettingAddStruct(
                                          (e) => e..remind = 0,
                                        );
                                        setState(() {});
                                      }
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Thiết lập nhắc trước khi bắt đầu bước:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (widget.detailCheck == false)
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.timeHourTextController,
                                        focusNode: _model.timeHourFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.timeHourTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.updateSettingAddStruct(
                                              (e) => e
                                                ..remindInSecond = functions.timeToMinute(
                                                    _model.timeHourTextController
                                                                    .text !=
                                                                null &&
                                                            _model.timeHourTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .timeHourTextController
                                                            .text
                                                        : '0',
                                                    _model.timeMinuteTextController
                                                                    .text !=
                                                                null &&
                                                            _model.timeMinuteTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .timeMinuteTextController
                                                            .text
                                                        : '0',
                                                    null),
                                            );
                                            setState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Giờ',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: ' ',
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
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .timeHourTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  if (widget.detailCheck == false)
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.timeMinuteTextController,
                                        focusNode: _model.timeMinuteFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.timeMinuteTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.updateSettingAddStruct(
                                              (e) => e
                                                ..remindInSecond = functions.timeToMinute(
                                                    _model.timeHourTextController
                                                                    .text !=
                                                                null &&
                                                            _model.timeHourTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .timeHourTextController
                                                            .text
                                                        : '0',
                                                    _model.timeMinuteTextController
                                                                    .text !=
                                                                null &&
                                                            _model.timeMinuteTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .timeMinuteTextController
                                                            .text
                                                        : '0',
                                                    null),
                                            );
                                            setState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Phút',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: ' ',
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
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .timeMinuteTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        '(${formatNumber(
                                          _model.settingAdd?.remindInSecond,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                        )} phút)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue2 ??=
                                  '${_model.settingAdd?.remind2?.toString()}' ==
                                          '1'
                                      ? true
                                      : false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue2 = newValue!);
                                if (newValue!) {
                                  _model.updateSettingAddStruct(
                                    (e) => e..remind2 = 1,
                                  );
                                  setState(() {});
                                } else {
                                  _model.updateSettingAddStruct(
                                    (e) => e..remind2 = 0,
                                  );
                                  setState(() {});
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Thiết lập nhắc chuyển bước',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.detailCheck == false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Thoát',
                                options: FFButtonOptions(
                                  height: 40.0,
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
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            if (widget.detailCheck == false)
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.checkCron = [];
                                    setState(() {});
                                    if (_model.checkType == '3') {
                                      while (_model.loop! <
                                          _model.checkOne.length) {
                                        if (_model
                                                .checkOne[_model.loop!].type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkOne[_model.loop!].title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      while (_model.loop! <
                                          _model.checkTwo.length) {
                                        if (_model
                                                .checkTwo[_model.loop!].type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkTwo[_model.loop!].title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      while (_model.loop! <
                                          _model.checkThrees.length) {
                                        if (_model.checkThrees[_model.loop!]
                                                .type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkThrees[_model.loop!].title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      while (_model.loop! <
                                          _model.checkBoxFour.length) {
                                        if (_model.checkBoxFour[_model.loop!]
                                                .type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkBoxFour[_model.loop!]
                                              .title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      while (_model.loop! <
                                          _model.checkBoxFive.length) {
                                        if (_model.checkBoxFive[_model.loop!]
                                                .type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkBoxFive[_model.loop!]
                                              .title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                      while (_model.loop! <
                                          _model.checkBoxSix.length) {
                                        if (_model.checkBoxSix[_model.loop!]
                                                .type ==
                                            true) {
                                          _model.addToCheckCron(_model
                                              .checkBoxSix[_model.loop!].title);
                                          setState(() {});
                                        }
                                        _model.loop = _model.loop! + 1;
                                        setState(() {});
                                      }
                                      _model.loop = 0;
                                      setState(() {});
                                    } else if (_model.checkType == '2') {
                                      _model.checkCron = _model.groupWeekValues!
                                          .toList()
                                          .cast<String>();
                                      setState(() {});
                                    }

                                    if ((_model.checkType != null &&
                                            _model.checkType != '') &&
                                        (_model.checkType != '0')) {
                                      _model.updateSettingAddStruct(
                                        (e) => e
                                          ..cron = functions.limitPublished(
                                              _model.checkType!,
                                              _model.checkCron.toList()),
                                      );
                                      setState(() {});
                                    }
                                    _model.updateSettingAddStruct(
                                      (e) => e
                                        ..cron = functions.limitPublished(
                                            _model.checkType!,
                                            _model.checkCron.toList())
                                        ..remind = _model.settingAdd?.remind,
                                    );
                                    setState(() {});
                                    await widget.callBack?.call(
                                      _model.settingAdd,
                                    );
                                    Navigator.pop(context);
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
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
