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
import 'domains_search_model.dart';
export 'domains_search_model.dart';

class DomainsSearchWidget extends StatefulWidget {
  const DomainsSearchWidget({
    super.key,
    this.callback,
    required this.search,
  });

  final Future Function(List<String>? dom)? callback;
  final List<String>? search;

  @override
  State<DomainsSearchWidget> createState() => _DomainsSearchWidgetState();
}

class _DomainsSearchWidgetState extends State<DomainsSearchWidget> {
  late DomainsSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DomainsSearchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenSearchDomainsSearch =
          await action_blocks.tokenReload(context);
      if (_model.tokenSearchDomainsSearch!) {
        _model.apiResultlld = await DomainGroup.getDomainsListCall.call(
          accessToken: FFAppState().accessToken,
        );
        if ((_model.apiResultlld?.succeeded ?? true)) {
          setState(() {
            _model.domainList = DomainsListDataStruct.maybeFromMap(
                    (_model.apiResultlld?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<DomainsListStruct>();
          });
          while (_model.loop < _model.domainList.length) {
            setState(() {
              _model.updateDomainListAtIndex(
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
        setState(() {});
        if (widget.search!.isNotEmpty) {
          while (_model.loop < widget.search!.length) {
            while (_model.loop2 < _model.domainList.length) {
              if ((widget.search?[_model.loop]) ==
                  _model.domainList[_model.loop2].id) {
                setState(() {
                  _model.updateDomainListAtIndex(
                    _model.loop2,
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
              maxHeight: 650.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
                width: 1.0,
              ),
            ),
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chọn lĩnh vực',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.cancel,
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
                                          hintText: 'Tìm kiếm lĩnh vực...',
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.domainList
                                            .where((e) => e.check == true)
                                            .toList()
                                            .length ==
                                        _model.domainList.length)
                                      Switch.adaptive(
                                        value: _model.switchValue1 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue);

                                          if (!newValue) {
                                            while (_model.loop <
                                                _model.domainList.length) {
                                              setState(() {
                                                _model.updateDomainListAtIndex(
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
                                    if (_model.domainList
                                            .where((e) => e.check == true)
                                            .toList()
                                            .length !=
                                        _model.domainList.length)
                                      Switch.adaptive(
                                        value: _model.switchValue2 ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue);
                                          if (newValue) {
                                            while (_model.loop <
                                                _model.domainList.length) {
                                              setState(() {
                                                _model.updateDomainListAtIndex(
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
                                    final listView = _model.domainList
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
                                          const SizedBox(height: 8.0),
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
                                                      '${listViewItem.id}${listViewItem.name}${listViewItem.check.toString()}',
                                                      listViewIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: CheckBoxToggleWidget(
                                                      key: Key(
                                                        'Keyuxj_${'${listViewItem.id}${listViewItem.name}${listViewItem.check.toString()}'}',
                                                      ),
                                                      checkParam:
                                                          listViewItem.check,
                                                      color: 'colorUser',
                                                      callBack:
                                                          (checkCall) async {
                                                        setState(() {
                                                          _model
                                                              .updateDomainListAtIndex(
                                                            listViewIndex,
                                                            (e) => e
                                                              ..check =
                                                                  checkCall,
                                                          );
                                                        });
                                                        while (_model.loop <
                                                            _model.domainList
                                                                .length) {
                                                          if (listViewItem.id ==
                                                              _model
                                                                  .domainList[
                                                                      _model
                                                                          .loop]
                                                                  .id) {
                                                            setState(() {
                                                              _model
                                                                  .updateDomainListAtIndex(
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
                                                                      'Readex Pro',
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
                            ].divide(const SizedBox(height: 10.0)),
                          ),
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
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {});
                                while (_model.loop < _model.domainList.length) {
                                  if (_model.domainList[_model.loop].check ==
                                      true) {
                                    setState(() {
                                      _model.addToListSeacrh(
                                          _model.domainList[_model.loop].id);
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
                                  _model.listSeacrh,
                                );
                                Navigator.pop(context);
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
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
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
                        ],
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
