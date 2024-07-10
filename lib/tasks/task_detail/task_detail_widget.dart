import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rich_text_editor/mobile_editor_component/mobile_editor_component_widget.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/tasks/detail_action_type_approve/detail_action_type_approve_widget.dart';
import '/tasks/detail_action_type_image/detail_action_type_image_widget.dart';
import '/tasks/detail_action_type_to_do_list/detail_action_type_to_do_list_widget.dart';
import '/tasks/detail_action_type_upload_file/detail_action_type_upload_file_widget.dart';
import '/tasks/popup_task_detail_copy/popup_task_detail_copy_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      await _model.getDetail(context);
      setState(() {});
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
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: Visibility(
          visible: _model.isLoad,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_model.isLoad)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 4.0, 2.0),
                                    child: Text(
                                      _model.list.first.workflowId.name,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Icon(
                                          Icons.outlined_flag_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                      ),
                                      Text(
                                        'Chạy lần thứ: ${widget.publishedCount?.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: CircularPercentIndicator(
                              percent: _model.list.isNotEmpty
                                  ? (double.parse((_model.list
                                              .where((e) => e.status == 'done')
                                              .toList()
                                              .length /
                                          _model.list.length)
                                      .toStringAsFixed(1)))
                                  : 0.0,
                              radius: 30.0,
                              lineWidth: 5.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 22.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: formatNumber(
                                      _model.list
                                          .where((e) => e.status == 'done')
                                          .toList()
                                          .length,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '/',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatNumber(
                                      _model.list.length,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 2.0)),
                      ),
                    ),
                  if (_model.isLoad)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.manage_accounts_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 22.0,
                              ),
                              Text(
                                'Người tạo: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Expanded(
                                child: Text(
                                  _model.list.first.createdUserId
                                                  .firstName !=
                                              ''
                                      ? _model
                                          .list.first.createdUserId.firstName
                                      : ' ',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ProfileUserNew',
                                      queryParameters: {
                                        'staffId': serializeParam(
                                          _model.list.first.createdUserId.staffs
                                              .first.id,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      '${FFAppConstants.ApiBaseUrl}/assets/${_model.list.first.createdUserId.avatar}?access_token=${FFAppState().accessToken}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22.0,
                                ),
                                Text(
                                  'Ngày tạo:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Expanded(
                                  child: Text(
                                    dateTimeFormat(
                                      'HH:mm dd/MM/yyyy',
                                      functions.stringToDateTime(
                                          _model.list.first.dateCreated),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_model.list.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                      child: Builder(
                        builder: (context) {
                          final dataList = _model.list.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                List.generate(dataList.length, (dataListIndex) {
                              final dataListItem = dataList[dataListIndex];
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 8.0, 0.0),
                                    child: SafeArea(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  36.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dataListItem.name,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (((dataListItem.status ==
                                                              'todo') &&
                                                          (dataListItem.current ==
                                                              1) &&
                                                          (dataListItem.staffs
                                                                  .where((e) =>
                                                                      e.staffsId
                                                                          .id ==
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .staffLogin,
                                                                        r'''$.id''',
                                                                      )
                                                                          .toString())
                                                                  .toList().isNotEmpty) &&
                                                          (dataListItem.actionType ==
                                                              'submit_text') &&
                                                          (dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .status ==
                                                              'done')) ||
                                                      ((dataListItem.status ==
                                                              'todo') &&
                                                          (dataListItem.current ==
                                                              1) &&
                                                          (dataListItem.staffs
                                                                  .where((e) =>
                                                                      e.staffsId
                                                                          .id ==
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .staffLogin,
                                                                        r'''$.id''',
                                                                      )
                                                                          .toString())
                                                                  .toList().isNotEmpty) &&
                                                          (dataListItem
                                                                  .actionType ==
                                                              'to_do_list') &&
                                                          (dataListItem
                                                                  .operations
                                                                  .where((e) =>
                                                                      e.operationsId.status ==
                                                                      'done')
                                                                  .toList()
                                                                  .length ==
                                                              dataListItem
                                                                  .operations
                                                                  .length)) ||
                                                      ((dataListItem.status ==
                                                              'todo') &&
                                                          (dataListItem
                                                                  .current ==
                                                              1) &&
                                                          (dataListItem.staffs
                                                                  .where((e) =>
                                                                      e.staffsId.id ==
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .staffLogin,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                  .toList().isNotEmpty) &&
                                                          (dataListItem.actionType == 'image') &&
                                                          (dataListItem.operations.first.operationsId.files.isNotEmpty)) ||
                                                      ((dataListItem.status == 'todo') &&
                                                          (dataListItem.current == 1) &&
                                                          (dataListItem.staffs
                                                                  .where((e) =>
                                                                      e.staffsId.id ==
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .staffLogin,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                  .toList().isNotEmpty) &&
                                                          (dataListItem.actionType == 'upload_file') &&
                                                          (dataListItem.operations.first.operationsId.files.isNotEmpty)) ||
                                                      ((dataListItem.status == 'todo') &&
                                                          (dataListItem.current == 1) &&
                                                          (dataListItem.staffs
                                                                  .where((e) =>
                                                                      e.staffsId.id ==
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .staffLogin,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                  .toList().isNotEmpty) &&
                                                          (dataListItem.actionType == 'approve')))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        var shouldSetState =
                                                            false;
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: const Text(
                                                                          'Xác nhận hoàn thành task!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              const Text('Đóng'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              const Text('Xác nhận'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.confirmOperationDetail2Token =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          shouldSetState =
                                                              true;
                                                          if (_model
                                                              .confirmOperationDetail2Token!) {
                                                            _model.apiResultConfirmOperationDetail2 =
                                                                await TaskGroup
                                                                    .confirmOperationCall
                                                                    .call(
                                                              accessToken:
                                                                  FFAppState()
                                                                      .accessToken,
                                                              staffId:
                                                                  FFAppState()
                                                                      .staffid,
                                                              taskId:
                                                                  dataListItem
                                                                      .id,
                                                              submitType: dataListItem
                                                                          .actionType ==
                                                                      'approve'
                                                                  ? 'approve'
                                                                  : 'submit',
                                                            );

                                                            shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultConfirmOperationDetail2
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Submit thành công',
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Submit thất bại',
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

                                                            _model.getWorkflowDetailToken2 =
                                                                await action_blocks
                                                                    .tokenReload(
                                                                        context);
                                                            shouldSetState =
                                                                true;
                                                            if (_model
                                                                .getWorkflowDetailToken2!) {
                                                              _model.apiResultGetWorkflowDetail =
                                                                  await ProcedureTemplateGroup
                                                                      .workflowsOneCall
                                                                      .call(
                                                                accessToken:
                                                                    FFAppState()
                                                                        .accessToken,
                                                                id: dataListItem
                                                                    .workflowId
                                                                    .id,
                                                              );

                                                              shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResultGetWorkflowDetail
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.stepList =
                                                                    OneWorkFlowDataStruct.maybeFromMap((_model.apiResultGetWorkflowDetail?.jsonBody ??
                                                                            ''))
                                                                        ?.data;
                                                                setState(() {});
                                                              }
                                                              if (_model
                                                                      .stepList!
                                                                      .steps
                                                                      .length >
                                                                  dataListItem
                                                                      .number) {
                                                                while (_model
                                                                        .loop <
                                                                    _model
                                                                        .stepList!
                                                                        .steps
                                                                        .where((e) =>
                                                                            e.number ==
                                                                            (dataListItem.number +
                                                                                1))
                                                                        .toList()
                                                                        .first
                                                                        .staffs
                                                                        .length) {
                                                                  _model.receiveTaskDetailToken =
                                                                      await action_blocks
                                                                          .tokenReload(
                                                                              context);
                                                                  shouldSetState =
                                                                      true;
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
                                                                              .where((e) => e.number == (dataListItem.number + 1))
                                                                              .toList()
                                                                              .first
                                                                              .staffs[_model.loop])
                                                                          ?.staffsId
                                                                          .id,
                                                                      publishedCount:
                                                                          dataListItem
                                                                              .publishedCount,
                                                                    );

                                                                    shouldSetState =
                                                                        true;
                                                                    if (!(_model
                                                                            .apiResultReceiveTaskDetail
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
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }

                                                                  _model.loop =
                                                                      _model.loop +
                                                                          1;
                                                                  setState(
                                                                      () {});
                                                                }
                                                                _model.loop = 0;
                                                                setState(() {});
                                                              }
                                                              _model.getTaskListDetailToken =
                                                                  await action_blocks
                                                                      .tokenReload(
                                                                          context);
                                                              shouldSetState =
                                                                  true;
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
                                                                  sort:
                                                                      'number',
                                                                  limit: 100,
                                                                  offset: 0,
                                                                );

                                                                shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultGetTaskListDetail2
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model
                                                                      .list = TaskListDataStruct.maybeFromMap((_model
                                                                              .apiResultGetTaskListDetail2
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                      .data
                                                                      .toList()
                                                                      .cast<
                                                                          TaskListStruct>();
                                                                  setState(
                                                                      () {});
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
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(width: 4.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        width: () {
                                                          if (dataListItem
                                                                  .status ==
                                                              'done') {
                                                            return 230.0;
                                                          } else if ((dataListItem
                                                                      .status ==
                                                                  'to do') &&
                                                              (dataListItem
                                                                      .current ==
                                                                  1)) {
                                                            return 230.0;
                                                          } else {
                                                            return 230.0;
                                                          }
                                                        }(),
                                                        height: 4.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: () {
                                                            if (dataListItem
                                                                    .status ==
                                                                'done') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2;
                                                            } else if ((dataListItem
                                                                        .status ==
                                                                    'todo') &&
                                                                (dataListItem
                                                                        .current ==
                                                                    1)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate;
                                                            }
                                                          }(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      () {
                                                        if ((dataListItem
                                                                    .status ==
                                                                'todo') &&
                                                            (dataListItem
                                                                    .current ==
                                                                1)) {
                                                          return 'Đang thực hiện';
                                                        } else if ((dataListItem
                                                                    .status ==
                                                                'todo') &&
                                                            (dataListItem
                                                                    .current ==
                                                                0)) {
                                                          return 'Chờ thực hiện';
                                                        } else {
                                                          return 'Hoàn thành';
                                                        }
                                                      }(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: () {
                                                              if (dataListItem
                                                                      .status ==
                                                                  'done') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary;
                                                              } else if ((dataListItem
                                                                          .status ==
                                                                      'todo') &&
                                                                  (dataListItem
                                                                          .current ==
                                                                      1)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              }
                                                            }(),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (dataListItem.description !=
                                                      '')
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.notes_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Text(
                                                            dataListItem
                                                                .description,
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              if ((dataListItem.actionType !=
                                                      'to_do_list') &&
                                                  (dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .content !=
                                                          ''))
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .description_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Text(
                                                            dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .content,
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              if (dataListItem.timeOperate !=
                                                      '')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.av_timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          dataListItem
                                                              .timeOperate,
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
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              if (dataListItem
                                                      .estimateInSecond !=
                                                  0)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.av_timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          dataListItem
                                                              .estimateInSecond
                                                              .toString(),
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
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              if (dataListItem.dateStart != '')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .date_range_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'HH:mm dd/MM/yyyy',
                                                            functions
                                                                .stringToDateTime(
                                                                    dataListItem
                                                                        .dateStart),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
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
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              if (dataListItem.dateEnd != '')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.av_timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        'T.gian hoàn thành (thực tế):',
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
                                                      Expanded(
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'HH:mm dd/MM/yyyy',
                                                            functions
                                                                .stringToDateTime(
                                                                    dataListItem
                                                                        .dateEnd),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
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
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              if (dataListItem.status == 'done')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    6.0,
                                                                    0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'ProfileUserNew',
                                                                queryParameters:
                                                                    {
                                                                  'staffId':
                                                                      serializeParam(
                                                                    dataListItem
                                                                        .submitStaffId
                                                                        .id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
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
                                                              width: 40.0,
                                                              height: 40.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.submitStaffId.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dataListItem
                                                                .submitStaffId
                                                                .userId
                                                                .firstName,
                                                            textAlign:
                                                                TextAlign.start,
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                ),
                                              if ('1' == '2')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Bộ phận:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          dataListItem
                                                              .staffs
                                                              .first
                                                              .staffsId
                                                              .departmentId
                                                              .name,
                                                          textAlign:
                                                              TextAlign.end,
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
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'to_do-list')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Nội dung',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              if ((dataListItem.actionType ==
                                                      'approve') &&
                                                  (dataListItem.status !=
                                                      'done'))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child:
                                                      DetailActionTypeApproveWidget(
                                                    key: Key(
                                                        'Keyxuw_${dataListIndex}_of_${dataList.length}'),
                                                    data: dataListItem,
                                                    callback: (result) async {
                                                      _model.confirmToken =
                                                          await action_blocks
                                                              .tokenReload(
                                                                  context);
                                                      if (_model
                                                          .confirmToken!) {
                                                        _model.apiResultConfirm =
                                                            await TaskGroup
                                                                .confirmOperationCall
                                                                .call(
                                                          accessToken:
                                                              FFAppState()
                                                                  .accessToken,
                                                          submitType: 'reject',
                                                          staffId: getJsonField(
                                                            FFAppState()
                                                                .staffLogin,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          taskId:
                                                              dataListItem.id,
                                                        );

                                                        if ((_model
                                                                .apiResultConfirm
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Thành công',
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
                                                                'Thất bại',
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
                                                            .getDetail(context);
                                                        setState(() {});
                                                      } else {
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'to_do_list')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final checkboxList =
                                                          dataListItem
                                                              .operations
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            checkboxList.length,
                                                            (checkboxListIndex) {
                                                          final checkboxListItem =
                                                              checkboxList[
                                                                  checkboxListIndex];
                                                          return DetailActionTypeToDoListWidget(
                                                            key: Key(
                                                                'Keya9b_${checkboxListIndex}_of_${checkboxList.length}'),
                                                            data: dataListItem,
                                                            listData:
                                                                checkboxListItem,
                                                            callback: (operationId,
                                                                status) async {
                                                              _model.apiResultCheckListToken =
                                                                  await action_blocks
                                                                      .tokenReload(
                                                                          context);
                                                              if (_model
                                                                  .apiResultCheckListToken!) {
                                                                _model.apiResultCheckList =
                                                                    await TaskGroup
                                                                        .updateOperationCall
                                                                        .call(
                                                                  accessToken:
                                                                      FFAppState()
                                                                          .accessToken,
                                                                  operationId:
                                                                      operationId,
                                                                  requestDataJson: <String,
                                                                      dynamic>{
                                                                    'status':
                                                                        status,
                                                                  },
                                                                );

                                                                if ((_model
                                                                        .apiResultCheckList
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Xác nhận thành công!',
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
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Xác nhận thất bại!',
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
                                                                              .error,
                                                                    ),
                                                                  );
                                                                }

                                                                await _model
                                                                    .getDetail(
                                                                        context);
                                                                setState(() {});
                                                              } else {
                                                                setState(() {});
                                                              }

                                                              setState(() {});
                                                            },
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'submit_text')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        if ((dataListItem
                                                                    .status ==
                                                                'todo') &&
                                                            (dataListItem
                                                                    .current ==
                                                                1))
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              if (dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .result !=
                                                                      '')
                                                                Container(
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        MobileEditorDisplayComponentWidget(
                                                                      key: Key(
                                                                          'Keyqyv_${dataListIndex}_of_${dataList.length}'),
                                                                      content: dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .result,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .result !=
                                                                      '')
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: SizedBox(
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  child: PopupTaskDetailCopyWidget(
                                                                                    content: getJsonField(
                                                                                      dataListItem.operations.first.operationsId.toMap(),
                                                                                      r'''$.result''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Mở rộng',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        if (dataListItem
                                                                .status ==
                                                            'done')
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Container(
                                                                height: 150.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      MobileEditorDisplayComponentWidget(
                                                                    key: Key(
                                                                        'Keyide_${dataListIndex}_of_${dataList.length}'),
                                                                    content: dataListItem
                                                                        .operations
                                                                        .first
                                                                        .operationsId
                                                                        .result,
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                child: PopupTaskDetailCopyWidget(
                                                                                  content: dataListItem.operations.first.operationsId.result,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Text(
                                                                      'Mở rộng',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((dataListItem
                                                                        .status ==
                                                                    'todo') &&
                                                                (dataListItem
                                                                        .current ==
                                                                    1))
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                child: MobileEditorComponentWidget(
                                                                                  content: getJsonField(
                                                                                    dataListItem.operations.first.operationsId.toMap(),
                                                                                    r'''$.result''',
                                                                                  ),
                                                                                  setContentCallback: (editorContent) async {
                                                                                    _model.gettokenTaskDetailCopyCopy = await action_blocks.tokenReload(context);
                                                                                    if (_model.gettokenTaskDetailCopyCopy!) {
                                                                                      _model.apiResultd4mCopyCopy = await TaskGroup.updateOperationCall.call(
                                                                                        operationId: dataListItem.operations.first.operationsId.id,
                                                                                        accessToken: FFAppState().accessToken,
                                                                                        requestDataJson: <String, dynamic>{
                                                                                          'status': 'done',
                                                                                          'result': editorContent,
                                                                                        },
                                                                                      );

                                                                                      if (!(_model.apiResultd4mCopyCopy?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Xác nhận thất bại',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      await _model.getDetail(context);
                                                                                      Navigator.pop(context);
                                                                                    } else {
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Nhập văn bản',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .edit_note,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          125.0,
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'upload_file')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            DetailActionTypeUploadFileWidget(
                                                          key: Key(
                                                              'Key454_${dataListIndex}_of_${dataList.length}'),
                                                          dataPass:
                                                              dataListItem,
                                                          callback:
                                                              (file) async {
                                                            _model.responseData =
                                                                null;
                                                            setState(() {});
                                                            if (file.isEmpty) {
                                                              _model
                                                                  .updateResponseDataStruct(
                                                                (e) => e
                                                                  ..status =
                                                                      'done'
                                                                  ..files = [],
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              while (_model
                                                                      .loop <
                                                                  file.length) {
                                                                _model.addToListFileDataType(
                                                                    FileDataTypeStruct(
                                                                  directusFilesId:
                                                                      FileIDDataTypeStruct(
                                                                    id: file[_model
                                                                        .loop],
                                                                  ),
                                                                ));
                                                                setState(() {});
                                                                _model.loop =
                                                                    _model.loop +
                                                                        1;
                                                                setState(() {});
                                                              }
                                                              _model.loop = 0;
                                                              _model
                                                                  .updateResponseDataStruct(
                                                                (e) => e
                                                                  ..status =
                                                                      'done'
                                                                  ..files = _model
                                                                      .listFileDataType
                                                                      .toList(),
                                                              );
                                                              setState(() {});
                                                              _model.listFileDataType =
                                                                  [];
                                                              setState(() {});
                                                            }

                                                            _model.apiResultUpdateoperationToken =
                                                                await action_blocks
                                                                    .tokenReload(
                                                                        context);
                                                            if (_model
                                                                .apiResultUpdateoperationToken!) {
                                                              _model.apiResultUpdateoperation =
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
                                                                      .apiResultUpdateoperation
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

                                                              await _model
                                                                  .getDetail(
                                                                      context);
                                                              setState(() {});
                                                            } else {
                                                              setState(() {});
                                                            }

                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (dataListItem.actionType ==
                                                  'image')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      DetailActionTypeImageWidget(
                                                        key: Key(
                                                            'Keyq7g_${dataListIndex}_of_${dataList.length}'),
                                                        image: dataListItem,
                                                        callback:
                                                            (imageid) async {
                                                          _model.responseData =
                                                              null;
                                                          setState(() {});
                                                          if (imageid.isEmpty) {
                                                            _model
                                                                .updateResponseDataStruct(
                                                              (e) => e
                                                                ..status =
                                                                    'done'
                                                                ..files = [],
                                                            );
                                                            setState(() {});
                                                          } else {
                                                            while (_model.loop <
                                                                imageid
                                                                    .length) {
                                                              _model.addToListFileDataType(
                                                                  FileDataTypeStruct(
                                                                directusFilesId:
                                                                    FileIDDataTypeStruct(
                                                                  id: imageid[
                                                                      _model
                                                                          .loop],
                                                                ),
                                                              ));
                                                              setState(() {});
                                                              _model.loop =
                                                                  _model.loop +
                                                                      1;
                                                              setState(() {});
                                                            }
                                                            _model.loop = 0;
                                                            _model
                                                                .updateResponseDataStruct(
                                                              (e) => e
                                                                ..status =
                                                                    'done'
                                                                ..files = _model
                                                                    .listFileDataType
                                                                    .toList(),
                                                            );
                                                            setState(() {});
                                                          }

                                                          _model.updateImageToken =
                                                              await action_blocks
                                                                  .tokenReload(
                                                                      context);
                                                          if (_model
                                                              .updateImageToken!) {
                                                            _model.apiResultUpdateImage =
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
                                                                    .apiResultUpdateImage
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Update thành công',
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Update thất bại',
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
                                                                .getDetail(
                                                                    context);
                                                            setState(() {});
                                                          } else {
                                                            setState(() {});
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (dataListItem.status == 'done') {
                                            return FlutterFlowTheme.of(context)
                                                .secondary;
                                          } else if ((dataListItem.status ==
                                                  'todo') &&
                                              (dataListItem.current == 1)) {
                                            return FlutterFlowTheme.of(context)
                                                .primary;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryText;
                                          }
                                        }(),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'B${dataListItem.number.toString()}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).divide(const SizedBox(height: 24.0)),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
