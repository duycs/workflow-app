import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/tasks/popup_see_more/popup_see_more_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_action_type_upload_file_model.dart';
export 'detail_action_type_upload_file_model.dart';

class DetailActionTypeUploadFileWidget extends StatefulWidget {
  const DetailActionTypeUploadFileWidget({
    super.key,
    this.dataPass,
    required this.callback,
  });

  final TaskListStruct? dataPass;
  final Future Function(List<String> file)? callback;

  @override
  State<DetailActionTypeUploadFileWidget> createState() =>
      _DetailActionTypeUploadFileWidgetState();
}

class _DetailActionTypeUploadFileWidgetState
    extends State<DetailActionTypeUploadFileWidget> {
  late DetailActionTypeUploadFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeUploadFileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      _model.listStringId = [];
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_model.listFileUpload.length > 0)
          Builder(
            builder: (context) {
              final dataFileUpload = _model.listFileUpload.toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(dataFileUpload.length, (dataFileUploadIndex) {
                  final dataFileUploadItem =
                      dataFileUpload[dataFileUploadIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (functions.checkFileLast('${(String tail) {
                              return tail.split('.').last;
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                            }(functions.fileName(dataFileUploadItem)!)}') ==
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
                              functions.fileName(dataFileUploadItem),
                              'Loading',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
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
                            _model.removeAtIndexFromListFileUpload(
                                dataFileUploadIndex);
                            _model.isShow = true;
                            setState(() {});
                          },
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  );
                }).divide(SizedBox(height: 4.0)),
              );
            },
          ),
        if (widget!.dataPass!.operations.first.operationsId.files.length > 0)
          Builder(
            builder: (context) {
              final dataFile = _model.listFileId.toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(dataFile.length, (dataFileIndex) {
                  final dataFileItem = dataFile[dataFileIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (functions.checkFileLast('${(String tail) {
                              return tail.split('.').last;
                            }(dataFileItem.filenameDownload)}') ==
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
                            }(dataFileItem.filenameDownload)}') ==
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
                            }(dataFileItem.filenameDownload)}') ==
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
                            }(dataFileItem.filenameDownload)}') ==
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
                            }(dataFileItem.filenameDownload)}') ==
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
                            }(dataFileItem.filenameDownload)}') ==
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
                            dataFileItem.filenameDownload,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: PopupSeeMoreWidget(
                                      fileName: dataFileItem.filenameDownload,
                                      fileId: dataFileItem.id,
                                    ),
                                  );
                                },
                              );
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
                                '${FFAppConstants.ApiBaseUrl}/assets/${dataFileItem.id}?access_token=${FFAppState().accessToken}',
                                widget!.dataPass!.name,
                                dataFileItem.filenameDownload,
                              );
                            } else {
                              setState(() {});
                            }

                            setState(() {});
                          },
                        ),
                        if (widget!.dataPass?.status != 'done')
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
                              _model.removeAtIndexFromListFileId(dataFileIndex);
                              _model.isShow = true;
                              setState(() {});
                            },
                          ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  );
                }).divide(SizedBox(height: 4.0)),
              );
            },
          ),
        if (_model.isShow == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Text(
              'Lưu để cập nhật dữ liệu mới nhất',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).error,
                    letterSpacing: 0.0,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        if (widget!.dataPass?.status == 'todo')
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FFButtonWidget(
                onPressed: (widget!.dataPass?.current == 0)
                    ? null
                    : () async {
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

                        if (_model.uploadedLocalFile != null &&
                            (_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)) {
                          _model.addToListFileUpload(_model.uploadedLocalFile);
                          _model.isShow = true;
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
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: (widget!.dataPass?.current == 0)
                    ? null
                    : () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Bạn chắc chắn muốn lưu?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Hủy'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Lưu'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          if (_model.listFileUpload.length >= 1) {
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
                                  _model.addToListFildIdDetail(
                                      FileIDDataTypeStruct(
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
                                  setState(() {});
                                } else {
                                  while (_model.loop <
                                      _model.listFileUpload.length) {
                                    _model.addToListFildIdDetail(
                                        FileIDDataTypeStruct(
                                      id: (FileUploadStruct.maybeFromMap((_model
                                                      .apiResultUploadFile
                                                      ?.jsonBody ??
                                                  ''))
                                              ?.data?[_model.loop])
                                          ?.id,
                                      filenameDownload:
                                          (FileUploadStruct.maybeFromMap((_model
                                                          .apiResultUploadFile
                                                          ?.jsonBody ??
                                                      ''))
                                                  ?.data?[_model.loop])
                                              ?.filenameDownload,
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
                            _model.addToListStringId(
                                _model.listFileId[_model.loop].id);
                            setState(() {});
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                          while (_model.loop < _model.listFildIdDetail.length) {
                            _model.addToListStringId(
                                _model.listFildIdDetail[_model.loop].id);
                            setState(() {});
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                          await widget.callback?.call(
                            _model.listStringId,
                          );
                          _model.listFileUpload = [];
                          _model.isShow = false;
                          _model.listFileId = [];
                          setState(() {});
                        }

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
