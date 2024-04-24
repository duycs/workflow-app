import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_personnel_list_model.dart';
export 'filter_personnel_list_model.dart';

class FilterPersonnelListWidget extends StatefulWidget {
  const FilterPersonnelListWidget({
    super.key,
    this.filterSearch,
    this.callback,
    this.status,
  });

  final String? filterSearch;
  final Future Function(
      List<StaffListStruct>? listCallback, String? statusCallback)? callback;
  final String? status;

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
                            fontFamily: 'Readex Pro',
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
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trạng thái hoạt động',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
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
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
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
                            _model.clearFilterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.clearFilterToken!) {
                              _model.apiResultClearFilter =
                                  await StaffGroup.getStaffListCall.call(
                                accessToken: FFAppState().accessToken,
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
                                setState(() {
                                  _model.statusValueController?.reset();
                                });
                                await widget.callback?.call(
                                  _model.list,
                                  _model.statusValue,
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
                                  fontFamily: 'Readex Pro',
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
                            _model.filterToken =
                                await action_blocks.tokenReload(context);
                            if (_model.filterToken!) {
                              _model.apiResultFilter =
                                  await StaffGroup.getStaffListCall.call(
                                accessToken: FFAppState().accessToken,
                                filter:
                                    '{\"_and\":[${widget.filterSearch != null && widget.filterSearch != '' ? '{\"user_id\":{\"first_name\":{\"_icontains\":\"${widget.filterSearch}\"}}}' : ' '}${() {
                                  if ((_model.statusValue != null &&
                                          _model.statusValue != '') &&
                                      (_model.statusValue == 'Hoạt động')) {
                                    return '{\"status\":{\"_eq\":\"active\"}}';
                                  } else if ((_model.statusValue != null &&
                                          _model.statusValue != '') &&
                                      (_model.statusValue ==
                                          'Không hoạt động')) {
                                    return '{\"status\":{\"_neq\":\"active\"}}';
                                  } else {
                                    return ' ';
                                  }
                                }()}]}',
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
                                  fontFamily: 'Readex Pro',
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
