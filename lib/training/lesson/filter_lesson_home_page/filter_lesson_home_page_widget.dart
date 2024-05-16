import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_lesson_home_page_model.dart';
export 'filter_lesson_home_page_model.dart';

class FilterLessonHomePageWidget extends StatefulWidget {
  const FilterLessonHomePageWidget({
    super.key,
    required this.callBack,
    String? status,
    String? dateStart,
    String? dateEnd,
    String? lessonFavoriteStatus,
    String? statusLoveFilter,
    String? statusDateToday,
    String? statusDateHistory,
    String? programsId,
    String? checkPrograms,
  })  : this.status = status ?? '',
        this.dateStart = dateStart ?? '',
        this.dateEnd = dateEnd ?? '',
        this.lessonFavoriteStatus = lessonFavoriteStatus ?? '',
        this.statusLoveFilter = statusLoveFilter ?? '',
        this.statusDateToday = statusDateToday ?? '',
        this.statusDateHistory = statusDateHistory ?? '',
        this.programsId = programsId ?? '',
        this.checkPrograms = checkPrograms ?? '';

  final Future Function(
      String? status,
      DateTime? dateStart,
      DateTime? dateEnd,
      String? lessonStatus,
      String? lessonFavoriteStatus,
      String? programsId)? callBack;
  final String status;
  final String dateStart;
  final String dateEnd;
  final String lessonFavoriteStatus;
  final String statusLoveFilter;
  final String statusDateToday;
  final String statusDateHistory;
  final String programsId;
  final String checkPrograms;

  @override
  State<FilterLessonHomePageWidget> createState() =>
      _FilterLessonHomePageWidgetState();
}

class _FilterLessonHomePageWidgetState
    extends State<FilterLessonHomePageWidget> {
  late FilterLessonHomePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterLessonHomePageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.programs(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                if (((widget.statusDateToday != 'dateToday') &&
                        (widget.statusDateHistory != 'lessonHistory')) ||
                    ((widget.statusDateToday != 'dateToday') &&
                        (widget.statusDateHistory == null ||
                            widget.statusDateHistory == '')) ||
                    ((widget.statusDateToday == null ||
                            widget.statusDateToday == '') &&
                        (widget.statusDateHistory != 'lessonHistory')) ||
                    ((widget.statusDateToday == null ||
                            widget.statusDateToday == '') &&
                        (widget.statusDateHistory == null ||
                            widget.statusDateHistory == '')))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: ((widget.statusDateToday != 'dateToday') &&
                                (widget.statusDateHistory !=
                                    'lessonHistory')) ||
                            ((widget.statusDateToday != 'dateToday') &&
                                (widget.statusDateHistory == null ||
                                    widget.statusDateHistory == '')) ||
                            ((widget.statusDateToday == null ||
                                    widget.statusDateToday == '') &&
                                (widget.statusDateHistory !=
                                    'lessonHistory')) ||
                            ((widget.statusDateToday == null ||
                                    widget.statusDateToday == '') &&
                                (widget.statusDateHistory == null ||
                                    widget.statusDateHistory == '')),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
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

                                  if (_datePicked1Date != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
                                      );
                                    });
                                  }
                                  setState(() {
                                    _model.dateStart = _model.datePicked1;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      _model.dateStart != null
                                          ? dateTimeFormat(
                                              'yyyy-MM-dd',
                                              _model.dateStart,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )
                                          : ((widget.dateStart != null &&
                                                      widget.dateStart != '') &&
                                                  (widget.dateStart != '0')
                                              ? widget.dateStart
                                              : 'Từ ngày'),
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
                                  final _datePicked2Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
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

                                  if (_datePicked2Date != null) {
                                    safeSetState(() {
                                      _model.datePicked2 = DateTime(
                                        _datePicked2Date.year,
                                        _datePicked2Date.month,
                                        _datePicked2Date.day,
                                      );
                                    });
                                  }
                                  setState(() {
                                    _model.dateEnd = _model.datePicked2;
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      _model.dateEnd != null
                                          ? dateTimeFormat(
                                              'yyyy-MM-dd',
                                              _model.dateEnd,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )
                                          : ((widget.dateEnd != null &&
                                                      widget.dateEnd != '') &&
                                                  (widget.dateEnd != '0')
                                              ? widget.dateEnd
                                              : 'Đến hết ngày'),
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
                        ),
                      ),
                    ),
                  ),
                if ('2' == '1')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownStatusValueController ??=
                          FormFieldController<String>(
                        _model.dropDownStatusValue ??=
                            widget.status != null && widget.status != ''
                                ? () {
                                    if ('${widget.status}' == 'published') {
                                      return '2';
                                    } else if ('${widget.status}' == 'draft') {
                                      return '1';
                                    } else {
                                      return null;
                                    }
                                  }()
                                : null,
                      ),
                      options: List<String>.from(['1', '2']),
                      optionLabels: ['Không hoạt động', 'Hoạt động'],
                      onChanged: (val) =>
                          setState(() => _model.dropDownStatusValue = val),
                      width: double.infinity,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nunito Sans',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Trạng thái hoạt động bài học',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                if ((widget.statusLoveFilter == null ||
                        widget.statusLoveFilter == '') ||
                    (widget.statusLoveFilter != 'love'))
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (widget.statusLoveFilter == null ||
                              widget.statusLoveFilter == '') ||
                          (widget.statusLoveFilter != 'love'),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: FlutterFlowDropDown<String>(
                          controller:
                              _model.lessonFavoriteStatusValueController ??=
                                  FormFieldController<String>(
                            _model.lessonFavoriteStatusValue ??=
                                widget.lessonFavoriteStatus != null &&
                                        widget.lessonFavoriteStatus != ''
                                    ? ('${widget.lessonFavoriteStatus}' ==
                                            'love'
                                        ? '1'
                                        : null)
                                    : null,
                          ),
                          options: List<String>.from(['1']),
                          optionLabels: ['Yêu thích'],
                          onChanged: (val) => setState(
                              () => _model.lessonFavoriteStatusValue = val),
                          width: double.infinity,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Bài học',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.programsValueController ??=
                        FormFieldController<String>(
                      _model.programsValue ??=
                          widget.programsId != null && widget.programsId != ''
                              ? widget.programsId
                              : '',
                    ),
                    options: List<String>.from(
                        _model.programList.map((e) => e.id).toList()),
                    optionLabels:
                        _model.programList.map((e) => e.name).toList(),
                    onChanged: (val) =>
                        setState(() => _model.programsValue = val),
                    width: double.infinity,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Chương trình đào tạo',
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
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              _model.status = '';
                              _model.dateStart = null;
                              _model.dateEnd = null;
                              _model.lessonFavoritStatus = '';
                            });
                            await widget.callBack?.call(
                              '',
                              _model.dateStartCPN,
                              _model.dateEndCPN,
                              '',
                              _model.lessonFavoritStatus,
                              '',
                            );
                            Navigator.pop(context);
                          },
                          text: 'Xoá bộ lọc',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                              () {
                                if (_model.dropDownStatusValue == '1') {
                                  return 'draft';
                                } else if (_model.dropDownStatusValue == '2') {
                                  return 'published';
                                } else {
                                  return 'noData';
                                }
                              }(),
                              () {
                                if (_model.dateStart != null) {
                                  return _model.dateStart;
                                } else if (widget.dateStart != null &&
                                    widget.dateStart != '') {
                                  return functions
                                      .stringToDateTime(widget.dateStart);
                                } else {
                                  return functions.stringToDateTime('noData');
                                }
                              }(),
                              () {
                                if (_model.dateEnd != null) {
                                  return _model.dateEnd;
                                } else if (widget.dateEnd != null &&
                                    widget.dateEnd != '') {
                                  return functions
                                      .stringToDateTime(widget.dateEnd);
                                } else {
                                  return functions.stringToDateTime('noData');
                                }
                              }(),
                              '',
                              _model.lessonFavoriteStatusValue == '1'
                                  ? 'love'
                                  : 'noData',
                              _model.programsValue,
                            );
                            Navigator.pop(context);
                          },
                          text: 'Xác nhận',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF33BA45),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
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
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
