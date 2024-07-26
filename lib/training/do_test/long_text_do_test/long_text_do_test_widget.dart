import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'long_text_do_test_model.dart';
export 'long_text_do_test_model.dart';

class LongTextDoTestWidget extends StatefulWidget {
  const LongTextDoTestWidget({
    super.key,
    this.listAnswerText,
    required this.questionAnswer,
    required this.corect,
  });

  final String? listAnswerText;
  final String? questionAnswer;
  final int? corect;

  @override
  State<LongTextDoTestWidget> createState() => _LongTextDoTestWidgetState();
}

class _LongTextDoTestWidgetState extends State<LongTextDoTestWidget> {
  late LongTextDoTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LongTextDoTestModel());

    _model.textController ??=
        TextEditingController(text: widget!.listAnswerText);
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Nunito Sans',
                letterSpacing: 0.0,
              ),
          maxLines: 3,
          validator: _model.textControllerValidator.asValidator(context),
        ),
        if (widget!.corect == 0)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Text(
              'Đáp án đúng: ${widget!.questionAnswer}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).error,
                    letterSpacing: 0.0,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
