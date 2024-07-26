import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import 'detail_profile_c_p_n_widget.dart' show DetailProfileCPNWidget;
import 'package:flutter/material.dart';

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
