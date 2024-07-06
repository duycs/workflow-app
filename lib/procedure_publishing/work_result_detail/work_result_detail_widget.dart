import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/procedure_publishing/checkbox_work_result/checkbox_work_result_widget.dart';
import '/procedure_publishing/result_work_grid_view/result_work_grid_view_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'work_result_detail_model.dart';
export 'work_result_detail_model.dart';

class WorkResultDetailWidget extends StatefulWidget {
  const WorkResultDetailWidget({
    super.key,
    this.workflowId,
    required this.publishedCount,
  });

  final String? workflowId;
  final int? publishedCount;

  @override
  State<WorkResultDetailWidget> createState() => _WorkResultDetailWidgetState();
}

class _WorkResultDetailWidgetState extends State<WorkResultDetailWidget> {
  late WorkResultDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkResultDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getTaskToDo(context);
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
              context.pop();
            },
          ),
          title: Text(
            'Chi tiết kết quả ',
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
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.list.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          _model.list.first.workflowId.name != ''
                              ? _model.list.first.workflowId.name
                              : ' ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Text(
                        'Lần chạy thứ: ${widget.publishedCount != null ? widget.publishedCount?.toString() : ' '}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.manage_accounts_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 22.0,
                          ),
                          Text(
                            'Người tạo:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              _model.list.first.createdUserId
                                              .firstName !=
                                          ''
                                  ? _model.list.first.createdUserId.firstName
                                  : ' ',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ],
                  ),
                ),
              Container(
                decoration: const BoxDecoration(),
                child: Builder(
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
                        return Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Container(
                                  width: double.infinity,
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              dataListItem.name,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.staffs.first.staffsId.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      dataListItem
                                                          .staffs
                                                          .first
                                                          .staffsId
                                                          .userId
                                                          .firstName,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 4.0)),
                                              ),
                                              if (dataListItem.operations.first
                                                      .operationsId.result ==
                                                  'submit_text')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        dataListItem
                                                                        .operations
                                                                        .first
                                                                        .operationsId
                                                                        .result !=
                                                                    ''
                                                            ? dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .result
                                                            : ' ',
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ),
                                                ),
                                              if ((dataListItem.actionType ==
                                                      'image') &&
                                                  (dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .files.isNotEmpty))
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child:
                                                      ResultWorkGridViewWidget(
                                                    key: Key(
                                                        'Keyylz_${dataListIndex}_of_${dataList.length}'),
                                                    type:
                                                        dataListItem.actionType,
                                                    parameter2: dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .files
                                                        .length,
                                                    operationList:
                                                        dataListItem.operations,
                                                  ),
                                                ),
                                              if ((dataListItem.status ==
                                                      'done') &&
                                                  ((dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .files.isNotEmpty) &&
                                                      (dataListItem
                                                              .actionType ==
                                                          'upload_file')))
                                                Builder(
                                                  builder: (context) {
                                                    final listFile =
                                                        dataListItem.operations
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          listFile.length,
                                                          (listFileIndex) {
                                                        final listFileItem =
                                                            listFile[
                                                                listFileIndex];
                                                        return Visibility(
                                                          visible: (dataListItem
                                                                      .status ==
                                                                  'done') &&
                                                              ((dataListItem
                                                                          .operations
                                                                          .first
                                                                          .operationsId
                                                                          .files.isNotEmpty) &&
                                                                  (dataListItem
                                                                          .actionType ==
                                                                      'upload_file')),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final fileItems =
                                                                      listFileItem
                                                                          .operationsId
                                                                          .files
                                                                          .toList();
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                        fileItems
                                                                            .length,
                                                                        (fileItemsIndex) {
                                                                      final fileItemsItem =
                                                                          fileItems[
                                                                              fileItemsIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (functions.checkFileLast((String var1) {
                                                                                return var1.split('.').last;
                                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                              'exc')
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/excel.png',
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (functions.checkFileLast((String var1) {
                                                                                return var1.split('.').last;
                                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                              'word')
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/images.png',
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (functions.checkFileLast((String var1) {
                                                                                return var1.split('.').last;
                                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                              'pptx')
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/ppt.png',
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (functions.checkFileLast((String var1) {
                                                                                return var1.split('.').last;
                                                                              }(dataListItem.operations.first.operationsId.files.first.directusFilesId.filenameDownload)) ==
                                                                              'pdf')
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/pdf.png',
                                                                                  width: 35.0,
                                                                                  height: 35.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Text(
                                                                                fileItemsItem.directusFilesId.filenameDownload,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    }).divide(const SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              if (dataListItem.actionType ==
                                                  'todo_list')
                                                Builder(
                                                  builder: (context) {
                                                    final dataCheckList =
                                                        dataListItem.operations
                                                            .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          dataCheckList.length,
                                                      itemBuilder: (context,
                                                          dataCheckListIndex) {
                                                        final dataCheckListItem =
                                                            dataCheckList[
                                                                dataCheckListIndex];
                                                        return CheckboxWorkResultWidget(
                                                          key: Key(
                                                              'Keyc8d_${dataCheckListIndex}_of_${dataCheckList.length}'),
                                                          listData:
                                                              dataCheckListItem,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              if (dataListItem
                                                          .operations
                                                          .first
                                                          .operationsId
                                                          .result !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    6.0,
                                                                    8.0,
                                                                    6.0),
                                                        child: custom_widgets
                                                            .HtmlToDoc(
                                                          width:
                                                              double.infinity,
                                                          height: 150.0,
                                                          html: functions
                                                              .formatHtml(
                                                                  dataListItem
                                                                      .operations
                                                                      .first
                                                                      .operationsId
                                                                      .result),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 0.0, 0.0),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
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
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'B${dataListItem.number.toString()}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(const SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
