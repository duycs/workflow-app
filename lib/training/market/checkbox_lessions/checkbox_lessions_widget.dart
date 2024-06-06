import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkbox_lessions_model.dart';
export 'checkbox_lessions_model.dart';

class CheckboxLessionsWidget extends StatefulWidget {
  const CheckboxLessionsWidget({
    super.key,
    this.parameter1,
    required this.callBack,
    required this.checkLessions,
  });

  final int? parameter1;
  final Future Function(bool? check)? callBack;
  final bool? checkLessions;

  @override
  State<CheckboxLessionsWidget> createState() => _CheckboxLessionsWidgetState();
}

class _CheckboxLessionsWidgetState extends State<CheckboxLessionsWidget> {
  late CheckboxLessionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxLessionsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkBoxLessions = widget.checkLessions!;
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
        setState(() => _model.checkBoxLessions = !_model.checkBoxLessions);
        await widget.callBack?.call(
          _model.checkBoxLessions,
        );
      },
      value: _model.checkBoxLessions,
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
