import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dropdown_departments_list_model.dart';
export 'dropdown_departments_list_model.dart';

class DropdownDepartmentsListWidget extends StatefulWidget {
  const DropdownDepartmentsListWidget({
    super.key,
    required this.callback,
    this.dataPar,
  });

  final Future Function(List<DepartmentsIdStruct>? item)? callback;
  final List<DepartmentsIdStruct>? dataPar;

  @override
  State<DropdownDepartmentsListWidget> createState() =>
      _DropdownDepartmentsListWidgetState();
}

class _DropdownDepartmentsListWidgetState
    extends State<DropdownDepartmentsListWidget> {
  late DropdownDepartmentsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownDepartmentsListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadDropdownDepartmentsList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadDropdownDepartmentsList!) {
        if (widget.dataPar!.isNotEmpty) {
          _model.apiResultDatade =
              await DepartmentGroup.getDepartmentListCall.call(
            accessToken: FFAppState().accessToken,
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
            }()},{\"status\":{\"_eq\":\"published\"}}]}',
          );
          if ((_model.apiResultDatade?.succeeded ?? true)) {
            _model.data = DepartmentListDataStruct.maybeFromMap(
                    (_model.apiResultDatade?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DepartmentListStruct>();
            setState(() {});
          }
          while (_model.loop < _model.data.length) {
            _model.updateDataAtIndex(
              _model.loop,
              (e) => e..checkDep = false,
            );
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop = 0;
          setState(() {});
          while (_model.loop < _model.data.length) {
            while (_model.loop2 < widget.dataPar!.length) {
              if ((widget.dataPar?[_model.loop2])?.departmentsId.id ==
                  _model.data[_model.loop].id) {
                _model.updateDataAtIndex(
                  _model.loop,
                  (e) => e..checkDep = true,
                );
                setState(() {});
              }
              _model.loop2 = _model.loop2 + 1;
              setState(() {});
            }
            _model.loop2 = 0;
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop2 = 0;
          _model.loop = 0;
          setState(() {});
        } else {
          _model.apiResulfilter =
              await DepartmentGroup.getDepartmentListCall.call(
            accessToken: FFAppState().accessToken,
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
            }()},{\"status\":{\"_eq\":\"published\"}}]}',
          );
          if ((_model.apiResulfilter?.succeeded ?? true)) {
            _model.data = DepartmentListDataStruct.maybeFromMap(
                    (_model.apiResulfilter?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DepartmentListStruct>();
            setState(() {});
          }
          while (_model.loop < _model.data.length) {
            _model.updateDataAtIndex(
              _model.loop,
              (e) => e..checkDep = false,
            );
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop = 0;
          setState(() {});
        }

        _model.isLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();

    _model.switchValue1 = true;
    _model.switchValue2 = false;
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
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 750.0,
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
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 80.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.textNameTextController,
                                        focusNode: _model.textNameFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textNameTextController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Tên bộ phận ...',
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          prefixIcon: const Icon(
                                            Icons.search_rounded,
                                          ),
                                          suffixIcon: _model
                                                  .textNameTextController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model
                                                        .textNameTextController
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
                                        validator: _model
                                            .textNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.data
                                            .where((e) => e.checkDep == true)
                                            .toList()
                                            .length ==
                                        _model.data.length)
                                      Switch.adaptive(
                                        value: _model.switchValue1!,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue);

                                          if (!newValue) {
                                            while (_model.loop <
                                                _model.data.length) {
                                              _model.updateDataAtIndex(
                                                _model.loop,
                                                (e) => e..checkDep = false,
                                              );
                                              setState(() {});
                                              _model.loop = _model.loop + 1;
                                              setState(() {});
                                            }
                                            _model.loop = 0;
                                            setState(() {});
                                            setState(() {
                                              _model.switchValue1 = true;
                                            });
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    if (_model.data
                                            .where((e) => e.checkDep == true)
                                            .toList()
                                            .length !=
                                        _model.data.length)
                                      Switch.adaptive(
                                        value: _model.switchValue2!,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue);
                                          if (newValue) {
                                            while (_model.loop <
                                                _model.data.length) {
                                              _model.updateDataAtIndex(
                                                _model.loop,
                                                (e) => e..checkDep = true,
                                              );
                                              setState(() {});
                                              _model.loop = _model.loop + 1;
                                              setState(() {});
                                            }
                                            _model.loop = 0;
                                            setState(() {});
                                            setState(() {
                                              _model.switchValue2 = false;
                                            });
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Chọn tất cả',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (_model.isLoad == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listView = _model.data
                                          .where((e) => e.name
                                              .toLowerCase()
                                              .contains(_model
                                                  .textNameTextController.text
                                                  .toLowerCase()))
                                          .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listView.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 16.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewItem =
                                              listView[listViewIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .checkBoxToggleModels
                                                          .getModel(
                                                        '${listViewItem.id}${listViewItem.name}${listViewItem.checkDep.toString()}',
                                                        listViewIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          CheckBoxToggleWidget(
                                                        key: Key(
                                                          'Keyeub_${'${listViewItem.id}${listViewItem.name}${listViewItem.checkDep.toString()}'}',
                                                        ),
                                                        checkParam: listViewItem
                                                            .checkDep,
                                                        color: 'colorUser',
                                                        callBack:
                                                            (checkCall) async {
                                                          _model.loop = 0;
                                                          setState(() {});
                                                          while (_model.loop <
                                                              _model.data
                                                                  .length) {
                                                            setState(() {});
                                                            if (listViewItem
                                                                    .id ==
                                                                _model
                                                                    .data[_model
                                                                        .loop]
                                                                    .id) {
                                                              _model
                                                                  .updateDataAtIndex(
                                                                _model.loop,
                                                                (e) => e
                                                                  ..checkDep =
                                                                      checkCall,
                                                              );
                                                              setState(() {});
                                                            }
                                                            _model.loop =
                                                                _model.loop + 1;
                                                            setState(() {});
                                                          }
                                                          _model.loop = 0;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewItem.name,
                                                              maxLines: 2,
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              if ((_model.data
                                          .where((e) => e.name
                                              .toLowerCase()
                                              .contains(_model
                                                  .textNameTextController.text
                                                  .toLowerCase()))
                                          .toList().isEmpty) &&
                                  (_model.isLoad == true))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 100.0, 0.0, 50.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.database,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 55.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            'Không có dữ liệu !',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
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
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Đóng',
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.callBackData = [];
                            setState(() {});
                            while (_model.loop < _model.data.length) {
                              if (_model.data[_model.loop].checkDep == true) {
                                _model.addToCallBackData(DepartmentsIdStruct(
                                  departmentsId: DepartmentsStruct(
                                    id: _model.data[_model.loop].id,
                                    name: _model.data[_model.loop].name,
                                  ),
                                ));
                                setState(() {});
                                while (_model.loop2 <
                                    _model.data[_model.loop].staffs.length) {
                                  _model.updateCallBackDataAtIndex(
                                    _model.callBackData.length - 1,
                                    (e) => e
                                      ..updateCheckStaff(
                                        (e) => e.add(StaffsStepStruct(
                                          staffsId: StaffIdStruct(
                                            id: _model.data[_model.loop]
                                                .staffs[_model.loop2].id,
                                            userId: UserIdStruct(
                                              firstName: _model
                                                  .data[_model.loop]
                                                  .staffs[_model.loop2]
                                                  .userId
                                                  .firstName,
                                            ),
                                          ),
                                        )),
                                      ),
                                  );
                                  setState(() {});
                                  _model.loop2 = _model.loop2 + 1;
                                  setState(() {});
                                }
                                _model.loop2 = 0;
                                setState(() {});
                              } else {
                                setState(() {});
                              }

                              _model.loop = _model.loop + 1;
                              setState(() {});
                            }
                            _model.loop = 0;
                            _model.loop2 = 0;
                            setState(() {});
                            Navigator.pop(context);
                            await widget.callback?.call(
                              _model.callBackData,
                            );
                          },
                          text: 'Xác nhận',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
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
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 12.0)),
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
