import '/flutter_flow/flutter_flow_util.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import 'popup_task_detail_copy_widget.dart' show PopupTaskDetailCopyWidget;
import 'package:flutter/material.dart';

class PopupTaskDetailCopyModel
    extends FlutterFlowModel<PopupTaskDetailCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MobileEditorDisplayComponent component.
  late MobileEditorDisplayComponentModel mobileEditorDisplayComponentModel;

  @override
  void initState(BuildContext context) {
    mobileEditorDisplayComponentModel =
        createModel(context, () => MobileEditorDisplayComponentModel());
  }

  @override
  void dispose() {
    mobileEditorDisplayComponentModel.dispose();
  }
}
