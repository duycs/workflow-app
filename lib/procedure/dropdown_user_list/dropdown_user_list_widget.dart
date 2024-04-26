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
import 'package:provider/provider.dart';
import 'dropdown_user_list_model.dart';
export 'dropdown_user_list_model.dart';

class DropdownUserListWidget extends StatefulWidget {
  const DropdownUserListWidget({
    super.key,
    required this.callback,
    this.dataPar,
  });

  final Future Function(List<StaffListStruct>? item)? callback;
  final List<StaffsStepStruct>? dataPar;

  @override
  State<DropdownUserListWidget> createState() => _DropdownUserListWidgetState();
}

class _DropdownUserListWidgetState extends State<DropdownUserListWidget> {
  late DropdownUserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownUserListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadDropdownUserList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadDropdownUserList!) {
        if (widget.dataPar!.isNotEmpty) {
          _model.apiResultList = await StaffGroup.getStaffListCall.call(
            accessToken: FFAppState().accessToken,
            filter: () {
              if (FFAppState().user.role ==
                  '82073000-1ba2-43a4-a55c-459d17c23b68') {
                return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.organization_id''',
                ).toString().toString()}\"}}}]}';
              } else if (FFAppState().user.role ==
                  'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.branch_id''',
                ).toString().toString()}\"}}}]}';
              } else if (FFAppState().user.role ==
                  '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.department_id''',
                ).toString().toString()}\"}}}]}';
              } else {
                return '{\"_and\":[]}';
              }
            }(),
          );
          if ((_model.apiResultList?.succeeded ?? true)) {
            setState(() {
              _model.staffList = StaffListDataStruct.maybeFromMap(
                      (_model.apiResultList?.jsonBody ?? ''))!
                  .data
                  .toList()
                  .cast<StaffListStruct>();
            });
          }
          while (_model.loop < _model.staffList.length) {
            setState(() {
              _model.updateStaffListAtIndex(
                _model.loop,
                (e) => e..check = false,
              );
            });
            setState(() {
              _model.loop = _model.loop + 1;
            });
          }
          setState(() {
            _model.loop = 0;
          });
          while (_model.loop < _model.staffList.length) {
            while (_model.loop2 < widget.dataPar!.length) {
              if (_model.staffList[_model.loop].id ==
                  (widget.dataPar?[_model.loop2])?.staffsId.id) {
                setState(() {
                  _model.updateStaffListAtIndex(
                    _model.loop,
                    (e) => e..check = true,
                  );
                });
              }
              setState(() {
                _model.loop2 = _model.loop2 + 1;
              });
            }
            setState(() {
              _model.loop2 = 0;
            });
            setState(() {
              _model.loop = _model.loop + 1;
            });
          }
          setState(() {
            _model.loop2 = 0;
            _model.loop = 0;
          });
        } else {
          _model.apiResultListData = await StaffGroup.getStaffListCall.call(
            accessToken: FFAppState().accessToken,
            filter: () {
              if (FFAppState().user.role ==
                  '82073000-1ba2-43a4-a55c-459d17c23b68') {
                return '{\"_and\":[{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.organization_id''',
                ).toString().toString()}\"}}}]}';
              } else if (FFAppState().user.role ==
                  'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.branch_id''',
                ).toString().toString()}\"}}}]}';
              } else if (FFAppState().user.role ==
                  '6a8bc644-cb2d-4a31-b11e-b86e19824725') {
                return '{\"_and\":[{\"branch_id\":{\"id\":{\"_eq\":\"${getJsonField(
                  FFAppState().staffLogin,
                  r'''$.department_id''',
                ).toString().toString()}\"}}}]}';
              } else {
                return '{\"_and\":[]}';
              }
            }(),
          );
          if ((_model.apiResultListData?.succeeded ?? true)) {
            setState(() {
              _model.staffList = StaffListDataStruct.maybeFromMap(
                      (_model.apiResultListData?.jsonBody ?? ''))!
                  .data
                  .toList()
                  .cast<StaffListStruct>();
            });
          }
          while (_model.loop < _model.staffList.length) {
            setState(() {
              _model.updateStaffListAtIndex(
                _model.loop,
                (e) => e..check = false,
              );
            });
            setState(() {
              _model.loop = _model.loop + 1;
            });
          }
          setState(() {
            _model.loop = 0;
          });
        }

        setState(() {
          _model.isLoad = true;
        });
      } else {
        setState(() {});
        return;
      }
    });

    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Tên nhân viên/email...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
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
                                              fontFamily: 'Readex Pro',
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
                                    if (_model.staffList
                                            .where((e) => e.check == true)
                                            .toList()
                                            .length ==
                                        _model.staffList.length)
                                      Switch.adaptive(
                                        value: _model.switchValue1 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue);

                                          if (!newValue) {
                                            while (_model.loop <
                                                _model.staffList.length) {
                                              setState(() {
                                                _model.updateStaffListAtIndex(
                                                  _model.loop,
                                                  (e) => e..check = false,
                                                );
                                              });
                                              setState(() {
                                                _model.loop = _model.loop + 1;
                                              });
                                            }
                                            setState(() {
                                              _model.loop = 0;
                                            });
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
                                    if (_model.staffList
                                            .where((e) => e.check == true)
                                            .toList()
                                            .length !=
                                        _model.staffList.length)
                                      Switch.adaptive(
                                        value: _model.switchValue2 ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue);
                                          if (newValue) {
                                            while (_model.loop <
                                                _model.staffList.length) {
                                              setState(() {
                                                _model.updateStaffListAtIndex(
                                                  _model.loop,
                                                  (e) => e..check = true,
                                                );
                                              });
                                              setState(() {
                                                _model.loop = _model.loop + 1;
                                              });
                                            }
                                            setState(() {
                                              _model.loop = 0;
                                            });
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
                                              fontFamily: 'Readex Pro',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final listView = _model.staffList
                                        .where((e) =>
                                            e.userId.firstName
                                                .toLowerCase()
                                                .contains(_model
                                                    .textNameTextController.text
                                                    .toLowerCase()) ||
                                            e.userId.email
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .checkBoxToggleModels
                                                        .getModel(
                                                      '${listViewItem.userId.firstName}${listViewItem.check.toString()}${listViewItem.id}',
                                                      listViewIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: CheckBoxToggleWidget(
                                                      key: Key(
                                                        'Key31x_${'${listViewItem.userId.firstName}${listViewItem.check.toString()}${listViewItem.id}'}',
                                                      ),
                                                      checkParam:
                                                          listViewItem.check,
                                                      color: 'colorUser',
                                                      callBack:
                                                          (checkCall) async {
                                                        setState(() {});
                                                        while (_model.loop <
                                                            _model.staffList
                                                                .length) {
                                                          if (listViewItem.id ==
                                                              _model
                                                                  .staffList[
                                                                      _model
                                                                          .loop]
                                                                  .id) {
                                                            setState(() {
                                                              _model
                                                                  .updateStaffListAtIndex(
                                                                _model.loop,
                                                                (e) => e
                                                                  ..check =
                                                                      checkCall,
                                                              );
                                                            });
                                                          }
                                                          setState(() {
                                                            _model.loop =
                                                                _model.loop + 1;
                                                          });
                                                        }
                                                        setState(() {
                                                          _model.loop = 0;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${listViewItem.userId.avatar != '' ? listViewItem.userId.avatar : ' '}?access_token=${FFAppState().accessToken}',
                                                        width: 32.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                      ),
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
                                                            listViewItem.userId
                                                                .firstName,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewItem
                                                                  .userId.email,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
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
                                  fontFamily: 'Readex Pro',
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
                            setState(() {});
                            while (_model.loop < _model.staffList.length) {
                              if (_model.staffList[_model.loop].check == true) {
                                setState(() {
                                  _model.addToCallBackData(StaffListStruct(
                                    id: _model.staffList[_model.loop].id,
                                    userId: UserStruct(
                                      firstName: _model.staffList[_model.loop]
                                          .userId.firstName,
                                    ),
                                  ));
                                });
                              }
                              setState(() {
                                _model.loop = _model.loop + 1;
                              });
                            }
                            setState(() {
                              _model.loop = 0;
                            });
                            await widget.callback?.call(
                              _model.callBackData,
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
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
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
