import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'detail_action_type_submit_text_model.dart';
export 'detail_action_type_submit_text_model.dart';

class DetailActionTypeSubmitTextWidget extends StatefulWidget {
  const DetailActionTypeSubmitTextWidget({
    super.key,
    this.result,
  });

  final String? result;

  @override
  State<DetailActionTypeSubmitTextWidget> createState() =>
      _DetailActionTypeSubmitTextWidgetState();
}

class _DetailActionTypeSubmitTextWidgetState
    extends State<DetailActionTypeSubmitTextWidget> {
  late DetailActionTypeSubmitTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailActionTypeSubmitTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
