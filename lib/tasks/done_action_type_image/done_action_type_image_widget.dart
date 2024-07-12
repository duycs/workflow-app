import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'done_action_type_image_model.dart';
export 'done_action_type_image_model.dart';

class DoneActionTypeImageWidget extends StatefulWidget {
  const DoneActionTypeImageWidget({
    super.key,
    this.image,
  });

  final String? image;

  @override
  State<DoneActionTypeImageWidget> createState() =>
      _DoneActionTypeImageWidgetState();
}

class _DoneActionTypeImageWidgetState extends State<DoneActionTypeImageWidget> {
  late DoneActionTypeImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneActionTypeImageModel());
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        '${FFAppConstants.ApiBaseUrl}/assets/${widget.image}?access_token=${FFAppState().accessToken}',
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.png',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
