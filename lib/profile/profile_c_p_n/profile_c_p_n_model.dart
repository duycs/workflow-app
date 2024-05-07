import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'profile_c_p_n_widget.dart' show ProfileCPNWidget;
import 'package:flutter/material.dart';

class ProfileCPNModel extends FlutterFlowModel<ProfileCPNWidget> {
  ///  Local state fields for this page.

  OrganizationListStruct? organizationDetail;
  void updateOrganizationDetailStruct(
          Function(OrganizationListStruct) updateFn) =>
      updateFn(organizationDetail ??= OrganizationListStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }

  /// Action blocks.
  Future getLinkOrganization(BuildContext context) async {
    bool? reloadTokenOrganization;
    ApiCallResponse? apiResultGetOrganization;

    reloadTokenOrganization = await action_blocks.tokenReload(context);
    if (reloadTokenOrganization!) {
      apiResultGetOrganization =
          await OrganizationGroup.getOrganizationCall.call(
        organizationId: getJsonField(
          FFAppState().staffLogin,
          r'''$.organization_id''',
        ).toString().toString(),
        accessToken: FFAppState().accessToken,
      );
      if ((apiResultGetOrganization.succeeded ?? true)) {
        organizationDetail = OrganizationListDataStruct.maybeFromMap(
                (apiResultGetOrganization.jsonBody ?? ''))
            ?.data;
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
