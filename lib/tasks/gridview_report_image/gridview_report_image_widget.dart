import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'gridview_report_image_model.dart';
export 'gridview_report_image_model.dart';

class GridviewReportImageWidget extends StatefulWidget {
  const GridviewReportImageWidget({
    super.key,
    this.parameter1,
    this.parameter3,
  });

  final int? parameter1;
  final List<OperationListStruct>? parameter3;

  @override
  State<GridviewReportImageWidget> createState() =>
      _GridviewReportImageWidgetState();
}

class _GridviewReportImageWidgetState extends State<GridviewReportImageWidget> {
  late GridviewReportImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridviewReportImageModel());

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

    return Builder(
      builder: (context) {
        final imageList = widget!.parameter3?.toList() ?? [];

        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(imageList.length, (imageListIndex) {
            final imageListItem = imageList[imageListIndex];
            return Builder(
              builder: (context) {
                final gridviewImage = imageListItem.operationsId.files.toList();

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
                  itemCount: gridviewImage.length,
                  itemBuilder: (context, gridviewImageIndex) {
                    final gridviewImageItem = gridviewImage[gridviewImageIndex];
                    return Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Stack(
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
                                        '${FFAppConstants.ApiBaseUrl}/assets/${widget!.parameter1! > 0 ? gridviewImageItem.directusFilesId.id : ' '}?access_token=${FFAppState().accessToken}',
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
                                          '${FFAppConstants.ApiBaseUrl}/assets/${widget!.parameter1! > 0 ? gridviewImageItem.directusFilesId.id : ' '}?access_token=${FFAppState().accessToken}',
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag:
                                    '${FFAppConstants.ApiBaseUrl}/assets/${widget!.parameter1! > 0 ? gridviewImageItem.directusFilesId.id : ' '}?access_token=${FFAppState().accessToken}',
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '${FFAppConstants.ApiBaseUrl}/assets/${widget!.parameter1! > 0 ? gridviewImageItem.directusFilesId.id : ' '}?access_token=${FFAppState().accessToken}',
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
                                  Icons.download_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.reloadtokenReportImage =
                                      await action_blocks.tokenReload(context);
                                  _shouldSetState = true;
                                  if (_model.reloadtokenReportImage!) {
                                    await actions.downloadFile(
                                      gridviewImageItem.directusFilesId.id,
                                      gridviewImageItem
                                          .directusFilesId.filenameDownload,
                                      gridviewImageItem
                                          .directusFilesId.filenameDownload,
                                    );
                                  } else {
                                    setState(() {});
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }),
        );
      },
    );
  }
}
