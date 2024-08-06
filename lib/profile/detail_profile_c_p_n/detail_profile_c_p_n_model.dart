import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/popup_detail_profile/popup_detail_profile_widget.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'detail_profile_c_p_n_widget.dart' show DetailProfileCPNWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DetailProfileCPNModel extends FlutterFlowModel<DetailProfileCPNWidget> {
  ///  Local state fields for this page.

  OrganizationListStruct? data;
  void updateDataStruct(Function(OrganizationListStruct) updateFn) {
    updateFn(data ??= OrganizationListStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - tokenReload] action in DetailProfileCPN widget.
  bool? getOrganizationToken;
  // Stores action output result for [Backend Call - API (GetOneOrganization)] action in DetailProfileCPN widget.
  ApiCallResponse? apiResultGetOrganization;
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
