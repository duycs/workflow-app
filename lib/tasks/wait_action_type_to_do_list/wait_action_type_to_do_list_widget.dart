import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wait_action_type_to_do_list_model.dart';
export 'wait_action_type_to_do_list_model.dart';

class WaitActionTypeToDoListWidget extends StatefulWidget {
  const WaitActionTypeToDoListWidget({
    super.key,
    this.listData,
  });

  final List<OperationListStruct>? listData;

  @override
  State<WaitActionTypeToDoListWidget> createState() =>
      _WaitActionTypeToDoListWidgetState();
}

class _WaitActionTypeToDoListWidgetState
    extends State<WaitActionTypeToDoListWidget> {
  late WaitActionTypeToDoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitActionTypeToDoListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: FlutterFlowCheckboxGroup(
        options: widget.listData!.map((e) => e.operationsId.content).toList(),
        onChanged: ('1' == '1')
            ? null
            : (val) => setState(() => _model.checkboxGroupValues = val),
        controller: _model.checkboxGroupValueController ??=
            FormFieldController<List<String>>(
          [],
        ),
        activeColor: FlutterFlowTheme.of(context).primary,
        checkColor: FlutterFlowTheme.of(context).info,
        checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              fontSize: 13.0,
              letterSpacing: 0.0,
            ),
        checkboxBorderRadius: BorderRadius.circular(2.0),
        initialized: _model.checkboxGroupValues != null,
      ),
    );
  }
}
