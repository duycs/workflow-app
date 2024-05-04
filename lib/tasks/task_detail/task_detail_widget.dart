import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks/detail_action_type_approve/detail_action_type_approve_widget.dart';
import '/tasks/detail_action_type_image/detail_action_type_image_widget.dart';
import '/tasks/detail_action_type_to_do_list/detail_action_type_to_do_list_widget.dart';
import '/tasks/detail_action_type_upload_file/detail_action_type_upload_file_widget.dart';
import '/tasks/task_detail_ck_popup/task_detail_ck_popup_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'task_detail_model.dart';
export 'task_detail_model.dart';

class TaskDetailWidget extends StatefulWidget {
  const TaskDetailWidget({
    super.key,
    this.workflowId,
    required this.publishedCount,
    this.paramBack,
  });

  final String? workflowId;
  final int? publishedCount;
  final String? paramBack;

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget> {
  late TaskDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getTaskListToken = await action_blocks.tokenReload(context);
      if (_model.getTaskListToken!) {
        _model.apiResultGetTaskList = await TaskGroup.getListTaskCall.call(
          accessToken: FFAppState().accessToken,
          filter:
              '{\"_and\":[{\"workflow_id\":{\"_eq\":\"${widget.workflowId}\"}},{\"published_count\":{\"_eq\":\"${widget.publishedCount?.toString()}\"}}]}',
        );
        if ((_model.apiResultGetTaskList?.succeeded ?? true)) {
          setState(() {
            _model.list = TaskListDataStruct.maybeFromMap(
                    (_model.apiResultGetTaskList?.jsonBody ?? ''))!
                .data
                .toList()
                .cast<TaskListStruct>();
          });
        } else {
          return;
        }

        setState(() {
          _model.isLoad = true;
        });
      } else {
        setState(() {});
      }
    });
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
              if (widget.paramBack == '1') {
                context.pushNamed(
                  'TaskList',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else if (widget.paramBack == '2') {
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
              } else if (widget.paramBack == '3') {
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
              } else if (widget.paramBack == '4') {
                context.pushNamed(
                  'ProcedurePublishedList',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else if (widget.paramBack == '5') {
                context.pushNamed(
                  'WorkResultList',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else if (widget.paramBack == '7') {
                context.pushNamed(
                  'ReportImage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              } else {
                return;
              }
            },
          ),
          title: Text(
            'Chi tiết công việc',
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_model.isLoad)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.manage_accounts_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Người tạo: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Expanded(
                              child: Text(
                                _model.list.first.createdUserId
                                                .firstName !=
                                            ''
                                    ? _model.list.first.createdUserId.firstName
                                    : ' ',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Ngày tạo:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Expanded(
                              child: Text(
                                dateTimeFormat(
                                  'HH:mm dd/MM/yyyy',
                                  functions.stringToDateTime(
                                      _model.list.first.dateCreated),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 4.0, 0.0),
                              child: Icon(
                                Icons.settings_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      _model.list.first.workflowId.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Chạy lần thứ: ${widget.publishedCount?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                            CircularPercentIndicator(
                              percent: _model.list.isNotEmpty
                                  ? (double.parse((_model.list
                                              .where((e) => e.status == 'done')
                                              .toList()
                                              .length /
                                          _model.list.length)
                                      .toStringAsFixed(1)))
                                  : 0.0,
                              radius: 20.0,
                              lineWidth: 6.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 0.0),
                              child: Text(
                                '${_model.list.where((e) => e.status == 'done').toList().length.toString()}/${_model.list.length.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 4.0)),
                        ),
                      ),
                    ],
                  ),
                if (_model.list.isNotEmpty)
                  Builder(
                    builder: (context) {
                      final dataList = _model.list.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 24.0),
                        itemBuilder: (context, dataListIndex) {
                          final dataListItem = dataList[dataListIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'B${dataListItem.number.toString()}:',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            dataListItem.name,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        if ((dataListItem.status == 'todo') &&
                                            (dataListItem.current == 1))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: const Text(
                                                                'Xác nhận hoàn thành task!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: const Text(
                                                                    'Đóng'),
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
                                                _model.confirmOperationDetail2Token =
                                                    await action_blocks
                                                        .tokenReload(context);
                                                shouldSetState = true;
                                                if (_model
                                                    .confirmOperationDetail2Token!) {
                                                  _model.apiResultConfirmOperationDetail2 =
                                                      await TaskGroup
                                                          .confirmOperationCall
                                                          .call(
                                                    accessToken: FFAppState()
                                                        .accessToken,
                                                    staffId:
                                                        FFAppState().staffid,
                                                    taskId: dataListItem.id,
                                                    submitType: dataListItem
                                                                .actionType ==
                                                            'approve'
                                                        ? 'approve'
                                                        : 'submit',
                                                  );
                                                  shouldSetState = true;
                                                  if ((_model
                                                          .apiResultConfirmOperationDetail2
                                                          ?.succeeded ??
                                                      true)) {
                                                    ScaffoldMessenger.of(
                                                            context)
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
                                                    ScaffoldMessenger.of(
                                                            context)
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

                                                  _model.getWorkflowDetailToken2 =
                                                      await action_blocks
                                                          .tokenReload(context);
                                                  shouldSetState = true;
                                                  if (_model
                                                      .getWorkflowDetailToken2!) {
                                                    _model.apiResultGetWorkflowDetail =
                                                        await ProcedureTemplateGroup
                                                            .workflowsOneCall
                                                            .call(
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                      id: dataListItem
                                                          .workflowId.id,
                                                    );
                                                    shouldSetState = true;
                                                    if ((_model
                                                            .apiResultGetWorkflowDetail
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.stepList =
                                                            OneWorkFlowDataStruct
                                                                    .maybeFromMap(
                                                                        (_model.apiResultGetWorkflowDetail?.jsonBody ??
                                                                            ''))
                                                                ?.data;
                                                      });
                                                    }
                                                    if (_model.stepList!.steps
                                                            .length >
                                                        dataListItem.number) {
                                                      while (_model.loop <
                                                          _model.stepList!.steps
                                                              .where((e) =>
                                                                  e.number ==
                                                                  (dataListItem
                                                                          .number +
                                                                      1))
                                                              .toList()
                                                              .first
                                                              .staffs
                                                              .length) {
                                                        _model.receiveTaskDetailToken =
                                                            await action_blocks
                                                                .tokenReload(
                                                                    context);
                                                        shouldSetState = true;
                                                        if (_model
                                                            .receiveTaskDetailToken!) {
                                                          _model.apiResultReceiveTaskDetail =
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
                                                                    ?.steps
                                                                    .where((e) =>
                                                                        e.number ==
                                                                        (dataListItem.number +
                                                                            1))
                                                                    .toList()
                                                                    .first
                                                                    .staffs[_model.loop])
                                                                ?.staffsId
                                                                .id,
                                                          );
                                                          shouldSetState =
                                                              true;
                                                          if (!(_model
                                                                  .apiResultReceiveTaskDetail
                                                                  ?.succeeded ??
                                                              true)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Nhận thất bại',
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
                                                          }
                                                        } else {
                                                          setState(() {});
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }

                                                        setState(() {
                                                          _model.loop =
                                                              _model.loop + 1;
                                                        });
                                                      }
                                                      setState(() {
                                                        _model.loop = 0;
                                                      });
                                                    }
                                                    _model.getTaskListDetailToken =
                                                        await action_blocks
                                                            .tokenReload(
                                                                context);
                                                    shouldSetState = true;
                                                    if (_model
                                                        .getTaskListDetailToken!) {
                                                      _model.apiResultGetTaskListDetail2 =
                                                          await TaskGroup
                                                              .getListTaskCall
                                                              .call(
                                                        accessToken:
                                                            FFAppState()
                                                                .accessToken,
                                                        filter:
                                                            '{\"_and\":[{\"workflow_id\":{\"_eq\":\"${widget.workflowId}\"}},{\"published_count\":{\"_eq\":\"${widget.publishedCount?.toString()}\"}}]}',
                                                      );
                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiResultGetTaskListDetail2
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model
                                                              .list = TaskListDataStruct
                                                                  .maybeFromMap((_model
                                                                          .apiResultGetTaskListDetail2
                                                                          ?.jsonBody ??
                                                                      ''))!
                                                              .data
                                                              .toList()
                                                              .cast<
                                                                  TaskListStruct>();
                                                        });
                                                      }
                                                    } else {
                                                      setState(() {});
                                                    }
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
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (dataListItem.status ==
                                                    'done') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondary;
                                                } else if ((dataListItem
                                                            .status ==
                                                        'todo') &&
                                                    (dataListItem.current ==
                                                        1)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .alternate;
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 4.0, 8.0, 4.0),
                                              child: Text(
                                                () {
                                                  if ((dataListItem.status ==
                                                          'todo') &&
                                                      (dataListItem.current ==
                                                          1)) {
                                                    return 'Đang thực hiện';
                                                  } else if ((dataListItem
                                                              .status ==
                                                          'todo') &&
                                                      (dataListItem.current ==
                                                          0)) {
                                                    return 'Chờ thực hiện';
                                                  } else {
                                                    return 'Hoàn thành';
                                                  }
                                                }(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: () {
                                                            if (dataListItem
                                                                    .status ==
                                                                'done') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground;
                                                            } else if ((dataListItem
                                                                        .status ==
                                                                    'todo') &&
                                                                (dataListItem
                                                                        .current ==
                                                                    1)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText;
                                                            }
                                                          }(),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ),
                                  if (dataListItem.description != '')
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.notes_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 4.0, 4.0),
                                              child: Text(
                                                dataListItem.description,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  if ((dataListItem.actionType !=
                                          'to_do_list') &&
                                      (dataListItem.operations.first
                                                  .operationsId.content !=
                                              ''))
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.description_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 4.0, 4.0),
                                              child: Text(
                                                dataListItem.operations.first
                                                    .operationsId.content,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  if (dataListItem.timeOperate != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.av_timer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Bắt đầu (dự kiến):',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              dataListItem.timeOperate,
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  if (dataListItem.estimateInSecond != 0)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.av_timer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'T.gian thực hiện (dự kiến):',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              dataListItem.estimateInSecond
                                                  .toString(),
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  if (dataListItem.dateStart != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.date_range_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Bắt đầu (thực tế):',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              dateTimeFormat(
                                                'HH:mm dd/MM/yyyy',
                                                functions.stringToDateTime(
                                                    dataListItem.dateStart),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  if (dataListItem.dateEnd != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.av_timer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'T.gian hoàn thành (thực tế):',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              dateTimeFormat(
                                                'HH:mm dd/MM/yyyy',
                                                functions.stringToDateTime(
                                                    dataListItem.dateEnd),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  if (dataListItem.status == 'done')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 2.0, 0.0),
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.submitStaffId.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                dataListItem.submitStaffId
                                                    .userId.firstName,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  if ('1' == '2')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bộ phận:',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            dataListItem.staffs.first.staffsId
                                                .departmentId.name,
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (dataListItem.actionType ==
                                            'to_do_list')
                                          Text(
                                            'Nội dung:',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        if (dataListItem.actionType ==
                                            'to_do_list')
                                          Builder(
                                            builder: (context) {
                                              final checkboxList = dataListItem
                                                  .operations
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: checkboxList.length,
                                                itemBuilder: (context,
                                                    checkboxListIndex) {
                                                  final checkboxListItem =
                                                      checkboxList[
                                                          checkboxListIndex];
                                                  return DetailActionTypeToDoListWidget(
                                                    key: Key(
                                                        'Key60t_${checkboxListIndex}_of_${checkboxList.length}'),
                                                    listData: checkboxListItem,
                                                    data: dataListItem,
                                                    callback: (operationId,
                                                        status) async {
                                                      _model.apiResultCheckList =
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
                                                              .apiResultCheckList
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Xác nhận thành công!',
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
                                                              'Xác nhận thất bại!',
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

                                                      setState(() {});

                                                      setState(() {});
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (dataListItem.actionType == 'image')
                                          Container(
                                            width: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: DetailActionTypeImageWidget(
                                              key: Key(
                                                  'Key9hl_${dataListIndex}_of_${dataList.length}'),
                                              image: dataListItem,
                                            ),
                                          ),
                                        if (dataListItem.actionType ==
                                            'approve')
                                          Container(
                                            width: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  dataListItem.status != 'done',
                                              child:
                                                  DetailActionTypeApproveWidget(
                                                key: Key(
                                                    'Keyshn_${dataListIndex}_of_${dataList.length}'),
                                                data: dataListItem,
                                                callback: (result) async {
                                                  _model.confirmToken =
                                                      await action_blocks
                                                          .tokenReload(context);
                                                  if (_model.confirmToken!) {
                                                    _model.apiResultConfirm =
                                                        await TaskGroup
                                                            .confirmOperationCall
                                                            .call(
                                                      accessToken: FFAppState()
                                                          .accessToken,
                                                      taskId: dataListItem.id,
                                                      staffId: getJsonField(
                                                        FFAppState().staffLogin,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      submitType: 'reject',
                                                    );
                                                    if ((_model.apiResultConfirm
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Thành công',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                            'Thất bại',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        if (dataListItem.actionType ==
                                            'submit_text')
                                          Container(
                                            width: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (dataListItem.status ==
                                                    'done')
                                                  Html(
                                                    data: dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .result,
                                                    onLinkTap:
                                                        (url, _, __, ___) =>
                                                            launchURL(url!),
                                                  ),
                                                if ((dataListItem.status ==
                                                        'todo') &&
                                                    (dataListItem.current ==
                                                        1) &&
                                                    (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .result !=
                                                            ''))
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Html(
                                                          data: dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .result,
                                                          onLinkTap: (url, _,
                                                                  __, ___) =>
                                                              launchURL(url!),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        TaskDetailCkPopupWidget(
                                                                      item: dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .result,
                                                                      workflowId:
                                                                          widget
                                                                              .workflowId!,
                                                                      publishedCount:
                                                                          widget
                                                                              .publishedCount!,
                                                                      paramBack:
                                                                          widget
                                                                              .paramBack,
                                                                      action:
                                                                          (ckString) async {
                                                                        _model.apiResultx5lTokenCopy =
                                                                            await action_blocks.tokenReload(context);
                                                                        if (_model
                                                                            .apiResultx5lTokenCopy!) {
                                                                          _model.apiResultx5lCopy = await TaskGroup
                                                                              .updateOperationCall
                                                                              .call(
                                                                            accessToken:
                                                                                FFAppState().accessToken,
                                                                            operationId:
                                                                                dataListItem.operations.first.operationsId.id,
                                                                            requestDataJson: <String,
                                                                                dynamic>{
                                                                              'status': 'done',
                                                                              'result': ckString,
                                                                            },
                                                                          );
                                                                          if (!(_model.apiResultx5lCopy?.succeeded ??
                                                                              true)) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Xác nhận thất bại',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: const Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            );
                                                                          }
                                                                          setState(
                                                                              () {});
                                                                        } else {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            setState(() {});
                                                          },
                                                          text: 'Nhập văn bản',
                                                          icon: Icon(
                                                            Icons.edit_note,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
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
                                                    ].divide(
                                                        const SizedBox(height: 8.0)),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        if (dataListItem.actionType ==
                                            'upload_file')
                                          Container(
                                            width: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .files.isNotEmpty)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files.isNotEmpty)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (functions
                                                                          .checkFileLast(
                                                                              (String tail) {
                                                                        return tail
                                                                            .split('.')
                                                                            .last;
                                                                      }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                      'exc')
                                                                    Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/excel.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  if (functions
                                                                          .checkFileLast(
                                                                              (String tail) {
                                                                        return tail
                                                                            .split('.')
                                                                            .last;
                                                                      }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                      'word')
                                                                    Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/images.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  if (functions
                                                                          .checkFileLast(
                                                                              (String tail) {
                                                                        return tail
                                                                            .split('.')
                                                                            .last;
                                                                      }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                      'pptx')
                                                                    Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/ppt.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  if (functions
                                                                          .checkFileLast(
                                                                              (String tail) {
                                                                        return tail
                                                                            .split('.')
                                                                            .last;
                                                                      }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                      'pdf')
                                                                    Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/pdf.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .files
                                                                          .first
                                                                          .directusFilesId
                                                                          .filenameDownload,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                        ].divide(const SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                      if ((functions.checkFileLast(
                                                                  (String tail) {
                                                                return tail
                                                                    .split('.')
                                                                    .last;
                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                              'pdf') &&
                                                          (dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files.isNotEmpty))
                                                        FlutterFlowPdfViewer(
                                                          networkPath:
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                          height: 300.0,
                                                          horizontalScroll:
                                                              false,
                                                        ),
                                                      if ((functions.checkFileLast(
                                                                  (String tail) {
                                                                return tail
                                                                    .split('.')
                                                                    .last;
                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                              'img') &&
                                                          (dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files.isNotEmpty))
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                                width: 350.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(height: 8.0)),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (dataListItem.status ==
                                                        'todo')
                                                      Expanded(
                                                        child:
                                                            DetailActionTypeUploadFileWidget(
                                                          key: Key(
                                                              'Keyr4q_${dataListIndex}_of_${dataList.length}'),
                                                          calback:
                                                              (file) async {
                                                            setState(() {
                                                              _model.responseData =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .updateResponseDataStruct(
                                                                (e) => e
                                                                  ..status =
                                                                      'done'
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
                                                            _model.apiResultl2eToken =
                                                                await action_blocks
                                                                    .tokenReload(
                                                                        context);
                                                            if (_model
                                                                .apiResultl2eToken!) {
                                                              _model.apiResultl2e =
                                                                  await TaskGroup
                                                                      .updateOperationCall
                                                                      .call(
                                                                accessToken:
                                                                    FFAppState()
                                                                        .accessToken,
                                                                operationId:
                                                                    dataListItem
                                                                        .operations
                                                                        .first
                                                                        .operationsId
                                                                        .id,
                                                                requestDataJson:
                                                                    _model
                                                                        .responseData
                                                                        ?.toMap(),
                                                              );
                                                              if ((_model
                                                                      .apiResultl2e
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Update thành công',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Update thất bại',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              setState(() {});
                                                            }

                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    if (((dataListItem.status ==
                                                                'done') ||
                                                            ((dataListItem
                                                                        .status ==
                                                                    'todo') &&
                                                                (dataListItem
                                                                        .current ==
                                                                    1))) &&
                                                        (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files.isNotEmpty))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.downloadToken =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          if (_model
                                                              .downloadToken!) {
                                                            await actions
                                                                .downloadFile(
                                                              '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                                              dataListItem.name,
                                                              dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files
                                                                  .first
                                                                  .directusFilesId
                                                                  .filenameDownload,
                                                            );
                                                          } else {
                                                            setState(() {});
                                                          }

                                                          setState(() {});
                                                        },
                                                        text: 'Tải tài liệu',
                                                        icon: const Icon(
                                                          Icons
                                                              .download_rounded,
                                                          size: 20.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 140.0,
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
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
    );
  }
}
