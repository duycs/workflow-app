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
import 'do_action_type_image_model.dart';
export 'do_action_type_image_model.dart';

class DoActionTypeImageWidget extends StatefulWidget {
  const DoActionTypeImageWidget({
    super.key,
    this.callback,
    this.image,
  });

  final Future Function(List<String> images)? callback;
  final TaskListStruct? image;

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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listUploadImage = [];
      setState(() {});
      while (_model.loop <
          widget.image!.operations.first.operationsId.files.length) {
        _model.addToListUploadImage(widget.image!.operations.first.operationsId
            .files[_model.loop].directusFilesId.id);
        setState(() {});
        _model.loop = _model.loop + 1;
        setState(() {});
      }
      _model.loop = 0;
      setState(() {});
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: const BoxDecoration(),
          child: Builder(
            builder: (context) {
              final list = widget.image?.operations.toList() ?? [];

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(list.length, (listIndex) {
                  final listItem = list[listIndex];
                  return Visibility(
                    visible: listIndex == 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((widget.image != null) &&
                            (listItem.operationsId.files.isNotEmpty))
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final listImage =
                                    _model.listUploadImage.toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6.0,
                                    mainAxisSpacing: 6.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listImage.length,
                                  itemBuilder: (context, listImageIndex) {
                                    final listImageItem =
                                        listImage[listImageIndex];
                                    return Stack(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
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
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      '${FFAppConstants.ApiBaseUrl}/assets/$listImageItem?access_token=${FFAppState().accessToken}',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag:
                                                        '${FFAppConstants.ApiBaseUrl}/assets/$listImageItem?access_token=${FFAppState().accessToken}',
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag:
                                                  '${FFAppConstants.ApiBaseUrl}/assets/$listImageItem?access_token=${FFAppState().accessToken}',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${FFAppConstants.ApiBaseUrl}/assets/$listImageItem?access_token=${FFAppState().accessToken}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.7,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 6.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 30.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 15.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Xác nhận'),
                                                              content: const Text(
                                                                  'Bạn chắc chắn muốn xóa'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Hủy '),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  _model
                                                      .removeAtIndexFromListUploadImage(
                                                          listImageIndex);
                                                  setState(() {});
                                                } else {
                                                  return;
                                                }
                                              },
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
                  );
                }),
              );
            },
          ),
        ),
        if (_model.imageUpload.isNotEmpty)
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Builder(
              builder: (context) {
                final listImageUpload = _model.imageUpload.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                    childAspectRatio: 1.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listImageUpload.length,
                  itemBuilder: (context, listImageUploadIndex) {
                    final listImageUploadItem =
                        listImageUpload[listImageUploadIndex];
                    return Stack(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(),
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
                                    image: Image.memory(
                                      listImageUploadItem.bytes ??
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
                                  listImageUploadItem.bytes ??
                                      Uint8List.fromList([]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 30.0,
                            fillColor: FlutterFlowTheme.of(context).alternate,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15.0,
                            ),
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Xác nhận'),
                                            content:
                                                const Text('Bạn chắc chắn muốn xóa'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Hủy '),
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
                              if (confirmDialogResponse) {
                                _model.removeAtIndexFromImageUpload(
                                    listImageUploadIndex);
                                setState(() {});
                              } else {
                                return;
                              }
                            },
                          ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FFButtonWidget(
              onPressed: () async {
                setState(() {
                  _model.isDataUploading = false;
                  _model.uploadedLocalFile =
                      FFUploadedFile(bytes: Uint8List.fromList([]));
                });

                final selectedMedia = await selectMedia(
                  multiImage: false,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
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
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }

                if ((_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
                  _model.addToImageUpload(_model.uploadedLocalFile);
                  setState(() {});
                }
              },
              text: 'Chụp ảnh',
              icon: Icon(
                Icons.camera_alt,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 18.0,
              ),
              options: FFButtonOptions(
                width: 110.0,
                height: 35.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                if ((_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
                  _model.imageToken = await action_blocks.tokenReload(context);
                  if (_model.imageToken!) {
                    _model.apiResultImage =
                        await UploadFileGroup.uploadListFileCall.call(
                      accessToken: FFAppState().accessToken,
                      fileList: _model.imageUpload,
                    );

                    if ((_model.apiResultImage?.succeeded ?? true)) {
                      if (FileUploadStruct.maybeFromMap(
                                  (_model.apiResultImage?.jsonBody ?? ''))!
                              .data
                              .length >=
                          2) {
                        while (_model.loop <
                            FileUploadStruct.maybeFromMap(
                                    (_model.apiResultImage?.jsonBody ?? ''))!
                                .data
                                .length) {
                          _model.addToListUploadImage(
                              FileUploadStruct.maybeFromMap(
                                      (_model.apiResultImage?.jsonBody ?? ''))!
                                  .data[_model.loop]
                                  .id);
                          setState(() {});
                          _model.loop = _model.loop + 1;
                          setState(() {});
                        }
                        _model.loop = 0;
                        setState(() {});
                      } else {
                        _model.addToListUploadImage(getJsonField(
                          (_model.apiResultImage?.jsonBody ?? ''),
                          r'''$.data.id''',
                        ).toString());
                        setState(() {});
                      }
                    }
                  } else {
                    setState(() {});
                  }
                }
                await widget.callback?.call(
                  _model.listUploadImage,
                );
                _model.imageUpload = [];
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }
}
