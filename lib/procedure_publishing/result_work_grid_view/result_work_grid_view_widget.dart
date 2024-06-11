import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'result_work_grid_view_model.dart';
export 'result_work_grid_view_model.dart';

class ResultWorkGridViewWidget extends StatefulWidget {
  const ResultWorkGridViewWidget({
    super.key,
    this.operationList,
    this.type,
    this.parameter2,
  });

  final List<OperationListStruct>? operationList;
  final String? type;
  final int? parameter2;

  @override
  State<ResultWorkGridViewWidget> createState() =>
      _ResultWorkGridViewWidgetState();
}

class _ResultWorkGridViewWidgetState extends State<ResultWorkGridViewWidget> {
  late ResultWorkGridViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultWorkGridViewModel());
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
        final gripview = widget.operationList?.toList() ?? [];
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(gripview.length, (gripviewIndex) {
            final gripviewItem = gripview[gripviewIndex];
            return Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Builder(
                builder: (context) {
                  final imageItem = gripviewItem.operationsId.files.toList();
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: imageItem.length,
                    itemBuilder: (context, imageItemIndex) {
                      final imageItemItem = imageItem[imageItemIndex];
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
                                      (widget.type == 'image') &&
                                              (widget.parameter2! > 0)
                                          ? '${FFAppConstants.ApiBaseUrl}/assets/${imageItemItem.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                          : ' ',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: (widget.type == 'image') &&
                                            (widget.parameter2! > 0)
                                        ? '${FFAppConstants.ApiBaseUrl}/assets/${imageItemItem.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                        : ' ',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: (widget.type == 'image') &&
                                      (widget.parameter2! > 0)
                                  ? '${FFAppConstants.ApiBaseUrl}/assets/${imageItemItem.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                  : ' ',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  (widget.type == 'image') &&
                                          (widget.parameter2! > 0)
                                      ? '${FFAppConstants.ApiBaseUrl}/assets/${imageItemItem.directusFilesId.id}?access_token=${FFAppState().accessToken}'
                                      : ' ',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 6.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.download_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                var shouldSetState = false;
                                _model.reloadImageGripview =
                                    await action_blocks.tokenReload(context);
                                shouldSetState = true;
                                if (_model.reloadImageGripview!) {
                                  await actions.downloadFile(
                                    '${FFAppConstants.ApiBaseUrl}/assets/${imageItemItem.directusFilesId.id}?access_token=${FFAppState().accessToken}',
                                    imageItemItem
                                        .directusFilesId.filenameDownload,
                                    imageItemItem
                                        .directusFilesId.filenameDownload,
                                  );
                                } else {
                                  setState(() {});
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          }),
        );
      },
    );
  }
}
