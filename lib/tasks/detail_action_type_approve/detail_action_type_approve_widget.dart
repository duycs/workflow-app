import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'detail_action_type_approve_model.dart';
export 'detail_action_type_approve_model.dart';

class DetailActionTypeApproveWidget extends StatefulWidget {
  const DetailActionTypeApproveWidget({
    super.key,
    this.data,
    this.callback,
  });

  final TaskListStruct? data;
  final Future Function(String? result)? callback;

  @override
  State<DetailActionTypeApproveWidget> createState() =>
      _DetailActionTypeApproveWidgetState();
}

class _DetailActionTypeApproveWidgetState
    extends State<DetailActionTypeApproveWidget> {
  late DetailActionTypeApproveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeApproveModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FFButtonWidget(
          onPressed:
              ((widget.data?.status == 'todo') && (widget.data?.current == 0))
                  ? null
                  : () async {
                      await widget.callback?.call(
                        'rejected',
                      );
                    },
          text: 'Từ chối',
          icon: Icon(
            Icons.close,
            color:
                (widget.data?.status == 'todo') && (widget.data?.current == 1)
                    ? FlutterFlowTheme.of(context).secondaryText
                    : FlutterFlowTheme.of(context).secondaryText,
            size: 20.0,
          ),
          options: FFButtonOptions(
            width: 110.0,
            height: 35.0,
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).alternate,
            textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 13.0,
                  letterSpacing: 0.0,
                ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ].divide(const SizedBox(width: 16.0)),
    );
  }
}
