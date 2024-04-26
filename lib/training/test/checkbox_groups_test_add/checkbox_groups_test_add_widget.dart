import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkbox_groups_test_add_model.dart';
export 'checkbox_groups_test_add_model.dart';

class CheckboxGroupsTestAddWidget extends StatefulWidget {
  const CheckboxGroupsTestAddWidget({
    super.key,
    this.parameter1,
  });

  final QuestionAnswerObjectStruct? parameter1;

  @override
  State<CheckboxGroupsTestAddWidget> createState() =>
      _CheckboxGroupsTestAddWidgetState();
}

class _CheckboxGroupsTestAddWidgetState
    extends State<CheckboxGroupsTestAddWidget> {
  late CheckboxGroupsTestAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxGroupsTestAddModel());
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
                    widget.parameter1?.answersId?.correct == 1 ? true : false,
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
                      fontFamily: 'Readex Pro',
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
