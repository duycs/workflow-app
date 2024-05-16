import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'select_do_test_model.dart';
export 'select_do_test_model.dart';

class SelectDoTestWidget extends StatefulWidget {
  const SelectDoTestWidget({
    super.key,
    this.listQuestion,
    this.listAnswer,
  });

  final QuestionAnswersIdStruct? listQuestion;
  final AnswersListStruct? listAnswer;

  @override
  State<SelectDoTestWidget> createState() => _SelectDoTestWidgetState();
}

class _SelectDoTestWidgetState extends State<SelectDoTestWidget> {
  late SelectDoTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDoTestModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToDetail(widget.listQuestion!);
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
      options: _model.detail.map((e) => e.content).toList().toList(),
      onChanged: ('1' == '1') ? null : (val) => setState(() {}),
      controller: _model.radioButtonValueController ??=
          FormFieldController<String>(widget.listAnswer!.answersId.content),
      optionHeight: 32.0,
      textStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Nunito Sans',
            color: valueOrDefault<Color>(
              () {
                if ((widget.listQuestion?.id ==
                        widget.listAnswer?.answersId.id) &&
                    (widget.listQuestion?.correct == 1)) {
                  return FlutterFlowTheme.of(context).primary;
                } else if ((widget.listQuestion?.id ==
                        widget.listAnswer?.answersId.id) &&
                    (widget.listQuestion?.correct != 1)) {
                  return FlutterFlowTheme.of(context).error;
                } else if (widget.listQuestion?.correct == 1) {
                  return FlutterFlowTheme.of(context).primary;
                } else {
                  return FlutterFlowTheme.of(context).secondaryText;
                }
              }(),
              FlutterFlowTheme.of(context).noColor,
            ),
            letterSpacing: 0.0,
          ),
      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            color: valueOrDefault<Color>(
              () {
                if ((widget.listQuestion?.id ==
                        widget.listAnswer?.answersId.id) &&
                    (widget.listQuestion?.correct == 1)) {
                  return FlutterFlowTheme.of(context).primary;
                } else if ((widget.listQuestion?.id ==
                        widget.listAnswer?.answersId.id) &&
                    (widget.listQuestion?.correct != 1)) {
                  return FlutterFlowTheme.of(context).error;
                } else {
                  return FlutterFlowTheme.of(context).secondaryText;
                }
              }(),
              FlutterFlowTheme.of(context).noColor,
            ),
            letterSpacing: 0.0,
          ),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.vertical,
      radioButtonColor: FlutterFlowTheme.of(context).primary,
      inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
      toggleable: false,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
