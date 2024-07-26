import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_long_text_model.dart';
export 'test_long_text_model.dart';

class TestLongTextWidget extends StatefulWidget {
  const TestLongTextWidget({
    super.key,
    this.answersId,
  });

  final AnswersListStruct? answersId;

  @override
  State<TestLongTextWidget> createState() => _TestLongTextWidgetState();
}

class _TestLongTextWidgetState extends State<TestLongTextWidget> {
  late TestLongTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestLongTextModel());

    _model.textController ??= TextEditingController(
        text: widget!.answersId?.answersId?.correct == 1
            ? widget!.answersId?.answersId?.content
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
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
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
