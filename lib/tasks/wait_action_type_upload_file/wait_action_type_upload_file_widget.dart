import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'wait_action_type_upload_file_model.dart';
export 'wait_action_type_upload_file_model.dart';

class WaitActionTypeUploadFileWidget extends StatefulWidget {
  const WaitActionTypeUploadFileWidget({
    super.key,
    String? name,
  }) : name = name ?? '';

  final String name;

  @override
  State<WaitActionTypeUploadFileWidget> createState() =>
      _WaitActionTypeUploadFileWidgetState();
}

class _WaitActionTypeUploadFileWidgetState
    extends State<WaitActionTypeUploadFileWidget> {
  late WaitActionTypeUploadFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitActionTypeUploadFileModel());
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
              text: 'Upload tài liệu',
              icon: const Icon(
                Icons.attach_file,
                size: 20.0,
              ),
              options: FFButtonOptions(
                width: 125.0,
                height: 35.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 13.0,
                      letterSpacing: 0.0,
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
