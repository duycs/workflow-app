import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_report_staff_model.dart';
export 'filter_report_staff_model.dart';

class FilterReportStaffWidget extends StatefulWidget {
  const FilterReportStaffWidget({
    super.key,
    this.filterSearch,
    this.callback,
    this.status,
    this.branch,
    this.department,
  });

  final String? filterSearch;
  final Future Function(
      String? statusCallback, String? department, String? branch)? callback;
  final String? status;
  final String? branch;
  final String? department;

  @override
  State<FilterReportStaffWidget> createState() =>
      _FilterReportStaffWidgetState();
}

class _FilterReportStaffWidgetState extends State<FilterReportStaffWidget> {
  late FilterReportStaffModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterReportStaffModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getListBranchToken3 = await action_blocks.tokenReload(context);
      if (_model.getListBranchToken3!) {
        _model.apiResultGetListBranch3 = await BranchGroup.branchListCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}}]}',
        );

        if ((_model.apiResultGetListBranch3?.succeeded ?? true)) {
          _model.branchList = BranchListDataStruct.maybeFromMap(
                  (_model.apiResultGetListBranch3?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<BranchListStruct>();
          setState(() {});
        }
        _model.listDeparment5Token = await action_blocks.tokenReload(context);
        if (_model.listDeparment5Token!) {
          _model.apiResultListDeparment5 =
              await DepartmentGroup.getDepartmentListCall.call(
            accessToken: FFAppState().accessToken,
            filter: () {
              if ((_model.branchValue == '1') &&
                  (FFAppState().user.role ==
                      '82073000-1ba2-43a4-a55c-459d17c23b68')) {
                return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.organization_id''',
                ).toString().toString()}\"}}}]}';
              } else if (((_model.branchValue == '1') &&
                      (FFAppState().user.role ==
                          'a8d33527-375b-4599-ac70-6a3fcad1de39')) ||
                  ((_model.branchValue != '1') &&
                      (FFAppState().user.role ==
                          'a8d33527-375b-4599-ac70-6a3fcad1de39'))) {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.branch_id''',
                ).toString().toString()}\"}}}]}';
              } else if ((_model.branchValue != '1') &&
                  (FFAppState().user.role ==
                      '82073000-1ba2-43a4-a55c-459d17c23b68')) {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${_model.branchValue}\"}}}]}';
              } else {
                return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.organization_id''',
                ).toString().toString()}\"}}}]}';
              }
            }(),
          );

          if ((_model.apiResultListDeparment5?.succeeded ?? true)) {
            _model.departmentList = DepartmentListDataStruct.maybeFromMap(
                    (_model.apiResultListDeparment5?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DepartmentListStruct>();
            setState(() {});
          }
        } else {
          setState(() {});
        }
      } else {
        setState(() {});
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
        width: double.infinity,
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
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if ('1' == '2')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trạng thái hoạt động',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            FlutterFlowChoiceChips(
                              options: [
                                ChipData('Hoạt động'),
                                ChipData('Không hoạt động')
                              ],
                              onChanged: (val) => setState(
                                  () => _model.statusValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 14.0,
                                elevation: 4.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 14.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 12.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.statusValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.statusValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  widget!.status != null && widget!.status != ''
                                      ? widget!.status!
                                      : ' '
                                ],
                              ),
                              wrapped: true,
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    if (FFAppState().user.role ==
                        '82073000-1ba2-43a4-a55c-459d17c23b68')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Chi nhánh',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.branchValueController ??=
                                  FormFieldController<String>(
                                _model.branchValue ??= widget!.branch != null &&
                                        widget!.branch != ''
                                    ? widget!.branch
                                    : '1',
                              ),
                              options: List<String>.from(
                                  _model.branchList.map((e) => e.id).toList()),
                              optionLabels:
                                  _model.branchList.map((e) => e.name).toList(),
                              onChanged: (val) async {
                                setState(() => _model.branchValue = val);
                                _model.listDeparment4Token =
                                    await action_blocks.tokenReload(context);
                                if (_model.listDeparment4Token!) {
                                  _model.apiResultListDeparment4 =
                                      await DepartmentGroup
                                          .getDepartmentListCall
                                          .call(
                                    accessToken: FFAppState().accessToken,
                                    filter:
                                        '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${_model.branchValue}\"}}}]}',
                                  );

                                  if ((_model
                                          .apiResultListDeparment4?.succeeded ??
                                      true)) {
                                    _model.departmentList =
                                        DepartmentListDataStruct.maybeFromMap(
                                                (_model.apiResultListDeparment4
                                                        ?.jsonBody ??
                                                    ''))!
                                            .data
                                            .toList()
                                            .cast<DepartmentListStruct>();
                                    setState(() {});
                                  }
                                } else {
                                  setState(() {});
                                }

                                setState(() {});
                              },
                              width: 300.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Lọc theo chi nhánh',
                              searchHintText: 'Tìm kiếm ',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    if ((FFAppState().user.role ==
                            '82073000-1ba2-43a4-a55c-459d17c23b68') ||
                        (FFAppState().user.role ==
                            'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Bộ phận',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.departmentValueController ??=
                                FormFieldController<String>(
                              _model.departmentValue ??=
                                  widget!.department != null &&
                                          widget!.department != ''
                                      ? widget!.department
                                      : '1',
                            ),
                            options: List<String>.from(_model.departmentList
                                .map((e) => e.id)
                                .toList()),
                            optionLabels: _model.departmentList
                                .map((e) => e.name)
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _model.departmentValue = val),
                            width: 300.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Lọc theo bộ phận',
                            searchHintText: 'Tìm kiếm ',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                  ].divide(SizedBox(height: 8.0)),
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
                              _model.statusValueController?.reset();
                            });
                            _model.clearFilterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.clearFilterToken!) {
                              _model.apiResultClearFilter =
                                  await StaffGroup.getStaffListCall.call(
                                accessToken: FFAppState().accessToken,
                                filter: '{\"_and\":[${() {
                                  if (FFAppState().user.role ==
                                      '82073000-1ba2-43a4-a55c-459d17c23b68') {
                                    return '{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.organization_id''',
                                    ).toString()}\"}}}';
                                  } else if (FFAppState().user.role ==
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                    return '{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.branch_id''',
                                    ).toString()}\"}}}';
                                  } else if (FFAppState().user.role ==
                                      '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                    return '{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.department_id''',
                                    ).toString()}\"}}}';
                                  } else {
                                    return ' ';
                                  }
                                }()}${widget!.filterSearch != null && widget!.filterSearch != '' ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${widget!.filterSearch}\"}}}' : ' '}]}',
                              );

                              if ((_model.apiResultClearFilter?.succeeded ??
                                  true)) {
                                _model.list = StaffListDataStruct.maybeFromMap(
                                        (_model.apiResultClearFilter
                                                ?.jsonBody ??
                                            ''))!
                                    .data
                                    .toList()
                                    .cast<StaffListStruct>();
                                setState(() {});
                                await widget.callback?.call(
                                  '',
                                  '',
                                  '',
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
                                  fontSize: 14.0,
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
                              _model.statusValue != null &&
                                      _model.statusValue != ''
                                  ? _model.statusValue
                                  : '',
                              _model.departmentValue != null &&
                                      _model.departmentValue != ''
                                  ? _model.departmentValue
                                  : '',
                              _model.branchValue != null &&
                                      _model.branchValue != ''
                                  ? _model.branchValue
                                  : '',
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
