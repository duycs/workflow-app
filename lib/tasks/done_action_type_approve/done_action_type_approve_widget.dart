import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'done_action_type_approve_model.dart';
export 'done_action_type_approve_model.dart';

class DoneActionTypeApproveWidget extends StatefulWidget {
  const DoneActionTypeApproveWidget({super.key});

  @override
  State<DoneActionTypeApproveWidget> createState() =>
      _DoneActionTypeApproveWidgetState();
}

class _DoneActionTypeApproveWidgetState
    extends State<DoneActionTypeApproveWidget> {
  late DoneActionTypeApproveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneActionTypeApproveModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
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
            icon: Icon(
              Icons.close,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).error,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    );
  }
}
