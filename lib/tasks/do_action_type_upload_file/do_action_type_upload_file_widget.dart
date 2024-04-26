import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'do_action_type_upload_file_model.dart';
export 'do_action_type_upload_file_model.dart';

class DoActionTypeUploadFileWidget extends StatefulWidget {
  const DoActionTypeUploadFileWidget({
    super.key,
    this.callback,
    this.file,
    this.type,
    this.fileTail,
  });

  final Future Function(String? file)? callback;
  final String? file;
  final String? type;
  final String? fileTail;

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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (((_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) ||
              ((widget.file != null && widget.file != '') &&
                  (widget.file != '6f2dfeb5-4df6-4b73-93c4-109f72133a25')))
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((widget.fileTail !=
                          '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                      (functions.checkFileLast((String tail) {
                            return tail.split('.').last;
                          }(widget.fileTail!)) ==
                          'exc'))
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
                  if ((widget.fileTail !=
                          '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                      (functions.checkFileLast((String tail) {
                            return tail.split('.').last;
                          }(widget.fileTail!)) ==
                          'word'))
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
                  if ((widget.fileTail !=
                          '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                      (functions.checkFileLast((String tail) {
                            return tail.split('.').last;
                          }(widget.fileTail!)) ==
                          'pptx'))
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
                  if ((widget.fileTail !=
                          '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                      (functions.checkFileLast((String tail) {
                            return tail.split('.').last;
                          }(widget.fileTail!)) ==
                          'pdf'))
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
                        () {
                          if (_model.fileName != '') {
                            return _model.fileName;
                          } else if ((_model.fileName == '') &&
                              ((widget.file != null && widget.file != '') &&
                                  (widget.file !=
                                      '6f2dfeb5-4df6-4b73-93c4-109f72133a25'))) {
                            return widget.file;
                          } else {
                            return 'Upload tài liệu';
                          }
                        }(),
                        'Tải tệp',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
          if ((widget.fileTail != '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
              (functions.checkFileLast((String tail) {
                    return tail.split('.').last;
                  }(widget.fileTail!)) ==
                  'pdf'))
            FlutterFlowPdfViewer(
              networkPath:
                  '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
              height: 300.0,
              horizontalScroll: false,
            ),
          if (functions.checkFileLast((String tail) {
                return tail.split('.').last;
              }(widget.fileTail!)) ==
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
                        '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag:
                          '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag:
                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
                    width: 350.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FFButtonWidget(
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
                    if (selectedUploadedFiles.length == selectedFiles.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                      });
                    } else {
                      setState(() {});
                      return;
                    }
                  }

                  _model.uploadFileToken =
                      await action_blocks.tokenReload(context);
                  if (_model.uploadFileToken!) {
                    _model.apiResultUploadFile =
                        await UploadFileGroup.uploadFileCall.call(
                      accessToken: FFAppState().accessToken,
                      file: _model.uploadedLocalFile,
                    );
                    if ((_model.apiResultUploadFile?.succeeded ?? true)) {
                      setState(() {
                        _model.fileName = getJsonField(
                          (_model.apiResultUploadFile?.jsonBody ?? ''),
                          r'''$.data.filename_download''',
                        ).toString();
                      });
                      await widget.callback?.call(
                        getJsonField(
                          (_model.apiResultUploadFile?.jsonBody ?? ''),
                          r'''$.data.id''',
                        ).toString(),
                      );
                    }
                  } else {
                    setState(() {});
                  }

                  setState(() {});
                },
                text: 'Upload tài liệu',
                icon: const Icon(
                  Icons.attach_file,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  width: 140.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              if ((widget.type != null && widget.type != '') &&
                  (widget.type != '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                  (widget.fileTail != null && widget.fileTail != '') &&
                  (widget.fileTail != '6f2dfeb5-4df6-4b73-93c4-109f72133a25'))
                FFButtonWidget(
                  onPressed: () async {
                    _model.downloadFileToken =
                        await action_blocks.tokenReload(context);
                    if (_model.downloadFileToken!) {
                      await actions.downloadFile(
                        '${FFAppConstants.ApiBaseUrl}/assets/${widget.file}?access_token=${FFAppState().accessToken}',
                        widget.type!,
                        widget.fileTail!,
                      );
                    } else {
                      setState(() {});
                    }

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
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
            ].divide(const SizedBox(width: 8.0)),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
