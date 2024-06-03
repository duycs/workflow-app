import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multi_selec_list_question_model.dart';
export 'multi_selec_list_question_model.dart';

class MultiSelecListQuestionWidget extends StatefulWidget {
  const MultiSelecListQuestionWidget({
    super.key,
    this.listAnswer,
  });

  final List<AnswersListStruct>? listAnswer;

  @override
  State<MultiSelecListQuestionWidget> createState() =>
      _MultiSelecListQuestionWidgetState();
}

class _MultiSelecListQuestionWidgetState
    extends State<MultiSelecListQuestionWidget> {
  late MultiSelecListQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiSelecListQuestionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: FlutterFlowCheckboxGroup(
            options:
                widget.listAnswer!.map((e) => e.answersId.content).toList(),
            onChanged: (val) =>
                setState(() => _model.checkboxGroupValues = val),
            controller: _model.checkboxGroupValueController ??=
                FormFieldController<List<String>>(
              [],
            ),
            activeColor: FlutterFlowTheme.of(context).primary,
            checkColor: FlutterFlowTheme.of(context).info,
            checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  letterSpacing: 0.0,
                ),
            checkboxBorderRadius: BorderRadius.circular(4.0),
            initialized: _model.checkboxGroupValues != null,
          ),
        ),
      ],
    );
  }
}
