import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure/add_workflow_market/add_workflow_market_widget.dart';
import '/procedure/procedure_work_filter/procedure_work_filter_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'procedure_list_model.dart';
export 'procedure_list_model.dart';

class ProcedureListWidget extends StatefulWidget {
  const ProcedureListWidget({super.key});

  @override
  State<ProcedureListWidget> createState() => _ProcedureListWidgetState();
}

class _ProcedureListWidgetState extends State<ProcedureListWidget> {
  late ProcedureListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      _model.checkToken = await action_blocks.tokenReload(context);
      if (_model.checkToken!) {
        _model.apiResultListData =
            await ProcedureTemplateGroup.workflowsListCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"template\":{\"_neq\":\"1\"}},{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}]}',
        );
        if ((_model.apiResultListData?.succeeded ?? true)) {
          setState(() {
            _model.dataList = WorkflowsListDataStruct.maybeFromMap(
                    (_model.apiResultListData?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<WorkflowsStruct>();
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

    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              'ProcedureCreate',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
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
          title: Text(
            'Quản lý quy trình',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textNameTextController,
                          focusNode: _model.textNameFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textNameTextController',
                            const Duration(milliseconds: 500),
                            () async {
                              setState(() {
                                _model.searchName =
                                    _model.textNameTextController.text;
                              });
                              await _model.getListAction(context);
                              setState(() {});
                              setState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Tìm kiếm...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            suffixIcon: _model
                                    .textNameTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textNameTextController?.clear();
                                      setState(() {
                                        _model.searchName =
                                            _model.textNameTextController.text;
                                      });
                                      await _model.getListAction(context);
                                      setState(() {});
                                      setState(() {});
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textNameTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.tune_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ProcedureWorkFilterWidget(
                                      name: _model.searchName != null &&
                                              _model.searchName != ''
                                          ? _model.searchName
                                          : '',
                                      dateStart: _model.dateStart != null &&
                                              _model.dateStart != ''
                                          ? _model.dateStart!
                                          : '',
                                      dateEnd: _model.dateEnd != null &&
                                              _model.dateEnd != ''
                                          ? _model.dateEnd!
                                          : '',
                                      staffId: _model.staffsId != null &&
                                              _model.staffsId != ''
                                          ? _model.staffsId!
                                          : '',
                                      callback: (name, dateStart, dateEnd,
                                          staffid) async {
                                        setState(() {
                                          _model.textNameTextController
                                              ?.clear();
                                        });
                                        setState(() {
                                          _model.searchName = name;
                                          _model.dateStart = dateStart;
                                          _model.dateEnd = dateEnd;
                                          _model.staffsId = staffid;
                                        });
                                        await _model.getListAction(context);
                                        setState(() {
                                          _model.textNameTextController?.text =
                                              name!;
                                        });
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if ('${(_model.searchName != null && _model.searchName != '') && (_model.searchName != ' ') ? ',{\"name\":{\"_icontains\":\"${_model.searchName}\"}}' : ' '}${(_model.dateStart != null && _model.dateStart != '') && (_model.dateStart != ' ') ? ',{\"date_created\":{\"_gte\":\"${_model.dateStart}\"}}' : ' '}${(_model.dateEnd != null && _model.dateEnd != '') && (_model.dateEnd != ' ') ? ',{\"date_created\":{\"_lte\":\"${_model.dateEnd}\"}}' : ' '}${(_model.staffsId != null && _model.staffsId != '') && (_model.staffsId != ' ') ? ',{\"steps\":{\"staffs\":{\"staffs_id\":{\"_eq\":\"${_model.staffsId}\"}}}}' : ' '}' !=
                    '    ')
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 4.0),
                    child: Text(
                      '#Kết quả hiển thị theo bộ lọc',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (_model.isLoad == true)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listView = _model.dataList.toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listView.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 4.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewItem = listView[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'ProcedureDetail',
                                    queryParameters: {
                                      'workflowsId': serializeParam(
                                        listViewItem.id,
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
                                },
                                child: Container(
                                  width: double.infinity,
                                  constraints: const BoxConstraints(
                                    maxWidth: 570.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  listViewItem.name !=
                                                              ''
                                                      ? listViewItem.name
                                                      : ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                                icon: const Icon(
                                                  Icons.add_business_outlined,
                                                  color: Color(0xFFBD0127),
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
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              AddWorkflowMarketWidget(
                                                            id: listViewItem.id,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            listViewItem.userCreated
                                                            .firstName !=
                                                        ''
                                                ? listViewItem
                                                    .userCreated.firstName
                                                : ' ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: listViewItem
                                                            .steps.isNotEmpty
                                                    ? listViewItem.steps.length.toString()
                                                    : '0',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              const TextSpan(
                                                text: ' Bước',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
