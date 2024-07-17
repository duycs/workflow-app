import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/alert_staff_check_departments/alert_staff_check_departments_widget.dart';
import '/procedure/dropdown_departments_list/dropdown_departments_list_widget.dart';
import '/procedure/dropdown_user_list/dropdown_user_list_widget.dart';
import '/timekeeping/time_keeping_select_date/time_keeping_select_date_widget.dart';
import '/timekeeping/timekeeping_shift/timekeeping_shift_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timekeeping_create_model.dart';
export 'timekeeping_create_model.dart';

class TimekeepingCreateWidget extends StatefulWidget {
  const TimekeepingCreateWidget({super.key});

  @override
  State<TimekeepingCreateWidget> createState() =>
      _TimekeepingCreateWidgetState();
}

class _TimekeepingCreateWidgetState extends State<TimekeepingCreateWidget> {
  late TimekeepingCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimekeepingCreateModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Tạo cấu hình chấm công',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
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
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    if (_model.staffSelectList.isNotEmpty) {
                      while (_model.loop < _model.staffSelectList.length) {
                        if (_model.staffsDepartment
                                .where((e) =>
                                    e.id ==
                                    _model.staffSelectList[_model.loop].staffsId
                                        .id)
                                .toList().isNotEmpty) {
                          _model.addToCheckStaffs(CheckUpdateStepStruct(
                            firstName: _model.staffSelectList[_model.loop]
                                .staffsId.userId.firstName,
                            name: _model.staffSelectList[_model.loop].staffsId
                                .departmentId.name,
                          ));
                          setState(() {});
                        }
                        _model.loop = _model.loop + 1;
                        setState(() {});
                      }
                      _model.loop = 0;
                      setState(() {});
                      if (_model.checkStaffs.isNotEmpty) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: AlertStaffCheckDepartmentsWidget(
                                  listParam: _model.checkStaffs,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        return;
                      }
                    }
                    _model.updateRequestStruct(
                      (e) => e
                        ..status = 'published'
                        ..departments = _model.departmentSelectList
                            .map((e) => e.departmentsId.id)
                            .toList()
                        ..staffs = _model.staffSelectList
                            .map((e) => e.staffsId.id)
                            .toList()
                        ..name = _model.nameTextController.text,
                    );
                    setState(() {});
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: TimekeepingShiftWidget(
                              callback: (shifts) async {
                                _model.updateRequestStruct(
                                  (e) => e..shifts = shifts.toList(),
                                );
                                setState(() {});
                              },
                              callback2: (addressId) async {
                                _model.updateRequestStruct(
                                  (e) => e
                                    ..addressId = addressId
                                    ..organizationId = getJsonField(
                                      FFAppState().staffOrganization,
                                      r'''$.id''',
                                    ).toString(),
                                );
                                setState(() {});
                                await _model.shiftConfigsCreate(context);

                                context.pushNamed(
                                  'TimekeepingList',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Text(
                    'Tiếp tục',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(2.0, 12.0, 0.0, 4.0),
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
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      controller: _model.nameTextController,
                      focusNode: _model.nameFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Vd: Chấm công theo ca...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                      validator: _model.nameTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  if ('1' == '2')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  if ('1' == '2')
                    TextFormField(
                      controller: _model.descriptionTextController,
                      focusNode: _model.descriptionFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText:
                            'Vd: Áp dụng cho nhân viên làm việc tại văn phòng, ...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 3,
                      validator: _model.descriptionTextControllerValidator
                          .asValidator(context),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        value: _model.checkboxListTileValue1 ??= false,
                        onChanged: ('1' == '2')
                            ? null
                            : (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue1 = newValue!);
                              },
                        title: Text(
                          'Chấm công theo ngày',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: ('1' == '2')
                            ? null
                            : FlutterFlowTheme.of(context).info,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  if ('1' == '2')
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                              setState(() =>
                                  _model.checkboxListTileValue2 = newValue!);
                            },
                      title: Text(
                        'Chấm công theo ca',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
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
                        value: _model.checkboxListTileValue3 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue3 = newValue!);
                        },
                        title: Text(
                          'Chấm công theo giờ',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                              setState(() =>
                                  _model.checkboxListTileValue4 = newValue!);
                            },
                      title: Text(
                        'Tích hợp chấm công bằng vị trí',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: ('1' == '1')
                          ? null
                          : FlutterFlowTheme.of(context).info,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
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
                        value: _model.checkboxListTileValue5 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue5 = newValue!);
                        },
                        title: Text(
                          'Tích hợp chấm công bằng wifi',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                  if ('1' == '2')
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                              setState(() =>
                                  _model.checkboxListTileValue6 = newValue!);
                            },
                      title: Text(
                        'Tích hợp chấm công bằng face ID',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: ('1' == '1')
                          ? null
                          : FlutterFlowTheme.of(context).info,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                              setState(() =>
                                  _model.checkboxListTileValue7 = newValue!);
                            },
                      title: Text(
                        'Tích hợp chấm công bằng vân tay',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: ('1' == '1')
                          ? null
                          : FlutterFlowTheme.of(context).info,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                  if ('1' == '2')
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  if ('1' == '2')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).error,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  if ('1' == '2')
                    InkWell(
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
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const TimeKeepingSelectDateWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                              Icon(
                                Icons.keyboard_double_arrow_down,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
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
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: DropdownDepartmentsListWidget(
                                  dataPar: _model.departmentSelectList,
                                  callback: (item) async {
                                    _model.departmentSelectList = [];
                                    setState(() {});
                                    _model.departmentSelectList = item!
                                        .toList()
                                        .cast<DepartmentsIdStruct>();
                                    setState(() {});
                                    while (_model.loop <
                                        _model.staffsDepartment.length) {
                                      while (_model.loop2! <
                                          _model
                                              .departmentSelectList[_model.loop]
                                              .departmentsId
                                              .staffs
                                              .length) {
                                        _model.addToStaffsDepartment(
                                            StaffListStruct(
                                          id: _model
                                              .departmentSelectList[_model.loop]
                                              .departmentsId
                                              .staffs[_model.loop2!]
                                              .id,
                                        ));
                                        _model.loop2 = _model.loop2! + 1;
                                        setState(() {});
                                      }
                                      _model.loop2 = 0;
                                      _model.loop = _model.loop + 1;
                                      setState(() {});
                                    }
                                    _model.loop = 0;
                                    setState(() {});
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Chọn bộ phận áp dụng...',
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: FlutterFlowChoiceChips(
                      options: _model.departmentSelectList
                          .map((e) => e.departmentsId.name)
                          .toList()
                          .map((label) => ChipData(label))
                          .toList(),
                      onChanged: ('1' == '1')
                          ? null
                          : (val) => setState(
                              () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                        iconColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 0.0, 4.0),
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
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
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: DropdownUserListWidget(
                                  dataPar: _model.staffSelectList,
                                  callback: (item) async {
                                    await _model.addStaffs(
                                      context,
                                      item: item,
                                    );

                                    setState(() {});
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Chọn nhân viên áp dụng...',
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                    child: Text(
                      '*Lưu ý: Không chọn nhân viên thuộc bộ phận đã chọn ở trên',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final staffs = _model.staffSelectList.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: staffs.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 2.0),
                          itemBuilder: (context, staffsIndex) {
                            final staffsItem = staffs[staffsIndex];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Text(
                                          staffsItem.staffsId.userId.firstName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
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
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.removeAtIndexFromStaffSelectList(
                                            staffsIndex);
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].addToEnd(const SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
