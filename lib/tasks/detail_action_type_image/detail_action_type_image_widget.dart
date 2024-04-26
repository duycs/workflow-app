import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_action_type_image_model.dart';
export 'detail_action_type_image_model.dart';

class DetailActionTypeImageWidget extends StatefulWidget {
  const DetailActionTypeImageWidget({
    super.key,
    this.image,
  });

  final TaskListStruct? image;

  @override
  State<DetailActionTypeImageWidget> createState() =>
      _DetailActionTypeImageWidgetState();
}

class _DetailActionTypeImageWidgetState
    extends State<DetailActionTypeImageWidget> {
  late DetailActionTypeImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeImageModel());
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if ((widget.image?.status == 'todo') && (widget.image?.current == 0))
            FFButtonWidget(
              onPressed: ('1' == '1')
                  ? null
                  : () {
                      print('Button pressed ...');
                    },
              text: 'Chụp ảnh',
              icon: Icon(
                Icons.camera_alt,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: 150.0,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          if ((widget.image?.status == 'todo') && (widget.image?.current == 1))
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (((_model.uploadedLocalFile.bytes?.isEmpty ??
                                true)) &&
                        (widget.image!.operations.first.operationsId.files.isNotEmpty))
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
                                  '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag:
                                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag:
                              '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                              width: 350.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    if ((_model.uploadedLocalFile.bytes?.isNotEmpty ?? false))
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
                                image: Image.memory(
                                  _model.uploadedLocalFile.bytes ??
                                      Uint8List.fromList([]),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: 'imageTag2',
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'imageTag2',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.memory(
                              _model.uploadedLocalFile.bytes ??
                                  Uint8List.fromList([]),
                              width: 350.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        final selectedMedia = await selectMedia(
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        _model.apiResultcd8 =
                            await UploadFileGroup.uploadFileCall.call(
                          accessToken: FFAppState().accessToken,
                          file: _model.uploadedLocalFile,
                        );
                        shouldSetState = true;
                        if (!(_model.apiResultcd8?.succeeded ?? true)) {
                          if (shouldSetState) setState(() {});
                          return;
                        }
                        if (shouldSetState) setState(() {});
                      },
                      text: 'Chụp ảnh',
                      icon: Icon(
                        Icons.camera_alt,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if ((widget.image?.status == 'done') &&
              (widget.image!.operations.first.operationsId.files.isNotEmpty))
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
                        '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag:
                          '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag:
                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.image?.operations.first.operationsId.files.first.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                    width: 350.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ].divide(const SizedBox(height: 6.0)),
      ),
    );
  }
}
