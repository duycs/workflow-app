import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_detail_ck_popup_model.dart';
export 'task_detail_ck_popup_model.dart';

class TaskDetailCkPopupWidget extends StatefulWidget {
  const TaskDetailCkPopupWidget({
    super.key,
    required this.item,
    required this.action,
    required this.workflowId,
    required this.publishedCount,
    this.paramBack,
  });

  final String? item;
  final Future Function(String? ckString)? action;
  final String? workflowId;
  final int? publishedCount;
  final String? paramBack;

  @override
  State<TaskDetailCkPopupWidget> createState() =>
      _TaskDetailCkPopupWidgetState();
}

class _TaskDetailCkPopupWidgetState extends State<TaskDetailCkPopupWidget> {
  late TaskDetailCkPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskDetailCkPopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.itemCk = widget.item!;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Nhập văn bản',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() {});
                  await widget.action?.call(
                    _model.itemCk,
                  );

                  context.pushNamed(
                    'TaskDetail',
                    queryParameters: {
                      'workflowId': serializeParam(
                        widget.workflowId,
                        ParamType.String,
                      ),
                      'publishedCount': serializeParam(
                        widget.publishedCount,
                        ParamType.int,
                      ),
                      'paramBack': serializeParam(
                        widget.paramBack,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  Navigator.pop(context);
                },
                text: 'Lưu',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontSize: 14.0,
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
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: custom_widgets.CKEditorUpdate(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          initialData: widget.item!,
                          action: (data) async {
                            setState(() {
                              _model.itemCk = data;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
