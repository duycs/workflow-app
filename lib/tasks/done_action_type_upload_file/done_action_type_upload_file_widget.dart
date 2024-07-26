import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'done_action_type_upload_file_model.dart';
export 'done_action_type_upload_file_model.dart';

class DoneActionTypeUploadFileWidget extends StatefulWidget {
  const DoneActionTypeUploadFileWidget({
    super.key,
    this.file,
  });

  final String? file;

  @override
  State<DoneActionTypeUploadFileWidget> createState() =>
      _DoneActionTypeUploadFileWidgetState();
}

class _DoneActionTypeUploadFileWidgetState
    extends State<DoneActionTypeUploadFileWidget> {
  late DoneActionTypeUploadFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneActionTypeUploadFileModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${FFAppConstants.ApiBaseUrl}/assets/${widget!.file}?access_token=${FFAppState().accessToken}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
