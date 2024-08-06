import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_button_add_model.dart';
export 'radio_button_add_model.dart';

class RadioButtonAddWidget extends StatefulWidget {
  const RadioButtonAddWidget({
    super.key,
    this.parameter1,
  });

  final QuestionAnswerObjectStruct? parameter1;

  @override
  State<RadioButtonAddWidget> createState() => _RadioButtonAddWidgetState();
}

class _RadioButtonAddWidgetState extends State<RadioButtonAddWidget> {
  late RadioButtonAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonAddModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                  shape: CircleBorder(),
                ),
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??=
                    widget!.parameter1?.answersId?.correct == 1 ? true : false,
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
                widget!.parameter1!.answersId.content,
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
