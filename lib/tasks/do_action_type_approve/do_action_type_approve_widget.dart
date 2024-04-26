import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'do_action_type_approve_model.dart';
export 'do_action_type_approve_model.dart';

class DoActionTypeApproveWidget extends StatefulWidget {
  const DoActionTypeApproveWidget({
    super.key,
    this.callback,
  });

  final Future Function(String? result)? callback;

  @override
  State<DoActionTypeApproveWidget> createState() =>
      _DoActionTypeApproveWidgetState();
}

class _DoActionTypeApproveWidgetState extends State<DoActionTypeApproveWidget> {
  late DoActionTypeApproveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoActionTypeApproveModel());
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: () async {
              setState(() {
                _model.result = 'rejected';
              });
              await widget.callback?.call(
                _model.result,
              );
            },
            text: 'Từ chối',
            icon: Icon(
              Icons.close,
              size: 15.0,
            ),
            options: FFButtonOptions(
              width: 150.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).error,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    );
  }
}
