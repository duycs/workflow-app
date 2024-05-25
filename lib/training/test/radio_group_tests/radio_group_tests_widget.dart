import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'radio_group_tests_model.dart';
export 'radio_group_tests_model.dart';

class RadioGroupTestsWidget extends StatefulWidget {
  const RadioGroupTestsWidget({
    super.key,
    this.parameter1,
  });

  final AnswersListStruct? parameter1;

  @override
  State<RadioGroupTestsWidget> createState() => _RadioGroupTestsWidgetState();
}

class _RadioGroupTestsWidgetState extends State<RadioGroupTestsWidget> {
  late RadioGroupTestsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioGroupTestsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToDetail(widget.parameter1!);
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowRadioButton(
      options: _model.detail.map((e) => e.answersId.content).toList().toList(),
      onChanged: ('1' == '1') ? null : (val) => setState(() {}),
      controller: _model.radioButtonValueController ??=
          FormFieldController<String>(widget.parameter1?.answersId.correct == 1
              ? widget.parameter1!.answersId.content
              : ' '),
      optionHeight: 42.0,
      optionWidth: MediaQuery.sizeOf(context).width * 1.2,
      textStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Nunito Sans',
            color: FlutterFlowTheme.of(context).primaryText,
            letterSpacing: 0.0,
          ),
      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      textPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.horizontal,
      radioButtonColor: FlutterFlowTheme.of(context).primary,
      inactiveRadioButtonColor: FlutterFlowTheme.of(context).primary,
      toggleable: true,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
