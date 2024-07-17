import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'mobile_editor_component_model.dart';
export 'mobile_editor_component_model.dart';

class MobileEditorComponentWidget extends StatefulWidget {
  const MobileEditorComponentWidget({
    super.key,
    this.content,
    this.setContentCallback,
  });

  final dynamic content;
  final Future Function(dynamic editorContent)? setContentCallback;

  @override
  State<MobileEditorComponentWidget> createState() =>
      _MobileEditorComponentWidgetState();
}

class _MobileEditorComponentWidgetState
    extends State<MobileEditorComponentWidget> {
  late MobileEditorComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MobileEditorComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: custom_widgets.MobileEditor(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        content: widget.content?.toString(),
        setContentCallback: (editorContent) async {
          await widget.setContentCallback?.call(
            editorContent,
          );
        },
        closeEditorCallback: () async {
          Navigator.pop(context);
        },
      ),
    );
  }
}
