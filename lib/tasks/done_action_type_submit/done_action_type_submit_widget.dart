import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'done_action_type_submit_model.dart';
export 'done_action_type_submit_model.dart';

class DoneActionTypeSubmitWidget extends StatefulWidget {
  const DoneActionTypeSubmitWidget({
    super.key,
    this.result,
  });

  final String? result;

  @override
  State<DoneActionTypeSubmitWidget> createState() =>
      _DoneActionTypeSubmitWidgetState();
}

class _DoneActionTypeSubmitWidgetState
    extends State<DoneActionTypeSubmitWidget> {
  late DoneActionTypeSubmitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneActionTypeSubmitModel());

    _model.textController ??= TextEditingController(text: widget.result);
    _model.textFieldFocusNode ??= FocusNode();
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
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: false,
        readOnly: true,
        obscureText: false,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Nunito Sans',
                letterSpacing: 0.0,
              ),
          hintText: 'Nhập nội dung...',
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Nunito Sans',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        maxLines: 4,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
