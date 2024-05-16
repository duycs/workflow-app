import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_action_type_upload_file_model.dart';
export 'detail_action_type_upload_file_model.dart';

class DetailActionTypeUploadFileWidget extends StatefulWidget {
  const DetailActionTypeUploadFileWidget({
    super.key,
    required this.calback,
  });

  final Future Function(String? file)? calback;

  @override
  State<DetailActionTypeUploadFileWidget> createState() =>
      _DetailActionTypeUploadFileWidgetState();
}

class _DetailActionTypeUploadFileWidgetState
    extends State<DetailActionTypeUploadFileWidget> {
  late DetailActionTypeUploadFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeUploadFileModel());
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: FFButtonWidget(
            onPressed: () async {
              final selectedFiles = await selectFiles(
                multiFile: false,
              );
              if (selectedFiles != null) {
                setState(() => _model.isDataUploading = true);
                var selectedUploadedFiles = <FFUploadedFile>[];

                try {
                  selectedUploadedFiles = selectedFiles
                      .map((m) => FFUploadedFile(
                            name: m.storagePath.split('/').last,
                            bytes: m.bytes,
                          ))
                      .toList();
                } finally {
                  _model.isDataUploading = false;
                }
                if (selectedUploadedFiles.length == selectedFiles.length) {
                  setState(() {
                    _model.uploadedLocalFile = selectedUploadedFiles.first;
                  });
                } else {
                  setState(() {});
                  return;
                }
              }

              _model.apiResult7cn = await UploadFileGroup.uploadFileCall.call(
                accessToken: FFAppState().accessToken,
                file: _model.uploadedLocalFile,
              );
              if ((_model.apiResult7cn?.succeeded ?? true)) {
                await widget.calback?.call(
                  getJsonField(
                    (_model.apiResult7cn?.jsonBody ?? ''),
                    r'''$.data.id''',
                  ).toString(),
                );
                setState(() {});
              }

              setState(() {});
            },
            text: 'Upload tài liệu',
            icon: const Icon(
              Icons.attach_file,
              size: 20.0,
            ),
            options: FFButtonOptions(
              width: 140.0,
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        ),
      ].divide(const SizedBox(height: 6.0)),
    );
  }
}
