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
import 'package:google_fonts/google_fonts.dart';
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
          _model.domainList = DomainsListDataStruct.maybeFromMap(
                  (_model.apiResultlld?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<DomainsListStruct>();
          setState(() {});
          while (_model.loop < _model.domainList.length) {
            _model.updateDomainListAtIndex(
              _model.loop,
              (e) => e..check = false,
            );
            setState(() {});
            _model.loop = _model.loop + 1;
            setState(() {});
          }
          _model.loop = 0;
          setState(() {});
        }

        setState(() {});
        if (widget!.search!.length > 0) {
          while (_model.loop < widget!.search!.length) {
            while (_model.loop2 < _model.domainList.length) {
              if ((widget!.search?[_model.loop]) ==
                  _model.domainList[_model.loop2].id) {
                _model.updateDomainListAtIndex(
                  _model.loop2,
                  (e) => e..check = true,
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

    return Visibility(
      visible: _model.isLoad == true,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 700.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
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
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
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
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                          Duration(milliseconds: 2000),
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
                                          hintText: 'Tìm kiếm lĩnh vực...',
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          prefixIcon: Icon(
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
                                                  child: Icon(
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                        value: _model.switchValue1!,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue!);

                                          if (!newValue!) {
                                            while (_model.loop <
                                                _model.domainList.length) {
                                              _model.updateDomainListAtIndex(
                                                _model.loop,
                                                (e) => e..check = false,
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
                                    if (_model.domainList
                                            .where((e) => e.check == true)
                                            .toList()
                                            .length !=
                                        _model.domainList.length)
                                      Switch.adaptive(
                                        value: _model.switchValue2!,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue!);
                                          if (newValue!) {
                                            while (_model.loop <
                                                _model.domainList.length) {
                                              _model.updateDomainListAtIndex(
                                                _model.loop,
                                                (e) => e..check = true,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final listView = _model.domainList
                                        .where((e) => (e.name.toLowerCase())
                                            .contains((_model
                                                .textNameTextController.text
                                                .toLowerCase())))
                                        .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listView.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewItem =
                                            listView[listViewIndex];
                                        return Container(
                                          decoration: BoxDecoration(),
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
                                                        _model
                                                            .updateDomainListAtIndex(
                                                          listViewIndex,
                                                          (e) => e
                                                            ..check = checkCall,
                                                        );
                                                        setState(() {});
                                                        while (_model.loop <
                                                            _model.domainList
                                                                .length) {
                                                          if (listViewItem.id ==
                                                              _model
                                                                  .domainList[
                                                                      _model
                                                                          .loop]
                                                                  .id) {
                                                            _model
                                                                .updateDomainListAtIndex(
                                                              _model.loop,
                                                              (e) => e
                                                                ..check =
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
                                                          EdgeInsetsDirectional
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
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Đóng',
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito Sans',
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
                                    _model.addToListSeacrh(
                                        _model.domainList[_model.loop].id);
                                    setState(() {});
                                  }
                                  _model.loop = _model.loop + 1;
                                  setState(() {});
                                }
                                _model.loop = 0;
                                setState(() {});
                                await widget.callback?.call(
                                  _model.listSeacrh,
                                );
                                Navigator.pop(context);
                              },
                              text: 'Xác nhận',
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                borderSide: BorderSide(
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
