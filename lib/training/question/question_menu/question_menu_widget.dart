import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/question/question_detail/question_detail_widget.dart';
import '/training/question/question_update/question_update_widget.dart';
import 'package:flutter/material.dart';
import 'question_menu_model.dart';
export 'question_menu_model.dart';

class QuestionMenuWidget extends StatefulWidget {
  const QuestionMenuWidget({
    super.key,
    required this.callBackRequest,
    required this.item,
  });

  final Future Function()? callBackRequest;
  final QuestionObjectStruct? item;

  @override
  State<QuestionMenuWidget> createState() => _QuestionMenuWidgetState();
}

class _QuestionMenuWidgetState extends State<QuestionMenuWidget> {
  late QuestionMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.0,
                child: Divider(
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered1 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered1 = false);
                  }),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.setColor = 1;
                      setState(() {});
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: double.infinity,
                              child: QuestionDetailWidget(
                                itemOne: widget.item!,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      Navigator.pop(context);
                      _model.setColor = 0;
                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _model.setColor == 1
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        title: Text(
                          'Chi tiết',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = false);
                  }),
                  child: Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.setColor = 2;
                        setState(() {});
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: QuestionUpdateWidget(
                                  item: widget.item!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        Navigator.pop(context);
                        _model.setColor = 0;
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _model.setColor == 2
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.edit_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          title: Text(
                            'Chỉnh sửa',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
