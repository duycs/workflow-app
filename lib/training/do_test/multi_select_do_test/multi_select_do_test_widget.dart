import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multi_select_do_test_model.dart';
export 'multi_select_do_test_model.dart';

class MultiSelectDoTestWidget extends StatefulWidget {
  const MultiSelectDoTestWidget({
    super.key,
    this.listQuestion,
    this.listAnswer,
  });

  final QuestionAnswersIdStruct? listQuestion;
  final List<AnswersListStruct>? listAnswer;

  @override
  State<MultiSelectDoTestWidget> createState() =>
      _MultiSelectDoTestWidgetState();
}

class _MultiSelectDoTestWidgetState extends State<MultiSelectDoTestWidget> {
  late MultiSelectDoTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiSelectDoTestModel());
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
            value: _model.checkboxValue ??= () {
              if (widget.listQuestion?.correct == 1) {
                return true;
              } else if ((widget.listAnswer!
                          .where(
                              (e) => e.answersId.id == widget.listQuestion?.id)
                          .toList()
                          .length >
                      0) &&
                  (widget.listAnswer != null &&
                      (widget.listAnswer)!.isNotEmpty)) {
                return true;
              } else {
                return false;
              }
            }(),
            onChanged: ('1' == '1')
                ? null
                : (newValue) async {
                    setState(() => _model.checkboxValue = newValue!);
                  },
            side: BorderSide(
              width: 2,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            activeColor: () {
              if ((widget.listQuestion?.correct == 1) &&
                  (widget.listAnswer!
                          .where(
                              (e) => e.answersId.id == widget.listQuestion?.id)
                          .toList()
                          .length >
                      0) &&
                  (widget.listAnswer != null &&
                      (widget.listAnswer)!.isNotEmpty)) {
                return FlutterFlowTheme.of(context).secondary;
              } else if ((widget.listQuestion?.correct != 1) &&
                  (widget.listAnswer!
                          .where(
                              (e) => e.answersId.id == widget.listQuestion?.id)
                          .toList()
                          .length >
                      0) &&
                  (widget.listAnswer != null &&
                      (widget.listAnswer)!.isNotEmpty)) {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).accent1;
              }
            }(),
            checkColor: ('1' == '1') ? null : FlutterFlowTheme.of(context).info,
          ),
        ),
        Expanded(
          child: Text(
            valueOrDefault<String>(
              widget.listQuestion?.content,
              'Loading',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: () {
                    if ((widget.listQuestion?.correct == 1) &&
                        (widget.listAnswer!
                                .where((e) =>
                                    e.answersId.id == widget.listQuestion?.id)
                                .toList()
                                .length >
                            0) &&
                        (widget.listAnswer != null &&
                            (widget.listAnswer)!.isNotEmpty)) {
                      return FlutterFlowTheme.of(context).secondary;
                    } else if ((widget.listQuestion?.correct != 1) &&
                        (widget.listAnswer!
                                .where((e) =>
                                    e.answersId.id == widget.listQuestion?.id)
                                .toList()
                                .length >
                            0) &&
                        (widget.listAnswer != null &&
                            (widget.listAnswer)!.isNotEmpty)) {
                      return FlutterFlowTheme.of(context).error;
                    } else if ((widget.listAnswer?.length == 0) &&
                        (widget.listQuestion?.correct == 1)) {
                      return FlutterFlowTheme.of(context).primary;
                    } else if ((widget.listAnswer?.length == 0) &&
                        (widget.listQuestion?.correct != 1)) {
                      return FlutterFlowTheme.of(context).primaryText;
                    } else if (widget.listQuestion?.correct == 1) {
                      return FlutterFlowTheme.of(context).primary;
                    } else {
                      return FlutterFlowTheme.of(context).primaryText;
                    }
                  }(),
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
