import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
  final Future Function(List<String> imageid)? callback;

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
          widget!.image!.operations.first.operationsId.files.length) {
        _model.addToImagesList(widget!.image!.operations.first.operationsId
            .files[_model.loop].directusFilesId.id);
        setState(() {});
        _model.loop = _model.loop + 1;
        setState(() {});
      }
      _model.loop = 0;
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if ((widget!.image?.status == 'done') &&
            (widget!.image!.operations.first.operationsId.files.length > 0))
          Builder(
            builder: (context) {
              final data = widget!.image?.operations?.toList() ?? [];

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(data.length, (dataIndex) {
                  final dataItem = data[dataIndex];
                  return Builder(
                    builder: (context) {
                      final dataGrid = dataItem.operationsId.files.toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6.0,
                          mainAxisSpacing: 6.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataGrid.length,
                        itemBuilder: (context, dataGridIndex) {
                          final dataGridItem = dataGrid[dataGridIndex];
                          return Stack(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(),
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
                                            '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.contain,
                                            ),
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
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 6.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.download,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15.0,
                                    ),
                                    onPressed: () async {
                                      _model.downloadImageToken =
                                          await action_blocks
                                              .tokenReload(context);
                                      if (_model.downloadImageToken!) {
                                        await actions.downloadFile(
                                          '${FFAppConstants.ApiBaseUrl}/assets/${dataGridItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                          dataGridItem
                                              .directusFilesId.filenameDownload,
                                          dataGridItem
                                              .directusFilesId.filenameDownload,
                                        );
                                      } else {
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }),
              );
            },
          ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if ((widget!.image?.status == 'todo') &&
                (widget!.image?.current == 1))
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Builder(
                  builder: (context) {
                    final dataTodoItem = _model.imagesList.toList();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0,
                        childAspectRatio: 1.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: dataTodoItem.length,
                      itemBuilder: (context, dataTodoItemIndex) {
                        final dataTodoItemItem =
                            dataTodoItem[dataTodoItemIndex];
                        return Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
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
                                          '${FFAppConstants.ApiBaseUrl}/assets/${dataTodoItemItem}?access_token=${FFAppState().accessToken}',
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag:
                                            '${FFAppConstants.ApiBaseUrl}/assets/${dataTodoItemItem}?access_token=${FFAppState().accessToken}',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag:
                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataTodoItemItem}?access_token=${FFAppState().accessToken}',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '${FFAppConstants.ApiBaseUrl}/assets/${dataTodoItemItem}?access_token=${FFAppState().accessToken}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.7,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 6.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    _model.removeAtIndexFromImagesList(
                                        dataTodoItemIndex);
                                    _model.isShow = true;
                                    setState(() {});
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
            if (_model.images.length > 0)
              Container(
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    final imageUpload = _model.images.toList();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0,
                        childAspectRatio: 1.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: imageUpload.length,
                      itemBuilder: (context, imageUploadIndex) {
                        final imageUploadItem = imageUpload[imageUploadIndex];
                        return Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
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
                            ),
                            Opacity(
                              opacity: 0.7,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 6.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    _model.removeAtIndexFromImages(
                                        imageUploadIndex);
                                    setState(() {});
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
            if (_model.isShow == true)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
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
              ),
            if ((widget!.image?.status == 'todo') &&
                (widget!.image?.current == 1))
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

                      if (_model.uploadedLocalFile != null &&
                          (_model.uploadedLocalFile.bytes?.isNotEmpty ??
                              false)) {
                        _model.addToImages(_model.uploadedLocalFile);
                        _model.isShow = true;
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Nunito Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
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
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Lưu'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        if (_model.images.length >= 1) {
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
                                  _model.addToImagesListDetail(
                                      FileUploadStruct.maybeFromMap((_model
                                                  .apiResultUploadListImage
                                                  ?.jsonBody ??
                                              ''))!
                                          .data[_model.loop]
                                          .id);
                                  setState(() {});
                                  _model.loop = _model.loop + 1;
                                  setState(() {});
                                }
                                _model.loop = 0;
                                setState(() {});
                              } else {
                                _model.addToImagesListDetail(getJsonField(
                                  (_model.apiResultUploadListImage?.jsonBody ??
                                      ''),
                                  r'''$.data.id''',
                                ).toString());
                                setState(() {});
                              }
                            }
                          } else {
                            setState(() {});
                          }
                        }
                        while (_model.loop < _model.imagesList.length) {
                          _model.addToImagesListDetail(
                              _model.imagesList[_model.loop]);
                          setState(() {});
                          _model.loop = _model.loop + 1;
                          setState(() {});
                        }
                        _model.loop = 0;
                        setState(() {});
                        await widget.callback?.call(
                          _model.imagesListDetail,
                        );
                        _model.images = [];
                        _model.isShow = false;
                        _model.imagesListDetail = [];
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
          ].divide(SizedBox(height: 8.0)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if ((widget!.image?.status == 'todo') &&
                (widget!.image?.current == 0))
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
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  width: 110.0,
                  height: 35.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
          ],
        ),
      ].divide(SizedBox(height: 6.0)),
    );
  }
}
