import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/profile_staff_new/profile_staff_new_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_user_new_widget.dart' show ProfileUserNewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileUserNewModel extends FlutterFlowModel<ProfileUserNewWidget> {
  ///  Local state fields for this page.

  StaffListStruct? staffDetail;
  void updateStaffDetailStruct(Function(StaffListStruct) updateFn) {
    updateFn(staffDetail ??= StaffListStruct());
  }

  bool checkLoad = false;

  dynamic dataStaff;

  String checkShow = '1';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks.
  Future getDataStaffOne(BuildContext context) async {
    bool? checkTokenGetOneStaff;
    ApiCallResponse? apiResultGetOneDataStaff;

    checkTokenGetOneStaff = await action_blocks.tokenReload(context);
    if (checkTokenGetOneStaff!) {
      apiResultGetOneDataStaff = await StaffGroup.staffGetOneCall.call(
        accessToken: FFAppState().accessToken,
        staffId: widget!.staffId,
      );

      if ((apiResultGetOneDataStaff?.succeeded ?? true)) {
        staffDetail = StaffListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneDataStaff?.jsonBody ?? ''),
          r'''$.data''',
        ));
        dataStaff = getJsonField(
          (apiResultGetOneDataStaff?.jsonBody ?? ''),
          r'''$.data''',
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi tải dữ liệu. Vui lòng thử lại',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      checkLoad = true;
    }
  }
}
