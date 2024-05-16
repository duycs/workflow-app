import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wait_action_type_upload_file_model.dart';
export 'wait_action_type_upload_file_model.dart';

class WaitActionTypeUploadFileWidget extends StatefulWidget {
  const WaitActionTypeUploadFileWidget({
    super.key,
    String? name,
  }) : this.name = name ?? '';

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: ('1' == '1')
                ? null
                : () {
                    print('Button pressed ...');
                  },
            text: 'Upload tài liệu',
            icon: Icon(
              Icons.attach_file,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(height: 6.0)),
      ),
    );
  }
}
