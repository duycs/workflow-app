import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'checkbox_groups_test_model.dart';
export 'checkbox_groups_test_model.dart';

class CheckboxGroupsTestWidget extends StatefulWidget {
  const CheckboxGroupsTestWidget({
    super.key,
    this.parameter1,
  });

  final AnswersListStruct? parameter1;

  @override
  State<CheckboxGroupsTestWidget> createState() =>
      _CheckboxGroupsTestWidgetState();
}

class _CheckboxGroupsTestWidgetState extends State<CheckboxGroupsTestWidget> {
  late CheckboxGroupsTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxGroupsTestModel());
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
        Row(
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
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??=
                    widget.parameter1?.answersId.correct == 1,
                onChanged: ('1' == '1')
                    ? null
                    : (newValue) async {
                        setState(() => _model.checkboxValue = newValue!);
                      },
                side: BorderSide(
                  width: 2,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor:
                    ('1' == '1') ? null : FlutterFlowTheme.of(context).info,
              ),
            ),
            Expanded(
              child: Text(
                widget.parameter1!.answersId.content,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
