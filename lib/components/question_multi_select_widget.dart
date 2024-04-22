import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'question_multi_select_model.dart';
export 'question_multi_select_model.dart';

class QuestionMultiSelectWidget extends StatefulWidget {
  const QuestionMultiSelectWidget({super.key});

  @override
  State<QuestionMultiSelectWidget> createState() =>
      _QuestionMultiSelectWidgetState();
}

class _QuestionMultiSelectWidgetState extends State<QuestionMultiSelectWidget> {
  late QuestionMultiSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionMultiSelectModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCheckboxGroup(
      options: const [''],
      onChanged: (val) => setState(() => _model.checkboxGroupValues = val),
      controller: _model.checkboxGroupValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      activeColor: FlutterFlowTheme.of(context).primary,
      checkColor: Colors.white,
      checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0.0,
          ),
      itemPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      checkboxBorderRadius: BorderRadius.circular(4.0),
      initialized: _model.checkboxGroupValues != null,
    );
  }
}
