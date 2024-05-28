import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'one_select_question_model.dart';
export 'one_select_question_model.dart';

class OneSelectQuestionWidget extends StatefulWidget {
  const OneSelectQuestionWidget({
    super.key,
    this.listAnswer,
    required this.callback,
  });

  final List<AnswersListStruct>? listAnswer;
  final Future Function(String? answerId, int? correct)? callback;

  @override
  State<OneSelectQuestionWidget> createState() =>
      _OneSelectQuestionWidgetState();
}

class _OneSelectQuestionWidgetState extends State<OneSelectQuestionWidget> {
  late OneSelectQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneSelectQuestionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.detail = widget.listAnswer!.toList().cast<AnswersListStruct>();
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
    return Container();
  }
}
