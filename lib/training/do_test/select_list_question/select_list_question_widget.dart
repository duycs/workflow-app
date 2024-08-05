import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_list_question_model.dart';
export 'select_list_question_model.dart';

class SelectListQuestionWidget extends StatefulWidget {
  const SelectListQuestionWidget({
    super.key,
    this.listAnswer,
    required this.callback,
  });

  final List<AnswersListStruct>? listAnswer;
  final Future Function(String? answerId, int? correct)? callback;

  @override
  State<SelectListQuestionWidget> createState() =>
      _SelectListQuestionWidgetState();
}

class _SelectListQuestionWidgetState extends State<SelectListQuestionWidget> {
  late SelectListQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectListQuestionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.detail = widget!.listAnswer!.toList().cast<AnswersListStruct>();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onChanged: (val) async {
        setState(() {});
        _model.answerId = _model.detail
            .where((e) => e.answersId.content == _model.radioButtonValue)
            .toList()
            .first
            .answersId
            .id;
        _model.correct = _model.detail
            .where((e) => e.answersId.content == _model.radioButtonValue)
            .toList()
            .first
            .answersId
            .correct;
        setState(() {});
        await widget.callback?.call(
          _model.answerId,
          _model.correct,
        );
      },
      controller: _model.radioButtonValueController ??=
          FormFieldController<String>(null),
      optionHeight: 32.0,
      optionWidth: double.infinity,
      textStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.horizontal,
      radioButtonColor: FlutterFlowTheme.of(context).primary,
      inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
      toggleable: false,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
