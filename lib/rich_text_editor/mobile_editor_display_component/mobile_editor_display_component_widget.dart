import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'mobile_editor_display_component_model.dart';
export 'mobile_editor_display_component_model.dart';

class MobileEditorDisplayComponentWidget extends StatefulWidget {
  const MobileEditorDisplayComponentWidget({
    super.key,
    required this.content,
  });

  final String? content;

  @override
  State<MobileEditorDisplayComponentWidget> createState() =>
      _MobileEditorDisplayComponentWidgetState();
}

class _MobileEditorDisplayComponentWidgetState
    extends State<MobileEditorDisplayComponentWidget> {
  late MobileEditorDisplayComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MobileEditorDisplayComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custom_widgets.MobileEditorDisplay(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      content: widget.content!,
    );
  }
}
