import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'process_template_detail_model.dart';
export 'process_template_detail_model.dart';

class ProcessTemplateDetailWidget extends StatefulWidget {
  const ProcessTemplateDetailWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<ProcessTemplateDetailWidget> createState() =>
      _ProcessTemplateDetailWidgetState();
}

class _ProcessTemplateDetailWidgetState
    extends State<ProcessTemplateDetailWidget> {
  late ProcessTemplateDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcessTemplateDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadProcessTemplateDetail =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadProcessTemplateDetail!) {
        _model.apiResultm7u =
            await ProcedureTemplateGroup.workflowsOneCall.call(
          accessToken: FFAppState().accessToken,
          id: widget!.id,
        );

        if ((_model.apiResultm7u?.succeeded ?? true)) {
          _model.data = WorkflowsStepCreateStruct(
            name: getJsonField(
              (_model.apiResultm7u?.jsonBody ?? ''),
              r'''$.data.name''',
            ).toString().toString(),
          );
          _model.stepList = functions
              .sortArrayStepList((getJsonField(
                (_model.apiResultm7u?.jsonBody ?? ''),
                r'''$.data.steps''',
                true,
              )!
                      .toList()
                      .map<WorkflowsStepCreateStruct?>(
                          WorkflowsStepCreateStruct.maybeFromMap)
                      .toList() as Iterable<WorkflowsStepCreateStruct?>)
                  .withoutNulls
                  .toList())
              .toList()
              .cast<WorkflowsStepCreateStruct>();
          setState(() {});
        }
        _model.isLoad = true;
        setState(() {});
      } else {
        setState(() {});
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Chi tiết mẫu quy trình',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'Bạn có chắc chắn thêm vào quy trình!'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Có'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        _model.apiResulthxs =
                            await ProcedureTemplateGroup.workflowCopyCall.call(
                          accessToken: FFAppState().accessToken,
                          workflowId: widget!.id,
                        );

                        if ((_model.apiResulthxs?.succeeded ?? true)) {
                          context.pushNamed(
                            'ProcessTemplateList',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          await actions.showToast(
                            context,
                            'Áp dụng quy trình thành công!',
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).secondary,
                          );
                        } else {
                          await actions.showToast(
                            context,
                            'Lỗi sao chép quy trình!',
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).error,
                          );
                        }
                      }

                      setState(() {});
                    },
                    text: 'Áp dụng',
                    icon: Icon(
                      Icons.exit_to_app_sharp,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 36.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: Colors.white,
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
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.isLoad == true,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.projectDiagram,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  _model.data?.name != null &&
                                          _model.data?.name != ''
                                      ? _model.data!.name
                                      : ' ',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        'Sơ đồ quy trình',
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final listView = _model.stepList.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listView.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewItem = listView[listViewIndex];
                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (listViewIndex > 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 15.0,
                                            child: VerticalDivider(
                                              thickness: 3.0,
                                              color: Color(0xB00F0E0E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      40.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: () {
                                                    if ((int var1) {
                                                      return var1 % 5 == 0
                                                          ? true
                                                          : false;
                                                    }(listViewIndex)) {
                                                      return Color(0xFF3ABEF9);
                                                    } else if ((int var1) {
                                                      return var1 % 5 == 1
                                                          ? true
                                                          : false;
                                                    }(listViewIndex)) {
                                                      return Color(0xFF26355D);
                                                    } else if ((int var1) {
                                                      return var1 % 5 == 2
                                                          ? true
                                                          : false;
                                                    }(listViewIndex)) {
                                                      return Color(0xFF059212);
                                                    } else if ((int var1) {
                                                      return var1 % 5 == 3
                                                          ? true
                                                          : false;
                                                    }(listViewIndex)) {
                                                      return Color(0xFFFF407D);
                                                    } else if ((int var1) {
                                                      return var1 % 5 == 4
                                                          ? true
                                                          : false;
                                                    }(listViewIndex)) {
                                                      return Color(0xFF7E8EF1);
                                                    } else {
                                                      return Color(0x00000000);
                                                    }
                                                  }(),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        2.0,
                                                        10.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30.0),
                                                    bottomRight:
                                                        Radius.circular(30.0),
                                                    topLeft:
                                                        Radius.circular(30.0),
                                                    topRight:
                                                        Radius.circular(30.0),
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    30.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewItem.name,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 55.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x6814181B),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                      spreadRadius: 1.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .noColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Bước',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: () {
                                                              if ((int var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        0
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF3ABEF9);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        1
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF26355D);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        2
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF059212);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        3
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFFFF407D);
                                                              } else if ((int
                                                                  var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        4
                                                                    ? true
                                                                    : false;
                                                              }(listViewIndex)) {
                                                                return Color(
                                                                    0xFF7E8EF1);
                                                              } else {
                                                                return Color(
                                                                    0x00000000);
                                                              }
                                                            }(),
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${(listViewIndex + 1).toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: () {
                                                              if ((int var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        0
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF3ABEF9);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        1
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF26355D);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        2
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFF059212);
                                                              } else if ((int
                                                                      var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        3
                                                                    ? true
                                                                    : false;
                                                              }(
                                                                  listViewIndex)) {
                                                                return Color(
                                                                    0xFFFF407D);
                                                              } else if ((int
                                                                  var1) {
                                                                return var1 %
                                                                            5 ==
                                                                        4
                                                                    ? true
                                                                    : false;
                                                              }(listViewIndex)) {
                                                                return Color(
                                                                    0xFF7E8EF1);
                                                              } else {
                                                                return Color(
                                                                    0x00000000);
                                                              }
                                                            }(),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                  if (listViewIndex ==
                                      (_model.stepList.length - 1))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
