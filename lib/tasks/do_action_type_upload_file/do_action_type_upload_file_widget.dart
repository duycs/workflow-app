import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'do_action_type_upload_file_model.dart';
export 'do_action_type_upload_file_model.dart';

class DoActionTypeUploadFileWidget extends StatefulWidget {
  const DoActionTypeUploadFileWidget({
    super.key,
    this.callback,
    this.dataPass,
  });

  final Future Function(List<String>? file)? callback;
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
      while (_model.loop <
          widget.dataPass!.operations.first.operationsId.files.length) {
        setState(() {
          _model.addToListFileId(FileIDDataTypeStruct(
            id: (widget.dataPass?.operations.first.operationsId
                    .files[_model.loop])
                ?.directusFilesId
                .id,
            filenameDownload: (widget.dataPass?.operations.first.operationsId
                    .files[_model.loop])
                ?.directusFilesId
                .filenameDownload,
          ));
        });
        setState(() {
          _model.loop = _model.loop + 1;
        });
      }
      setState(() {
        _model.loop = 0;
      });
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text(_model.listFileId.length.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: const Text('Confirm'),
                  ),
                ],
              );
            },
          ) ??
          false;
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

    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      final data = _model.listFileId.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (context, dataIndex) {
                          final dataItem = data[dataIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (functions
                                            .checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(dataItem.filenameDownload)) ==
                                        'exc')
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/excel.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (functions
                                            .checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(dataItem.filenameDownload)) ==
                                        'word')
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/images.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (functions
                                            .checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(dataItem.filenameDownload)) ==
                                        'pptx')
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/ppt.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (functions
                                            .checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(dataItem.filenameDownload)) ==
                                        'pdf')
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                              if ((functions.checkFileLast((String tail) {
                                        return tail.split('.').last;
                                      }(dataItem.filenameDownload)) ==
                                      'pdf') &&
                                  (_model.isShowPdf == false))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.isShowPdf = true;
                                    });
                                  },
                                  child: Text(
                                    '(Xem thêm)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              if ((functions.checkFileLast((String tail) {
                                        return tail.split('.').last;
                                      }(dataItem.filenameDownload)) ==
                                      'pdf') &&
                                  _model.isShowPdf)
                                FlutterFlowPdfViewer(
                                  networkPath:
                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                  height: 300.0,
                                  horizontalScroll: false,
                                ),
                              if (functions.checkFileLast((String tail) {
                                    return tail.split('.').last;
                                  }(dataItem.filenameDownload)) ==
                                  'img')
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag:
                                              '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag:
                                        '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        '${FFAppConstants.ApiBaseUrl}/assets/${dataItem.id}?access_token=${FFAppState().accessToken}',
                                        width: 350.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((functions.checkFileLast((String tail) {
                                        return tail.split('.').last;
                                      }(dataItem.filenameDownload)) ==
                                      'pdf') &&
                                  _model.isShowPdf)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.isShowPdf = false;
                                    });
                                  },
                                  child: Text(
                                    '(Ẩn bớt)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  if (_model.listFileUpload.isNotEmpty)
                    Builder(
                      builder: (context) {
                        final dataUpload = _model.listFileUpload.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: dataUpload.length,
                          itemBuilder: (context, dataUploadIndex) {
                            final dataUploadItem = dataUpload[dataUploadIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ((_model.uploadedLocalFile.bytes
                                            ?.isNotEmpty ??
                                        false))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.checkFileLast(
                                                (String tail) {
                                              return tail.split('.').last;
                                            }(functions.fileName(dataUploadItem)!)) ==
                                            'exc')
                                          Container(
                                            width: 35.0,
                                            height: 35.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/excel.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (functions.checkFileLast(
                                                (String tail) {
                                              return tail.split('.').last;
                                            }(functions.fileName(dataUploadItem)!)) ==
                                            'word')
                                          Container(
                                            width: 35.0,
                                            height: 35.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/images.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (functions.checkFileLast(
                                                functions.checkFileLast(
                                                    (String tail) {
                                              return tail.split('.').last;
                                            }(functions.fileName(dataUploadItem)!))) ==
                                            'pptx')
                                          Container(
                                            width: 35.0,
                                            height: 35.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/ppt.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (functions.checkFileLast(
                                                (String tail) {
                                              return tail.split('.').last;
                                            }(functions.fileName(dataUploadItem)!)) ==
                                            'pdf')
                                          Container(
                                            width: 35.0,
                                            height: 35.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
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
                                              functions
                                                  .fileName(dataUploadItem),
                                              'Loading',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                if ((functions.checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(functions.fileName(dataUploadItem)!)) ==
                                        'pdf') &&
                                    (_model.isShowPdf == false))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.isShowPdf = true;
                                      });
                                    },
                                    child: Text(
                                      '(Xem thêm)',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                if ((functions.checkFileLast((String tail) {
                                          return tail.split('.').last;
                                        }(functions.fileName(dataUploadItem)!)) ==
                                        'pdf') &&
                                    _model.isShowPdf)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.isShowPdf = false;
                                      });
                                    },
                                    child: Text(
                                      '(Ẩn bớt)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: FFButtonWidget(
                          onPressed: () async {
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
                              if (selectedUploadedFiles.length ==
                                  selectedFiles.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            setState(() {
                              _model.addToListFileUpload(
                                  _model.uploadedLocalFile);
                            });
                          },
                          text: 'Upload tài liệu',
                          icon: const Icon(
                            Icons.attach_file,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: 140.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      if (_model.listFileId.isNotEmpty)
                        Expanded(
                          flex: 2,
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.downloadFileToken =
                                  await action_blocks.tokenReload(context);

                              setState(() {});
                            },
                            text: 'Tải tài liệu',
                            icon: const Icon(
                              Icons.download_sharp,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: 140.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 1,
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.uploadFileToken =
                                await action_blocks.tokenReload(context);
                            if (_model.uploadFileToken!) {
                              _model.apiResultUploadFile =
                                  await UploadFileGroup.uploadListFileCall.call(
                                accessToken: FFAppState().accessToken,
                                fileList: _model.listFileUpload,
                              );
                              if ((_model.apiResultUploadFile?.succeeded ??
                                  true)) {
                                if (_model.listFileUpload.length == 1) {
                                  setState(() {
                                    _model.addToListFileId(FileIDDataTypeStruct(
                                      id: getJsonField(
                                        (_model.apiResultUploadFile?.jsonBody ??
                                            ''),
                                        r'''$.data.id''',
                                      ).toString(),
                                      filenameDownload: getJsonField(
                                        (_model.apiResultUploadFile?.jsonBody ??
                                            ''),
                                        r'''$.data.filename_download''',
                                      ).toString(),
                                    ));
                                  });
                                } else {
                                  while (_model.loop <
                                      _model.listFileUpload.length) {
                                    setState(() {
                                      _model
                                          .addToListFileId(FileIDDataTypeStruct(
                                        id: (FileUploadStruct.maybeFromMap(
                                                    (_model.apiResultUploadFile
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.data[_model.loop])
                                            ?.id,
                                        filenameDownload: (FileUploadStruct
                                                    .maybeFromMap((_model
                                                            .apiResultUploadFile
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.data[_model.loop])
                                            ?.id,
                                      ));
                                    });
                                    setState(() {
                                      _model.loop = _model.loop + 1;
                                    });
                                  }
                                  setState(() {
                                    _model.loop = 0;
                                  });
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(_model.listFileId.length
                                                .toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                }

                                while (_model.loop < _model.listFileId.length) {
                                  setState(() {
                                    _model.addToFileName(
                                        _model.listFileId[_model.loop].id);
                                  });
                                  setState(() {
                                    _model.loop = _model.loop + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop = 0;
                                });
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(_model.fileName.length
                                                  .toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: const Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                await widget.callback?.call(
                                  _model.fileName,
                                );
                                setState(() {
                                  _model.listFileUpload = [];
                                  _model.listFileId = [];
                                });
                              }
                            } else {
                              setState(() {});
                            }

                            setState(() {});
                          },
                          text: 'Lưu',
                          icon: Icon(
                            Icons.save,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: 140.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
