import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/training/study_program/filter_study_program/filter_study_program_widget.dart';
import '/training/study_program/study_program_create/study_program_create_widget.dart';
import '/training/study_program/study_program_edit/study_program_edit_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'study_program_list_model.dart';
export 'study_program_list_model.dart';

class StudyProgramListWidget extends StatefulWidget {
  const StudyProgramListWidget({super.key});

  @override
  State<StudyProgramListWidget> createState() => _StudyProgramListWidgetState();
}

class _StudyProgramListWidgetState extends State<StudyProgramListWidget> {
  late StudyProgramListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyProgramListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.tokenReloadStudyProgramList =
          await action_blocks.tokenReload(context);
      if (_model.tokenReloadStudyProgramList!) {
        _model.apiResultStudyProgramList =
            await StudyProgramGroup.studyProgramListCall.call(
          accessToken: FFAppState().accessToken,
          filter: '{\"_and\":[{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}]}',
        );
        if ((_model.apiResultStudyProgramList?.succeeded ?? true)) {
          setState(() {
            _model.dataList = StudyProgramListDataStruct.maybeFromMap(
                    (_model.apiResultStudyProgramList?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<StudyProgramListStruct>();
            _model.meta = StudyProgramListDataStruct.maybeFromMap(
                    (_model.apiResultStudyProgramList?.jsonBody ?? ''))
                ?.meta;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Lỗi tải dữ liệu!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }

        setState(() {
          _model.isLoad = true;
        });
      } else {
        setState(() {});
        return;
      }
    });

    _model.textFieldNameSearchTextController ??= TextEditingController();
    _model.textFieldNameSearchFocusNode ??= FocusNode();
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: const AlignmentDirectional(0.0, 1.0)
                        .resolve(Directionality.of(context)),
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: StudyProgramCreateWidget(
                        callBackList: () async {
                          setState(() {
                            _model.checkShow = null;
                            _model.dataList = [];
                            _model.meta = null;
                            _model.isLoad = false;
                            _model.nameSearch = '';
                            _model.dateEndSearch = '';
                            _model.dateStartSearch = '';
                            _model.lessionsNameSearch = '';
                          });
                          await _model.getListProgram(context);
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
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
              context.pushNamed(
                'Profile',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chương trình đào tạo',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'LessonsList',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Danh sách bài học',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'TestList',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Danh sách bài thi',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _model.textFieldNameSearchTextController,
                                focusNode: _model.textFieldNameSearchFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldNameSearchTextController',
                                  const Duration(milliseconds: 500),
                                  () async {
                                    setState(() {
                                      _model.nameSearch = _model
                                          .textFieldNameSearchTextController
                                          .text;
                                      _model.isLoad = false;
                                      _model.dataList = [];
                                    });
                                    await _model.getListProgram(context);
                                    setState(() {});
                                    setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Tìm kiếm tên chương trình',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                  prefixIcon: const Icon(
                                    Icons.search_sharp,
                                  ),
                                  suffixIcon: _model
                                          .textFieldNameSearchTextController!
                                          .text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model
                                                .textFieldNameSearchTextController
                                                ?.clear();
                                            setState(() {
                                              _model.nameSearch = _model
                                                  .textFieldNameSearchTextController
                                                  .text;
                                              _model.isLoad = false;
                                              _model.dataList = [];
                                            });
                                            await _model
                                                .getListProgram(context);
                                            setState(() {});
                                            setState(() {});
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model
                                    .textFieldNameSearchTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 10.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.tune_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: FilterStudyProgramWidget(
                                              name: _model.nameSearch!,
                                              lessionsName:
                                                  _model.lessionsNameSearch!,
                                              dateStart:
                                                  _model.dateStartSearch!,
                                              dateEnd: _model.dateEndSearch!,
                                              callBack: (name, dateStart,
                                                  dateEnd, lessions) async {
                                                setState(() {
                                                  _model
                                                      .textFieldNameSearchTextController
                                                      ?.clear();
                                                });
                                                setState(() {
                                                  _model.nameSearch = name;
                                                  _model.dateEndSearch =
                                                      dateEnd;
                                                  _model.dateStartSearch =
                                                      dateStart;
                                                  _model.lessionsNameSearch =
                                                      lessions;
                                                });
                                                await _model
                                                    .getListProgram(context);
                                                setState(() {
                                                  _model
                                                      .textFieldNameSearchTextController
                                                      ?.text = name!;
                                                });
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ('${(_model.nameSearch != null && _model.nameSearch != '') && (_model.nameSearch != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.nameSearch}\"}}' : ' '}${(_model.lessionsNameSearch != null && _model.lessionsNameSearch != '') && (_model.lessionsNameSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"name\":{\"_icontains\":\"${_model.lessionsNameSearch}\"}}}}' : ' '}${(_model.dateStartSearch != null && _model.dateStartSearch != '') && (_model.dateStartSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_gte\":\"${_model.dateStartSearch}\"}}}}' : ' '}${(_model.dateEndSearch != null && _model.dateEndSearch != '') && (_model.dateEndSearch != ' ') ? ',{\"lessions\":{\"lessions_id\":{\"date_created\":{\"_lte\":\"${_model.dateEndSearch}\"}}}}' : ' '}' !=
                          '    ')
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              '#Kết quả hiển thị theo bộ lọc',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ),
                      if (_model.isLoad == true)
                        Builder(
                          builder: (context) {
                            final dataListView = _model.dataList.toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: dataListView.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, dataListViewIndex) {
                                final dataListViewItem =
                                    dataListView[dataListViewIndex];
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 12.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: (_model.checkShow != null &&
                                                        _model.checkShow !=
                                                            '') &&
                                                    (_model.checkShow ==
                                                        dataListViewItem.id)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 2.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 12.0, 5.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                StudyProgramEditWidget(
                                                              dataDetail:
                                                                  dataListViewItem,
                                                              callBackList1:
                                                                  () async {
                                                                setState(() {
                                                                  _model.checkShow =
                                                                      null;
                                                                  _model.dataList =
                                                                      [];
                                                                  _model.meta =
                                                                      null;
                                                                  _model.isLoad =
                                                                      false;
                                                                  _model.nameSearch =
                                                                      '';
                                                                  _model.dateEndSearch =
                                                                      '';
                                                                  _model.dateStartSearch =
                                                                      '';
                                                                  _model.lessionsNameSearch =
                                                                      '';
                                                                });
                                                                setState(() {
                                                                  _model
                                                                      .textFieldNameSearchTextController
                                                                      ?.clear();
                                                                });
                                                                await _model
                                                                    .getListProgram(
                                                                        context);
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              '#${(dataListViewIndex + 1).toString()} : ${dataListViewItem.name != '' ? dataListViewItem.name : ' '}',
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${'${valueOrDefault<String>(
                                                              dataListViewItem
                                                                  .lessions
                                                                  .length
                                                                  .toString(),
                                                              '0',
                                                            )} bài học'} - ${'${valueOrDefault<String>(
                                                              dataListViewItem
                                                                  .tests.length
                                                                  .toString(),
                                                              '0',
                                                            )} bài thi'}',
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (_model.checkShow ==
                                                            dataListViewItem
                                                                .id) {
                                                          setState(() {
                                                            _model.checkShow =
                                                                null;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.checkShow =
                                                                dataListViewItem
                                                                    .id;
                                                          });
                                                        }
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            (_model.checkShow !=
                                                                            null &&
                                                                        _model.checkShow !=
                                                                            '') &&
                                                                    (dataListViewItem
                                                                            .id ==
                                                                        _model
                                                                            .checkShow)
                                                                ? 'Thu nhỏ'
                                                                : 'Xem thêm',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          if ((_model.checkShow !=
                                                                      null &&
                                                                  _model.checkShow !=
                                                                      '') &&
                                                              (dataListViewItem
                                                                      .id ==
                                                                  _model
                                                                      .checkShow))
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_up,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 14.0,
                                                            ),
                                                          if (dataListViewItem
                                                                  .id !=
                                                              _model.checkShow)
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 14.0,
                                                            ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (dataListViewItem.id ==
                                          _model.checkShow)
                                        Builder(
                                          builder: (context) {
                                            final dataListTestsView =
                                                dataListViewItem.tests.toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  dataListTestsView.length,
                                              itemBuilder: (context,
                                                  dataListTestsViewIndex) {
                                                final dataListTestsViewItem =
                                                    dataListTestsView[
                                                        dataListTestsViewIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 6.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'TestDetail',
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            dataListTestsViewItem
                                                                .testsId.id,
                                                            ParamType.String,
                                                          ),
                                                          'name':
                                                              serializeParam(
                                                            dataListTestsViewItem
                                                                .testsId.name,
                                                            ParamType.String,
                                                          ),
                                                          'description':
                                                              serializeParam(
                                                            dataListTestsViewItem
                                                                .testsId
                                                                .description,
                                                            ParamType.String,
                                                          ),
                                                          'time':
                                                              serializeParam(
                                                            dataListTestsViewItem
                                                                .testsId
                                                                .durationMinutes
                                                                .toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(6.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 7,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    dataListTestsViewItem.testsId.name !=
                                                                                ''
                                                                        ? dataListTestsViewItem
                                                                            .testsId
                                                                            .name
                                                                        : ' '
                                                                            .maybeHandleOverflow(
                                                                            maxChars:
                                                                                30,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dataListTestsViewItem.testsId.dateCreated !=
                                                                                ''
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            dateTimeFormat(
                                                                              'dd-MM-yyyy',
                                                                              functions.stringToDateTime(valueOrDefault<String>(
                                                                                dataListTestsViewItem.testsId.dateCreated,
                                                                                '0',
                                                                              )),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '0',
                                                                          )
                                                                        : ' ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Bài thi',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      if (dataListViewItem.id ==
                                          _model.checkShow)
                                        Builder(
                                          builder: (context) {
                                            final dataListLessionsView =
                                                dataListViewItem.lessions
                                                    .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  dataListLessionsView.length,
                                              itemBuilder: (context,
                                                  dataListLessionsViewIndex) {
                                                final dataListLessionsViewItem =
                                                    dataListLessionsView[
                                                        dataListLessionsViewIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 6.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'LessonDetail',
                                                        queryParameters: {
                                                          'idLesson':
                                                              serializeParam(
                                                            dataListLessionsViewItem
                                                                .lessionsId.id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(6.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              90.0),
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${dataListLessionsViewItem.lessionsId.imageCover != '' ? dataListLessionsViewItem.lessionsId.imageCover : ' '}?access_token=${FFAppState().accessToken}',
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        200.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 9,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          dataListLessionsViewItem.lessionsId.name != ''
                                                                              ? dataListLessionsViewItem.lessionsId.name
                                                                              : ' '.maybeHandleOverflow(
                                                                                  maxChars: 25,
                                                                                  replacement: '…',
                                                                                ),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dataListLessionsViewItem.lessionsId.dateCreated != ''
                                                                              ? valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    'dd-MM-yyyy',
                                                                                    functions.stringToDateTime(valueOrDefault<String>(
                                                                                      dataListLessionsViewItem.lessionsId.dateCreated,
                                                                                      '0',
                                                                                    )),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  '0',
                                                                                )
                                                                              : ' ',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text:
                                                                          'Bài học',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            30.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      if ((_model.dataList.isEmpty) &&
                          (_model.isLoad == true))
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 150.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.database,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 55.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Không có dữ liệu !',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ].divide(const SizedBox(height: 12.0)),
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
