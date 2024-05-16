import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'detail_action_type_image_model.dart';
export 'detail_action_type_image_model.dart';

class DetailActionTypeImageWidget extends StatefulWidget {
  const DetailActionTypeImageWidget({
    super.key,
    this.image,
    required this.callback,
  });

  final TaskListStruct? image;
  final Future Function(List<String>? imageid)? callback;

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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.loop <
          widget.image!.operations.first.operationsId.files.length) {
        setState(() {
          _model.addToImagesList(widget.image!.operations.first.operationsId
              .files[_model.loop].directusFilesId.id);
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
                title: Text(_model.imagesList.length.toString()),
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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if ((widget.image?.status == 'done') &&
                (widget.image!.operations.first.operationsId.files.isNotEmpty))
              Builder(
                builder: (context) {
                  final data = widget.image?.operations.toList() ?? [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, dataIndex) {
                      final dataItem = data[dataIndex];
                      return Builder(
                        builder: (context) {
                          final dataGrid = dataItem.operationsId.files.toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: dataGrid.length,
                            itemBuilder: (context, dataGridIndex) {
                              final dataGridItem = dataGrid[dataGridIndex];
                              return InkWell(
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
                                          '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag:
                                            '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag:
                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((widget.image?.status == 'todo') &&
                    (widget.image?.current == 1))
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final dataTodoItem = _model.imagesList.toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: dataTodoItem.length,
                          itemBuilder: (context, dataTodoItemIndex) {
                            final dataTodoItemItem =
                                dataTodoItem[dataTodoItemIndex];
                            return Stack(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              children: [
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
                                            '${FFAppConstants.ApiBaseUrl}/assets/$dataTodoItemItem?access_token=${FFAppState().accessToken}',
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag:
                                              '${FFAppConstants.ApiBaseUrl}/assets/$dataTodoItemItem?access_token=${FFAppState().accessToken}',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag:
                                        '${FFAppConstants.ApiBaseUrl}/assets/$dataTodoItemItem?access_token=${FFAppState().accessToken}',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        '${FFAppConstants.ApiBaseUrl}/assets/$dataTodoItemItem?access_token=${FFAppState().accessToken}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      _model.removeAtIndexFromImagesList(
                                          dataTodoItemIndex);
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (_model.images.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final imageUpload = _model.images.toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: imageUpload.length,
                          itemBuilder: (context, imageUploadIndex) {
                            final imageUploadItem =
                                imageUpload[imageUploadIndex];
                            return Stack(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              children: [
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
                                            imageUploadItem.bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag3',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag3',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        imageUploadItem.bytes ??
                                            Uint8List.fromList([]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      _model.removeAtIndexFromImages(
                                          imageUploadIndex);
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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

                        setState(() {
                          _model.addToImages(_model.uploadedLocalFile);
                        });
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
                              fontFamily: 'Nunito Sans',
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
                    FFButtonWidget(
                      onPressed: () async {
                        if ((_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)) {
                          _model.uploadListImageToken =
                              await action_blocks.tokenReload(context);
                          if (_model.uploadListImageToken!) {
                            _model.apiResultUploadListImage =
                                await UploadFileGroup.uploadListFileCall.call(
                              accessToken: FFAppState().accessToken,
                              fileList: _model.images,
                            );
                            if ((_model.apiResultUploadListImage?.succeeded ??
                                true)) {
                              if (FileUploadStruct.maybeFromMap((_model
                                              .apiResultUploadListImage
                                              ?.jsonBody ??
                                          ''))!
                                      .data
                                      .length >=
                                  2) {
                                while (_model.loop <
                                    FileUploadStruct.maybeFromMap((_model
                                                .apiResultUploadListImage
                                                ?.jsonBody ??
                                            ''))!
                                        .data
                                        .length) {
                                  setState(() {
                                    _model.addToImagesList(
                                        FileUploadStruct.maybeFromMap((_model
                                                    .apiResultUploadListImage
                                                    ?.jsonBody ??
                                                ''))!
                                            .data[_model.loop]
                                            .id);
                                  });
                                  setState(() {
                                    _model.loop = _model.loop + 1;
                                  });
                                }
                                setState(() {
                                  _model.loop = 0;
                                });
                              } else {
                                setState(() {
                                  _model.addToImagesList(getJsonField(
                                    (_model.apiResultUploadListImage
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.data.id''',
                                  ).toString());
                                });
                              }
                            }
                          } else {
                            setState(() {});
                          }
                        }
                        await widget.callback?.call(
                          _model.imagesList,
                        );
                        setState(() {
                          _model.images = [];
                        });

                        setState(() {});
                      },
                      text: 'Lưu',
                      icon: Icon(
                        Icons.save,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
              ].divide(const SizedBox(height: 8.0)),
            ),
            if ((widget.image?.status == 'todo') &&
                (widget.image?.current == 0))
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
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
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
          ].divide(const SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
