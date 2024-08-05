import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'check_box_test_model.dart';
export 'check_box_test_model.dart';

class CheckBoxTestWidget extends StatefulWidget {
  const CheckBoxTestWidget({
    super.key,
    this.textCheckBox,
  });

  final List<TestAnswersIdStruct>? textCheckBox;

  @override
  State<CheckBoxTestWidget> createState() => _CheckBoxTestWidgetState();
}

class _CheckBoxTestWidgetState extends State<CheckBoxTestWidget> {
  late CheckBoxTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxTestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCheckboxGroup(
      options: widget.textCheckBox!.map((e) => e.content).toList(),
      onChanged: (val) => setState(() => _model.checkboxGroupValues = val),
      controller: _model.checkboxGroupValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      activeColor: FlutterFlowTheme.of(context).primary,
      checkColor: Colors.white,
      checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Nunito Sans',
            letterSpacing: 0.0,
          ),
      itemPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      checkboxBorderRadius: BorderRadius.circular(4.0),
      initialized: _model.checkboxGroupValues != null,
    );
  }
}
