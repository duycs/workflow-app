import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'check_box_toggle_model.dart';
export 'check_box_toggle_model.dart';

class CheckBoxToggleWidget extends StatefulWidget {
  const CheckBoxToggleWidget({
    super.key,
    required this.checkParam,
    required this.callBack,
    this.color,
  });

  final bool? checkParam;
  final Future Function(bool? checkCall)? callBack;
  final String? color;

  @override
  State<CheckBoxToggleWidget> createState() => _CheckBoxToggleWidgetState();
}

class _CheckBoxToggleWidgetState extends State<CheckBoxToggleWidget> {
  late CheckBoxToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxToggleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.check = widget.checkParam!;
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
        color: widget.color != null && widget.color != ''
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).secondary,
        size: 24.0,
      ),
      offIcon: Icon(
        Icons.check_box_outline_blank,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
    );
  }
}
