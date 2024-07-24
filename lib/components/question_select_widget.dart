import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_select_model.dart';
export 'question_select_model.dart';

class QuestionSelectWidget extends StatefulWidget {
  const QuestionSelectWidget({super.key});

  @override
  State<QuestionSelectWidget> createState() => _QuestionSelectWidgetState();
}

class _QuestionSelectWidgetState extends State<QuestionSelectWidget> {
  late QuestionSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionSelectModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: FlutterFlowRadioButton(
        options: ['Option 1'].toList(),
        onChanged: (val) => setState(() {}),
        controller: _model.radioButtonValueController ??=
            FormFieldController<String>(null),
        optionHeight: 32.0,
        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito Sans',
              letterSpacing: 0.0,
            ),
        buttonPosition: RadioButtonPosition.left,
        direction: Axis.vertical,
        radioButtonColor: FlutterFlowTheme.of(context).primary,
        inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
        toggleable: false,
        horizontalAlignment: WrapAlignment.start,
        verticalAlignment: WrapCrossAlignment.start,
      ),
    );
  }
}
