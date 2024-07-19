import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found/data_not_found_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'time_keeping_shift_select_model.dart';
export 'time_keeping_shift_select_model.dart';

class TimeKeepingShiftSelectWidget extends StatefulWidget {
  const TimeKeepingShiftSelectWidget({
    super.key,
    required this.callback,
  });

  final Future Function(ShiftListStruct item)? callback;

  @override
  State<TimeKeepingShiftSelectWidget> createState() =>
      _TimeKeepingShiftSelectWidgetState();
}

class _TimeKeepingShiftSelectWidgetState
    extends State<TimeKeepingShiftSelectWidget> {
  late TimeKeepingShiftSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeKeepingShiftSelectModel());

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
        constraints: BoxConstraints(
          maxHeight: 600.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50.0,
                  child: Divider(
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 16.0),
                        child: Text(
                          'Chọn ca làm việc',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                PagedListView<ApiPagingParams, dynamic>.separated(
                  pagingController: _model.setListViewController(
                    (nextPageMarker) =>
                        TimekeepingShiftGroup.shiftListCall.call(
                      accessToken: FFAppState().accessToken,
                      offset: nextPageMarker.nextPageNumber * 20,
                      limit: 20,
                      filter:
                          '{\"_and\":[{\"status\":{\"_eq\":\"published\"}},{\"organization_id\":{\"id\":{\"_eq\":\"${getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.id''',
                      ).toString()}\"}}}]}',
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => SizedBox(height: 4.0),
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) => DataNotFoundWidget(),
                    itemBuilder: (context, _, shiftsIndex) {
                      final shiftsItem = _model
                          .listViewPagingController!.itemList![shiftsIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.callback?.call(
                            ShiftListStruct(
                              id: shiftsItem.id,
                              startTime: shiftsItem.startTime,
                              endTime: shiftsItem.endTime,
                              name: shiftsItem.name,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: ListTile(
                              title: Text(
                                shiftsItem.name != null && shiftsItem.name != ''
                                    ? shiftsItem.name
                                    : 'Chưa cập nhật',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: shiftsItem.name != null &&
                                              shiftsItem.name != ''
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : Color(0x6D57636C),
                                      fontSize: shiftsItem.name != null &&
                                              shiftsItem.name != ''
                                          ? 18.0
                                          : 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                '${shiftsItem.startTime} - ${shiftsItem.endTime}',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              dense: false,
                            ),
                          ),
                        ),
                      );
                    },
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
