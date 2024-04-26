import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/procedure_publishing/checkbox_work_result/checkbox_work_result_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.list.length > 0)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.manage_accounts_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            'Người tạo:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              _model.list.first.createdUserId.firstName !=
                                          null &&
                                      _model.list.first.createdUserId
                                              .firstName !=
                                          ''
                                  ? _model.list.first.createdUserId.firstName
                                  : ' ',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _model.list.first.workflowId.name != null &&
                                            _model.list.first.workflowId.name !=
                                                ''
                                        ? _model.list.first.workflowId.name
                                        : ' ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    'Lần chạy thứ: ${widget.publishedCount != null ? widget.publishedCount?.toString() : ' '}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
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
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, dataListIndex) {
                        final dataListItem = dataList[dataListIndex];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'B${dataListItem.number.toString()}:',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            dataListItem.name,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.staffs.first.staffsId.userId.avatar}?access_token=${FFAppState().accessToken}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                dataListItem.staffs.first
                                                    .staffsId.userId.firstName,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                        if (dataListItem.operations.first
                                                .operationsId.result ==
                                            'submit_text')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .result !=
                                                              null &&
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((dataListItem.actionType ==
                                                'image') &&
                                            (dataListItem.operations.first
                                                    .operationsId.files.length >
                                                0))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: Image.network(
                                                        (dataListItem.actionType ==
                                                                    'image') &&
                                                                (dataListItem
                                                                        .operations
                                                                        .first
                                                                        .operationsId
                                                                        .files
                                                                        .length >
                                                                    0)
                                                            ? '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                            : ' ',
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: (dataListItem
                                                                      .actionType ==
                                                                  'image') &&
                                                              (dataListItem
                                                                      .operations
                                                                      .first
                                                                      .operationsId
                                                                      .files
                                                                      .length >
                                                                  0)
                                                          ? '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                          : ' ',
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: (dataListItem.actionType ==
                                                            'image') &&
                                                        (dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files
                                                                .length >
                                                            0)
                                                    ? '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                    : ' ',
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    (dataListItem.actionType ==
                                                                'image') &&
                                                            (dataListItem
                                                                    .operations
                                                                    .first
                                                                    .operationsId
                                                                    .files
                                                                    .length >
                                                                0)
                                                        ? '${FFAppConstants.ApiBaseUrl}/assets/${dataListItem.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                                        : ' ',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((dataListItem.status == 'done') &&
                                            ((dataListItem
                                                        .operations
                                                        .first
                                                        .operationsId
                                                        .files
                                                        .length >
                                                    0) &&
                                                (dataListItem.actionType ==
                                                    'upload_file')))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (functions.checkFileLast(
                                                              (String var1) {
                                                            return var1
                                                                .split('.')
                                                                .last;
                                                          }(dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files
                                                                  .first
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                          'exc')
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/excel.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      if (functions.checkFileLast(
                                                              (String var1) {
                                                            return var1
                                                                .split('.')
                                                                .last;
                                                          }(dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files
                                                                  .first
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                          'word')
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/images.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      if (functions.checkFileLast(
                                                              (String var1) {
                                                            return var1
                                                                .split('.')
                                                                .last;
                                                          }(dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files
                                                                  .first
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                          'pptx')
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/ppt.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      if (functions.checkFileLast(
                                                              (String var1) {
                                                            return var1
                                                                .split('.')
                                                                .last;
                                                          }(dataListItem
                                                                  .operations
                                                                  .first
                                                                  .operationsId
                                                                  .files
                                                                  .first
                                                                  .directusFilesId
                                                                  .filenameDownload)) ==
                                                          'pdf')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/pdf.png',
                                                              width: 35.0,
                                                              height: 35.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            dataListItem
                                                                .operations
                                                                .first
                                                                .operationsId
                                                                .files
                                                                .first
                                                                .directusFilesId
                                                                .filenameDownload,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (functions.checkFileLast(
                                                          (String var1) {
                                                        return var1
                                                            .split('.')
                                                            .last;
                                                      }(dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .files
                                                              .first
                                                              .directusFilesId
                                                              .filenameDownload)) ==
                                                      'pdf')
                                                    FlutterFlowPdfViewer(
                                                      networkPath:
                                                          'http://www.pdf995.com/samples/pdf.pdf',
                                                      width: double.infinity,
                                                      height: 300.0,
                                                      horizontalScroll: false,
                                                    ),
                                                  if (functions.checkFileLast(
                                                          (String var1) {
                                                        return var1
                                                            .split('.')
                                                            .last;
                                                      }(dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .files
                                                              .first
                                                              .directusFilesId
                                                              .filenameDownload)) ==
                                                      'img')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/113/600',
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      if (dataListItem
                                                              .operations
                                                              .first
                                                              .operationsId
                                                              .files
                                                              .length >
                                                          0) {
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
                                                      }
                                                    },
                                                    text: 'Tải tài liệu',
                                                    icon: Icon(
                                                      Icons.download,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        if (dataListItem.actionType ==
                                            'todo_list')
                                          Builder(
                                            builder: (context) {
                                              final dataCheckList = dataListItem
                                                  .operations
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: dataCheckList.length,
                                                itemBuilder: (context,
                                                    dataCheckListIndex) {
                                                  final dataCheckListItem =
                                                      dataCheckList[
                                                          dataCheckListIndex];
                                                  return CheckboxWorkResultWidget(
                                                    key: Key(
                                                        'Keyc8d_${dataCheckListIndex}_of_${dataCheckList.length}'),
                                                    listData: dataCheckListItem,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
