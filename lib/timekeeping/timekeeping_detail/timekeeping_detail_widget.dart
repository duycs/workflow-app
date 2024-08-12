import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timekeeping_detail_model.dart';
export 'timekeeping_detail_model.dart';

class TimekeepingDetailWidget extends StatefulWidget {
  const TimekeepingDetailWidget({
    super.key,
    required this.itemDetail,
  });

  final ShiftConfigsStruct? itemDetail;

  @override
  State<TimekeepingDetailWidget> createState() =>
      _TimekeepingDetailWidgetState();
}

class _TimekeepingDetailWidgetState extends State<TimekeepingDetailWidget> {
  late TimekeepingDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimekeepingDetailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Chi tiết cấu hình chấm công',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 12.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tên hình thức',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          constraints: BoxConstraints(
                            minHeight: 50.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.numbers_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22.0,
                                ),
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.itemDetail?.name != null &&
                                              widget!.itemDetail?.name != ''
                                          ? widget!.itemDetail?.name
                                          : 'Chưa cập nhật',
                                      'Chưa cập nhật',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                        if ('1' == '2')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 24.0, 0.0, 4.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Mô tả',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
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
                            ),
                          ),
                        if ('1' == '2')
                          Container(
                            width: 100.0,
                            constraints: BoxConstraints(
                              minHeight: 50.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.notes_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Chấm công hàng ngày áp dụng chho các bộ phận làm việc tại văn phòng',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Áp dụng',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowRadioButton(
                          options: ['Đang áp dụng', 'Chưa áp dụng'].toList(),
                          onChanged:
                              ('1' == '1') ? null : (val) => setState(() {}),
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>(
                                  widget!.itemDetail?.enable == 1
                                      ? 'Đang áp dụng'
                                      : 'Chưa áp dụng'),
                          optionHeight: 32.0,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          textPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.horizontal,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 16.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Ngày nghỉ trong tuần',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 1.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'MON',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '1')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '1')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'TUE',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '2')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '2')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'WED',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '3')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '3')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'THU',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '4')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '4')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'FRI',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '5')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '5')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'SAT',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '6')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '6')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'SUN',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: widget!.itemDetail!.offWeekDays
                                                .where((e) => e == '0')
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: widget!.itemDetail!.offWeekDays
                                                      .where((e) => e == '0')
                                                      .toList()
                                                      .length >
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hình thức chấm công',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        if ('1' == '2')
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue1 ??= true,
                              onChanged: ('1' == '1')
                                  ? null
                                  : (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue1 = newValue!);
                                    },
                              title: Text(
                                'Chấm công theo ngày',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                'Chấm cả ngày, 1/2 ngày, ...',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: ('1' == '1')
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        if ('1' == '2')
                          Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue2 ??= true,
                            onChanged: ('1' == '1')
                                ? null
                                : (newValue) async {
                                    setState(() => _model
                                        .checkboxListTileValue2 = newValue!);
                                  },
                            title: Text(
                              'Chấm công theo ca',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              'Chấm ca sáng, ca chiều, ca tối, ...',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: ('1' == '1')
                                ? null
                                : FlutterFlowTheme.of(context).info,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if ('1' == '2')
                          Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        if ('1' == '2')
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue3 ??= true,
                              onChanged: ('1' == '1')
                                  ? null
                                  : (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue3 = newValue!);
                                    },
                              title: Text(
                                'Chấm công theo giờ',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                'Chấm giờ vào làm. tan làm, ...',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: ('1' == '1')
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tích hợp chấm công',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue4 ??= true,
                            onChanged: ('1' == '1')
                                ? null
                                : (newValue) async {
                                    setState(() => _model
                                        .checkboxListTileValue4 = newValue!);
                                  },
                            title: Text(
                              'Tích hợp chấm công bằng vị trí',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              'Thiết lập vị trí chấm công cho nhân viên, ...',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: ('1' == '1')
                                ? null
                                : FlutterFlowTheme.of(context).info,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        if ('1' == '2')
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue5 ??= true,
                              onChanged: ('1' == '1')
                                  ? null
                                  : (newValue) async {
                                      setState(() => _model
                                          .checkboxListTileValue5 = newValue!);
                                    },
                              title: Text(
                                'Tích hợp chấm công bằng wifi',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                'Kết hợp với wifi yêu cầu, ...',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: ('1' == '1')
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.leading,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        if ('1' == '2')
                          Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue6 ??= true,
                            onChanged: ('1' == '1')
                                ? null
                                : (newValue) async {
                                    setState(() => _model
                                        .checkboxListTileValue6 = newValue!);
                                  },
                            title: Text(
                              'Tích hợp chấm công bằng face ID',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              'Sử dụng face ID để chấm công, ...',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: ('1' == '1')
                                ? null
                                : FlutterFlowTheme.of(context).info,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue7 ??= true,
                            onChanged: ('1' == '1')
                                ? null
                                : (newValue) async {
                                    setState(() => _model
                                        .checkboxListTileValue7 = newValue!);
                                  },
                            title: Text(
                              'Tích hợp chấm công bằng vân tay',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              'Thiết lập vân tay chấm công cho nhân viên, ...',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: ('1' == '1')
                                ? null
                                : FlutterFlowTheme.of(context).info,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        if ('1' == '2')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 24.0, 0.0, 4.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Ngày chốt bảng chấm công',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
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
                            ),
                          ),
                        if ('1' == '2')
                          Container(
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
                                  Icon(
                                    Icons.date_range,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Ngày cuối cùng trong tháng',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Thời gian làm việc',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final shifts =
                                widget!.itemDetail?.shifts?.toList() ?? [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: shifts.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, shiftsIndex) {
                                final shiftsItem = shifts[shiftsIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${(shiftsIndex + 1).toString()}. ',
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
                                              text: shiftsItem.shiftsId.name !=
                                                          null &&
                                                      shiftsItem
                                                              .shiftsId.name !=
                                                          ''
                                                  ? shiftsItem.shiftsId.name
                                                  : 'Chưa cập nhật',
                                              style: TextStyle(
                                                color: shiftsItem.shiftsId
                                                                .name !=
                                                            null &&
                                                        shiftsItem.shiftsId
                                                                .name !=
                                                            ''
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : Color(0x6D57636C),
                                                fontSize:
                                                    shiftsItem.shiftsId.name !=
                                                                null &&
                                                            shiftsItem.shiftsId
                                                                    .name !=
                                                                ''
                                                        ? 14.0
                                                        : 13.0,
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
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.alarm,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 22.0,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Bắt đầu ',
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
                                                          TextSpan(
                                                            text: shiftsItem.shiftsId
                                                                            .startTime !=
                                                                        null &&
                                                                    shiftsItem
                                                                            .shiftsId
                                                                            .startTime !=
                                                                        ''
                                                                ? shiftsItem
                                                                    .shiftsId
                                                                    .startTime
                                                                : ' ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.alarm,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 22.0,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Kết thúc ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: shiftsItem.shiftsId
                                                                            .endTime !=
                                                                        null &&
                                                                    shiftsItem
                                                                            .shiftsId
                                                                            .endTime !=
                                                                        ''
                                                                ? shiftsItem
                                                                    .shiftsId
                                                                    .endTime
                                                                : ' ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Vị trí làm việc',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight: 60.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22.0,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget!.itemDetail?.addressId?.detail !=
                                                  null &&
                                              widget!.itemDetail?.addressId
                                                      ?.detail !=
                                                  ''
                                          ? widget!.itemDetail!.addressId.detail
                                          : ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      widget!.itemDetail?.addressId
                                                  ?.meterRange !=
                                              null
                                          ? '${widget!.itemDetail?.addressId?.meterRange?.toString()} m'
                                          : ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Bộ phận áp dụng',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        if (widget!.itemDetail?.departments?.length == 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 4.0, 0.0, 4.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Chưa áp dụng cho bộ phận nào!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        FlutterFlowChoiceChips(
                          options: widget!.itemDetail!.departments
                              .map((e) => e.name)
                              .toList()
                              .map((label) => ChipData(label))
                              .toList(),
                          onChanged: ('1' == '1')
                              ? null
                              : (val) => setState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconSize: 18.0,
                            elevation: 0.0,
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
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          chipSpacing: 4.0,
                          rowSpacing: 4.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          disabledColor: FlutterFlowTheme.of(context).secondary,
                          wrapped: true,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 24.0, 0.0, 4.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Nhân viên áp dụng',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                          ),
                        ),
                        if (widget!.itemDetail?.staffs?.length == 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 4.0, 0.0, 4.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Chưa áp dụng cho nhân viên nào!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            final staffs =
                                widget!.itemDetail?.staffs?.toList() ?? [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: staffs.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.0),
                              itemBuilder: (context, staffsIndex) {
                                final staffsItem = staffs[staffsIndex];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 6.0, 8.0, 6.0),
                                    child: Text(
                                      staffsItem.userId.firstName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ].addToEnd(SizedBox(height: 32.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'TimekeepingUpdate',
                      queryParameters: {
                        'itemDetail': serializeParam(
                          widget!.itemDetail,
                          ParamType.DataStruct,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Chỉnh sửa',
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
