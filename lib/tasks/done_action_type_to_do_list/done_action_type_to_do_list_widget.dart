import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'done_action_type_to_do_list_model.dart';
export 'done_action_type_to_do_list_model.dart';

class DoneActionTypeToDoListWidget extends StatefulWidget {
  const DoneActionTypeToDoListWidget({
    super.key,
    this.listData,
  });

  final OperationListStruct? listData;

  @override
  State<DoneActionTypeToDoListWidget> createState() =>
      _DoneActionTypeToDoListWidgetState();
}

class _DoneActionTypeToDoListWidgetState
    extends State<DoneActionTypeToDoListWidget> {
  late DoneActionTypeToDoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneActionTypeToDoListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                widget!.listData?.operationsId?.status == 'done',
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
            checkColor: ('1' == '1') ? null : FlutterFlowTheme.of(context).info,
          ),
        ),
        Expanded(
          child: Text(
            widget!.listData!.operationsId.content,
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
