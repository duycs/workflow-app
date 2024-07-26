import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_staff_check_departments_model.dart';
export 'alert_staff_check_departments_model.dart';

class AlertStaffCheckDepartmentsWidget extends StatefulWidget {
  const AlertStaffCheckDepartmentsWidget({
    super.key,
    required this.listParam,
  });

  final List<CheckUpdateStepStruct>? listParam;

  @override
  State<AlertStaffCheckDepartmentsWidget> createState() =>
      _AlertStaffCheckDepartmentsWidgetState();
}

class _AlertStaffCheckDepartmentsWidgetState
    extends State<AlertStaffCheckDepartmentsWidget> {
  late AlertStaffCheckDepartmentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertStaffCheckDepartmentsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                  child: Text(
                    'Lưu ý: Không chọn nhân viên đã có trong bộ phận được chọn!',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).error,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final list = widget!.listParam!.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, listIndex) {
                      final listItem = list[listIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Nhân viên ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        ': ${listItem.firstName}',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Đã có trong bộ phận',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        ': ${listItem.name}',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    'Vui lòng chọn lại nhân viên hoặc bộ phận!',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Tôi đã hiểu',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
