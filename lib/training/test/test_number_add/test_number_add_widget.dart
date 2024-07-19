import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'test_number_add_model.dart';
export 'test_number_add_model.dart';

class TestNumberAddWidget extends StatefulWidget {
  const TestNumberAddWidget({
    super.key,
    this.answersId,
  });

  final QuestionAnswerObjectStruct? answersId;

  @override
  State<TestNumberAddWidget> createState() => _TestNumberAddWidgetState();
}

class _TestNumberAddWidgetState extends State<TestNumberAddWidget> {
  late TestNumberAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestNumberAddModel());

    _model.textController ??= TextEditingController(
        text: widget.answersId?.answersId.correct == 1
            ? widget.answersId?.answersId.content
            : ' ');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      autofocus: false,
      readOnly: true,
      obscureText: false,
      decoration: InputDecoration(
        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Nunito Sans',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      keyboardType: TextInputType.number,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
