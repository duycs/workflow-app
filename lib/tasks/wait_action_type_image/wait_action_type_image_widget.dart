import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'wait_action_type_image_model.dart';
export 'wait_action_type_image_model.dart';

class WaitActionTypeImageWidget extends StatefulWidget {
  const WaitActionTypeImageWidget({super.key});

  @override
  State<WaitActionTypeImageWidget> createState() =>
      _WaitActionTypeImageWidgetState();
}

class _WaitActionTypeImageWidgetState extends State<WaitActionTypeImageWidget> {
  late WaitActionTypeImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitActionTypeImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                size: 20.0,
              ),
              options: FFButtonOptions(
                width: 110.0,
                height: 35.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ],
        ),
      ].divide(const SizedBox(height: 6.0)),
    );
  }
}
