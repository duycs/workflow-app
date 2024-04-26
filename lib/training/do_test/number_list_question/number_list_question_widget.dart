import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'number_list_question_model.dart';
export 'number_list_question_model.dart';

class NumberListQuestionWidget extends StatefulWidget {
  const NumberListQuestionWidget({
    super.key,
    required this.callBack,
  });

  final Future Function(int? number)? callBack;

  @override
  State<NumberListQuestionWidget> createState() =>
      _NumberListQuestionWidgetState();
}

class _NumberListQuestionWidgetState extends State<NumberListQuestionWidget> {
  late NumberListQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumberListQuestionModel());

    _model.textController ??= TextEditingController();
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
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          const Duration(milliseconds: 500),
          () async {
            await widget.callBack?.call(
              int.tryParse(_model.textController.text),
            );
          },
        ),
        autofocus: false,
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
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        keyboardType: TextInputType.number,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
