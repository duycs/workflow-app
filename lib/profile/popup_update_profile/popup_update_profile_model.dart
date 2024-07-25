import '/flutter_flow/flutter_flow_util.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import 'popup_update_profile_widget.dart' show PopupUpdateProfileWidget;
import 'package:flutter/material.dart';

class PopupUpdateProfileModel
    extends FlutterFlowModel<PopupUpdateProfileWidget> {
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
