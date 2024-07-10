import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'one_select_answer_model.dart';
export 'one_select_answer_model.dart';

class OneSelectAnswerWidget extends StatefulWidget {
  const OneSelectAnswerWidget({
    super.key,
    this.data,
    required this.callback,
    required this.stringId,
  });

  final TestAnswersIdStruct? data;
  final Future Function(String? id)? callback;
  final String? stringId;

  @override
  State<OneSelectAnswerWidget> createState() => _OneSelectAnswerWidgetState();
}

class _OneSelectAnswerWidgetState extends State<OneSelectAnswerWidget> {
  late OneSelectAnswerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneSelectAnswerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Theme(
          data: ThemeData(
            checkboxTheme: CheckboxThemeData(
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
          ),
          child: Checkbox(
            value: _model.checkboxValue ??=
                widget.stringId == widget.data?.id,
            onChanged: (newValue) async {
              setState(() => _model.checkboxValue = newValue!);
              if (newValue!) {
                await widget.callback?.call(
                  widget.data?.id,
                );
              }
            },
            side: BorderSide(
              width: 2,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            activeColor: FlutterFlowTheme.of(context).primary,
            checkColor: FlutterFlowTheme.of(context).info,
          ),
        ),
        Expanded(
          child: Text(
            valueOrDefault<String>(
              widget.data?.content,
              'Loading',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
