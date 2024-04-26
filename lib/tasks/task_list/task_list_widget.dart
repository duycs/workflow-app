import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/procedure_pushlished/procedure_pushlished_widget.dart';
import '/tasks/do_action_type_approve/do_action_type_approve_widget.dart';
import '/tasks/do_action_type_image/do_action_type_image_widget.dart';
import '/tasks/do_action_type_to_do_list/do_action_type_to_do_list_widget.dart';
import '/tasks/do_action_type_upload_file/do_action_type_upload_file_widget.dart';
import '/tasks/filter_task_list/filter_task_list_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'task_list_model.dart';
export 'task_list_model.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  late TaskListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.filter =
          '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.id''',
      ).toString().toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
        FFAppState().staffLogin,
        r'''$.organization_id''',
      ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
      await _model.getTaskToDo(context);
      setState(() {});
      _model.caculatorTotalToken = await action_blocks.tokenReload(context);
      if (_model.caculatorTotalToken!) {
        _model.apiResultCaculatorTotal = await TaskGroup.getListTaskCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.id''',
          ).toString().toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
            FFAppState().staffLogin,
            r'''$.organization_id''',
          ).toString().toString()}\"}}}]}',
        );
        if ((_model.apiResultCaculatorTotal?.succeeded ?? true)) {
          setState(() {
            _model.totalDone = TaskListDataStruct.maybeFromMap(
                    (_model.apiResultCaculatorTotal?.jsonBody ?? ''))!
                .data
                .where((e) => e.status == 'done')
                .toList()
                .toList()
                .cast<TaskListStruct>();
            _model.totalWait = TaskListDataStruct.maybeFromMap(
                    (_model.apiResultCaculatorTotal?.jsonBody ?? ''))!
                .data
                .where((e) =>
                    (e.status == 'todo') &&
                    (e.current.toString() == '0'))
                .toList()
                .toList()
                .cast<TaskListStruct>();
            _model.filter =
                '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.id''',
            ).toString().toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
              FFAppState().staffLogin,
              r'''$.organization_id''',
            ).toString().toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
          });
        }
      } else {
        setState(() {});
      }
    });

    _model.textFieldNameTextController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();
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
        floatingActionButton: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
          child: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ProcedurePushlishedWidget(
                        callback: () async {
                          await _model.getTaskToDo(context);
                        },
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 1.0,
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Công việc hôm nay',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textFieldNameTextController,
                                focusNode: _model.textFieldNameFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldNameTextController',
                                  const Duration(milliseconds: 500),
                                  () async {
                                    setState(() {});
                                    if (_model.textFieldNameTextController
                                                .text !=
                                            '') {
                                      setState(() {
                                        _model.filter =
                                            '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.id''',
                                        ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.organization_id''',
                                        ).toString()}\"}}},{\"name\":{\"_icontains\":\"${_model.textFieldNameTextController.text}\"}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                      });
                                      await _model.getTaskToDo(context);
                                      setState(() {});
                                      setState(() {});
                                    } else {
                                      setState(() {
                                        _model.filter =
                                            '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.id''',
                                        ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                          FFAppState().staffLogin,
                                          r'''$.organization_id''',
                                        ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                      });
                                      await _model.getTaskToDo(context);
                                      setState(() {});
                                      setState(() {});
                                    }
                                  },
                                ),
                                autofocus: false,
                                textInputAction: TextInputAction.search,
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
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 24.0,
                                  ),
                                  suffixIcon: _model
                                          .textFieldNameTextController!
                                          .text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textFieldNameTextController
                                                ?.clear();
                                            setState(() {});
                                            if (_model.textFieldNameTextController
                                                        .text !=
                                                    '') {
                                              setState(() {
                                                _model.filter =
                                                    '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.id''',
                                                ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.organization_id''',
                                                ).toString()}\"}}},{\"name\":{\"_icontains\":\"${_model.textFieldNameTextController.text}\"}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                              });
                                              await _model.getTaskToDo(context);
                                              setState(() {});
                                              setState(() {});
                                            } else {
                                              setState(() {
                                                _model.filter =
                                                    '{\"_and\":[{\"staffs\":{\"staffs_id\":{\"id\":{\"_eq\":\"${getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.id''',
                                                ).toString()}\"}}}},{\"workflow_id\":{\"organization_id\":{\"_eq\":\"${getJsonField(
                                                  FFAppState().staffLogin,
                                                  r'''$.organization_id''',
                                                ).toString()}\"}}},{\"status\":{\"_eq\":\"todo\"}},{\"current\":{\"_eq\":\"1\"}}]}';
                                              });
                                              await _model.getTaskToDo(context);
                                              setState(() {});
                                              setState(() {});
                                            }

                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model
                                    .textFieldNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.tune_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
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
                                          child: FilterTaskListWidget(
                                            filterSearch: _model
                                                .textFieldNameTextController
                                                .text,
                                            dateStart: _model.dateStartFilter,
                                            dateEnd: _model.dateEndFilter,
                                            type: _model.typeFilter,
                                            callback: (data,
                                                dateStartCallback,
                                                dateEndCallback,
                                                typeCallback) async {
                                              setState(() {
                                                _model.list = data!
                                                    .toList()
                                                    .cast<TaskListStruct>();
                                                _model.dateStartFilter =
                                                    dateStartCallback;
                                                _model.dateEndFilter =
                                                    dateEndCallback;
                                                _model.typeFilter =
                                                    typeCallback;
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'TaskListWait',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text:
                                  'Chờ thực hiện (${_model.totalWait.length.toString()})',
                              options: FFButtonOptions(
                                width: 115.0,
                                height: 30.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text:
                                  'Đang thực hiện (${_model.list.length.toString()})',
                              options: FFButtonOptions(
                                width: 115.0,
                                height: 30.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'TaskListDone',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text:
                                  'Hoàn thành (${_model.totalDone.length.toString()})',
                              options: FFButtonOptions(
                                width: 115.0,
                                height: 30.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ].divide(const SizedBox(width: 6.0)),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final dataList = _model.list.toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: dataList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, dataListIndex) {
                              final dataListItem = dataList[dataListIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 8.0, 4.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 4.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dataListItem.name,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '#${dataListItem.workflowId.name}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (dataListItem.actionType ==
                                                'submit_text')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 4.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var shouldSetState = false;
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Thông báo:'),
                                                                  content: const Text(
                                                                      'Xác nhận lưu thông tin!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: const Text(
                                                                          'Đóng'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: const Text(
                                                                          'Xác nhận'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.updateoperation2Token =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      shouldSetState = true;
                                                      if (_model
                                                          .updateoperation2Token!) {
                                                        _model.apiResultUpdateoperation2 =
                                                            await TaskGroup
                                                                .updateOperationCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          requestDataJson: <String,
                                                              dynamic>{
                                                            'status': 'done',
                                                            'result': _model
                                                                .submitText,
                                                          },
                                                          operationId:
                                                              dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .id,
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model
                                                                .apiResultUpdateoperation2
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Lưu thành công!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Lưu thất bại!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      } else {
                                                        setState(() {});
                                                      }
                                                    } else {
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }

                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  text: 'Lưu',
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var shouldSetState = false;
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: const Text(
                                                                    'Bạn chắc chắn?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: const Text(
                                                                        'Thoát'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: const Text(
                                                                        'Xác nhận'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    _model.confirmOperationCopy2Token =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    shouldSetState = true;
                                                    if (_model
                                                        .confirmOperationCopy2Token!) {
                                                      _model.apiResultConfirmOperationCopy2 =
                                                          await TaskGroup
                                                              .confirmOperationCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        staffId: FFAppState()
                                                            .staffid,
                                                        taskId: dataListItem.id,
                                                        submitType: dataListItem
                                                                    .actionType ==
                                                                'approve'
                                                            ? 'approve'
                                                            : 'submit',
                                                      );
                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiResultConfirmOperationCopy2
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Submit thành công',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Submit thất bại',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }

                                                      _model.getWorkflowCopyToken =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      shouldSetState = true;
                                                      if (_model
                                                          .getWorkflowCopyToken!) {
                                                        _model.apiResultGetWorkflowCopy =
                                                            await ProcedureTemplateGroup
                                                                .workflowsOneCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          id: dataListItem
                                                              .workflowId.id,
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model
                                                                .apiResultGetWorkflowCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            _model.stepList =
                                                                OneWorkFlowDataStruct.maybeFromMap(
                                                                        (_model.apiResultGetWorkflowCopy?.jsonBody ??
                                                                            ''))
                                                                    ?.data;
                                                          });
                                                        }
                                                        if (_model.stepList!
                                                                .steps.length >
                                                            dataListItem
                                                                .number) {
                                                          while (_model.loop <
                                                              _model
                                                                  .stepList!
                                                                  .steps
                                                                  .length) {
                                                            if (dataListItem
                                                                    .number ==
                                                                (_model
                                                                        .stepList!
                                                                        .steps[_model
                                                                            .loop]
                                                                        .number -
                                                                    1)) {
                                                              _model.apiResultqt8CopyToken =
                                                                  await action_blocks
                                                                      .tokenReload(
                                                                          context);
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .apiResultqt8CopyToken!) {
                                                                _model.apiResultqt8Copy =
                                                                    await TaskGroup
                                                                        .receiveTaskCall
                                                                        .call(
                                                                  accessToken:
                                                                      FFAppState()
                                                                          .accessToken,
                                                                  workflowId:
                                                                      dataListItem
                                                                          .workflowId
                                                                          .id,
                                                                  staffId: (_model
                                                                          .stepList
                                                                          ?.steps[_model.loop])
                                                                      ?.staffs
                                                                      .first
                                                                      .staffsId
                                                                      .id,
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                if (!(_model
                                                                        .apiResultqt8Copy
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Nhận thất bại',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                setState(() {});
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                            }
                                                            setState(() {
                                                              _model.loop =
                                                                  _model.loop +
                                                                      1;
                                                            });
                                                          }
                                                          setState(() {
                                                            _model.loop = 0;
                                                          });
                                                        }
                                                        await _model
                                                            .getTaskToDo(
                                                                context);
                                                      } else {
                                                        setState(() {});
                                                      }
                                                    } else {
                                                      setState(() {});
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                },
                                                text: 'Xác nhận',
                                                options: FFButtonOptions(
                                                  height: 30.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 6.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'TaskDetail',
                                                  queryParameters: {
                                                    'workflowId':
                                                        serializeParam(
                                                      dataListItem
                                                          .workflowId.id,
                                                      ParamType.String,
                                                    ),
                                                    'publishedCount':
                                                        serializeParam(
                                                      dataListItem
                                                          .publishedCount,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_model.isShow != dataListItem.id)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 6.0, 0.0, 6.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.isShow = dataListItem.id;
                                              });
                                            },
                                            child: Text(
                                              'Xem thêm',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (_model.isShow == dataListItem.id)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (dataListItem.createdUserId
                                                        .firstName !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.person,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Người tạo:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        dataListItem
                                                            .createdUserId
                                                            .firstName,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 0.0, 8.0, 6.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                6.0,
                                                                0.0),
                                                    child: Icon(
                                                      Icons
                                                          .confirmation_num_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Chạy lần thứ:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 13.0,
                                                            letterSpacing:
                                                                0.0,
                                                            fontStyle:
                                                                FontStyle
                                                                    .italic,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    dataListItem
                                                        .publishedCount
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (dataListItem.dateCreated != '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.timer,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Ngày tạo:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        'HH:mm dd/MM/yyyy',
                                                        functions
                                                            .stringToDateTime(
                                                                dataListItem
                                                                    .dateCreated),
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (dataListItem.timeOperate !=
                                                'null')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.av_timer,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Bắt đầu (dự kiến):',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dataListItem.timeOperate,
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (dataListItem.estimateInSecond !=
                                                0)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.update_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'T.gian thực hiện (dự kiến):',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      dataListItem.dateStart !=
                                                              '',
                                                      false,
                                                    ))
                                                      Text(
                                                        dataListItem.estimateInSecond.toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                              dataListItem.dateStart !=
                                                      '',
                                              false,
                                            ))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 6.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.date_range,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Bắt đầu (thực tế):',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        'HH:mm dd/MM/yyyy',
                                                        functions
                                                            .stringToDateTime(
                                                                dataListItem
                                                                    .dateStart),
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 6.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.isShow = '';
                                                  });
                                                },
                                                child: Text(
                                                  'Ẩn bớt',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (dataListItem.actionType !=
                                          'to_do_list')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Icon(
                                                  Icons.notes_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Nội dung: ${dataListItem.operations.first.operationsId.content}',
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (dataListItem.actionType ==
                                          'to_do_list')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Icon(
                                                  Icons.notes_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Nội dung: ',
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (dataListItem.actionType ==
                                          'upload_file')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model
                                                .doActionTypeUploadFileModels
                                                .getModel(
                                              dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files.isNotEmpty
                                                  ? '${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}${dataListItem.operations.first.operationsId.id}'
                                                  : dataListItem.operations.first.operationsId.id,
                                              dataListIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: DoActionTypeUploadFileWidget(
                                              key: Key(
                                                'Keypbt_${dataListItem.operations.first.operationsId.files.isNotEmpty ? '${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}${dataListItem.operations.first.operationsId.id}' : dataListItem.operations.first.operationsId.id}',
                                              ),
                                              file: dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files.isNotEmpty
                                                  ? dataListItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .files
                                                      .first
                                                      .directusFilesId
                                                      .id
                                                  : '6f2dfeb5-4df6-4b73-93c4-109f72133a25',
                                              type: dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files.isNotEmpty
                                                  ? dataListItem.name
                                                  : '6f2dfeb5-4df6-4b73-93c4-109f72133a25',
                                              fileTail: dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files.isNotEmpty
                                                  ? dataListItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .files
                                                      .first
                                                      .directusFilesId
                                                      .filenameDownload
                                                  : '6f2dfeb5-4df6-4b73-93c4-109f72133a25',
                                              callback: (file) async {
                                                setState(() {
                                                  _model.responseData = null;
                                                });
                                                setState(() {
                                                  _model
                                                      .updateResponseDataStruct(
                                                    (e) => e
                                                      ..status = 'done'
                                                      ..updateFiles(
                                                        (e) => e.add(
                                                            FileDataTypeStruct(
                                                          directusFilesId:
                                                              FileIDDataTypeStruct(
                                                            id: file,
                                                          ),
                                                        )),
                                                      ),
                                                  );
                                                });
                                                _model.apiResultUpdateoperation =
                                                    await TaskGroup
                                                        .updateOperationCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  requestDataJson: _model
                                                      .responseData
                                                      ?.toMap(),
                                                  operationId: dataListItem
                                                      .operations
                                                      .first
                                                      .operationsId
                                                      .id,
                                                );
                                                if ((_model
                                                        .apiResultUpdateoperation
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Update thành công',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  await _model
                                                      .getTaskToDo(context);
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Update thất bại',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      if (dataListItem.actionType == 'image')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: DoActionTypeImageWidget(
                                            key: Key(
                                                'Keyaan_${dataListIndex}_of_${dataList.length}'),
                                            image: dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .files.isNotEmpty
                                                ? dataListItem
                                                    .operations
                                                    .first
                                                    .operationsId
                                                    .files
                                                    .first
                                                    .directusFilesId
                                                    .id
                                                : '6f2dfeb5-4df6-4b73-93c4-109f72133a25',
                                            callback: (image) async {
                                              setState(() {
                                                _model.responseData = null;
                                              });
                                              setState(() {
                                                _model.updateResponseDataStruct(
                                                  (e) => e
                                                    ..status = 'done'
                                                    ..updateFiles(
                                                      (e) => e.add(
                                                          FileDataTypeStruct(
                                                        directusFilesId:
                                                            FileIDDataTypeStruct(
                                                          id: image,
                                                        ),
                                                      )),
                                                    ),
                                                );
                                              });
                                              _model.apiResultUpdateoperationCopyCopy =
                                                  await TaskGroup
                                                      .updateOperationCall
                                                      .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                                requestDataJson: _model
                                                    .responseData
                                                    ?.toMap(),
                                                operationId: dataListItem
                                                    .operations
                                                    .first
                                                    .operationsId
                                                    .id,
                                              );
                                              if ((_model
                                                      .apiResultUpdateoperation
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Update thành công',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Update thất bại',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      if (dataListItem.actionType == 'approve')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: DoActionTypeApproveWidget(
                                            key: Key(
                                                'Keyyhw_${dataListIndex}_of_${dataList.length}'),
                                            callback: (result) async {
                                              _model.confirmOperationCopyToken =
                                                  await action_blocks
                                                      .tokenReload(context);
                                              if (_model
                                                  .confirmOperationCopyToken!) {
                                                _model.apiResultConfirmOperationCopy =
                                                    await TaskGroup
                                                        .confirmOperationCall
                                                        .call(
                                                  accessToken:
                                                      FFAppState().accessToken,
                                                  staffId: FFAppState().staffid,
                                                  taskId: dataListItem.id,
                                                  submitType: 'reject',
                                                );
                                                if ((_model
                                                        .apiResultConfirmOperationCopy
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Submit thành công',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Submit thất bại',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }

                                                await _model
                                                    .getTaskToDo(context);
                                                setState(() {});
                                                setState(() {});
                                              } else {
                                                setState(() {});
                                              }

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final datatodolist = dataListItem
                                                .operations
                                                .map((e) => e)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: datatodolist.length,
                                              itemBuilder:
                                                  (context, datatodolistIndex) {
                                                final datatodolistItem =
                                                    datatodolist[
                                                        datatodolistIndex];
                                                return Visibility(
                                                  visible:
                                                      dataListItem.actionType ==
                                                          'to_do_list',
                                                  child:
                                                      DoActionTypeToDoListWidget(
                                                    key: Key(
                                                        'Key6n7_${datatodolistIndex}_of_${datatodolist.length}'),
                                                    listdata: datatodolistItem,
                                                    callback: (status,
                                                        operationId) async {
                                                      _model.updateoperationCopyCopyCopyCopyToken =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      if (_model
                                                          .updateoperationCopyCopyCopyCopyToken!) {
                                                        _model.apiResultUpdateoperationCopyCopyCopyCopy =
                                                            await TaskGroup
                                                                .updateOperationCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          requestDataJson: <String,
                                                              dynamic>{
                                                            'status': status,
                                                          },
                                                          operationId:
                                                              operationId,
                                                        );
                                                        if ((_model
                                                                .apiResultUpdateoperation
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Xác nhận thành công',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Xác nhận thất bại',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }

                                                        await _model
                                                            .getTaskToDo(
                                                                context);
                                                      } else {
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      if (dataListItem.actionType ==
                                          'submit_text')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  child:
                                                      custom_widgets.CKEditor(
                                                    width: double.infinity,
                                                    height: 300.0,
                                                    initialData: dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .result,
                                                    action: (data) async {
                                                      setState(() {
                                                        _model.submitText =
                                                            data;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  selectedPageIndex: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
