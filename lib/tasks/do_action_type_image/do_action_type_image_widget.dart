import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'do_action_type_image_model.dart';
export 'do_action_type_image_model.dart';

class DoActionTypeImageWidget extends StatefulWidget {
  const DoActionTypeImageWidget({
    super.key,
    this.callback,
    this.image,
  });

  final Future Function(String? image)? callback;
  final String? image;

  @override
  State<DoActionTypeImageWidget> createState() =>
      _DoActionTypeImageWidgetState();
}

class _DoActionTypeImageWidgetState extends State<DoActionTypeImageWidget> {
  late DoActionTypeImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoActionTypeImageModel());
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
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  if (((_model.uploadedLocalFile.bytes?.isNotEmpty ??
                              false)) &&
                      (widget.image != null && widget.image != ''))
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
                              tag: 'imageTag1',
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'imageTag1',
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
                  if ((widget.image != null && widget.image != '') &&
                      (widget.image !=
                          '6f2dfeb5-4df6-4b73-93c4-109f72133a25') &&
                      ((_model.uploadedLocalFile.bytes?.isEmpty ?? true)))
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
                                '${FFAppConstants.ApiBaseUrl}/assets/${widget.image}?access_token=${FFAppState().accessToken}',
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag:
                                  '${FFAppConstants.ApiBaseUrl}/assets/${widget.image}?access_token=${FFAppState().accessToken}',
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag:
                            '${FFAppConstants.ApiBaseUrl}/assets/${widget.image}?access_token=${FFAppState().accessToken}',
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${FFAppConstants.ApiBaseUrl}/assets/${widget.image}?access_token=${FFAppState().accessToken}',
                            width: 350.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  FFButtonWidget(
                    onPressed: () async {
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

                      _model.apiResultImage =
                          await UploadFileGroup.uploadFileCall.call(
                        accessToken: FFAppState().accessToken,
                        file: _model.uploadedLocalFile,
                      );
                      if ((_model.apiResultImage?.succeeded ?? true)) {
                        await widget.callback?.call(
                          getJsonField(
                            (_model.apiResultImage?.jsonBody ?? ''),
                            r'''$.data.id''',
                          ).toString(),
                        );
                      }

                      setState(() {});
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
        ],
      ),
    );
  }
}
