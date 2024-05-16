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
import 'package:provider/provider.dart';
import 'filter_personnel_list_model.dart';
export 'filter_personnel_list_model.dart';

class FilterPersonnelListWidget extends StatefulWidget {
  const FilterPersonnelListWidget({
    super.key,
    this.filterSearch,
    this.callback,
    this.status,
    this.branch,
    this.department,
  });

  final String? filterSearch;
  final Future Function(List<StaffListStruct>? listCallback,
      String? statusCallback, String? department, String? branch)? callback;
  final String? status;
  final String? branch;
  final String? department;

  @override
  State<FilterPersonnelListWidget> createState() =>
      _FilterPersonnelListWidgetState();
}

class _FilterPersonnelListWidgetState extends State<FilterPersonnelListWidget> {
  late FilterPersonnelListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterPersonnelListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getListBranchToken2 = await action_blocks.tokenReload(context);
      if (_model.getListBranchToken2!) {
        _model.apiResultGetListBranch2 = await BranchGroup.branchListCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}}]}',
        );
        if ((_model.apiResultGetListBranch2?.succeeded ?? true)) {
          setState(() {
            _model.branchList = BranchListDataStruct.maybeFromMap(
                    (_model.apiResultGetListBranch2?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<BranchListStruct>();
          });
        }
        _model.listDeparment4Token = await action_blocks.tokenReload(context);
        if (_model.listDeparment4Token!) {
          _model.apiResultListDeparment4 =
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
          if ((_model.apiResultListDeparment4?.succeeded ?? true)) {
            setState(() {
              _model.departmentList = DepartmentListDataStruct.maybeFromMap(
                      (_model.apiResultListDeparment4?.jsonBody ?? ''))!
                  .data
                  .toList()
                  .cast<DepartmentListStruct>();
            });
          }
        } else {
          setState(() {});
        }
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trạng thái hoạt động',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        FlutterFlowChoiceChips(
                          options: const [
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
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
                              widget.status != null && widget.status != ''
                                  ? widget.status!
                                  : ' '
                            ],
                          ),
                          wrapped: true,
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                    if (FFAppState().user.role ==
                        '82073000-1ba2-43a4-a55c-459d17c23b68')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          FlutterFlowDropDown<String>(
                            controller: _model.branchValueController ??=
                                FormFieldController<String>(
                              _model.branchValue ??=
                                  widget.branch != null && widget.branch != ''
                                      ? widget.branch
                                      : '1',
                            ),
                            options: List<String>.from(
                                _model.branchList.map((e) => e.id).toList()),
                            optionLabels:
                                _model.branchList.map((e) => e.name).toList(),
                            onChanged: (val) async {
                              setState(() => _model.branchValue = val);
                              _model.listDeparment3Token =
                                  await action_blocks.tokenReload(context);
                              if (_model.listDeparment3Token!) {
                                _model.apiResultListDeparment3 =
                                    await DepartmentGroup.getDepartmentListCall
                                        .call(
                                  accessToken: FFAppState().accessToken,
                                  filter:
                                      '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${_model.branchValue}\"}}}]}',
                                );
                                if ((_model
                                        .apiResultListDeparment3?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.departmentList =
                                        DepartmentListDataStruct.maybeFromMap(
                                                (_model.apiResultListDeparment3
                                                        ?.jsonBody ??
                                                    ''))!
                                            .data
                                            .toList()
                                            .cast<DepartmentListStruct>();
                                  });
                                }
                              } else {
                                setState(() {});
                              }

                              setState(() {});
                            },
                            width: 300.0,
                            height: 40.0,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                    if ((FFAppState().user.role ==
                            '82073000-1ba2-43a4-a55c-459d17c23b68') ||
                        (FFAppState().user.role ==
                            'a8d33527-375b-4599-ac70-6a3fcad1de39'))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bộ phận',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.departmentValueController ??=
                                FormFieldController<String>(
                              _model.departmentValue ??=
                                  widget.department != null &&
                                          widget.department != ''
                                      ? widget.department
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
                            height: 40.0,
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
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                  ].divide(const SizedBox(height: 8.0)),
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
                                }()}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${widget.filterSearch}\"}}}' : ' '}]}',
                              );
                              if ((_model.apiResultClearFilter?.succeeded ??
                                  true)) {
                                setState(() {
                                  _model.list =
                                      StaffListDataStruct.maybeFromMap((_model
                                                  .apiResultClearFilter
                                                  ?.jsonBody ??
                                              ''))!
                                          .data
                                          .toList()
                                          .cast<StaffListStruct>();
                                });
                                await widget.callback?.call(
                                  _model.list,
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
                            _model.filterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.filterToken!) {
                              _model.apiResultFilter =
                                  await StaffGroup.getStaffListCall.call(
                                accessToken: FFAppState().accessToken,
                                filter:
                                    '{\"_and\":[{}${widget.filterSearch != null && widget.filterSearch != '' ? ',{\"user_id\":{\"first_name\":{\"_icontains\":\"${widget.filterSearch}\"}}}' : ' '}${() {
                                  if ((_model.statusValue != null &&
                                          _model.statusValue != '') &&
                                      (_model.statusValue == 'Hoạt động')) {
                                    return ',{\"status\":{\"_eq\":\"active\"}}';
                                  } else if ((_model.statusValue != null &&
                                          _model.statusValue != '') &&
                                      (_model.statusValue ==
                                          'Không hoạt động')) {
                                    return ',{\"status\":{\"_neq\":\"active\"}}';
                                  } else {
                                    return ' ';
                                  }
                                }()}${() {
                                  if (FFAppState().user.role ==
                                      '82073000-1ba2-43a4-a55c-459d17c23b68') {
                                    return ',{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.organization_id''',
                                    ).toString()}\"}}}';
                                  } else if (FFAppState().user.role ==
                                      'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                                    return ',{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.branch_id''',
                                    ).toString()}\"}}}';
                                  } else if (FFAppState().user.role ==
                                      '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                                    return ',{\"department_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                      FFAppState().staffLogin,
                                      r'''$.department_id''',
                                    ).toString()}\"}}}';
                                  } else {
                                    return ' ';
                                  }
                                }()}${_model.branchValue != '1' ? ',{\"branch_id\":{\"id\":{\"_eq\":\"${_model.branchValue}\"}}}' : ' '}${_model.departmentValue != '1' ? ',{\"department_id\":{\"id\":{\"_eq\":\"${_model.departmentValue}\"}}}' : ' '}]}',
                              );
                              if ((_model.apiResultFilter?.succeeded ?? true)) {
                                setState(() {
                                  _model.list =
                                      StaffListDataStruct.maybeFromMap((_model
                                                  .apiResultFilter?.jsonBody ??
                                              ''))!
                                          .data
                                          .toList()
                                          .cast<StaffListStruct>();
                                });
                                await widget.callback?.call(
                                  _model.list,
                                  _model.statusValue,
                                  _model.departmentValue,
                                  _model.branchValue,
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Lỗi Lọc',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }
                            } else {
                              setState(() {});
                            }

                            setState(() {});
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
                                  fontSize: 14.0,
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
