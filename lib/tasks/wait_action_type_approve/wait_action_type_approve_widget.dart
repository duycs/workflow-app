import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'wait_action_type_approve_model.dart';
export 'wait_action_type_approve_model.dart';

class WaitActionTypeApproveWidget extends StatefulWidget {
  const WaitActionTypeApproveWidget({super.key});

  @override
  State<WaitActionTypeApproveWidget> createState() =>
      _WaitActionTypeApproveWidgetState();
}

class _WaitActionTypeApproveWidgetState
    extends State<WaitActionTypeApproveWidget> {
  late WaitActionTypeApproveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitActionTypeApproveModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: ('1' == '1')
                ? null
                : () {
                    print('Button pressed ...');
                  },
            text: 'Từ chối',
            icon: const Icon(
              Icons.close,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(const SizedBox(width: 16.0)),
      ),
    );
  }
}
