import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/tasks/popup_see_more/popup_see_more_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'do_action_type_upload_file_model.dart';
export 'do_action_type_upload_file_model.dart';

class DoActionTypeUploadFileWidget extends StatefulWidget {
  const DoActionTypeUploadFileWidget({
    super.key,
    this.callback,
    this.dataPass,
  });

  final Future Function(List<String> file)? callback;
  final TaskListStruct? dataPass;

  @override
  State<DoActionTypeUploadFileWidget> createState() =>
      _DoActionTypeUploadFileWidgetState();
}

class _DoActionTypeUploadFileWidgetState
    extends State<DoActionTypeUploadFileWidget> {
  late DoActionTypeUploadFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoActionTypeUploadFileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listFileId = [];
      setState(() {});
      while (_model.loop <
          widget!.dataPass!.operations.first.operationsId.files.length) {
        _model.addToListFileId(FileIDDataTypeStruct(
          id: (widget!.dataPass?.operations?.first?.operationsId
                  ?.files?[_model.loop])
              ?.directusFilesId
              ?.id,
          filenameDownload: (widget!.dataPass?.operations?.first?.operationsId
                  ?.files?[_model.loop])
              ?.directusFilesId
              ?.filenameDownload,
        ));
        setState(() {});
        _model.loop = _model.loop + 1;
        setState(() {});
      }
      _model.loop = 0;
      _model.fileName = [];
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            final data = _model.listFileId.toList();

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(data.length, (dataIndex) {
                final dataItem = data[dataIndex];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'video')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/images111.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'exc')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/excel.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'img')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/9967614.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'word')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/images.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'pptx')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/ppt.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (functions.checkFileLast('${(String tail) {
                                return tail.split('.').last;
                              }(dataItem.filenameDownload)}') ==
                              'pdf')
                            Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/pdf.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          Expanded(
                            child: Text(
                              dataItem.filenameDownload,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          if ((functions.checkFileLast('${(String tail) {
                                    return tail.split('.').last;
                                  }(dataItem.filenameDownload)}') ==
                                  'pdf') ||
                              (functions.checkFileLast('${(String tail) {
                                    return tail.split('.').last;
                                  }(dataItem.filenameDownload)}') ==
                                  'img'))
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
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
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: PopupSeeMoreWidget(
                                            fileName: dataItem.filenameDownload,
                                            fileId: dataItem.id,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.download_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.downloadFileToken =
                                  await action_blocks.tokenReload(context);
                              if (_model.downloadFileToken!) {
                                await actions.downloadFile(
                                  '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                  widget!.dataPass!.name,
                                  dataItem.filenameDownload,
                                );
                              } else {
                                setState(() {});
                              }

                              setState(() {});
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.removeAtIndexFromListFileId(dataIndex);
                              setState(() {});
                            },
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
        if (_model.listFileUpload.length > 0)
          Builder(
            builder: (context) {
              final dataUpload = _model.listFileUpload.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(dataUpload.length, (dataUploadIndex) {
                  final dataUploadItem = dataUpload[dataUploadIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}') ==
                                'video')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/images111.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}') ==
                                'exc')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/excel.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}') ==
                                'img')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/9967614.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}') ==
                                'word')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/images.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (functions.checkFileLast(
                                    functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}')) ==
                                'pptx')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/ppt.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (functions.checkFileLast('${(String tail) {
                                  return tail.split('.').last;
                                }(functions.fileName(dataUploadItem)!)}') ==
                                'pdf')
                              Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/pdf.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  functions.fileName(dataUploadItem),
                                  'Loading',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.removeAtIndexFromListFileUpload(
                                      dataUploadIndex);
                                  setState(() {});
                                },
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FFButtonWidget(
              onPressed: () async {
                setState(() {
                  _model.isDataUploading = false;
                  _model.uploadedLocalFile =
                      FFUploadedFile(bytes: Uint8List.fromList([]));
                });

                final selectedFiles = await selectFiles(
                  multiFile: false,
                );
                if (selectedFiles != null) {
                  setState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  try {
                    selectedUploadedFiles = selectedFiles
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                            ))
                        .toList();
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedFiles.length) {
                    setState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }

                if (_model.uploadedLocalFile != null &&
                    (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
                  _model.addToListFileUpload(_model.uploadedLocalFile);
                  setState(() {});
                }
              },
              text: 'Chọn file',
              icon: Icon(
                Icons.attach_file,
                size: 20.0,
              ),
              options: FFButtonOptions(
                width: 110.0,
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            if (_model.listFileUpload.length > 0)
              FFButtonWidget(
                onPressed: () async {
                  if (_model.uploadedLocalFile != null &&
                      (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
                    _model.uploadFileToken =
                        await action_blocks.tokenReload(context);
                    if (_model.uploadFileToken!) {
                      _model.apiResultUploadFile =
                          await UploadFileGroup.uploadListFileCall.call(
                        accessToken: FFAppState().accessToken,
                        fileList: _model.listFileUpload,
                      );

                      if ((_model.apiResultUploadFile?.succeeded ?? true)) {
                        if (_model.listFileUpload.length == 1) {
                          _model.addToListFileId(FileIDDataTypeStruct(
                            id: getJsonField(
                              (_model.apiResultUploadFile?.jsonBody ?? ''),
                              r'''$.data.id''',
                            ).toString(),
                            filenameDownload: getJsonField(
                              (_model.apiResultUploadFile?.jsonBody ?? ''),
                              r'''$.data.filename_download''',
                            ).toString(),
                          ));
                          setState(() {});
                        } else {
                          while (_model.loop < _model.listFileUpload.length) {
                            _model.addToListFileId(FileIDDataTypeStruct(
                              id: (FileUploadStruct.maybeFromMap((_model
                                              .apiResultUploadFile?.jsonBody ??
                                          ''))
                                      ?.data?[_model.loop])
                                  ?.id,
                              filenameDownload: (FileUploadStruct.maybeFromMap(
                                          (_model.apiResultUploadFile
                                                  ?.jsonBody ??
                                              ''))
                                      ?.data?[_model.loop])
                                  ?.id,
                            ));
                            setState(() {});
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                        }
                      }
                    } else {
                      setState(() {});
                    }
                  }
                  while (_model.loop < _model.listFileId.length) {
                    _model.addToFileName(_model.listFileId[_model.loop].id);
                    setState(() {});
                    _model.loop = _model.loop + 1;
                    setState(() {});
                  }
                  _model.loop = 0;
                  setState(() {});
                  await widget.callback?.call(
                    _model.fileName,
                  );
                  _model.listFileUpload = [];
                  _model.listFileId = [];
                  setState(() {});

                  setState(() {});
                },
                text: 'Lưu',
                icon: Icon(
                  Icons.save_alt,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  width: 110.0,
                  height: 35.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
