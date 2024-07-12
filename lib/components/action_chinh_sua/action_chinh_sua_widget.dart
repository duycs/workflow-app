import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/training/certificate/list_certi/list_certi_widget.dart';
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
    this.dataDetail,
    this.callBackList2,
    bool? checkMarket,
    this.checkpage,
    this.itemProgram,
    this.itemLessions,
    this.itemLession,
    this.idProgram,
    required this.checkCodeCertificate,
  }) : checkMarket = checkMarket ?? true;

  final StudyProgramListStruct? dataDetail;
  final Future Function()? callBackList2;
  final bool checkMarket;
  final String? checkpage;
  final dynamic itemProgram;
  final StudyProgramListStruct? itemLessions;
  final LessonsStruct? itemLession;
  final String? idProgram;
  final String? checkCodeCertificate;

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
      _model.checkPage = widget.checkpage!;
      setState(() {});
      while ('1' == '1') {
        setState(() {});
        if ((_model.checkPage != 'programEdit') &&
            (_model.triggerRefreshList == true)) {
          await widget.callBackList2?.call();
          _model.triggerRefreshList = false;
          setState(() {});
          Navigator.pop(context);
          break;
        } else if ((_model.checkPage == 'programEdit') &&
            (_model.triggerRefreshList != true)) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: StudyProgramEditWidget(
                  dataDetail: widget.dataDetail,
                  itemLessions: widget.itemLessions,
                  itemPrograms: widget.itemProgram,
                  itemLession: widget.itemLession,
                  callBackList1: () async {
                    _model.triggerRefreshList = true;
                    setState(() {});
                  },
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          _model.checkPage = '';
          setState(() {});
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

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 50.0,
                child: Divider(
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    if (widget.checkpage != 'studyProgramDetail')
                      Container(
                        decoration: BoxDecoration(
                          color: _model.setColor == 5
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.setColor = 5;
                            setState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 100));

                            context.pushNamed(
                              'StudyProgramDetail',
                              queryParameters: {
                                'studyProgramList': serializeParam(
                                  widget.dataDetail,
                                  ParamType.DataStruct,
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
                            _model.setColor = 0;
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.article,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Xem chi tiết',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      ),
                    if (widget.checkpage != 'studyProgramDetail')
                      Container(
                        decoration: BoxDecoration(
                          color: _model.setColor == 1
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                        ),
                        child: Visibility(
                          visible: widget.dataDetail?.userCreated.id ==
                              FFAppState().user.id,
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
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: StudyProgramEditWidget(
                                      dataDetail: widget.dataDetail,
                                      callBackList1: () async {
                                        _model.triggerRefreshList = true;
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.setColor = 0;
                              setState(() {});
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.edit,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              title: Text(
                                'Chỉnh sửa',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                    Container(
                      decoration: BoxDecoration(
                        color: _model.setColor == 2
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: widget.dataDetail?.status == 'published',
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.setColor = 2;
                            setState(() {});
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

                            _model.setColor = 0;
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.supervisor_account,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Gán cho bộ phận',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                    Container(
                      decoration: BoxDecoration(
                        color: _model.setColor == 3
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: (widget.dataDetail?.template == 0) &&
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
                            (widget.dataDetail?.copyrightOrganizationId ==
                                    null ||
                                widget.dataDetail?.copyrightOrganizationId ==
                                    '') &&
                            (FFAppState().marketOn == true) &&
                            (widget.dataDetail?.status == 'published') &&
                            (widget.dataDetail?.version == 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.setColor = 3;
                            setState(() {});
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
                            _model.setColor = 0;
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.storefront_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Đưa khóa học lên Market',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                    Container(
                      decoration: BoxDecoration(
                        color: _model.setColor == 4
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: (widget.dataDetail?.template == 0) &&
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
                            (widget.dataDetail?.copyrightOrganizationId ==
                                    null ||
                                widget.dataDetail?.copyrightOrganizationId ==
                                    '') &&
                            (widget.dataDetail!.version > 0) &&
                            (FFAppState().marketOn == true) &&
                            (widget.dataDetail?.status == 'published'),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.setColor = 4;
                            setState(() {});
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
                                    category: widget.dataDetail?.categoryId,
                                    domain: widget.dataDetail?.domainId,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            Navigator.pop(context);
                            _model.setColor = 0;
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.update_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Cập nhật phiên bản khóa học',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                    Container(
                      decoration: BoxDecoration(
                        color: _model.setColor == 6
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.setColor = 6;
                            setState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 100));
                            _model.setColor = 0;
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
                                    child: ListCertiWidget(
                                      idProgram: widget.idProgram,
                                      checkCodeCertificate: widget
                                          .dataDetail!.certificateId.code,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.stars_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            title: Text(
                              'Chọn mẫu chứng chỉ',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
