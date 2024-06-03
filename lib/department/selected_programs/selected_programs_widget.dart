import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'selected_programs_model.dart';
export 'selected_programs_model.dart';

class SelectedProgramsWidget extends StatefulWidget {
  const SelectedProgramsWidget({
    super.key,
    this.callBack,
    bool? itemCheck,
  }) : itemCheck = itemCheck ?? false;

  final Future Function(bool? check)? callBack;
  final bool itemCheck;

  @override
  State<SelectedProgramsWidget> createState() => _SelectedProgramsWidgetState();
}

class _SelectedProgramsWidgetState extends State<SelectedProgramsWidget> {
  late SelectedProgramsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedProgramsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.check = widget.itemCheck;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleIcon(
      onPressed: () async {
        setState(() => _model.check = !_model.check);
        await widget.callBack?.call(
          _model.check,
        );
      },
      value: _model.check,
      onIcon: Icon(
        Icons.check_box,
        color: FlutterFlowTheme.of(context).primary,
        size: 25.0,
      ),
      offIcon: Icon(
        Icons.check_box_outline_blank,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 25.0,
      ),
    );
  }
}
