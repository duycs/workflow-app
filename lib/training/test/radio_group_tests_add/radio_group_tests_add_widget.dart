import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'radio_group_tests_add_model.dart';
export 'radio_group_tests_add_model.dart';

class RadioGroupTestsAddWidget extends StatefulWidget {
  const RadioGroupTestsAddWidget({
    super.key,
    this.parameter1,
  });

  final QuestionAnswerObjectStruct? parameter1;

  @override
  State<RadioGroupTestsAddWidget> createState() =>
      _RadioGroupTestsAddWidgetState();
}

class _RadioGroupTestsAddWidgetState extends State<RadioGroupTestsAddWidget> {
  late RadioGroupTestsAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioGroupTestsAddModel());

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: FlutterFlowRadioButton(
            options:
                _model.detail.map((e) => e.answersId.content).toList().toList(),
            onChanged: ('1' == '1') ? null : (val) => setState(() {}),
            controller: _model.radioButtonValueController ??=
                FormFieldController<String>(
                    widget.parameter1?.answersId.correct == 1
                        ? widget.parameter1!.answersId.content
                        : ' '),
            optionHeight: 32.0,
            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
            selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
            buttonPosition: RadioButtonPosition.left,
            direction: Axis.vertical,
            radioButtonColor: FlutterFlowTheme.of(context).primary,
            inactiveRadioButtonColor:
                FlutterFlowTheme.of(context).secondaryText,
            toggleable: false,
            horizontalAlignment: WrapAlignment.start,
            verticalAlignment: WrapCrossAlignment.start,
          ),
        ),
      ],
    );
  }
}
