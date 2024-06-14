import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/market/add_program_market/add_program_market_widget.dart';
import '/training/study_program/add_department/add_department_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'action_chinh_sua_model.dart';
export 'action_chinh_sua_model.dart';

class ActionChinhSuaWidget extends StatefulWidget {
  const ActionChinhSuaWidget({
    super.key,
    required this.dataDetail,
    required this.callBackList2,
    bool? checkMarket,
    required this.checkpage,
  }) : checkMarket = checkMarket ?? true;

  final StudyProgramListStruct? dataDetail;
  final Future Function()? callBackList2;
  final bool checkMarket;
  final String? checkpage;

  @override
  State<ActionChinhSuaWidget> createState() => _ActionChinhSuaWidgetState();
}

class _ActionChinhSuaWidgetState extends State<ActionChinhSuaWidget> {
  late ActionChinhSuaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionChinhSuaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while ('1' == '1') {
        setState(() {});
        if (_model.triggerRefreshList == true) {
          await widget.callBackList2?.call();
          _model.triggerRefreshList = false;
          setState(() {});
          Navigator.pop(context);
          break;
        }
        await Future.delayed(const Duration(milliseconds: 200));
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
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 300.0,
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
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              if (widget.dataDetail?.userCreated.id == FFAppState().user.id)
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
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: StudyProgramEditWidget(
                              dataDetail: widget.dataDetail!,
                              callBackList1: () async {
                                _model.triggerRefreshList = true;
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Icon(
                            Icons.mode,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              'Chỉnh sửa',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (widget.dataDetail?.status == 'published')
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
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddDepartmentWidget(
                              detail: widget.dataDetail!,
                              callBack: () async {
                                _model.triggerRefreshList = true;
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Icon(
                            Icons.people,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              'Gán chương trình cho bộ phận',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.dataDetail?.template == 0) &&
                  (getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.authors[0]''',
                      ) !=
                      null) &&
                  ((widget.dataDetail?.authorId == null ||
                          widget.dataDetail?.authorId == '') ||
                      ((widget.dataDetail?.authorId != null &&
                              widget.dataDetail?.authorId != '') &&
                          (widget.dataDetail?.authorId ==
                              getJsonField(
                                FFAppState().staffOrganization,
                                r'''$.authors[0]''',
                              ).toString()))) &&
                  (widget.dataDetail?.copyrightOrganizationId == null ||
                      widget.dataDetail?.copyrightOrganizationId == '') &&
                  (FFAppState().marketOn == true) &&
                  (widget.dataDetail?.status == 'published'))
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered3 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered3 = false);
                  }),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddProgramMarketWidget(
                              id: widget.dataDetail!.id,
                              price: widget.dataDetail?.price,
                              version: widget.dataDetail?.version,
                              checkPage: widget.checkpage,
                              nameLession: widget.dataDetail?.lessions
                                  .map((e) => e.lessionsId.name)
                                  .toList(),
                              lessions: widget.dataDetail,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Icon(
                            Icons.shopify,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              'Đưa khóa học lên Market',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.dataDetail?.template == 0) &&
                  (getJsonField(
                        FFAppState().staffOrganization,
                        r'''$.authors[0]''',
                      ) !=
                      null) &&
                  ((widget.dataDetail?.authorId == null ||
                          widget.dataDetail?.authorId == '') ||
                      ((widget.dataDetail?.authorId != null &&
                              widget.dataDetail?.authorId != '') &&
                          (widget.dataDetail?.authorId ==
                              getJsonField(
                                FFAppState().staffOrganization,
                                r'''$.authors[0]''',
                              ).toString()))) &&
                  (widget.dataDetail?.copyrightOrganizationId == null ||
                      widget.dataDetail?.copyrightOrganizationId == '') &&
                  (widget.dataDetail!.version > 0) &&
                  (FFAppState().marketOn == true) &&
                  (widget.dataDetail?.status == 'published'))
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered4 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered4 = false);
                  }),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddProgramMarketWidget(
                              id: widget.dataDetail!.id,
                              price: widget.dataDetail?.price,
                              version: widget.dataDetail?.version,
                              checkPage: widget.checkpage,
                              category: widget.dataDetail?.categoryId,
                              domain: widget.dataDetail?.domainId,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Icon(
                            Icons.shopify,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              'Update version khóa học trên Market',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
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
