import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'timekeeping_management_list_filter_model.dart';
export 'timekeeping_management_list_filter_model.dart';

class TimekeepingManagementListFilterWidget extends StatefulWidget {
  const TimekeepingManagementListFilterWidget({
    super.key,
    required this.callback,
    this.idBrand,
    this.idDepartment,
    this.idStaff,
    this.idShifts,
    this.idStatus,
  });

  final Future Function(String? idBranch, String? idDepartment, String? idStaff,
      String? idShifts, String? idStatus)? callback;
  final String? idBrand;
  final String? idDepartment;
  final String? idStaff;
  final String? idShifts;
  final String? idStatus;

  @override
  State<TimekeepingManagementListFilterWidget> createState() =>
      _TimekeepingManagementListFilterWidgetState();
}

class _TimekeepingManagementListFilterWidgetState
    extends State<TimekeepingManagementListFilterWidget> {
  late TimekeepingManagementListFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimekeepingManagementListFilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.isRoleOrgAdmin(FFAppState().user)) {
        await _model.getListBranch(context);
        setState(() {});
      }
      if (((widget.idBrand != null && widget.idBrand != '') &&
              (widget.idBrand != 'noData')) ||
          functions.isRoleBranchAdmin(FFAppState().user)) {
        await _model.getListDepartment(context);
        setState(() {});
      }
      if (((widget.idBrand != null && widget.idBrand != '') &&
              (widget.idBrand != 'noData') &&
              (widget.idDepartment != null && widget.idDepartment != '') &&
              (widget.idDepartment != 'noData')) ||
          functions.isRoleDepartmentAdmin(FFAppState().user)) {
        await _model.getListStaffs(context);
        setState(() {});
      }
      await _model.getListShifts(context);
      setState(() {});
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
      alignment: const AlignmentDirectional(0.0, 1.0),
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
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
                              fontWeight: FontWeight.w600,
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
                if (functions.isRoleOrgAdmin(FFAppState().user))
                  Text(
                    'Chi nhánh',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                if (functions.isRoleOrgAdmin(FFAppState().user))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDown1ValueController ??=
                          FormFieldController<String>(
                        _model.dropDown1Value ??= (widget.idBrand != null &&
                                    widget.idBrand != '') &&
                                (widget.idBrand != 'noData')
                            ? widget.idBrand
                            : '',
                      ),
                      options: List<String>.from(
                          _model.listBranch.map((e) => e.id).toList()),
                      optionLabels:
                          _model.listBranch.map((e) => e.name).toList(),
                      onChanged: (val) async {
                        setState(() => _model.dropDown1Value = val);
                        setState(() {
                          _model.dropDown3ValueController?.reset();
                        });
                        _model.listStaffs = [];
                        await _model.getListDepartment(context);
                        setState(() {});
                      },
                      width: double.infinity,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nunito Sans',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Chọn chi nhánh',
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                if (functions.isRoleBranchAdmin(FFAppState().user) ||
                    functions.isRoleOrgAdmin(FFAppState().user))
                  Text(
                    'Bộ phận',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                if (functions.isRoleBranchAdmin(FFAppState().user) ||
                    functions.isRoleOrgAdmin(FFAppState().user))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDown2ValueController ??=
                          FormFieldController<String>(
                        _model.dropDown2Value ??=
                            (widget.idDepartment != null &&
                                        widget.idDepartment != '') &&
                                    (widget.idDepartment != 'noData')
                                ? widget.idDepartment
                                : '',
                      ),
                      options: List<String>.from(
                          _model.listDepartment.map((e) => e.id).toList()),
                      optionLabels:
                          _model.listDepartment.map((e) => e.name).toList(),
                      onChanged: (val) async {
                        setState(() => _model.dropDown2Value = val);
                        await _model.getListStaffs(context);
                        setState(() {});
                      },
                      width: double.infinity,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nunito Sans',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Chọn bộ phận',
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
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                Text(
                  'Nhân viên',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDown3ValueController ??=
                        FormFieldController<String>(
                      _model.dropDown3Value ??=
                          (widget.idStaff != null && widget.idStaff != '') &&
                                  (widget.idStaff != 'noData')
                              ? widget.idStaff
                              : '',
                    ),
                    options: List<String>.from(
                        _model.listStaffs.map((e) => e.id).toList()),
                    optionLabels: _model.listStaffs
                        .map((e) => e.userId.firstName)
                        .toList(),
                    onChanged: (val) =>
                        setState(() => _model.dropDown3Value = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Chọn nhân viên',
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
                Text(
                  'Ca làm việc',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDown4ValueController ??=
                        FormFieldController<String>(
                      _model.dropDown4Value ??= '',
                    ),
                    options: List<String>.from(
                        _model.listShifts.map((e) => e.id).toList()),
                    optionLabels: _model.listShifts.map((e) => e.name).toList(),
                    onChanged: (val) =>
                        setState(() => _model.dropDown4Value = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Chọn ca làm việc',
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
                Text(
                  'Trạng thái',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDown5ValueController ??=
                        FormFieldController<String>(
                      _model.dropDown5Value ??= '',
                    ),
                    options: List<String>.from(
                        ['Option 1', '1', '2', '3', '4', '5']),
                    optionLabels: const [
                      'Chưa chấm công',
                      'Đi làm',
                      '1/2 ngày',
                      'Nghỉ có lý do',
                      'Nghỉ không lý do',
                      'Nghỉ có lương'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDown5Value = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Chọn trạng thái chấm công',
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
                          onPressed: () {
                            print('Button pressed ...');
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
                            await widget.callback?.call(
                              _model.dropDown1Value != null &&
                                      _model.dropDown1Value != ''
                                  ? _model.dropDown1Value
                                  : 'noData',
                              _model.dropDown2Value != null &&
                                      _model.dropDown2Value != ''
                                  ? _model.dropDown2Value
                                  : 'noData',
                              _model.dropDown3Value != null &&
                                      _model.dropDown3Value != ''
                                  ? _model.dropDown3Value
                                  : 'noData',
                              _model.dropDown4Value != null &&
                                      _model.dropDown4Value != ''
                                  ? _model.dropDown4Value
                                  : 'noData',
                              _model.dropDown5Value != null &&
                                      _model.dropDown5Value != ''
                                  ? _model.dropDown5Value
                                  : 'noData',
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
