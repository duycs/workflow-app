import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
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
import 'add_department_model.dart';
export 'add_department_model.dart';

class AddDepartmentWidget extends StatefulWidget {
  const AddDepartmentWidget({
    super.key,
    required this.callBack,
    required this.detail,
  });

  final Future Function()? callBack;
  final StudyProgramListStruct? detail;

  @override
  State<AddDepartmentWidget> createState() => _AddDepartmentWidgetState();
}

class _AddDepartmentWidgetState extends State<AddDepartmentWidget> {
  late AddDepartmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDepartmentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenReloadAddDepartmentListList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadAddDepartmentListList!) {
        setState(() {});
        while (_model.loop < widget.detail!.departments.length) {
          _model.addToListAdd(DepartmentListStruct(
            id: (widget.detail?.departments[_model.loop])?.departmentsId.id,
            name:
                (widget.detail?.departments[_model.loop])?.departmentsId.name,
          ));
          setState(() {});
          _model.loop = _model.loop + 1;
          setState(() {});
        }
        _model.loop = 0;
        setState(() {});
      } else {
        setState(() {});
        return;
      }

      _model.addDepartmentListcall =
          await DepartmentGroup.getDepartmentListCall.call(
        filter: '{\"_and\":[${() {
          if (FFAppState().user.role ==
              '82073000-1ba2-43a4-a55c-459d17c23b68') {
            return '{\"organization_id\":{\"_eq\":\"';
          } else if (FFAppState().user.role ==
              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
            return '{\"branch_id\":{\"id\":{\"_eq\":\"';
          } else {
            return ' ';
          }
        }()}${() {
          if (FFAppState().user.role ==
              '82073000-1ba2-43a4-a55c-459d17c23b68') {
            return getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString();
          } else if (FFAppState().user.role ==
              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
            return getJsonField(
              FFAppState().staffBranch,
              r'''$.id''',
            ).toString().toString();
          } else {
            return ' ';
          }
        }()}${() {
          if (FFAppState().user.role ==
              '82073000-1ba2-43a4-a55c-459d17c23b68') {
            return '\"}}';
          } else if (FFAppState().user.role ==
              'a8d33527-375b-4599-ac70-6a3fcad1de39') {
            return '\"}}}';
          } else {
            return ' ';
          }
        }()}${FFAppState().user.role == '6a8bc644-cb2d-4a31-b11e-b86e19824725' ? ',{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.department_id''',
          ).toString().toString()}\"}}' : ' '}]}',
        accessToken: FFAppState().accessToken,
      );
      if ((_model.addDepartmentListcall?.succeeded ?? true)) {
        _model.dataList = DepartmentListDataStruct.maybeFromMap(
                (_model.addDepartmentListcall?.jsonBody ?? ''))!
            .data
            .toList()
            .cast<DepartmentListStruct>();
        setState(() {});
      }
      _model.isLoad = true;
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
    context.watch<FFAppState>();

    return Visibility(
      visible: _model.isLoad == true,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Gán chương trình cho bộ phận',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await widget.callBack?.call();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= '',
                          ),
                          options: List<String>.from(
                              _model.dataList.map((e) => e.id).toList()),
                          optionLabels:
                              _model.dataList.map((e) => e.name).toList(),
                          onChanged: (val) async {
                            setState(() => _model.dropDownValue = val);
                            setState(() {});
                            if (!_model.listAdd
                                .map((e) => e.id)
                                .toList()
                                .contains((_model.dropDownValue!))) {
                              _model.addToListAdd(_model.dataList
                                  .where((e) => e.id == _model.dropDownValue)
                                  .toList()
                                  .first);
                              setState(() {});
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text('Bộ phận đã có!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Đóng'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          width: 300.0,
                          height: 56.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Chọn bộ phận',
                          searchHintText: 'Tìm kiếm bộ phận ...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 1.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                        Builder(
                          builder: (context) {
                            final listShow = _model.listAdd.toList();
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(listShow.length,
                                    (listShowIndex) {
                                  final listShowItem = listShow[listShowIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${(listShowIndex + 1).toString()}. ${listShowItem.name}',
                                              maxLines: 3,
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
                                          if (((FFAppState().user.role ==
                                                      '6a8bc644-cb2d-4a31-b11e-b86e19824725') &&
                                                  (getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.department_id''',
                                                      ).toString() ==
                                                      listShowItem.id)) ||
                                              ((FFAppState().user.role ==
                                                      'a8d33527-375b-4599-ac70-6a3fcad1de39') &&
                                                  (getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.branch_id''',
                                                      ).toString() ==
                                                      listShowItem
                                                          .branchId.id)) ||
                                              (FFAppState().user.role ==
                                                  '82073000-1ba2-43a4-a55c-459d17c23b68'))
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
                                                _model.removeAtIndexFromListAdd(
                                                    listShowIndex);
                                                setState(() {});
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(const SizedBox(height: 6.0)),
                              ),
                            );
                          },
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
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
                              await widget.callBack?.call();
                              Navigator.pop(context);
                            },
                            text: 'Đóng',
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
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Double Tap',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                          child: FFButtonWidget(
                            onPressed: () async {
                              var shouldSetState = false;
                              _model.loop = 0;
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Trước vào loop',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              _model.updateRequestStruct(
                                (e) => e
                                  ..departments =
                                      _model.requestDepartmentList.toList(),
                              );
                              setState(() {});
                              while (_model.loop < _model.listAdd.length) {
                                _model.addToCheckDepartmentList(
                                    DepartmentListStruct(
                                  departmentsId: DepartmentsStruct(
                                    id: _model.listAdd[_model.loop].id,
                                  ),
                                ));
                                setState(() {});
                                _model.loop = _model.loop + 1;
                                setState(() {});
                              }
                              _model.loop = 0;
                              _model.updateRequestStruct(
                                (e) => e
                                  ..departments =
                                      _model.checkDepartmentList.toList(),
                              );
                              setState(() {});
                              _model.tokenReloadAddDepartmentListListCallApi =
                                  await action_blocks.tokenReload(context);
                              shouldSetState = true;
                              if (_model
                                  .tokenReloadAddDepartmentListListCallApi!) {
                                setState(() {});
                              } else {
                                setState(() {});
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              _model.studyProgramAddDepartment =
                                  await StudyProgramGroup
                                      .updateDepartmentSynchronizedCall
                                      .call(
                                accessToken: FFAppState().accessToken,
                                requestDataJson: <String, dynamic>{
                                  'id': widget.detail?.id,
                                  'departments': getJsonField(
                                    <String, List<dynamic>?>{
                                      'map': getJsonField(
                                        _model.request?.toMap(),
                                        r'''$.departments''',
                                        true,
                                      ),
                                    },
                                    r'''$.map''',
                                  ),
                                },
                              );
                              shouldSetState = true;
                              if ((_model
                                      .studyProgramAddDepartment?.succeeded ??
                                  true)) {
                                await widget.callBack?.call();
                              }
                              Navigator.pop(context);
                              if (shouldSetState) setState(() {});
                            },
                            text: 'Xác nhận',
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
