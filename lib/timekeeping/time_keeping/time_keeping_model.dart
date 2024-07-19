import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/timekeeping/individual_timekeeping_details/individual_timekeeping_details_widget.dart';
import '/timekeeping/time_keeping_checkout/time_keeping_checkout_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'time_keeping_widget.dart' show TimeKeepingWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeKeepingModel extends FlutterFlowModel<TimeKeepingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - authenticateUsingBiometricsSetting] action in Button widget.
  bool? authenticateBiometicsTimeKeeping;
  // Stores action output result for [Custom Action - timeKeepingLocation] action in Button widget.
  String? timeKeepingLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
