import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chip_custom_model.dart';
export 'chip_custom_model.dart';

class ChipCustomWidget extends StatefulWidget {
  const ChipCustomWidget({
    super.key,
    Color? backgroundColor,
    this.borderColor,
    String? text,
  })  : backgroundColor = backgroundColor ?? Colors.white,
        text = text ?? 'Chip';

  final Color backgroundColor;
  final Color? borderColor;
  final String text;

  @override
  State<ChipCustomWidget> createState() => _ChipCustomWidgetState();
}

class _ChipCustomWidgetState extends State<ChipCustomWidget> {
  late ChipCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChipCustomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.backgroundColor ?? FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.borderColor ?? FlutterFlowTheme.of(context).noColor,
              FlutterFlowTheme.of(context).noColor,
            ),
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 4.0, 7.0, 4.0),
            child: Text(
              widget.text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
