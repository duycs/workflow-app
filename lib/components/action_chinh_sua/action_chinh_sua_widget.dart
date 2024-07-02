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
    this.dataDetail,
    this.callBackList2,
    bool? checkMarket,
    this.checkpage,
    this.itemProgram,
    this.itemLessions,
    this.itemLession,
  }) : checkMarket = checkMarket ?? true;

  final StudyProgramListStruct? dataDetail;
  final Future Function()? callBackList2;
  final bool checkMarket;
  final String? checkpage;
  final dynamic itemProgram;
  final StudyProgramListStruct? itemLessions;
  final LessonsStruct? itemLession;

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

    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                if (widget.dataDetail?.userCreated.id == FFAppState().user.id)
                  InkWell(
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
                              dataDetail: widget.dataDetail,
                              callBackList1: () async {
                                _model.triggerRefreshList = true;
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.edit,
                      ),
                      title: Text(
                        'Chỉnh sửa',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                    ),
                  ),
                if (widget.dataDetail?.status == 'published')
                  InkWell(
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
                    child: ListTile(
                      leading: const Icon(
                        Icons.supervisor_account,
                      ),
                      title: Text(
                        'Gán cho bộ phận',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
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
                  InkWell(
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
                    child: ListTile(
                      leading: const Icon(
                        Icons.storefront_outlined,
                      ),
                      title: Text(
                        'Đưa khóa học lên Market',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
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
                  InkWell(
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
                    child: ListTile(
                      leading: const Icon(
                        Icons.update_sharp,
                      ),
                      title: Text(
                        'Cập nhật phiên bản khóa học',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
