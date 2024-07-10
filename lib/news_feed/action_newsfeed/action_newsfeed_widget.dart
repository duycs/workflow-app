import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/news_feed/newsfeed_edit/newsfeed_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'action_newsfeed_model.dart';
export 'action_newsfeed_model.dart';

class ActionNewsfeedWidget extends StatefulWidget {
  const ActionNewsfeedWidget({
    super.key,
    required this.newsFeedList,
    required this.callback,
    this.checkPage,
  });

  final NewsfeedListStruct? newsFeedList;
  final Future Function()? callback;
  final String? checkPage;

  @override
  State<ActionNewsfeedWidget> createState() => _ActionNewsfeedWidgetState();
}

class _ActionNewsfeedWidgetState extends State<ActionNewsfeedWidget> {
  late ActionNewsfeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionNewsfeedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while ('1' == '1') {
        if (_model.var1 == true) {
          await widget.callback?.call();
          _model.var1 = false;
          setState(() {});
          Navigator.pop(context);
        }
        await Future.delayed(const Duration(milliseconds: 500));
      }
    });
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
        constraints: const BoxConstraints(
          maxHeight: 200.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x2B202529),
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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 50.0,
                child: Divider(
                  thickness: 4.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    MouseRegion(
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
                          _model.checkColor = 1;
                          setState(() {});
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: NewsfeedEditWidget(
                                  newsFeedData: widget.newsFeedList!,
                                  callback: () async {
                                    _model.var1 = true;
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          _model.checkColor = 0;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.checkColor == 1
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegionHovered2 = true);
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegionHovered2 = false);
                      }),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.checkColor = 2;
                          setState(() {});

                          context.pushNamed(
                            'NewsfeedDetail',
                            queryParameters: {
                              'newsfeedId': serializeParam(
                                widget.newsFeedList?.id,
                                ParamType.String,
                              ),
                              'checkpage': serializeParam(
                                widget.checkPage,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.checkColor == 2
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.info_outline,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Chi tiết',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
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
    );
  }
}
