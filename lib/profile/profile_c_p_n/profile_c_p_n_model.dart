import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'profile_c_p_n_widget.dart' show ProfileCPNWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileCPNModel extends FlutterFlowModel<ProfileCPNWidget> {
  ///  Local state fields for this page.

  OrganizationListStruct? organizationDetail;
  void updateOrganizationDetailStruct(
          Function(OrganizationListStruct) updateFn) =>
      updateFn(organizationDetail ??= OrganizationListStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
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
      if ((apiResultGetOrganization?.succeeded ?? true)) {
        organizationDetail = OrganizationListDataStruct.maybeFromMap(
                (apiResultGetOrganization?.jsonBody ?? ''))
            ?.data;
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
