import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'popup_see_more_model.dart';
export 'popup_see_more_model.dart';

class PopupSeeMoreWidget extends StatefulWidget {
  const PopupSeeMoreWidget({
    super.key,
    this.fileName,
    this.fileId,
  });

  final String? fileName;
  final String? fileId;

  @override
  State<PopupSeeMoreWidget> createState() => _PopupSeeMoreWidgetState();
}

class _PopupSeeMoreWidgetState extends State<PopupSeeMoreWidget> {
  late PopupSeeMoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupSeeMoreModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  if (functions.checkFileLast((String tail) {
                        return tail.split('.').last;
                      }(widget.fileName!)) ==
                      'pdf')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
                      child: FlutterFlowPdfViewer(
                        networkPath:
                            '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                        width: double.infinity,
                        height: 300.0,
                        horizontalScroll: false,
                      ),
                    ),
                  if (functions.checkFileLast((String tail) {
                        return tail.split('.').last;
                      }(widget.fileName!)) ==
                      'img')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
                      child: InkWell(
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
                                  '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag:
                                    '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag:
                              '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (functions.checkFileLast((String tail) {
                        return tail.split('.').last;
                      }(widget.fileName!)) ==
                      'video')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
                      child: FlutterFlowVideoPlayer(
                        path:
                            '${FFAppConstants.ApiBaseUrl}/assets/${widget.fileId}?access_token=${FFAppState().accessToken}',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
